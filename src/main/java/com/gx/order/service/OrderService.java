package com.gx.order.service;

import com.gx.merchandise.domain.OrderBillPO;
import com.gx.order.domain.OrderPagePO;
import com.gx.order.domain.StockResult;
import com.gx.order.domain.TbOrderInfoPO;
import com.gx.order.domain.TbOrderItemPO;
import com.gx.portal.cart.domain.TbCartInfoVO;
import org.apache.ibatis.annotations.Select;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author admin
 */
public interface OrderService {

    /**
     * 订单全部信息
     * @return
     */
    List<TbOrderInfoPO> getAllOrderInfo();

    /**
     * 分页查询
     * @param i
     * @param rows
     * @return
     */
    List<TbOrderInfoPO> getPageOrderInfo(int i, Integer rows);

    /**
     * 获取订单信息
     * @param stockId
     * @return
     */
    OrderBillPO getOrderBillPO(String stockId);

    /**
     *
     * @param stockMap
     * @param cartIds
     * @param tbOrderItemPO
     * @param tbOrderInfoPO
     * @param addressId
     * @return
     */
    StockResult stockManageInterface(HttpServletRequest request,HashMap<String, String> stockMap, String cartIds, TbOrderItemPO tbOrderItemPO, TbOrderInfoPO tbOrderInfoPO, String addressId) throws Exception;

    /**
     * 获取订单详细信息
     * @param orderId
     * @return
     */
    OrderPagePO getOrderDetail(String orderId);

    int generateOrderSupply(String addressId, TbOrderInfoPO orderPO) throws Exception;

    /**
     * 超时关闭订单
     * @param orderId
     * @param orderStatus
     * @return
     */
    int cancelOrder(String orderId, String orderStatus, String orderStatusDesc, Date date);

    /**
     * 获取指定订单状态订单id
     * @param memberId
     * @param orderStatus
     * @return
     */
    List<TbOrderInfoPO> getOrderIds1(String merchantId,String memberId, String orderStatus);

    /**
     * 获取全部订单id
     * @param merchantId
     * @param memberId
     * @return
     */
    List<TbOrderInfoPO> getOrderIds2(String merchantId, String memberId);

    /**
     * 获取订单全部信息，除去配信息
     * @param orderId
     * @return
     */
    OrderPagePO getOrderDetail2(String orderId);


}
