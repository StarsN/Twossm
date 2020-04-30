package com.gx.portal.item.service.Impl;

import com.gx.portal.item.dao.IItemdao;
import com.gx.portal.item.domain.ItemPO;
import com.gx.portal.item.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 */
@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private IItemdao iItemdao;
    /**
     *
     * @return
     */
    @Override
    public List<ItemPO> searchItemList() {
        return iItemdao.searchItemList();
    }
}
