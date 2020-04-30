package com.gx.merchandise.dao;

import com.gx.member.domain.TbMemberPO;
import com.gx.merchandise.domain.TbMerchandiseImagePO;
import com.gx.merchandise.domain.TbMerchandiseInfoPO;
import com.gx.merchandise.domain.TbMerchandiseStockPO;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @author admin
 */
@Repository
public interface IMerchandisedao {
    /**
     * 获取分页商品
     * @param start
     * @param end
     * @return
     */
    @Select("select m.*,mi.imagePath,ms.stock from tb_merchandise_info m LEFT JOIN tb_merchandise_image mi ON m.merchandiseCode=mi.merchandiseCode LEFT JOIN tb_merchandise_stock ms ON m.merchandiseCode=ms.merchandiseCode limit #{start},#{end}")
    List<Map<String,String>> getPageMerchandiseInfo(@Param("start")Integer start,@Param("end")Integer end);

    /**
     * 获取全部商品
     * @return
     */
    @Select("select * from tb_merchandise_info")
    List<TbMerchandiseInfoPO> getAllMerchandiseInfo();

    /**
     * 保存商品信息
     * @param tbMerchandiseInfoPO
     */
    @Insert("insert into tb_merchandise_info (merchandiseCode,merchandiseName,merchantCode,brandId,modelId,salePrice,shortDesc,totalStock,status,publishAddress,detailDesc,createTime,lastModifyTime) values(#{po.merchandiseCode},#{po.merchandiseName},#{po.merchantCode},#{po.brandId},#{po.modelId},#{po.salePrice},#{po.shortDesc},#{po.totalStock},#{po.status},#{po.publishAddress},#{po.detailDesc},#{po.createTime},#{po.lastModifyTime})")
    void saveMerchandiseInfo(@Param("po")TbMerchandiseInfoPO tbMerchandiseInfoPO);

    /**
     * 更新商品信息
     * @param tbMerchandiseInfoPO
     */
    @Update("update tb_merchandise_info set merchandiseName=#{po.merchandiseName},merchantCode=#{po.merchantCode},brandId=#{po.brandId},modelId=#{po.modelId},salePrice=#{po.salePrice},shortDesc=#{po.shortDesc},totalStock=#{po.totalStock},status=#{po.status},publishAddress=#{po.publishAddress},detailDesc=#{po.detailDesc} where merchandiseCode=#{po.merchandiseCode}")
    void updateMerchandiseInfo(@Param("po") TbMerchandiseInfoPO tbMerchandiseInfoPO);

    /**
     * 删除商品信息
     * @param merchandiseCode
     */
    @Delete("delete from tb_merchandise_info where merchandiseCode=#{merchandiseCode}")
    void deleteMerchandiseInfo(@Param("merchandiseCode") String merchandiseCode);

    /**
     * 保存图片
     * @param tbMerchandiseImagePO
     */
    @Insert("insert into tb_merchandise_image(imgId,merchandiseCode,imagePath,type,idx)values(#{po.imgId},#{po.merchandiseCode},#{po.imagePath},#{po.type},#{po.idx})")
    void insertImagePO(@Param("po") TbMerchandiseImagePO tbMerchandiseImagePO);

    /**
     * 根据商品主键获取商品
     * @param merchandiseCode
     * @return
     */
    @Select("select * from tb_merchandise_info where merchandiseCode=#{merchandiseCode}")
    TbMerchandiseInfoPO getMerchandisePO(@Param("merchandiseCode") String merchandiseCode);

    /**
     * 获取商品图片信息
     * @param merchandiseCode
     * @return
     */
    @Select("select * from tb_merchandise_image where merchandiseCode=#{merchandiseCode}")
    TbMerchandiseImagePO getMerchandiseImagePO(@Param("merchandiseCode") String merchandiseCode);

    /**
     * 更新发布地址
     * @param merchandiseCode
     * @param publishAddress
     */
    @Update("update tb_merchandise_info set publishAddress=#{publishAddress} where merchandiseCode=#{merchandiseCode}")
    void setPublishAddress(@Param("merchandiseCode") String merchandiseCode, @Param("publishAddress") String publishAddress);

    /**
     * 更新商品的状态
     * @param merchandiseCode
     * @param s
     */
    @Update("update tb_merchandise_info set status=#{status} where merchandiseCode=#{merchandiseCode}")
    void updateMerchandiseStatus(@Param("merchandiseCode") String merchandiseCode, @Param("status") String s);

    /**
     * 获取商品库存
     * @return
     */
    @Select("SELECT s.stock,s.price,i.merchandiseCode,i.merchandiseName,i.`status`,tm.merchantName from tb_merchandise_stock s LEFT JOIN tb_merchandise_info i ON(s.merchandiseCode=i.merchandiseCode) LEFT JOIN tb_merchant tm ON i.merchantCode=tm.merchantCode")
    List<Map<String,String>> getMerchandiseStock();

    /**
     * 分页获取库存
     * @param i
     * @param rows
     * @return
     */
    @Select("SELECT s.stock,s.price,i.merchandiseCode,i.merchandiseName,i.`status`,tm.merchantName from tb_merchandise_stock s LEFT JOIN tb_merchandise_info i ON(s.merchandiseCode=i.merchandiseCode) LEFT JOIN tb_merchant tm ON i.merchantCode=tm.merchantCode limit #{start},#{end}")
    List<Map<String, String>> getPagegetMerchandiseStock(@Param("start") int i, @Param("end") Integer rows);

    /**
     * 更新商品价格
     * @param merchandiseCode
     * @param price
     */
    @Update("update tb_merchandise_info set salePrice=#{price} where merchandiseCode=#{merchandiseCode}")
    void updatePrice(@Param("merchandiseCode") String merchandiseCode, @Param("price") String price);

    /**
     * 更新库存
     * @param merchandiseCode
     * @param stock
     * @param price
     */
    @Update("update tb_merchandise_stock set stock=#{stock},price=#{price} where merchandiseCode=#{merchandiseCode}")
    void updateMerchandiseStock(@Param("merchandiseCode") String merchandiseCode, @Param("stock") String stock, @Param("price") String price);

    /**
     * 查找商品库存
     * @param merchandiseCode
     * @return
     */
    @Select("select * from tb_merchandise_stock where merchandiseCode=#{merchandiseCode}")
    TbMerchandiseStockPO gainMerchandiseStock(@Param("merchandiseCode") String merchandiseCode);

    /**
     * 新增库存信息
     * @param tbMerchandiseStockPO
     */
    @Insert("insert into tb_merchandise_stock(id,merchandiseCode,stock,updateTime,updateBy,price,stockId)values(#{po.id},#{po.merchandiseCode},#{po.stock},#{po.updateTime},#{po.updateBy},#{po.price},#{po.stockId})")
    void addMerchandiseStock(@Param("po") TbMerchandiseStockPO tbMerchandiseStockPO);

    /**
     *在商品页更新库存
     * @param tbMerchandiseStockPO
     */
    @Update("update tb_merchandise_stock set stock=#{po.stock},price=#{po.price},updateTime=#{po.updateTime}where merchandiseCode=#{po.merchandiseCode}")
    void updateMerchandiseStockPO(@Param("po") TbMerchandiseStockPO tbMerchandiseStockPO);

    /**
     * 根据stockId查找库存
     * @param stockId
     * @return
     */
    @Select("select stock from tb_merchandise_stock where stockId=#{stockId}")
    String getStockByStockId(@Param("stockId") String stockId);

    /**
     * 下单后更新缓存
     * @param stockId
     * @param newStock
     * @return
     */
    @Update("update tb_merchandise_stock set stock=#{stock} where stockId=#{stockId}")
    int updateStock(@Param("stockId") String stockId, @Param("stock") String newStock);
}
