package com.gx.merchandise.service.Impl;

import com.gx.example.dao.IAccountdao;
import com.gx.example.domain.Account;
import com.gx.merchandise.dao.IMerchandisedao;
import com.gx.merchandise.domain.TbMerchandiseImagePO;
import com.gx.merchandise.domain.TbMerchandiseInfoPO;
import com.gx.merchandise.domain.TbMerchandiseStockPO;
import com.gx.merchandise.service.MerchandiseService;
import com.gx.util.HttpClientUtil;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @author admin
 */
@Service("merchandiseService")
public class MerchandiseServiceImpl implements MerchandiseService {
    private final static transient Logger logger = LoggerFactory.getLogger(MerchandiseServiceImpl.class);

    @Autowired
    private IMerchandisedao merchandisedao;

    /**
     * 获取分页数据
     * @param start
     * @param end
     * @return
     */
    @Override
    public List<Map<String,String>> getPageMerchandiseInfo(Integer start,Integer end) {
        return merchandisedao.getPageMerchandiseInfo(start,end);
    }

    /**
     * 获取全部商品
     * @return
     */
    @Override
    public List<TbMerchandiseInfoPO> getAllMerchandiseInfo() {
        return merchandisedao.getAllMerchandiseInfo();
    }

    /**
     * 保存商品信息
     * @param tbMerchandiseInfoPO
     */
    @Override
    public void saveMerchandiseInfo(TbMerchandiseInfoPO tbMerchandiseInfoPO) {
        merchandisedao.saveMerchandiseInfo(tbMerchandiseInfoPO);
    }

    /**
     * 更新商品信息
     * @param tbMerchandiseInfoPO
     */
    @Override
    public void updateMerchandiseInfo(TbMerchandiseInfoPO tbMerchandiseInfoPO) {
        merchandisedao.updateMerchandiseInfo(tbMerchandiseInfoPO);
    }
    //删除商品信息
    @Override
    public void deleteMerchandiseInfo(String merchandiseCode) {
        merchandisedao.deleteMerchandiseInfo(merchandiseCode);
    }

    /**
     * 上传图片
     * @param file
     */
    @Override
    public String uploadFile(MultipartFile file, HttpServletRequest request) throws IOException {
        String fileFileName = file.getOriginalFilename();
        int i = fileFileName.indexOf(".");
        //文件后缀
        String suffix = fileFileName.substring(i + 1);
        logger.info("suffix=" + suffix);
        //获取项目路径
        ServletContext sc = request.getSession().getServletContext();
        String dir = sc.getRealPath("/upload/images");
        logger.info("dir=" + dir);
        //图片新名字
        String imageName = UUID.randomUUID().toString() + "." + suffix;
        //图片上传的具体路径
        File realFile = new File(dir,imageName);
        FileUtils.writeByteArrayToFile(realFile,file.getBytes());
        logger.info("图片存的具体位置=" + realFile.getPath());
        logger.info("图片名字=" + realFile.getName());
        logger.info("==========图片已经上传成功========");
        return realFile.getName();
    }

    /**
     * 保存图片
     * @param tbMerchandiseImagePO
     */
    @Override
    public void insertImagePO(TbMerchandiseImagePO tbMerchandiseImagePO) {
        merchandisedao.insertImagePO(tbMerchandiseImagePO);
    }

    /**
     * 发布商品
     * @param request
     */
    @Override
    public String publish(HttpServletRequest request) {
        logger.info("========商品发布中======");
        String merchandiseCode = request.getParameter("merchandiseCode");
        logger.info("将要发布的商品的编号：" + merchandiseCode);
        String url = "http://127.0.0.1:8080/Twossm/merchandise/paddingContent";
        HashMap<String,String> requestMap = new HashMap<>();
        requestMap.put("merchandiseCode",merchandiseCode);
        String result = HttpClientUtil.doPost(url, "UTF-8", null, requestMap);
        return result;
    }

    /**
     * 根据主键获取商品
     * @param merchandiseCode
     * @return
     */
    @Override
    public TbMerchandiseInfoPO getMerchandisePO(String merchandiseCode) {
        return merchandisedao.getMerchandisePO(merchandiseCode);
    }

    @Override
    public TbMerchandiseImagePO getMerchandiseImagePO(String merchandiseCode) {
        return merchandisedao.getMerchandiseImagePO(merchandiseCode);
    }

    /**
     * 更新发布地址
     * @param merchandiseCode
     * @param publishAddress
     */
    @Override
    public void setPublishAddress(String merchandiseCode, String publishAddress) {
        merchandisedao.setPublishAddress(merchandiseCode,publishAddress);
    }

    /**
     * 更新商品的状态
     * @param s
     */
    @Override
    public void updateMerchandiseStatus(String merchandiseCode,String s) {
        merchandisedao.updateMerchandiseStatus(merchandiseCode,s);
    }

    /**
     * 获取商品库存
     * @return
     */
    @Override
    public List<Map<String,String>> getMerchandiseStock() {
        return merchandisedao.getMerchandiseStock();
    }

    /**
     * 分页获取库存
     * @param i
     * @param rows
     * @return
     */
    @Override
    public List<Map<String, String>> getPagegetMerchandiseStock(int i, Integer rows) {
        return merchandisedao.getPagegetMerchandiseStock(i,rows);
    }

    @Override
    public void updatePrice(String merchandiseCode,String price) {
        merchandisedao.updatePrice(merchandiseCode,price);
    }

    /**
     * 更新库存
     * @param merchandiseCode
     * @param stock
     * @param price
     */
    @Override
    public void updateMerchandiseStock(String merchandiseCode, String stock, String price) {
        merchandisedao.updateMerchandiseStock(merchandiseCode,stock,price);
    }

    /**
     * 获取商品库存
     * @param merchandiseCode
     * @return
     */
    @Override
    public TbMerchandiseStockPO gainMerchandiseStock(String merchandiseCode) {
        return merchandisedao.gainMerchandiseStock(merchandiseCode);
    }

    /**
     * 新增库存信息
     * @param tbMerchandiseStockPO
     */
    @Override
    public void addMerchandiseStock(TbMerchandiseStockPO tbMerchandiseStockPO) {
        merchandisedao.addMerchandiseStock(tbMerchandiseStockPO);
    }

    /**
     * 在商品页更新库存
     * @param tbMerchandiseStockPO
     */
    @Override
    public void updateMerchandiseStockPO(TbMerchandiseStockPO tbMerchandiseStockPO) {
        merchandisedao.updateMerchandiseStockPO(tbMerchandiseStockPO);
    }

    @Override
    public String getStockByStockId(String stockId) {
        return merchandisedao.getStockByStockId(stockId);
    }

    @Override
    public int updateStock(String stockId, String newStock) {
        return merchandisedao.updateStock(stockId,newStock);
    }


}
