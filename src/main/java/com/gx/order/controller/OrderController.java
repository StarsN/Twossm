package com.gx.order.controller;


import cn.com.do1.common.util.AssertUtil;
import com.google.gson.Gson;
import com.gx.address.domian.TbAddressPO;
import com.gx.address.domian.TbAddressVO;
import com.gx.address.service.AddressService;
import com.gx.member.domain.TbMemberPO;
import com.gx.merchandise.domain.OrderBillPO;
import com.gx.merchant.domain.TbMerchantPO;
import com.gx.order.domain.*;
import com.gx.order.service.OrderService;
import com.gx.portal.cart.domain.TbCartInfoVO;
import com.gx.portal.cart.service.CartService;
import com.gx.util.BigDecimalUtil;
import com.gx.whiteList.domain.TbWhiteListPO;
import com.gx.whiteList.service.WhiteListService;
import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;
import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;

import java.util.*;

/**
 * @author admin
 */
@Controller
@RequestMapping("/order")
public class OrderController {
    private final static transient Logger logger = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private CartService cartService;

    @Autowired
    private WhiteListService whiteListService;

    /**
     * 后台管理订单列表页面
     * @return
     */
    @RequestMapping("/returnListPage")
    public String returnListPage(){
        return "order/orderManage/list";
    }

    /**
     * 提交订单跳转页面
     * @return
     */
    @RequestMapping("/returnOrderPayPage")
    public String returnOrderPayPage(HttpServletRequest request,HttpServletResponse response){
        //获取到订单Id
        String orderId = request.getParameter("orderId");
        logger.info("在提交订单跳转页面中获取orderId=" + orderId);
        return "portal/order/orderPay";
    }

    /**
     * 跳转到订单取消页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/returnOrderCancelPage")
    public String returnOrderCancelPage(HttpServletRequest request,HttpServletResponse response){
        logger.info("在returnOrderCancelPage中获取的orderId=" + request.getParameter("orderId"));
        return "portal/order/orderCancel";
    }

    /**
     * 渠道订单列表
     * @return
     */
    @RequestMapping("/returnOrderListPage")
    public String returnOrderListPage(HttpServletRequest request,HttpServletResponse response){
        String status = request.getParameter("orderStatus");
        logger.info("获取到的订单状态=" + status);
        return "portal/order/orderList";
    }

    @ResponseBody
    @RequestMapping(value = "/getAllOrderInfo",produces = "text/plain;charset=utf-8")
    public String getAllOrderInfo(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        logger.info("订单管理control层......正在查询全部订单......");
        Integer page = Integer.valueOf(request.getParameter("page"));
        Integer rows = Integer.valueOf(request.getParameter("rows"));
        logger.info("page=" + page);
        logger.info("rows=" + rows);
        List<TbOrderInfoPO> totalOrderInfoPOS = orderService.getAllOrderInfo();
        //获取分页数据
        List<TbOrderInfoPO> orderInfoPOS = orderService.getPageOrderInfo((page - 1) * rows,rows);
        logger.info("orderInfoPOS=" + orderInfoPOS);
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
        int total = totalOrderInfoPOS.size();
        map.put("total", total);
        map.put("rows", orderInfoPOS);
        String jsonMap = gson.toJson(map);
        logger.info("jsonMap=" + jsonMap);
        return jsonMap;
    }

    /**
     * 立即购买订单提交
     * @param request
     * @return
     */
    @RequestMapping(value = "/purchase2Submit",produces = "text/plain;charset=utf-8")
    public String purchase2Submit(HttpServletRequest request,HttpServletResponse response){
        String stockId = request.getParameter("stockId");
        String buyNum = request.getParameter("buyNum");
        //获取session中的商家
        TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
        //获取session中的member
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        //获取到商品订单信息
        OrderBillPO orderBillPO = orderService.getOrderBillPO(stockId);
        logger.info("订单信息=" +orderBillPO);
        //检查白名单情况
        List<TbWhiteListPO> listWhite = whiteListService.getWhiteListInfoByMerchandiseCode(orderBillPO.getMerchandiseCode());
        if (listWhite != null && listWhite.size() > 0) {
            logger.info("商品:" + orderBillPO.getMerchandiseCode() + "存在白名单策略--");
            logger.info("白名单数量=" + listWhite.size());
            String phoneNumber = tbMemberPO.getPhoneNumber();//用户手机
            if (!AssertUtil.isEmpty(phoneNumber)) {
                logger.info("member用户：" + tbMemberPO.getMemberId() + "存在手机号：" + phoneNumber);
                boolean prohibitionFlag = true;//标识禁止购买，默认禁止
                for (TbWhiteListPO pp : listWhite) {
                    if (pp.getWhiteListMember() != null && pp.getWhiteListMember().indexOf(phoneNumber) >= 0) {
                        logger.info("用户：" + phoneNumber + "通过白名单校验，继续购买");
                        prohibitionFlag = false;//不禁止购买
                        continue;//跳出循环
                    }
                }
                if (prohibitionFlag) {
                    logger.info("用户：" + phoneNumber + "所有报名单策略都不通过，禁止购买");
                    request.setAttribute("resultDesc", listWhite.get(0).getWhiteListTips());
                }
            } else {
                logger.info("member用户：" + tbMemberPO.getMemberId() + "不存在手机号，不允许购买");
                request.setAttribute("resultDesc", listWhite.get(0).getWhiteListTips());
            }
        } else {
            logger.info("商品:" + orderBillPO.getMerchandiseCode() + "不存在白名单策略--");
        }

        //商品总金额
        BigDecimal bg = BigDecimalUtil.mul(orderBillPO.getPrice(), buyNum);
        Double totalPrice=bg.doubleValue();
        //获取默认地址
        String memberId= tbMemberPO.getMemberId();
        TbAddressPO defaultAddress = null;
        if(memberId!=null){
            defaultAddress = addressService.getDefaultAddressByMemberId(memberId);
            if(AssertUtil.isEmpty(defaultAddress)){
                List<TbAddressPO> tbAddressPOS = addressService.getAllAddress(memberId);
                defaultAddress = tbAddressPOS.get(0);
            }
        }
        request.setAttribute("orderBillPO",orderBillPO);
        request.setAttribute("addressPO",defaultAddress);
        request.setAttribute("tbMerchantPO",tbMerchantPO);
        request.setAttribute("buyNum",buyNum);
        request.setAttribute("totalPrice",totalPrice);
        return "portal/order/order_fillout";
    }

    //立即购买提交订单
    @ResponseBody
    @RequestMapping(value = "/orderSubmit",produces = "text/plain;charset=utf-8")
    public String orderSubmit(HttpServletRequest request,HttpServletResponse response) throws Exception {
        logger.info("-------------------提交订单处理中-------------");
        Map<String,Object> map = new HashMap<>();
        String code = null;
        Gson gson = new Gson();
        //获取到会员信息
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        //获取到地址id
        String addressId = request.getParameter("addressId");
        //获取到库存Id
        String stockId = request.getParameter("stockId");
        logger.info("获取到的stockId=" + stockId);
        //获取到购买数量
        String buyNum = request.getParameter("buyNum");
        logger.info("获取到的购买数量=" + buyNum);
        //订单id
        String orderId = null;
        if(AssertUtil.isEmpty(stockId)||AssertUtil.isEmpty(buyNum)){
            //获取订单信息失败
            code = "1";
        }else{
            //获取到billPO
            OrderBillPO orderBillPO = orderService.getOrderBillPO(stockId);
            //获取到商品Code
            String merchandiseCode = orderBillPO.getMerchandiseCode();
            BigDecimal totalPrice = BigDecimalUtil.mul(orderBillPO.getPrice(),buyNum);
            logger.info("订单总额为=" + totalPrice);
            //创建订单PO
            TbOrderInfoPO tbOrderInfoPO = new TbOrderInfoPO();
            tbOrderInfoPO.setCashAmount(totalPrice.toString());
            //创建订单项PO
            TbOrderItemPO tbOrderItemPO = new TbOrderItemPO();
            //设置库存id
            tbOrderItemPO.setStockId(stockId);
            //设置购买数量
            tbOrderItemPO.setBuyNum(buyNum);
            //设置单价
            tbOrderItemPO.setCashPrice(orderBillPO.getPrice());
            //设置总价格
            tbOrderItemPO.setSubTotal(totalPrice.toString());
            //设置商品编号和商品名称
            tbOrderItemPO.setMerchandiseCode(orderBillPO.getMerchandiseCode());
            tbOrderItemPO.setMerchandiseName(orderBillPO.getMerchandiseName());
            //将订单插入订单项信息
            StockResult result = null;
            //库存map，参数1-库存id，参数2购买数量
            HashMap<String,String> stockMap = new HashMap<>();
            stockMap.put(stockId,buyNum);
            //参数1-库存map，参数2-cartIds,购物ids没有则是立即购买下单，参数3-订单项PO，参数4-订单PO，参数5-收货地址id
            result = orderService.stockManageInterface(request,stockMap,null,tbOrderItemPO,tbOrderInfoPO,addressId);
            if(!result.isStatus()){
                code = "1";
                logger.info("库存扣减失败");
            }
            code="0";
            orderId = result.getOrderId();
        }
        map.put("code",code);
        map.put("orderId",orderId);
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }

    /**
     * 获取订单详细信息
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ajaxView",produces = "text/plain;charset=utf-8")
    public String ajaxView(HttpServletRequest request,HttpServletResponse response){
        //获取订单id
        String orderId = request.getParameter("orderId");
        //获取订单的详细信息
        OrderPagePO orderPagePO = orderService.getOrderDetail(orderId);
        logger.info("订单详细信息=" + orderPagePO);
        Map<String,Object> map = new HashMap<>();
        Gson gson = new Gson();
        map.put("code","0");
        map.put("orderPagePO",orderPagePO);
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }

    /**
     * 超时关闭订单
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/cancelOrder",produces = "text/plain;charset=utf-8")
    public String cancelOrder(HttpServletRequest request,HttpServletResponse response){
        String orderId = request.getParameter("orderId");
        String orderStatus = request.getParameter("orderStatus");
        String orderStatusDesc = OrderStatusEnum.getNameByCode(orderStatus);
        int result = orderService.cancelOrder(orderId,orderStatus,orderStatusDesc,new Date());
        Map<String,Object> map = new HashMap<>();
        map.put("code","0");
        Gson gson = new Gson();
        String jsonMap = gson.toJson(map);
        return  jsonMap;
    }

    /**
     * 获取指定订单状态全部订单Id
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getOrderIds",produces = "text/plain;charset=utf-8")
    public String getOrderIds(HttpServletRequest request,HttpServletResponse response){
        //获取订单状态
        String orderStatus = request.getParameter("orderStatus");
        //获取会员id
        TbMemberPO memberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        //获取merchantId
        TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
        String merchantId = tbMerchantPO.getMerchantId();
        String memberId = memberPO.getMemberId();
        List<TbOrderInfoPO> tbOrderInfoPOS = null;
        logger.info("status=" + orderStatus);
        if("1".equals(orderStatus)||"2".equals(orderStatus)||"3".equals(orderStatus)){
            logger.info("订单状态不为空");
            //根据用户id\订单状态获取全部订单id
            tbOrderInfoPOS = orderService.getOrderIds1(merchantId,memberId,orderStatus);
            Map<String,Object> map = new HashMap<>();
            map.put("tbOrderInfoPOs",tbOrderInfoPOS);
            Gson gson = new Gson();
            String jsonMap=gson.toJson(map);
            return jsonMap;
        }else{
            logger.info("订单状态为空");
            tbOrderInfoPOS = orderService.getOrderIds2(merchantId,memberId);
            Map<String,Object> map = new HashMap<>();
            map.put("tbOrderInfoPOs",tbOrderInfoPOS);
            Gson gson = new Gson();
            String jsonMap=gson.toJson(map);
            return jsonMap;
        }

    }

    /**
     * 获取订单信息
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getOrder",produces = "text/plain;charset=utf-8")
    public String getOrder(HttpServletRequest request,HttpServletResponse response) {
        //获取订单状态
        String orderStatus = request.getParameter("orderStatus");
        //获取会员id
        TbMemberPO memberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        //获取merchantId
        TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
        String merchantId = tbMerchantPO.getMerchantId();
        String memberId = memberPO.getMemberId();
        List<TbOrderInfoPO> tbOrderInfoPOS = null;
        logger.info("status=" + orderStatus);
        if ("1".equals(orderStatus) || "2".equals(orderStatus) || "3".equals(orderStatus)) {
            logger.info("订单状态不为空");
            //根据用户id\订单状态获取全部订单id
            tbOrderInfoPOS = orderService.getOrderIds1(merchantId, memberId, orderStatus);
        } else {
            logger.info("订单状态为空");
            tbOrderInfoPOS = orderService.getOrderIds2(merchantId, memberId);
        }
        //根据订单id查找到orderPage
        List<OrderPagePO> orderPagePOS = new ArrayList<>();
        if (!AssertUtil.isEmpty(tbOrderInfoPOS)) {
            for (int i = 0; i < tbOrderInfoPOS.size(); i++) {
                String orderId = tbOrderInfoPOS.get(i).getOrderId();
                OrderPagePO orderPagePO = orderService.getOrderDetail2(orderId);
                orderPagePOS.add(orderPagePO);
            }
        }
        logger.info("订单详细信息=" + orderPagePOS);
        Map<String, Object> map = new HashMap<>();
        map.put("OrderPagerVO", orderPagePOS);
        Gson gson = new Gson();
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }

    /**
     * 购物车结算
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/cart2Submit",produces = "text/plain;charset=utf-8")
    public ModelAndView cart2Submit(HttpServletRequest request, HttpServletResponse response){
        //获取到会员信息
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        //获取session中的商家
        TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
        //获取到cartIds[]
        String cartIds = request.getParameter("cartIds");
        //根据ids查询购物车信息
        List<TbCartInfoVO> cartList = cartService.getCartListByCartIds(cartIds);
        logger.info("获取到的cartList=" + cartList);
        //获取默认地址
        String memberId= tbMemberPO.getMemberId();
        TbAddressPO defaultAddress = null;
        if(memberId!=null){
            defaultAddress = addressService.getDefaultAddressByMemberId(memberId);
            if(AssertUtil.isEmpty(defaultAddress)){
                List<TbAddressPO> tbAddressPOS = addressService.getAllAddress(memberId);
                defaultAddress = tbAddressPOS.get(0);
            }
        }
        BigDecimal bg = new BigDecimal("0");
        for (TbCartInfoVO cart : cartList) {
//            if (cart.getBuyNum() < ) {
//                logger.info("购物车购买数量小于1，异常加入购物车，返回首页·····");
//                return "order_purchase_error";
//            }
            bg = bg.add(BigDecimalUtil.mul(cart.getCashPrice(), cart.getBuyNum()));
        }
        ModelAndView modelAndView = new ModelAndView();
        request.setAttribute("address",defaultAddress);
        request.setAttribute("cartList",cartList);
        request.setAttribute("totalPrice",bg.doubleValue());
        request.setAttribute("tbMerchantPO",tbMerchantPO);
        request.setAttribute("cartIds",cartIds);
        modelAndView.addObject("cartList",cartList);
        modelAndView.setViewName("portal/order/order_fillout2");
        return modelAndView;
    }

    /**
     * 购物车下单
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/cartOrderSubmit",produces = "text/plain;charset=utf-8")
    public String cartOrderSubmit(HttpServletRequest request,HttpServletResponse response) throws Exception {
        logger.info("-------------------提交订单处理中-------------");
        Map<String,Object> map = new HashMap<>();
        String code = "";
        Gson gson = new Gson();
        //获取到会员信息
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        //获取到地址id
        String addressId = request.getParameter("addressId");
        //获取到购物车ids
        String cartIds = request.getParameter("cartIds");
        logger.info("获取到的cartIds=" + cartIds);
        //订单id
        String orderId = null;
        List<TbCartInfoVO> cartList = null;
        if(AssertUtil.isEmpty(cartIds)){
            code = "1";
        }else{
            cartList = cartService.getCartListByCartIds(cartIds);
        }
        //扣减库存
        HashMap<String,String> stockMap = new HashMap<>();
        for (TbCartInfoVO vo : cartList) {
            stockMap.put(vo.getStockId(),vo.getBuyNum());
        }
        //创建订单PO
        TbOrderInfoPO tbOrderInfoPO = new TbOrderInfoPO();
        //将订单插入订单项信息
        StockResult result = null;
        result = orderService.stockManageInterface(request,stockMap,cartIds,null,tbOrderInfoPO,addressId);
        if(!result.isStatus()){
            code = "1";
            logger.info("库存扣减失败");
        }
        code="0";
        orderId = result.getOrderId();
        map.put("code",code);
        map.put("orderId",orderId);
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }
}
