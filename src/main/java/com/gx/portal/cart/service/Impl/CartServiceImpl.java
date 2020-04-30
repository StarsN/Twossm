package com.gx.portal.cart.service.Impl;

import com.gx.merchandise.domain.TbMerchandiseStockPO;
import com.gx.merchant.domain.TbMerchantPO;
import com.gx.portal.cart.dao.ICartdao;
import com.gx.portal.cart.domain.TbCartInfoPO;
import com.gx.portal.cart.domain.TbCartInfoPVO;
import com.gx.portal.cart.domain.TbCartInfoVO;
import com.gx.portal.cart.service.CartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Service("cartService")
public class CartServiceImpl implements CartService {
    private final static transient Logger logger = LoggerFactory.getLogger(CartServiceImpl.class);
    @Autowired
    private ICartdao cartdao;
    /**
     * 获取购物车
     * @param memberId
     * @param stockId
     * @return
     */
    @Override
    public TbCartInfoPO gainCartByMemberIdAndStockId(String memberId, String stockId) {
        return cartdao.gainCartByMemberIdAndStockId(memberId,stockId);
    }

    /**
     * 更新购物车数量
     * @param tbCartInfoPO
     * @return
     */
    @Override
    public int updateBuyNum(TbCartInfoPO tbCartInfoPO) {
        return cartdao.updateBuyNum(tbCartInfoPO);
    }

    /**
     * 新增购物车
     * @param tbCartInfoPO
     * @return
     */
    @Override
    public int insertCartInfo(TbCartInfoPO tbCartInfoPO) {
        return cartdao.insertCartInfo(tbCartInfoPO);
    }

    /**
     * 获取购物车列表
     * @param memberId
     * @param tbMerchantPO
     * @return
     */
    @Override
    public List<TbCartInfoPVO> getCartInfoPVOListByMemberIdAndMerchant(String memberId, TbMerchantPO tbMerchantPO) {
        List<TbCartInfoVO> tbCartInfoVOList = cartdao.CartInfoByMemberIdAndMerchantId(memberId,tbMerchantPO.getMerchantId());
        List<TbCartInfoPVO> tbCartInfoPVOList = new ArrayList<>();
        TbCartInfoPVO tbCartInfoPVO = new TbCartInfoPVO();
        tbCartInfoPVO.setCartList(tbCartInfoVOList);
        tbCartInfoPVO.setMerchantName(tbMerchantPO.getMerchantName());
        tbCartInfoPVOList.add(tbCartInfoPVO);
        return tbCartInfoPVOList;
    }

    /**
     * 根据购物车id获取库存
     * @param cartId
     * @return
     */
    @Override
    public TbMerchandiseStockPO getStockByCartId(String cartId) {
        return cartdao.getStockByCartId(cartId);
    }

    /**
     * 修改购物车购买数量
     * @param tbCartInfoPO
     * @return
     */
    @Override
    public int updateCartBuyNum(TbCartInfoPO tbCartInfoPO) {
        return cartdao.updateCartBuyNum(tbCartInfoPO);
    }

    /**
     * 删除购物车项
     * @param cartId
     * @return
     */
    @Override
    public int deleteCartByCartId(String cartId) {
        return cartdao.deleteCartByCartId(cartId);
    }

    /**
     * 获取购物车信息
     * @param cartIds
     * @return
     */
    @Override
    public List<TbCartInfoVO> getCartListByCartIds(String cartIds) {
        logger.info("cartIds=" + cartIds);
        String[] cartIdArray = cartIds.split(",");
        logger.info("cartIdArry=" + cartIdArray.toString());
        List<String> cartList = new ArrayList<>(Arrays.asList(cartIdArray));
        logger.info("cartList=" +cartList);
//        StringBuilder sb = new StringBuilder();
//        if(cartIdArray.length == 1){
//            sb.append("('").append(cartIds.trim()).append("')");
//        }
//        if(cartIdArray.length>1){
//            sb.append("(");
//            for(int i = 0;i < cartIdArray.length;i++){
//                sb.append("'").append(cartIdArray[i].trim()).append("'");
//                if(i!=cartIdArray.length-1){
//                    sb.append(",");
//                }
//            }
//            sb.append(")");
//        }
        return cartdao.getCartListByCartIds(cartList);
    }
}
