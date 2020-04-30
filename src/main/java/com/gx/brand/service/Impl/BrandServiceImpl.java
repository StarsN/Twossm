package com.gx.brand.service.Impl;

import com.gx.brand.dao.IBranddao;
import com.gx.brand.domain.TbBrand;
import com.gx.brand.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 */
@Service("brandService")
public class BrandServiceImpl implements BrandService {

    @Autowired
    private IBranddao branddao;
    /**
     * 全部查询
     * @return
     */
    @Override
    public List<TbBrand> getAllBrandInfo() {
        return branddao.getAllBrandInfo();
    }

    /**
     * 分页查询
     * @param i
     * @param rows
     * @return
     */
    @Override
    public List<TbBrand> getPageBrandInfo(int i, Integer rows) {
        return branddao.getPageBrandInfo(i,rows);
    }

    /**
     * 新增
     * @param tbBrand
     */
    @Override
    public void saveBrandInfo(TbBrand tbBrand) {
        branddao.saveBrandInfo(tbBrand);
    }

    @Override
    public void updateBrandInfo(TbBrand tbBrand) {
        branddao.updateBrandInfo(tbBrand);
    }

    @Override
    public void deleteBrandInfo(String brandId) {
        branddao.deleteBrandInfo(brandId);
    }
}
