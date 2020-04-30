package com.gx.brand.dao;

import com.gx.brand.domain.TbBrand;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author admin
 */
@Repository
public interface IBranddao {
    /**
     *查询全部
     * @return
     */
    @Select("select * from tb_brand")
    List<TbBrand> getAllBrandInfo();

    /**
     * 分页查询
     * @param i
     * @param rows
     * @return
     */
    @Select("select * from tb_brand limit #{start},#{end}")
    List<TbBrand> getPageBrandInfo(@Param("start") int i, @Param("end") Integer rows);

    /**
     * 新增
     * @param tbBrand
     */
    @Insert("insert into tb_brand (brandId,name,code) values(#{po.brandId},#{po.name},#{po.code})")
    void saveBrandInfo(@Param("po") TbBrand tbBrand);

    /**
     * 修改
     * @param tbBrand
     */
    @Update("update tb_brand set name=#{po.name},code=#{po.code} where brandId=#{po.brandId}")
    void updateBrandInfo(@Param("po") TbBrand tbBrand);

    /**
     * 删除
     * @param brandId
     */
    @Delete("delete from tb_brand where brandId=#{brandId}")
    void deleteBrandInfo(String brandId);
}
