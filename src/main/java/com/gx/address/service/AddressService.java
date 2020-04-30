package com.gx.address.service;

import com.gx.address.domian.TbAddressPO;
import com.gx.address.domian.TbAddressVO;
import com.gx.member.domain.TbMemberPO;

import java.util.List;

public interface AddressService {
    /**
     * 更改地址状态
     * @param memberId
     */
    int updateAddressType(String memberId);

    /**
     * 新增地址
     * @param addressPO
     * @return
     */
    int insertAddress(TbAddressPO addressPO);

    /**
     * 根据会员id获取全部地址
     * @param memberId
     * @return
     */
    List<TbAddressPO> getAllAddress(String memberId);

    /**
     * 获取具体地址信息
     * @param addressId
     * @return
     */
    TbAddressVO getAddressById(String addressId);

    /**
     * 修改地址信息
     * @param addressPO
     * @return
     */
    int updateAddress(TbAddressPO addressPO);

    /**
     * 删除地址
     * @param memberId
     * @param addressId
     * @return
     */
    int deleteAddress(String memberId, String addressId);

    /**
     * 获取默认地址
     * @param memberId
     * @return
     */
    TbAddressPO getDefaultAddressByMemberId(String memberId);
}
