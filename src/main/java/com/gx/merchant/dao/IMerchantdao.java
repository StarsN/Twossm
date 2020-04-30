package com.gx.merchant.dao;

import com.gx.merchant.domain.TbMerchantPO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author admin
 */
@Repository
public interface IMerchantdao {

    /**
     * 获取所有商家信息
     * @return
     */
    @Select("select * from tb_merchant")
    List<TbMerchantPO> getAllMerchantInfo();

    /**
     * 分页商家信息
     * @param i
     * @param rows
     * @return
     */
    @Select("select * from tb_merchant limit #{start},#{end}")
    List<TbMerchantPO> getPageMerchantInfo(@Param("start") int i, @Param("end") Integer rows);

    /**
     * 有商家Code查询
     * @param merchantCode
     * @return
     */
    @Select("select * from tb_merchant where merchantCode=#{merchantCode}")
    List<TbMerchantPO> getAllMerchantInfoByMerchantCode(@Param("merchantCode") String merchantCode);

    /**
     * 有商家code限制查询
     * @param i
     * @param rows
     * @param merchantCode
     * @return
     */
    @Select("select * from tb_merchant where merchantCode=#{merchantCode} limit #{start},#{end}")
    List<TbMerchantPO> getPageMerchantInfoByMerchantCode(@Param("start") int i, @Param("end") Integer rows, @Param("merchantCode") String merchantCode);

    /**
     * 根据商家code查找商家信息
     * @param merchantCode
     * @return
     */
    @Select("select * from tb_merchant where merchantCode=#{merchantCode}")
    TbMerchantPO getMerchantInfoByMerchantCode(@Param("merchantCode") String merchantCode);
}
