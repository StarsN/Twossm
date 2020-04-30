package com.gx.portal.item.dao;

import com.gx.portal.item.domain.ItemPO;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author admin
 */
@Repository
public interface IItemdao {
    /**
     *
     * @return
     */
    @Select("select m.*,i.* from tb_merchandise_info m LEFT JOIN tb_merchandise_image i on m.merchandiseCode = i.merchandiseCode where status = '1'")
    List<ItemPO> searchItemList();
}
