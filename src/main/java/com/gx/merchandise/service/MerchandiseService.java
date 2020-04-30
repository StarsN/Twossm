package com.gx.merchandise.service;

import com.gx.example.domain.Account;
import com.gx.merchandise.domain.TbMerchandiseImagePO;
import com.gx.merchandise.domain.TbMerchandiseInfoPO;
import com.gx.merchandise.domain.TbMerchandiseStockPO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @author admin
 */
public interface MerchandiseService {
    //获取总商品数
    List<Map<String,String>> getPageMerchandiseInfo(Integer start,Integer end);
    //获取总商品数
    List<TbMerchandiseInfoPO> getAllMerchandiseInfo();
    //保存商品信息
    void saveMerchandiseInfo(TbMerchandiseInfoPO tbMerchandiseInfoPO);
    //更新商品信息
    void updateMerchandiseInfo(TbMerchandiseInfoPO tbMerchandiseInfoPO);
    //删除商品信息
    void deleteMerchandiseInfo(String merchandiseCode);

    /**
     * 上传图片
     * @param file
     */
    String uploadFile(MultipartFile file, HttpServletRequest request) throws IOException;

    /**
     * 保存图片
     * @param tbMerchandiseImagePO
     */
    void insertImagePO(TbMerchandiseImagePO tbMerchandiseImagePO);

    /**
     * 发布商品
     * @param request
     */
    String publish(HttpServletRequest request);

    /**
     * 根据商品id获取商品
     * @param merchandiseCode
     * @return
     */
    TbMerchandiseInfoPO getMerchandisePO(String merchandiseCode);

    /**
     * 获取商品照片信息
     * @param merchandiseCode
     * @return
     */
    TbMerchandiseImagePO getMerchandiseImagePO(String merchandiseCode);

    /**
     * 更新发布地址
     * @param merchandiseCode
     * @param publishAddress
     */
    void setPublishAddress(String merchandiseCode, String publishAddress);

    //更新商品的状态
    void updateMerchandiseStatus(String merchandiseCode,String s);

    /**
     * 获取商品库存
     * @return
     */
    List<Map<String,String>> getMerchandiseStock();

    /**
     * 分页获取库存
     * @param i
     * @param rows
     * @return
     */
    List<Map<String, String>> getPagegetMerchandiseStock(int i, Integer rows);

    /**
     * 更新价格
     * @param price
     */
    void updatePrice(String merchandiseCode,String price);


    /**
     * 在库存管理更新库存
     * @param merchandiseCode
     * @param stock
     * @param price
     */
    void updateMerchandiseStock(String merchandiseCode, String stock, String price);

    /**
     * 根据商品编号查找库存
     * @param merchandiseCode
     * @return
     */
    TbMerchandiseStockPO gainMerchandiseStock(String merchandiseCode);

    /**
     * 新增库存信息
     * @param tbMerchandiseStockPO
     */
    void addMerchandiseStock(TbMerchandiseStockPO tbMerchandiseStockPO);

    /**
     * 在商品页更新库存信息
     * @param tbMerchandiseStockPO
     */
    void updateMerchandiseStockPO(TbMerchandiseStockPO tbMerchandiseStockPO);

    /**
     * 根据stockid查找库存
     * @param stockId
     * @return
     */
    String getStockByStockId(String stockId);

    /**
     * 下单后更新库存
     * @param stockId
     * @param newStock
     */
    int updateStock(String stockId, String newStock);
}
