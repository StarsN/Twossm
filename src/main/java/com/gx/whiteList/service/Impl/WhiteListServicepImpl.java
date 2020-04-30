package com.gx.whiteList.service.Impl;

import com.gx.whiteList.dao.WhiteListdao;
import com.gx.whiteList.domain.TbWhiteListBindRefPO;
import com.gx.whiteList.domain.TbWhiteListPO;
import com.gx.whiteList.service.WhiteListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 */
@Service("whiteList")
public class WhiteListServicepImpl implements WhiteListService {

    @Autowired
    private WhiteListdao whiteListdao;
    /**
     * 获取全部商品
     * @return
     */
    @Override
    public List<TbWhiteListPO> getAllWhiteListInfo() {
        return whiteListdao.getAllWhiteListInfo();
    }

    @Override
    public List<TbWhiteListPO> getPageWhiteListInfo(int i, Integer rows) {
        return whiteListdao.getPageWhiteListInfo(i,rows);
    }

    /**
     * 新增白名单
     * @param tbWhiteListPO
     * @return
     */
    @Override
    public int insertPO(TbWhiteListPO tbWhiteListPO) {
        return whiteListdao.insertPO(tbWhiteListPO);
    }

    @Override
    public int insertWhilteListBindRefPO(TbWhiteListBindRefPO whiteListBindRefPO) {
        return whiteListdao.insertWhilteListBindRefPO(whiteListBindRefPO);
    }

    /**
     * 根据商品编码查询白名单
     * @param merchandiseCode
     * @return
     */
    @Override
    public List<TbWhiteListPO> getWhiteListInfoByMerchandiseCode(String merchandiseCode) {
        return whiteListdao.getWhiteListInfoByMerchandiseCode(merchandiseCode);
    }
}
