package com.gx.person.dao;

import com.gx.person.domain.TbPersonInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

/**
 * @author admin
 */
@Repository
public interface IPersondao {
    /**
     * 新增用户信息
     * @param tbPersonInfo
     */
    @Insert("insert into TB_PERSON_INFO(personId,personName,age,sex,merchant,changePwd,changeTime,province)values(#{po.personId},#{po.personName},#{po.age},#{po.sex},#{po.merchant},#{po.changePwd},#{po.changeTime},#{po.province})")
    void addPersonInfo(@Param("po") TbPersonInfo tbPersonInfo);

    /**
     * 更新用户信息
     * @param tbPersonInfo
     */
    @Update("update TB_PERSON_INFO set personName=#{po.personName} where personId=#{po.personId}")
    void updatePersonInfo(@Param("po") TbPersonInfo tbPersonInfo);

    /**
     * 删除用户
     * @param personId
     */
    @Delete("delete from TB_PERSON_INFO where personId=#{personId}")
    void deletePersonInfo(@Param("personId") String personId);
}
