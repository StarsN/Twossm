package com.gx.whiteList.service;

import com.gx.whiteList.domain.TbWhiteListBindRefPO;
import com.gx.whiteList.domain.TbWhiteListPO;

import java.util.List;

public interface WhiteListService {
    /**
     *全部获取
     * @return
     */
    List<TbWhiteListPO> getAllWhiteListInfo();

    /**
     * 分页查询
     * @param i
     * @param rows
     * @return
     */
    List<TbWhiteListPO> getPageWhiteListInfo(int i, Integer rows);

    /**
     * 新增白名单
     * @param tbWhiteListPO
     * @return
     */
    int insertPO(TbWhiteListPO tbWhiteListPO);

    /**
     * 新增关联白名单
     * @param whiteListBindRefPO
     */
    int insertWhilteListBindRefPO(TbWhiteListBindRefPO whiteListBindRefPO);

    /**
     * 根据商品编码查找白名单
     * @param merchandiseCode
     * @return
     */
    List<TbWhiteListPO> getWhiteListInfoByMerchandiseCode(String merchandiseCode);
}
