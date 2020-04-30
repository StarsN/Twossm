package com.gx.merchant.service;

import com.gx.merchant.domain.TbMerchantPO;

import java.util.List;

public interface MerchantService {

    /**
     * 获取所有商家
     * @return
     */
    List<TbMerchantPO> getAllMerchantInfo();

    /**
     * 获取分页商家信息
     * @param i
     * @param rows
     * @return
     */
    List<TbMerchantPO> getPageMerchantInfo(int i, Integer rows);

    /**
     * 有商家merchantCode
     * @param merchantCode
     * @return
     */
    List<TbMerchantPO> getAllMerchantInfoByMerchantCode(String merchantCode);

    /**
     * 有商家code
     * @param i
     * @param rows
     * @param merchantCode
     * @return
     */
    List<TbMerchantPO> getPageMerchantInfoByMerchantCode(int i, Integer rows, String merchantCode);

    /**
     * 根据商家code查找商家信息
     * @param merchantCode
     * @return
     */
    TbMerchantPO getMerchantInfoByMerchantCode(String merchantCode);
}
