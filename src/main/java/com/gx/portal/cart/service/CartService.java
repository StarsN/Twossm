package com.gx.portal.cart.service;

import com.gx.merchandise.domain.TbMerchandiseStockPO;
import com.gx.merchant.domain.TbMerchantPO;
import com.gx.portal.cart.domain.TbCartInfoPO;
import com.gx.portal.cart.domain.TbCartInfoPVO;
import com.gx.portal.cart.domain.TbCartInfoVO;

import java.util.List;

public interface CartService {
    /**
     * 获取购物车
     * @param memberId
     * @param stockId
     * @return
     */
    TbCartInfoPO gainCartByMemberIdAndStockId(String memberId, String stockId);

    /**
     * 更新购物车数量
     * @param tbCartInfoPO
     * @return
     */
    int updateBuyNum(TbCartInfoPO tbCartInfoPO);

    /**
     * 新增购物车
     * @param tbCartInfoPO
     * @return
     */
    int insertCartInfo(TbCartInfoPO tbCartInfoPO);

    /**
     * 获取购物车列表
     * @param memberId
     * @param tbMerchantPO
     * @return
     */
    List<TbCartInfoPVO> getCartInfoPVOListByMemberIdAndMerchant(String memberId, TbMerchantPO tbMerchantPO);

    /**
     * 根据购物车id获取库存
     * @param cartId
     * @return
     */
    TbMerchandiseStockPO getStockByCartId(String cartId);

    /**
     * 修改购物车购买数量
     * @param tbCartInfoPO
     * @return
     */
    int updateCartBuyNum(TbCartInfoPO tbCartInfoPO);

    /**
     * 删除购物车项
     * @param cartId
     * @return
     */
    int deleteCartByCartId(String cartId);

    /**
     * 获取购物车信息
     * @param cartIds
     * @return
     */
    List<TbCartInfoVO> getCartListByCartIds(String cartIds);
}
