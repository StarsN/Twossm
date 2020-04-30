package com.gx.order.service.Impl;

import cn.com.do1.common.util.AssertUtil;
import com.gx.address.domian.TbAddressVO;
import com.gx.address.service.AddressService;
import com.gx.member.domain.TbMemberPO;
import com.gx.merchandise.domain.OrderBillPO;
import com.gx.merchandise.service.MerchandiseService;
import com.gx.merchant.domain.TbMerchantPO;
import com.gx.merchant.service.MerchantService;
import com.gx.order.dao.IOrderdao;
import com.gx.order.domain.*;
import com.gx.order.service.OrderService;
import com.gx.portal.cart.domain.TbCartInfoVO;
import com.gx.portal.cart.service.CartService;
import com.gx.util.BigDecimalUtil;
import com.gx.util.SysConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;

/**
 * @author admin
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService {
    private final static transient Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Autowired
    private IOrderdao orderdao;
    @Autowired
    private MerchandiseService merchandiseService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private CartService cartService;
    /**
     * 订单全部信息
     * @return
     */
    @Override
    public List<TbOrderInfoPO> getAllOrderInfo() {
        return orderdao.getAllOrderInfo();
    }

    /**
     * 分页查询
     * @param i
     * @param rows
     * @return
     */
    @Override
    public List<TbOrderInfoPO> getPageOrderInfo(int i, Integer rows) {
        return orderdao.getPageOrderInfo(i,rows);
    }

    /**
     * 获取订单信息
     * @param stockId
     * @return
     */
    @Override
    public OrderBillPO getOrderBillPO(String stockId) {
        return orderdao.getOrderBillPO(stockId);
    }

    /**
     *
     * @param stockMap
     * @param cartIds
     * @param tbOrderItemPO
     * @param tbOrderInfoPO
     * @param addressId
     * @return
     */
    @Override
    public StockResult stockManageInterface(HttpServletRequest request,HashMap<String, String> stockMap, String cartIds, TbOrderItemPO tbOrderItemPO, TbOrderInfoPO tbOrderInfoPO, String addressId) throws Exception {
        StockResult result = new StockResult();
        //正常下单
        //todo 暂时省去缓存扣减库存
        //todo 缓存扣库存成功
        String orderId = generateOrder(request,stockMap,cartIds,tbOrderItemPO,tbOrderInfoPO,addressId);
        result.setOrderId(orderId);
        result.setStatus(true);
        return result;
    }

    /**
     * 获取订单详细信息
     * @param orderId
     * @return
     */
    @Override
    public OrderPagePO getOrderDetail(String orderId) {
        //获取订单信息
        TbOrderInfoVO tbOrderInfoVO = orderdao.getOrderById(orderId);
        //获取订单项信息
        List<TbOrderItemVO> tbOrderItemVOS = orderdao.getOrderItemById(orderId);
        //获取配送信息
        TbSupplyInfoVO tbSupplyInfoVO = orderdao.SupplyInfoVO(orderId);
        OrderPagePO orderPagePO = new OrderPagePO();
        orderPagePO.setTbOrderInfoVO(tbOrderInfoVO);
        orderPagePO.setTbOrderItemVOList(tbOrderItemVOS);
        orderPagePO.setTbSupplyInfoVO(tbSupplyInfoVO);
        return orderPagePO;
    }

    @Override
    public int generateOrderSupply(String addressId, TbOrderInfoPO orderPO) throws Exception {
        logger.info("生成配送信息中，地址id=" + addressId);
        TbSupplyInfoPO supplypo = new TbSupplyInfoPO();
        supplypo.setSupplyId(UUID.randomUUID().toString());
        supplypo.setOrderId(orderPO.getOrderId());
        if (AssertUtil.isEmpty(addressId)) {

        } else {
            //根据addressId获取地址信息
            TbAddressVO addressVO = addressService.getAddressById(addressId);
            logger.info("会员默认地址为=" + addressVO);
            logger.info("生成配送信息中，地址id=" + addressId);
            supplypo.setCity(addressVO.getCity());
            supplypo.setInceptPeople(addressVO.getInceptPeople());
            supplypo.setInceptTel(addressVO.getInceptPhone());
            supplypo.setPayAmount("0.00");
            supplypo.setProvince(addressVO.getProvince());
            supplypo.setRegion(addressVO.getRegion());
            //supplypo.setSupplyTime(new Date());
            supplypo.setSupplyAddress(addressVO.getProvinceCityRegion() + addressVO.getStreetAddress());
            supplypo.setSupplyStatus(SysConstant.orderSupplyStatus.DELIVERYING);
            supplypo.setInceptPost(addressVO.getInceptPost());
            supplypo.setProvinceName(addressVO.getProvinceText());
            supplypo.setCityName(addressVO.getCityText());
            supplypo.setRegionName(addressVO.getRegionText());
            supplypo.setStreetAddress(addressVO.getStreetAddress());
        }
        //默认售后状态为送货上门 2
        supplypo.setSupplyType(orderPO.getOrderSupplyType());
        supplypo.setAppointmentTime(orderPO.getAppointmentTime());
        int result = orderdao.insertSupplyInfo(supplypo);
        return result;
    }

    /**
     * 超时关闭订单
     * @param orderId
     * @param orderStatus
     * @return
     */
    @Override
    public int cancelOrder(String orderId, String orderStatus,String orderStatusDesc,Date date) {
        return orderdao.cancelOrder(orderId,orderStatus,orderStatusDesc,date);
    }

    /**
     * 获取指定订单状态订单Id
     * @param memberId
     * @param orderStatus
     * @return
     */
    @Override
    public List<TbOrderInfoPO> getOrderIds1(String merchantId,String memberId, String orderStatus) {
        return orderdao.getOrderIds1(merchantId,memberId,orderStatus);
    }

    /**
     * 获取全部订单id
     * @param merchantId
     * @param memberId
     * @return
     */
    @Override
    public List<TbOrderInfoPO> getOrderIds2(String merchantId, String memberId) {
        return orderdao.getOrderIds2(merchantId,memberId);
    }

    /**
     * 获取订单全部信息，除去配送信息
     * @param orderId
     * @return
     */
    @Override
    public OrderPagePO getOrderDetail2(String orderId) {
        //获取订单信息
        TbOrderInfoVO tbOrderInfoVO = orderdao.getOrderById(orderId);
        //获取订单项信息
        List<TbOrderItemVO> tbOrderItemVOS = orderdao.getOrderItemById(orderId);
        OrderPagePO orderPagePO = new OrderPagePO();
        orderPagePO.setTbOrderInfoVO(tbOrderInfoVO);
        orderPagePO.setTbOrderItemVOList(tbOrderItemVOS);
        return orderPagePO;
    }

    /**
     *
     * @param stockMap
     * @param cartIds
     * @param tbOrderItemPO
     * @param tbOrderInfoPO
     * @param addressId
     * @return
     */
    private String generateOrder(HttpServletRequest request,HashMap<String, String> stockMap, String cartIds, TbOrderItemPO tbOrderItemPO, TbOrderInfoPO tbOrderInfoPO, String addressId) throws Exception {
        //获取member
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        //获取商家
        TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
        //生成订单id
        String orderId = UUID.randomUUID().toString();
        //立即购买下单
        if(AssertUtil.isEmpty(cartIds)){
            Date date = new Date();
            logger.info("下单时间=" + date);
            tbOrderItemPO.setOrderItemId(UUID.randomUUID().toString());
            tbOrderItemPO.setOrderId(orderId);
            tbOrderItemPO.setGenerateTime(date);
            tbOrderItemPO.setOrderItemStatus(SysConstant.orderItemStatus.NORMAL);
            tbOrderItemPO.setOrderItemStatusDesc(OrderItemStatus.getNameByCode(SysConstant.orderItemStatus.NORMAL));
            logger.info("将要插入的订单项信息=" + tbOrderItemPO);
            //将订单项插入数据库
            int result = orderdao.insertOrderItem(tbOrderItemPO);
            if (result==1){
                logger.info("订单项插入成功");
                //生成订单
                String totalAmount = tbOrderInfoPO.getCashAmount();
                String realAmount = tbOrderInfoPO.getCashAmount();
                //todo 进行优惠券优惠代码
                tbOrderInfoPO.setTotalAmount(totalAmount);
                tbOrderInfoPO.setCashAmount(realAmount);
                tbOrderInfoPO.setInvoiceAmount(realAmount);
                tbOrderInfoPO.setOrderId(orderId);
                tbOrderInfoPO.setMemberId(tbMemberPO.getMemberId());
                tbOrderInfoPO.setMerchantId(tbMerchantPO.getMerchantId());
                tbOrderInfoPO.setOrderStatus(SysConstant.orderStatus.WAIT_PAYING);
                tbOrderInfoPO.setOrderStatusDesc(OrderStatusEnum.getNameByCode(SysConstant.orderStatus.WAIT_PAYING));
                tbOrderInfoPO.setPayStatus(SysConstant.payStatus.WAIT_PAYING);
                tbOrderInfoPO.setPayStatusDesc(PayStatusEnum.getNameByCode(SysConstant.payStatus.WAIT_PAYING));
                tbOrderInfoPO.setGenerateTime(date);
                tbOrderInfoPO.setUpdateTime(date);
                //会员留言
                String memberMsg = request.getParameter("memberMsg");
                tbOrderInfoPO.setMemberMsg(memberMsg);
                logger.info("将要插入的订单信息=" + tbOrderInfoPO);
                int result2 = orderdao.inserOrderInfo(tbOrderInfoPO);
                if (result2==1){
                    logger.info("订单生成成功");
                }
                //todo 将优惠券改为已经使用
                //修改库存
                for(String key:stockMap.keySet()){
                    //stockId
                    String stockId = key;
                    //购买num
                    String num = stockMap.get(key);
                    if(Integer.parseInt(num)<1){
                        logger.info("扣减库存，购买数量少于1，下单异常，address=" + addressId);
                        throw new Exception("下单异常，请稍后再试");
                    }
                    //根据stockId查找库存
                    String stock = merchandiseService.getStockByStockId(stockId);
                    logger.info("===key:" + key +",下单前库存：" + stock + ",本次扣减库存：" + num);
                    //更新库存
                    String newStock = String.valueOf(Integer.parseInt(stock) - Integer.parseInt(num));
                    int result3 = merchandiseService.updateStock(stockId,newStock);
                    if (result3==1){
                        logger.info("数据库库存更新成功");
                    }
                }
                //生成配送信息
                int result4 = this.generateOrderSupply(addressId,tbOrderInfoPO);
                if(result4==1){
                    logger.info("新增配送信息成功");
                }
            }
        }else{
            //购物车下单
            List<TbCartInfoVO> cartList = cartService.getCartListByCartIds(cartIds);
            //算总额
            BigDecimal bg = new BigDecimal("0");
            Map<String, List<TbCartInfoVO>> cartMap = new HashMap<>();
            boolean flag = false;
            for (TbCartInfoVO cart :cartList) {
                bg = bg.add(BigDecimalUtil.mul(String.valueOf(cart.getCashPrice()), String.valueOf(cart.getBuyNum())));
                //插入订单项
                String orderItemId = UUID.randomUUID().toString();
                TbOrderItemPO tbOrderItemPO1 = new TbOrderItemPO();
                tbOrderItemPO1.setOrderItemId(orderItemId);
                tbOrderItemPO1.setOrderId(orderId);
                tbOrderItemPO1.setStockId(cart.getStockId());
                tbOrderItemPO1.setCashPrice(cart.getCashPrice());
                tbOrderItemPO1.setBuyNum(cart.getBuyNum());
                tbOrderItemPO1.setGenerateTime(new Date());
                tbOrderItemPO1.setMerchandiseCode(cart.getMerchandiseCode());
                tbOrderItemPO1.setMerchandiseName(cart.getMerchandiseName());
                tbOrderItemPO1.setOrderItemStatus(SysConstant.orderItemStatus.NORMAL);
                tbOrderItemPO1.setOrderItemStatusDesc(OrderItemStatus.getNameByCode(SysConstant.orderItemStatus.NORMAL));
                tbOrderItemPO1.setSubTotal(String.valueOf(BigDecimalUtil.mul(cart.getCashPrice(),cart.getBuyNum())));
                int result = orderdao.insertOrderItem(tbOrderItemPO1);
                if(result>0){
                    flag = true;
                }
            }
            if(flag){
                //生成订单
                logger.info("订单项插入成功");
                //生成订单
                String totalAmount = tbOrderInfoPO.getCashAmount();
                String realAmount = tbOrderInfoPO.getCashAmount();
                //todo 进行优惠券优惠代码
                tbOrderInfoPO.setTotalAmount(bg.toString());
                tbOrderInfoPO.setCashAmount(bg.toString());
                tbOrderInfoPO.setInvoiceAmount(bg.toString());
                tbOrderInfoPO.setOrderId(orderId);
                tbOrderInfoPO.setMemberId(tbMemberPO.getMemberId());
                tbOrderInfoPO.setMerchantId(tbMerchantPO.getMerchantId());
                tbOrderInfoPO.setOrderStatus(SysConstant.orderStatus.WAIT_PAYING);
                tbOrderInfoPO.setOrderStatusDesc(OrderStatusEnum.getNameByCode(SysConstant.orderStatus.WAIT_PAYING));
                tbOrderInfoPO.setPayStatus(SysConstant.payStatus.WAIT_PAYING);
                tbOrderInfoPO.setPayStatusDesc(PayStatusEnum.getNameByCode(SysConstant.payStatus.WAIT_PAYING));
                tbOrderInfoPO.setGenerateTime(new Date());
                tbOrderInfoPO.setUpdateTime(new Date());
                //会员留言
                String memberMsg = request.getParameter("memberMsg");
                tbOrderInfoPO.setMemberMsg(memberMsg);
                logger.info("将要插入的订单信息=" + tbOrderInfoPO);
                int result2 = orderdao.inserOrderInfo(tbOrderInfoPO);
                if (result2==1){
                    logger.info("订单生成成功");
                }
                //修改库存
                for(String key:stockMap.keySet()){
                    //stockId
                    String stockId = key;
                    //购买num
                    String num = stockMap.get(key);
                    if(Integer.parseInt(num)<1){
                        logger.info("扣减库存，购买数量少于1，下单异常，address=" + addressId);
                        throw new Exception("下单异常，请稍后再试");
                    }
                    //根据stockId查找库存
                    String stock = merchandiseService.getStockByStockId(stockId);
                    logger.info("===key:" + key +",下单前库存：" + stock + ",本次扣减库存：" + num);
                    //更新库存
                    String newStock = String.valueOf(Integer.parseInt(stock) - Integer.parseInt(num));
                    int result3 = merchandiseService.updateStock(stockId,newStock);
                    if (result3==1){
                        logger.info("数据库库存更新成功");
                    }
                }
                //生成配送信息
                int result4 = this.generateOrderSupply(addressId,tbOrderInfoPO);
                if(result4==1){
                    logger.info("新增配送信息成功");
                }
            }
        }
        return orderId;
    }
}
