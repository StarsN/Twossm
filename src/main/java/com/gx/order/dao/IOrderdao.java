package com.gx.order.dao;


import com.gx.merchandise.domain.OrderBillPO;
import com.gx.order.domain.*;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @author admin
 */
@Repository
public interface IOrderdao {
    /**
     * 查询全部订单信息
     * @return
     */
    @Select("select * from tb_order_info")
    List<TbOrderInfoPO> getAllOrderInfo();

    /**
     * 分页查询
     * @param i
     * @param rows
     * @return
     */
    @Select("select * from tb_order_info limit #{start},#{end}")
    List<TbOrderInfoPO> getPageOrderInfo(@Param("start") int i, @Param("end") Integer rows);

    /**
     * 获取订单信息
     * @param stockId
     * @return
     */
    @Select("SELECT tms.stockId,tms.merchandiseCode,tmi.`status`,tms.price,tmi.merchandiseName,tmim.imagePath FROM tb_merchandise_stock tms LEFT JOIN tb_merchandise_info tmi ON tms.merchandiseCode = tmi.merchandiseCode LEFT JOIN tb_merchandise_image tmim ON tms.merchandiseCode = tmim.merchandiseCode WHERE tms.stockId=#{stockId}")
    OrderBillPO getOrderBillPO(@Param("stockId") String stockId);

    /**
     * 插入订单项信息
     * @param
     */
    @Insert("insert into tb_orderItem(orderItemId,orderId,merchandiseCode,merchandiseName,cashPrice,buyNum,subTotal,generateTime,orderItemStatus,orderItemStatusDesc,stockId)values(" +
            "#{po.orderItemId},#{po.orderId},#{po.merchandiseCode},#{po.merchandiseName},#{po.cashPrice},#{po.buyNum},#{po.subTotal},#{po.generateTime},#{po.orderItemStatus},#{po.orderItemStatusDesc},#{po.stockId})")
    int insertOrderItem(@Param("po")TbOrderItemPO tbOrderItemPO);

    /**
     * 插入订单信息
     * @param tbOrderInfoPO
     * @return
     */
    @Insert("insert into tb_order_info(orderId,memberId,merchantId,orderStatus,orderStatusDesc,payStatus,payStatusDesc,payTime,endTime,memberMsg,generateTime,updateTime,sendTime,completeTime,cashAmount,totalAmount,discountAmount,invoiceAmount)values(" +
            "#{po.orderId},#{po.memberId},#{po.merchantId},#{po.orderStatus},#{po.orderStatusDesc},#{po.payStatus},#{po.payStatusDesc},#{po.payTime},#{po.endTime},#{po.memberMsg},#{po.generateTime},#{po.updateTime},#{po.sendTime},#{po.completeTime},#{po.cashAmount},#{po.totalAmount},#{po.discountAmount},#{po.invoiceAmount})")
    int inserOrderInfo(@Param("po") TbOrderInfoPO tbOrderInfoPO);

    /**
     * 获取订单信息
     * @param orderId
     * @return
     */
    @Select("select t1.*,t2.*,t3.phoneNumber from tb_order_info t1\n" +
            "LEFT JOIN tb_merchant t2 ON t1.merchantId=t2.merchantId\n" +
            "LEFT JOIN tb_member t3 ON t1.memberId=t3.memberId where t1.orderId=#{orderId}")
    TbOrderInfoVO getOrderById(@Param("orderId") String orderId);

    /**
     * 获取订单项信息
     * @param orderId
     * @return
     */
    //    tb_order_item tb_merchandise_image tb_merchandise_info TB_MERCHANDISE_STOCK tb_merchant
    //todo tb_merchandise_assessment
    @Select("SELECT t1.*,t2.*,t3.publishAddress,t5.merchantName FROM tb_orderitem t1 LEFT JOIN tb_merchandise_image t2 ON t1.merchandiseCode=t2.merchandiseCode\n" +
            "LEFT JOIN tb_merchandise_info t3 ON t2.merchandiseCode=t3.merchandiseCode\n" +
            "LEFT JOIN tb_merchandise_stock t4 ON t1.stockId=t4.stockId\n" +
            "LEFT JOIN tb_merchant t5 ON t3.merchantCode=t5.merchantCode where t1.orderId=#{orderId}")
    List<TbOrderItemVO> getOrderItemById(@Param("orderId") String orderId);

    /**
     * 新增收货信息
     * @param supplypo
     * @return
     */
    @Insert("insert into tb_supply_info(supplyId,orderId,logistcsCompany,logistcsId,supplyType,supplyStatus,payAmount,supplyTime,overTime,inceptPeople,inceptTel,inceptPost,province,city,region,supplyAddress,supplyRemark,provinceName,cityName,regionName,streetAddress,appointmentTime)values(" +
            "#{po.supplyId},#{po.orderId},#{po.logistcsCompany},#{po.logistcsId},#{po.supplyType},#{po.supplyStatus},#{po.payAmount},#{po.supplyTime},#{po.overTime},#{po.inceptPeople},#{po.inceptTel},#{po.inceptPost},#{po.province},#{po.city},#{po.region},#{po.supplyAddress},#{po.supplyRemark},#{po.provinceName},#{po.cityName},#{po.regionName},#{po.streetAddress},#{po.appointmentTime})")
    int insertSupplyInfo(@Param("po") TbSupplyInfoPO supplypo);

    /**
     * 货物配送信息
     * @param orderId
     * @return
     */
    @Select("select * from tb_supply_info where orderId=#{orderId}")
    TbSupplyInfoVO SupplyInfoVO(@Param("orderId") String orderId);

    /**
     * 超时关闭订单
     * @param orderId
     * @param orderStatus
     * @return
     */
    @Update("update tb_order_info set orderStatus=#{orderStatus},orderStatusDesc=#{orderStatusDesc},updateTime=#{date} where orderId=#{orderId} and (orderStatus='1' or orderStatus='20')")
    int cancelOrder(@Param("orderId") String orderId, @Param("orderStatus") String orderStatus,@Param("orderStatusDesc") String orderStatusDesc,@Param("date") Date date);

    /**
     * 获取指定状态订单id
     * @param memberId
     * @param orderStatus
     * @return
     */
    @Select("select t.orderId from tb_order_info t where t.memberId =#{memberId} and t.merchantId=#{merchantId} AND t.orderStatus=#{orderStatus} ORDER BY t.generateTime DESC")
    List<TbOrderInfoPO> getOrderIds1(@Param("merchantId")String merchantId,@Param("memberId") String memberId, @Param("orderStatus") String orderStatus);

    /**
     * 获取全部顶单id
     * @param merchantId
     * @param memberId
     * @return
     */
    @Select("select t.orderId from tb_order_info t where t.memberId =#{memberId} and t.merchantId=#{merchantId} ORDER BY t.generateTime DESC")
    List<TbOrderInfoPO> getOrderIds2(@Param("merchantId") String merchantId, @Param("memberId") String memberId);



////    TB_ORDER_INFO
//            tb_order_item
//    TB_MEMBER
//            TB_SUPPLY_INFO
//    tb_merchant
//            TB_ORDER_INFO_EXPAND
}
