package com.gx.merchant.service.Impl;

import com.gx.merchandise.service.MerchandiseService;
import com.gx.merchant.dao.IMerchantdao;
import com.gx.merchant.domain.TbMerchantPO;
import com.gx.merchant.service.MerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 */
@Service("merchantService")
public class MerchantServiceImpl implements MerchantService {

    @Autowired
    private IMerchantdao merchantdao;
    /**
     * 获取所有商家
     * @return
     */
    @Override
    public List<TbMerchantPO> getAllMerchantInfo() {
        return merchantdao.getAllMerchantInfo();
    }

    /**
     * 获取分页商家信息
     * @param i
     * @param rows
     * @return
     */
    @Override
    public List<TbMerchantPO> getPageMerchantInfo(int i, Integer rows) {
        return merchantdao.getPageMerchantInfo(i,rows);
    }

    /**
     * 有商家code
     * @param merchantCode
     * @return
     */
    @Override
    public List<TbMerchantPO> getAllMerchantInfoByMerchantCode(String merchantCode) {
        return merchantdao.getAllMerchantInfoByMerchantCode(merchantCode);
    }

    /**
     * 有商家code限制
     * @param i
     * @param rows
     * @param merchantCode
     * @return
     */
    @Override
    public List<TbMerchantPO> getPageMerchantInfoByMerchantCode(int i, Integer rows, String merchantCode) {
        return merchantdao.getPageMerchantInfoByMerchantCode(i,rows,merchantCode);
    }

    /**
     * 根据商家code查找商家信息
     * @param merchantCode
     * @return
     */
    @Override
    public TbMerchantPO getMerchantInfoByMerchantCode(String merchantCode) {
        return merchantdao.getMerchantInfoByMerchantCode(merchantCode);
    }
}
