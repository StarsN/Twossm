package com.gx.address.dao;

import com.gx.address.domian.TbAddressPO;
import com.gx.address.domian.TbAddressVO;
import com.gx.member.domain.TbMemberPO;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author admin
 */
@Repository
public interface Addressdao {

    /**
     * 更新地址状态
     * @param memberId
     * @return
     */
    @Update("update tb_address set addressType='0' where memberId=#{memberId}")
    public int updateAddressType(@Param("memberId") String memberId);

    /**
     * 新增地址
     * @param addressPO
     * @return
     */
    @Insert("insert into tb_address(addressId,memberId,inceptPeople,inceptPhone,province,city,region,streetAddress,provinceCityRegion,provinceText,cityText,regionText,addressType,inceptPost,createTime,lastUpdateTime)values(" +
            "#{po.addressId},#{po.memberId},#{po.inceptPeople},#{po.inceptPhone},#{po.province},#{po.city},#{po.region},#{po.streetAddress},#{po.provinceCityRegion},#{po.provinceText},#{po.cityText},#{po.regionText},#{po.addressType},#{po.inceptPost},#{po.createTime},#{po.lastUpdateTime})")
    int insertAddress(@Param("po") TbAddressPO addressPO);

    /**
     * 获取会员全部地址
     * @param memberId
     * @return
     */
    @Select("select * from tb_address where memberId=#{memberId} order by addressType desc")
    List<TbAddressPO> getAllAddress(@Param("memberId") String memberId);

    @Select("select * from tb_address where addressId=#{addressId}")
    TbAddressVO getAddressById(@Param("addressId") String addressId);

    /**
     * 修改地址信息
     * @param addressPO
     * @return
     */
    @Update("update tb_address set inceptPeople=#{po.inceptPeople},inceptPhone=#{po.inceptPhone},province=#{po.province},city=#{po.city},region=#{po.region},streetAddress=#{po.streetAddress},provinceCityRegion=#{po.provinceCityRegion},provinceText=#{po.provinceText},cityText=#{po.cityText},regionText=#{po.regionText},addressType=#{po.addressType},inceptPost=#{po.inceptPost},lastUpdateTime=#{po.lastUpdateTime} where addressId=#{po.addressId}")
    int updateAddress(@Param("po") TbAddressPO addressPO);

    /**
     * 删除地址
     * @param memberId
     * @param addressId
     * @return
     */
    @Delete("delete from tb_address where memberId=#{memberId} and addressId=#{addressId}")
    int deleteAddress(@Param("memberId") String memberId, @Param("addressId") String addressId);

    /**
     * 获取默认地址
     * @param memberId
     * @return
     */
    @Select("select * from tb_address where memberId=#{memberId} and addressType='1'")
    TbAddressPO getDefaultAddressByMemberId(@Param("memberId") String memberId);
}
