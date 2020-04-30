package com.gx.order.domain;

import java.util.List;

public class OrderPagePO {
    //订单信息
    private TbOrderInfoVO tbOrderInfoVO;
    //订单项信息
    private List<TbOrderItemVO> tbOrderItemVOList;
    //配送信息
    private TbSupplyInfoVO tbSupplyInfoVO;

    public TbOrderInfoVO getTbOrderInfoVO() {
        return tbOrderInfoVO;
    }

    public void setTbOrderInfoVO(TbOrderInfoVO tbOrderInfoVO) {
        this.tbOrderInfoVO = tbOrderInfoVO;
    }

    public List<TbOrderItemVO> getTbOrderItemVOList() {
        return tbOrderItemVOList;
    }

    public void setTbOrderItemVOList(List<TbOrderItemVO> tbOrderItemVOList) {
        this.tbOrderItemVOList = tbOrderItemVOList;
    }

    public TbSupplyInfoVO getTbSupplyInfoVO() {
        return tbSupplyInfoVO;
    }

    public void setTbSupplyInfoVO(TbSupplyInfoVO tbSupplyInfoVO) {
        this.tbSupplyInfoVO = tbSupplyInfoVO;
    }

    @Override
    public String toString() {
        return "OrderPagePO{" +
                "tbOrderInfoVO=" + tbOrderInfoVO +
                ", tbOrderItemVOList=" + tbOrderItemVOList +
                ", tbSupplyInfoVO=" + tbSupplyInfoVO +
                '}';
    }
}
