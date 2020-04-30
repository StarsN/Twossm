package com.gx.portal.cart.controller;

import cn.com.do1.common.util.AssertUtil;
import com.google.gson.Gson;
import com.gx.member.domain.TbMemberPO;
import com.gx.merchandise.domain.TbMerchandiseInfoPO;
import com.gx.merchandise.domain.TbMerchandiseStockPO;
import com.gx.merchandise.service.MerchandiseService;
import com.gx.merchant.domain.TbMerchantPO;
import com.gx.portal.cart.domain.TbCartInfoPO;
import com.gx.portal.cart.domain.TbCartInfoPVO;
import com.gx.portal.cart.service.CartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


@RequestMapping("/cart")
@Controller
public class CartController {
    public final static  transient Logger logger = LoggerFactory.getLogger(CartController.class);
    @Autowired
    private MerchandiseService merchandiseService;
    @Autowired
    private CartService cartService;

    /**
     * 返回购物车列表页面
     * @return
     */
    @RequestMapping("/returnListPage")
    public String returnListPage(){
        return "portal/cart/cartList";
    }

    /**
     * 添加购物车
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ajaxAdd",produces = "text/plain;charset=utf-8")
    public String ajaxAdd(HttpServletRequest request, HttpServletResponse response){
        //获取到购买数量
        String buyNum = request.getParameter("buyNum");
        //获取到商品的编号
        String merchandiseCode = request.getParameter("merchandiseCode");
        //获取到会员信息
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        //获取到商家信息
        TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
        //根据商品id获取到商品库存信息
        TbMerchandiseStockPO tbMerchandiseStockPO = merchandiseService.gainMerchandiseStock(merchandiseCode);
        //库存Id
        String stockId = tbMerchandiseStockPO.getStockId();
        //会员id
        String memberId = tbMemberPO.getMemberId();
        Map<String,Object> map = new HashMap<>();
        Gson gson = new Gson();
        //判断是否已经加入购物车
        TbCartInfoPO tbCartInfoPO = cartService.gainCartByMemberIdAndStockId(memberId,stockId);
        if(!AssertUtil.isEmpty(tbCartInfoPO)){
            tbCartInfoPO.setBuyNum(String.valueOf(Integer.parseInt(tbCartInfoPO.getBuyNum()) + Integer.parseInt(buyNum)));
            int result = cartService.updateBuyNum(tbCartInfoPO);
            if(result==1){
                logger.info("添加商品成功");
                map.put("code","0");
                map.put("msg","添加商品成功");
                String jsonMap = gson.toJson(map);
                return  jsonMap;
            }
        }else{
            tbCartInfoPO = new TbCartInfoPO();
            tbCartInfoPO.setCartId(UUID.randomUUID().toString());
            tbCartInfoPO.setBuyNum(buyNum);
            tbCartInfoPO.setCreateTime(new Date());
            tbCartInfoPO.setMemberId(memberId);
            tbCartInfoPO.setMerchandiseCode(merchandiseCode);
            tbCartInfoPO.setMerchantId(tbMerchantPO.getMerchantId());
            tbCartInfoPO.setStockId(stockId);
            tbCartInfoPO.setIsExpire("1");
            logger.info("将要插入数据库的购物车信息=" + tbCartInfoPO);
            int result = cartService.insertCartInfo(tbCartInfoPO);
            if(result > 0){
                logger.info("添加商品成功");
                map.put("code","0");
                map.put("msg","添加商品成功");
                String jsonMap = gson.toJson(map);
                return  jsonMap;
            }
        }
        map.put("code","1");
        map.put("msg","添加商品失败");
        String jsonMap = gson.toJson(map);
        return  jsonMap;
    }

    /**
     * 查询购物车
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ajaxSearch",produces = "text/plain;charset=utf-8")
    public String ajaxSearch(HttpServletRequest request,HttpServletResponse response){
        //获取会员信息
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        //获取商家信息
        TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
        //根据会员id和商家id获取购物车信息
        List<TbCartInfoPVO> tbCartInfoPVOList = cartService.getCartInfoPVOListByMemberIdAndMerchant(tbMemberPO.getMemberId(),tbMerchantPO);
        logger.info("获取到的购物车信息=" + tbCartInfoPVOList);
        Map<String,Object> map = new HashMap<>();
        Gson gson = new Gson();
        map.put("code","0");
        map.put("cartVOList",tbCartInfoPVOList);
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }

    /**
     * 根据购物车id获取库存
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getStockByCartId",produces = "text/plain;charset=utf-8")
    public String getStockByCartId(HttpServletRequest request,HttpServletResponse response){
        //获取到购物车id
        String cartId = request.getParameter("cartId");
        //根据cartId获取库存
        TbMerchandiseStockPO tbMerchandiseStockPO = cartService.getStockByCartId(cartId);
        logger.info("获取到的库存为=" + tbMerchandiseStockPO);
        Map<String, Object> map = new HashMap<>();
        Gson gson = new Gson();
        if(!AssertUtil.isEmpty(tbMerchandiseStockPO)){
            map.put("stock",tbMerchandiseStockPO.getStock());
            map.put("code","0");
            String jsonMap = gson.toJson(map);
            return  jsonMap;
        }
        map.put("code","1");
        map.put("desc","查找库存失败");
        String jsonMap = gson.toJson(map);
        return  jsonMap;

    }

    /**
     * 修改购物车购买数量
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ajaxUpdate",produces = "text/plain;charset=utf-8")
    public String ajaxUpdate(HttpServletRequest request,HttpServletResponse response){
        //获取到购物车id
        String cartId = request.getParameter("cartId");
        //获取到修改购物车的数量
        String num = request.getParameter("num");
        TbCartInfoPO tbCartInfoPO = new TbCartInfoPO();
        tbCartInfoPO.setCartId(cartId);
        tbCartInfoPO.setBuyNum(num);
        int result = cartService.updateCartBuyNum(tbCartInfoPO);
        Map<String,Object> map = new HashMap<>();
        Gson gson = new Gson();
        if(result>0){
            map.put("code","0");
            String jsonMap = gson.toJson(map);
            return  jsonMap;
        }
        map.put("code","1");
        map.put("desc","修改购物车购买数量失败");
        String jsonMap = gson.toJson(map);
        return  jsonMap;
    }

    /**
     * 删除购物车项
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ajaxDeleteCart",produces = "text/plain;charset=utf-8")
    public String ajaxDeleteCart(HttpServletRequest request,HttpServletResponse response){
        Map<String,Object> map = new HashMap<>();
        Gson gson = new Gson();
        //获取购物车id
        String cartId = request.getParameter("cartId");
        //删除购物车项
        int result = cartService.deleteCartByCartId(cartId);
        if (result>0){
            map.put("code","0");
            return gson.toJson(map);
        }
        map.put("code","1");
        return  gson.toJson(map);
    }
}
