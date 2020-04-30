package com.gx.portal.cart.domain;

import java.util.List;

public class TbCartInfoPVO {
    private String merchantName;
    private List<TbCartInfoVO> cartList;

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public List<TbCartInfoVO> getCartList() {
        return cartList;
    }

    public void setCartList(List<TbCartInfoVO> cartList) {
        this.cartList = cartList;
    }

    @Override
    public String toString() {
        return "TbCartInfoPVO{" +
                "merchantName='" + merchantName + '\'' +
                ", cartList=" + cartList +
                '}';
    }
}
