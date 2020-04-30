package com.gx.whiteList.controller;

import com.google.gson.Gson;
import com.gx.merchant.domain.TbMerchantPO;
import com.gx.merchant.service.MerchantService;
import com.gx.user.domain.TbUserInfo;
import com.gx.whiteList.domain.TbWhiteListBindRefPO;
import com.gx.whiteList.domain.TbWhiteListPO;
import com.gx.whiteList.service.WhiteListService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

/**
 * @author admin
 */
@RequestMapping("whiteList")
@Controller
public class WhiteListController {
    private final static transient Logger logger = LoggerFactory.getLogger(WhiteListController.class);
    @Autowired
    private WhiteListService whiteListService;
    @Autowired
    private RedisTemplate redisTemplate;
    //白名单商品关联数据库字段
    public static final String WHITE_LIST = "WHITE_LIST_";
    @RequestMapping("/returnListPage")
    public String returnListPage(){
        return "whiteList/list";
    }

    @ResponseBody
    @RequestMapping(value = "/getAllWhiteListInfo",produces = "text/plain;charset=utf-8")
    public String getAllWhiteListInfo(HttpServletRequest request, HttpServletResponse response){
        logger.info("白名单管理control层......正在查询全部白名单......");
        Integer page = Integer.valueOf(request.getParameter("page"));
        Integer rows = Integer.valueOf(request.getParameter("rows"));
        logger.info("page=" + page);
        logger.info("rows=" + rows);
        List<TbWhiteListPO> totalTbWhiteListInfoPOS = whiteListService.getAllWhiteListInfo();
        //获取分页数据
        List<TbWhiteListPO> whiteListInfoPOS = whiteListService.getPageWhiteListInfo((page - 1) * rows,rows);
        logger.info("whiteListInfoPOS=" + whiteListInfoPOS);
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
        int total = totalTbWhiteListInfoPOS.size();
        map.put("total", total);
        map.put("rows", whiteListInfoPOS);
        String jsonMap = gson.toJson(map);
        logger.info("jsonMap=" + jsonMap);
        return jsonMap;
    }

    /**
     * 新增白名单
     * @param mFile
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ajaxAdd",produces = "text/plain;charset=utf-8")
    public String ajaxAdd(@RequestParam(value="file_upload2", required=false) MultipartFile mFile, HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取商家id
        TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
        String merchantId = tbMerchantPO.getMerchantId();
        String merchantName = tbMerchantPO.getMerchantName();
        TbUserInfo tbUserInfo = (TbUserInfo) request.getSession().getAttribute("tbUserInfoPO");
        //获取到白名单名字
        String whiteListName = request.getParameter("whiteListName");
        //获取到描述
        String whiteListDesc = request.getParameter("whiteListDesc");
        //获取到商品id
        String merchandiseCode = request.getParameter("merchandiseCode");
        //获取到文件
        //获取到失败提示语
        String whiteListTips = request.getParameter("whiteListTips");
        logger.info("白名单名字=" + whiteListName + "白名单描述=" + whiteListDesc + "商品id=" + merchandiseCode + "文件=" + mFile.getOriginalFilename());
        TbWhiteListPO tbWhiteListPO = new TbWhiteListPO();
        tbWhiteListPO.setWhiteListName(whiteListName);
        tbWhiteListPO.setWhiteListDesc(whiteListDesc);
        tbWhiteListPO.setWhiteListTips(whiteListTips);
        //处理白名单文件
        //file不为空，设置白名单到PO，一定要选
        //将mFile转为file
        File file = new File(mFile.getOriginalFilename());
        FileUtils.copyInputStreamToFile(mFile.getInputStream(),file);
        if (file != null) {
            //创建文件输入流
            BufferedReader reader = new BufferedReader(new FileReader(file));
            //先读一行？？
            reader.readLine();
            String line = null;
            //声明手机号码集合
            Set<String> phoneSet = new HashSet<String>();
            //是否将读的行添加到手机集合中标志位
            boolean flag = false;
            //读那一行不为空
            while ((line = reader.readLine()) != null) {
                //那一行不为空
                if (StringUtils.isNotEmpty(line)) {
                    //把那一行添加到手机集合中去
                    logger.info("line=" + line);
                    phoneSet.add(line);
                }
            }
            //将手机列表集合转化成以逗号隔开的字符串
            String phoneStr = StringUtils.join(phoneSet, ",");
            //设置白名单手机列表
            tbWhiteListPO.setWhiteListMember(phoneStr);
            //设置白名单数量
            tbWhiteListPO.setMemberNum(String.valueOf(phoneSet.size()));
            //设置白名单的fileName
            tbWhiteListPO.setFileName(whiteListName);
        }
        logger.info("tbWhiteListPo=" + tbWhiteListPO);
        //设置商家id
        tbWhiteListPO.setMerchantId(merchantId);
        tbWhiteListPO.setMerchantName(merchantName);
        //设置白名单id
        tbWhiteListPO.setWhiteListId(UUID.randomUUID().toString());
        //设置创建时间
        tbWhiteListPO.setCreateTime(new Date());
        //设置用操作用户
        tbWhiteListPO.setCreatedBy(tbUserInfo.getUserName());
        //设置更新时间
        tbWhiteListPO.setUpdateTime(new Date());
        //设置更新的用户
        tbWhiteListPO.setUpdateBy(tbUserInfo.getUserName());
        //插入操作
        int result = whiteListService.insertPO(tbWhiteListPO);
        if(result>0){
            logger.info("白名单新增成功");
        }
        //得到白名单id
        String whiteListId = tbWhiteListPO.getWhiteListId();
        if (!"".equals(merchandiseCode) && merchandiseCode.length()>0) {
            System.out.println("添加关联商品啦");
            TbWhiteListBindRefPO whiteListBindRefPO = new TbWhiteListBindRefPO();
            //设置RefPO的值
            String uuid = "";
            whiteListBindRefPO.setWhiteListBindRefId(uuid = UUID.randomUUID().toString());
            System.out.println("关联商品uuid:" + uuid);
            //设置白名单的值
            whiteListBindRefPO.setWhiteListId(whiteListId);
            System.out.println("白名单id:" + whiteListId);
            //设置关联id的值是商品码
            whiteListBindRefPO.setLinkId(String.valueOf(merchandiseCode));
            System.out.println("关联商品码：" + merchandiseCode);
            //设置关联类型
            whiteListBindRefPO.setWhiteListType("1");
            //插入数据库
            System.out.println("whiteListBindRefPO=" + whiteListBindRefPO);
            int result2 = whiteListService.insertWhilteListBindRefPO(whiteListBindRefPO);
            if(result2>0){
                logger.info("新增白名单关联成功");
            }
            //缓存操作
//            if(redisTemplate.hasKey(WHITE_LIST + merchandiseCode)){
//                logger.info("缓存中有白名单");
//                List<TbWhiteListPO> list = (List<TbWhiteListPO>) redisTemplate.opsForList().leftPop(WHITE_LIST + merchandiseCode);
//                list.add(tbWhiteListPO);
//                redisTemplate.opsForList().leftPush(WHITE_LIST + merchandiseCode,list);
//            }else{
//                logger.info("缓存中没有白名单");
//                List<TbWhiteListPO> list = new ArrayList<>();
//                list.add(tbWhiteListPO);
//                redisTemplate.opsForList().leftPush(WHITE_LIST + merchandiseCode,list);
//            }
        }
//        List<TbWhiteListPO> list2 = (List<TbWhiteListPO>) redisTemplate.opsForList().leftPop(WHITE_LIST + merchandiseCode);
//        logger.info("缓存中的白名单=" + list2);
        Map<String,Object> map = new HashMap<>();
        Gson gson = new Gson();
        map.put("code","0");
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }

    //下载模板
    @RequestMapping(value = "/downModelCsv",produces = "text/plain;charset=utf-8")
    public void downModelCsv(HttpServletRequest request,HttpServletResponse response) {
        logger.info("进入下载模板了");
        HttpServletResponse resp = response;
        String fileName = null;
        try {
            fileName = new String("whiteListPhone".getBytes("GBK"), "ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        resp.setContentType("application/octet-stream");
        resp.setCharacterEncoding("utf-8");
        resp.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".csv");
        byte[] buff = new byte[1024];
        OutputStream os = null;
        try {
            os = resp.getOutputStream();
            os.write("手机号码".getBytes("GB2312"));
            os.write("\r\n".getBytes());
            List<String> members = new ArrayList<String>();
            members.add("13751876551");
            members.add("13800138000");
            for (String member : members) {
                os.write(member.getBytes());
                os.write("\r\n".getBytes());
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
