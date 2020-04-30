package com.gx.whiteList.dao;


import com.gx.whiteList.domain.TbWhiteListBindRefPO;
import com.gx.whiteList.domain.TbWhiteListPO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author admin
 */
@Repository
public interface WhiteListdao {

    /**
     * 全部获取
     * @return
     */
    @Select("select w.*,m.merchantName from tb_white_list w LEFT JOIN tb_merchant m on w.merchantId = m.merchantCode")
    List<TbWhiteListPO> getAllWhiteListInfo();

    /**
     * 分页查询
     * @param i
     * @param rows
     * @return
     */
    @Select("select w.*,m.merchantName from tb_white_list w LEFT JOIN tb_merchant m on w.merchantId = m.merchantCode limit #{start},#{end}")
    List<TbWhiteListPO> getPageWhiteListInfo(@Param("start") int i, @Param("end") Integer rows);

    /**
     * 新增白名单
     * @param tbWhiteListPO
     * @return
     */
    @Insert("insert into tb_white_list(whiteListId,whiteListName,whiteListDesc,whiteListTips,createTime,updateTime,whiteListMember,merchantId,merchantName,fileName,memberNum,createdBy,updateBy)values(" +
            "#{po.whiteListId},#{po.whiteListName},#{po.whiteListDesc},#{po.whiteListTips},#{po.createTime},#{po.updateTime},#{po.whiteListMember},#{po.merchantId},#{po.merchantName},#{po.fileName},#{po.memberNum},#{po.createdBy},#{po.updateBy})")
    int insertPO(@Param("po") TbWhiteListPO tbWhiteListPO);

    /**
     * 添加关联
     * @param whiteListBindRefPO
     * @return
     */
    @Insert("insert into tb_white_list_bind_ref(whiteListBindRefId,whiteListId,linkId,whiteListType)values(" +
            "#{po.whiteListBindRefId},#{po.whiteListId},#{po.linkId},#{po.whiteListType})")
    int insertWhilteListBindRefPO(@Param("po") TbWhiteListBindRefPO whiteListBindRefPO);

    /**
     *
     * @param merchandiseCode
     * @return
     */
    @Select("select w.*\n" +
            "from tb_white_list w \n" +
            "LEFT JOIN tb_white_list_bind_ref f\n" +
            "ON w.whiteListId = f.whiteListId\n" +
            "where f.whiteListType='1' and f.linkId=#{merchandiseCode}")
    List<TbWhiteListPO> getWhiteListInfoByMerchandiseCode(@Param("merchandiseCode") String merchandiseCode);
}
