package com.gx.brand.service;

import com.gx.brand.domain.TbBrand;

import java.util.List;

public interface BrandService {
    /**
     * 查询全部
     * @return
     */
    List<TbBrand> getAllBrandInfo();

    /**
     * 分页查询
     * @param i
     * @param rows
     * @return
     */
    List<TbBrand> getPageBrandInfo(int i, Integer rows);

    /**
     * 新增
     * @param tbBrand
     */
    void saveBrandInfo(TbBrand tbBrand);

    /**
     * 修改
     * @param tbBrand
     */
    void updateBrandInfo(TbBrand tbBrand);

    /**
     * 删除
     * @param brandId
     */
    void deleteBrandInfo(String brandId);
}
