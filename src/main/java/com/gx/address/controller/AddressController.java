package com.gx.address.controller;

import cn.com.do1.common.util.AssertUtil;
import com.google.gson.Gson;
import com.gx.address.domian.TbAddressPO;
import com.gx.address.domian.TbAddressVO;
import com.gx.address.service.AddressService;
import com.gx.member.domain.TbMemberPO;
import com.liferay.portal.kernel.util.Http;
import net.sf.json.groovy.GJson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * @author admin
 */
@Controller
@RequestMapping("/address")
public class AddressController {

    private final static transient Logger logger = LoggerFactory.getLogger(AddressController.class);

    @Autowired
    private AddressService addressService;
    /**
     * 返回地址列表页面
     * @return
     */
    @RequestMapping("/returnAddressPage")
    public String returnAddressPage(){
        return "portal/addressMgr/addressList";
    }

    /**
     * 返回添加地址页面
     * @return
     */
    @RequestMapping("/returnAddAddressPage")
    public String returnAddAddressPage(){
        return "portal/addressMgr/addAddress";
    }

    /**
     * 去到编辑地址
     * @return
     */
    @RequestMapping("/editAddress")
    public String editAddress(HttpServletRequest request,HttpServletResponse response){
        //获取到地址id
        String addressId = request.getParameter("addressId");
        logger.info("地址id=" + addressId);
        //根据地址地找出具体信息
        TbAddressVO tbAddressVO = addressService.getAddressById(addressId);
        //将tbAddressPO放进session
        request.getSession().setAttribute("tbAddressVO",tbAddressVO);
        return "portal/addressMgr/editAddress";
    }

    /**
     * 新增地址
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ajaxAdd",produces = "text/plain;charset=utf-8")
    public String ajaxAdd(HttpServletRequest request, HttpServletResponse response){
        //从session获取tbMemberPO
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        String inceptPeople =request.getParameter("inceptPeople");
        String inceptTel = request.getParameter("inceptTel");
        String provinceCityRegion = request.getParameter("provinceCityRegion");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String region = request.getParameter("region");
        String provinceText = request.getParameter("provinceText");
        String cityText = request.getParameter("cityText");
        String regionText = request.getParameter("regionText");
        String streetAddress = request.getParameter("streetAddress");
        String addressType = request.getParameter("addressType");
        TbAddressPO addressPO = new TbAddressPO();
        addressPO.setInceptPeople(inceptPeople);
        addressPO.setInceptPhone(inceptTel);
        addressPO.setProvinceCityRegion(provinceCityRegion);
        addressPO.setProvince(province);
        addressPO.setCity(city);
        addressPO.setRegion(region);
        addressPO.setProvinceText(provinceText);
        addressPO.setCityText(cityText);
        addressPO.setRegionText(regionText);
        addressPO.setStreetAddress(streetAddress);
        addressPO.setAddressType(addressType);
        addressPO.setMemberId(tbMemberPO.getMemberId());
        logger.info("会员信息=" + tbMemberPO);
        if(!AssertUtil.isEmpty(tbMemberPO)&&tbMemberPO.getMemberId()!=null){
            logger.info("进来啦");
            //如果选择的是迷人地址，则将该会员的其他地址改为普通地址
            if("1".equals(addressPO.getAddressType())){
                int result = addressService.updateAddressType(tbMemberPO.getMemberId());
                logger.info("收货信息更新结果=" + result);
            }else{
                addressPO.setAddressType("0");
            }
            Date date = new Date();
            addressPO.setAddressId(UUID.randomUUID().toString());
            addressPO.setCreateTime(date);
            addressPO.setLastUpdateTime(date);
            logger.info("收货信息=" + addressPO);
            //插入地址信息
            int result = addressService.insertAddress(addressPO);
            if(result==1){
                Map<String,Object> map = new HashMap<>();
                map.put("code","0");
                map.put("desc","新增地址成功");
                Gson gson = new Gson();
                String jsonMap = gson.toJson(map);
                return jsonMap;
            }else{
                Map<String,Object> map = new HashMap<>();
                map.put("code","1");
                map.put("desc","新增地址失败");
                Gson gson = new Gson();
                String jsonMap = gson.toJson(map);
                return jsonMap;
            }
        }else {
            logger.info("会员还没登录");
            Map<String,Object> map = new HashMap<>();
            map.put("code","1");
            map.put("desc","您还没登录，请登录");
            Gson gson = new Gson();
            String jsonMap = gson.toJson(map);
            return jsonMap;
        }
    }

    /**
     * 获取所有地址
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getAllAddress",produces = "text/plain;charset=utf-8")
    public String getAllAddress(HttpServletRequest request,HttpServletResponse response){
        //获取session中的member
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        String jsonMap = null;
        Gson gson = new Gson();
        //根据memberid获取地址
        if(!AssertUtil.isEmpty(tbMemberPO)&&tbMemberPO.getMemberId()!=null){
            List<TbAddressPO> tbAddressPOS = addressService.getAllAddress(tbMemberPO.getMemberId());
            logger.info("获取到的地址信息=" + tbAddressPOS);
            Map<String,Object> map = new HashMap<>();
            map.put("code","0");
            map.put("addressVOs",tbAddressPOS);
           jsonMap = gson.toJson(map);
        }else{
            logger.info("用户尚未登录");
            Map<String,Object> map = new HashMap<>();
            map.put("code","1");
            map.put("desc","用户尚未登录");
            jsonMap = gson.toJson(map);
        }
        return jsonMap;
    }

    /**
     * 更新地址
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ajaxUpdate",produces = "text/plain;charset=utf-8")
    public String ajaxUpdate(HttpServletRequest request, HttpServletResponse response){
        //从session获取tbMemberPO
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        String addressId =request.getParameter("addressId");
        String inceptPeople =request.getParameter("inceptPeople");
        String inceptTel = request.getParameter("inceptTel");
        String provinceCityRegion = request.getParameter("provinceCityRegion");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String region = request.getParameter("region");
        String provinceText = request.getParameter("provinceText");
        String cityText = request.getParameter("cityText");
        String regionText = request.getParameter("regionText");
        String streetAddress = request.getParameter("streetAddress");
        String addressType = request.getParameter("addressType");
        TbAddressPO addressPO = new TbAddressPO();
        addressPO.setAddressId(addressId);
        addressPO.setInceptPeople(inceptPeople);
        addressPO.setInceptPhone(inceptTel);
        addressPO.setProvinceCityRegion(provinceCityRegion);
        addressPO.setProvince(province);
        addressPO.setCity(city);
        addressPO.setRegion(region);
        addressPO.setProvinceText(provinceText);
        addressPO.setCityText(cityText);
        addressPO.setRegionText(regionText);
        addressPO.setStreetAddress(streetAddress);
        addressPO.setAddressType(addressType);
        addressPO.setMemberId(tbMemberPO.getMemberId());
        logger.info("会员信息=" + tbMemberPO);
        if(!AssertUtil.isEmpty(tbMemberPO)&&tbMemberPO.getMemberId()!=null){
            logger.info("进来啦");
            //如果选择的是默认地址，则将该会员的其他地址改为普通地址
            if("1".equals(addressPO.getAddressType())){
                int result = addressService.updateAddressType(tbMemberPO.getMemberId());
                logger.info("收货信息更新结果=" + result);
            }else{
                addressPO.setAddressType("0");
            }
            Date date = new Date();
            addressPO.setLastUpdateTime(date);
            logger.info("收货信息=" + addressPO);
            //修改地址信息
            int result = addressService.updateAddress(addressPO);
            if(result==1){
                Map<String,Object> map = new HashMap<>();
                map.put("code","0");
                map.put("desc","修改地址成功");
                Gson gson = new Gson();
                String jsonMap = gson.toJson(map);
                return jsonMap;
            }else{
                Map<String,Object> map = new HashMap<>();
                map.put("code","1");
                map.put("desc","修改地址失败");
                Gson gson = new Gson();
                String jsonMap = gson.toJson(map);
                return jsonMap;
            }
        }else {
            logger.info("会员还没登录");
            Map<String,Object> map = new HashMap<>();
            map.put("code","1");
            map.put("desc","您还没登录，请登录");
            Gson gson = new Gson();
            String jsonMap = gson.toJson(map);
            return jsonMap;
        }
    }

    /**
     * 删除地址
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteAddress",produces = "text/plain;charset=utf-8")
    public String deleteAddress(HttpServletRequest request,HttpServletResponse response){
        //获取地址id
        String addressId = request.getParameter("addressId");
        //获取session中的member
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        if(!AssertUtil.isEmpty(tbMemberPO)){
            int result = addressService.deleteAddress(tbMemberPO.getMemberId(),addressId);
            if(result==1){
                Map<String,Object> map = new HashMap<>();
                map.put("code","0");
                map.put("desc","删除地址成功");
                Gson gson = new Gson();
                String jsonMap = gson.toJson(map);
                return jsonMap;
            }else{
                Map<String,Object> map = new HashMap<>();
                map.put("code","1");
                map.put("desc","删除地址失败");
                Gson gson = new Gson();
                String jsonMap = gson.toJson(map);
                return jsonMap;
            }
        }else{
            logger.info("会员还没登录");
            Map<String,Object> map = new HashMap<>();
            map.put("code","1");
            map.put("desc","您还没登录，请登录");
            Gson gson = new Gson();
            String jsonMap = gson.toJson(map);
            return jsonMap;
        }
    }
}
