package com.gx.portal.cart.dao;

import com.gx.merchandise.domain.TbMerchandiseStockPO;
import com.gx.portal.cart.domain.TbCartInfoPO;
import com.gx.portal.cart.domain.TbCartInfoVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICartdao {
    /**
     * 获取购物车
     * @param memberId
     * @param stockId
     * @return
     */
    @Select("select * from tb_cart_info c where memberId=#{memberId} and stockId=#{stockId} and c.isExpire='1'")
    TbCartInfoPO gainCartByMemberIdAndStockId(@Param("memberId") String memberId, @Param("stockId") String stockId);

    /**
     * 更新购物车数量
     * @param tbCartInfoPO
     * @return
     */
    @Update("update tb_cart_info set buyNum=#{po.buyNum} where cartId=#{po.cartId}")
    int updateBuyNum(@Param("po") TbCartInfoPO tbCartInfoPO);

    /**
     * 新增购物车
     * @param tbCartInfoPO
     * @return
     */
    @Insert("insert into tb_cart_info(cartId,merchandiseCode,memberId,merchantId,buyNum,isExpire,createTime,stockId)values(" +
            "#{po.cartId},#{po.merchandiseCode},#{po.memberId},#{po.merchantId},#{po.buyNum},#{po.isExpire},#{po.createTime},#{po.stockId})")
    int insertCartInfo(@Param("po") TbCartInfoPO tbCartInfoPO);

    /**
     * 获取购物车列表
     * @param memberId
     * @param merchantId
     * @return
     */
    @Select("SELECT b.*,tms.price cashPrice,m.publishAddress,m.merchandiseName,m.`status` itemStatus from (select c.*,a.imagePath from tb_cart_info c LEFT JOIN (SELECT i.merchandiseCode,i.imagePath from tb_merchandise_image i)a ON c.merchandiseCode=a.merchandiseCode where c.memberId=#{memberId} and c.isExpire='1' and c.merchantId=#{merchantId})b LEFT JOIN tb_merchandise_info m ON m.merchandiseCode=b.merchandiseCode LEFT JOIN tb_merchandise_stock tms ON tms.stockId=b.stockId")
    List<TbCartInfoVO> CartInfoByMemberIdAndMerchantId(@Param("memberId") String memberId, @Param("merchantId") String merchantId);

    /**
     * 根据购物车id获取库存
     * @param cartId
     * @return
     */
    @Select("SELECT m.* FROM tb_cart_info c LEFT JOIN tb_merchandise_stock m ON c.stockId=m.stockId WHERE c.cartId=#{cartId}")
    TbMerchandiseStockPO getStockByCartId(@Param("cartId") String cartId);

    /**
     * 修改购物车购买数量
     * @param tbCartInfoPO
     * @return
     */
    @Update("update tb_cart_info set buyNum=#{po.buyNum} where cartId=#{po.cartId}")
    int updateCartBuyNum(@Param("po") TbCartInfoPO tbCartInfoPO);

    /**
     * 删除购物车项
     * @param cartId
     * @return
     */
    @Update("update tb_cart_info c set c.isExpire='4' where cartId=#{cartId}")
    int deleteCartByCartId(@Param("cartId") String cartId);

    /**
     * 获取购物车
     * @param
     * @return
     */
    @Select({"<script>","SELECT b.*,tms.price cashPrice,m.publishAddress,m.merchandiseName,m.`status` itemStatus from (select c.*,a.imagePath from tb_cart_info c LEFT JOIN (SELECT i.merchandiseCode,i.imagePath from tb_merchandise_image i)a ON c.merchandiseCode=a.merchandiseCode where c.memberId=\"81fca143-fde7-4f9f-aafe-c1eddffff3b4\" and c.isExpire='1' and c.merchantId=\"001\") b LEFT JOIN tb_merchandise_info m ON m.merchandiseCode=b.merchandiseCode LEFT JOIN tb_merchandise_stock tms ON tms.stockId=b.stockId where b.cartId IN ",
            "<foreach collection='cartIds' item='id' open='(' separator=',' close=')'>",
            "#{id}",
            "</foreach>",
            "</script>"})
    List<TbCartInfoVO> getCartListByCartIds(@Param("cartIds") List<String> cartList);
}
