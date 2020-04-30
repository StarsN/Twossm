package com.gx.address.service.Impl;

import com.gx.address.dao.Addressdao;
import com.gx.address.domian.TbAddressPO;
import com.gx.address.domian.TbAddressVO;
import com.gx.address.service.AddressService;
import com.gx.member.domain.TbMemberPO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 */
@Service("addressService")
public class AddressServiceImpl implements AddressService {

    @Autowired
    private Addressdao addressdao;
    /**
     * 新盖地址状态
     * @param memberId
     */
    @Override
    public int updateAddressType(String memberId) {
        return addressdao.updateAddressType(memberId);
    }

    /**
     * 新增地址
     * @param addressPO
     * @return
     */
    @Override
    public int insertAddress(TbAddressPO addressPO) {
        return addressdao.insertAddress(addressPO);
    }

    /**
     * 获取会员全部地址
     * @param memberId
     * @return
     */
    @Override
    public List<TbAddressPO> getAllAddress(String memberId) {
        return addressdao.getAllAddress(memberId);
    }

    /**
     * 获取具体地址信息
     * @param addressId
     * @return
     */
    @Override
    public TbAddressVO getAddressById(String addressId) {
        return addressdao.getAddressById(addressId);
    }

    /**
     * 修改地址信息
     * @param addressPO
     * @return
     */
    @Override
    public int updateAddress(TbAddressPO addressPO) {
        return addressdao.updateAddress(addressPO);
    }

    /**
     * 删除地址
     * @param memberId
     * @param addressId
     * @return
     */
    @Override
    public int deleteAddress(String memberId, String addressId) {
        return addressdao.deleteAddress(memberId,addressId);
    }

    /**
     * 获取默认地址
     * @param memberId
     * @return
     */
    @Override
    public TbAddressPO getDefaultAddressByMemberId(String memberId) {
        return addressdao.getDefaultAddressByMemberId(memberId);
    }
}
