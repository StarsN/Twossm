package com.gx.user.dao;

import com.gx.user.domain.TbPersonUserRef;
import com.gx.user.domain.TbUserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Repository
public interface IUserdao {
    /**
     * 获取全部用户信息
     * @return
     */
    @Select("select p.personName,u.userName,u.userId from tb_person_info p LEFT JOIN tb_person_user_ref r ON p.personId=r.personId LEFT JOIN tb_user_info u ON r.userId = u.userId")
    List<Map<String,String>> getAllInfo();

    /**
     * 分页获取用户信息
     * @param i
     * @param rows
     * @return
     */
    @Select("(select p.personName,u.userName,u.userId from tb_person_info p LEFT JOIN tb_person_user_ref r ON p.personId=r.personId LEFT JOIN tb_user_info u ON r.userId = u.userId)limit #{start},#{end}")
    List<Map<String, String>> getAPagellInfo(@Param("start") Integer i, @Param("end") Integer rows);

    /**
     * 新增用户
     * @param tbUserInfo
     */
    @Insert("insert into TB_USER_INFO(userId,userName,password,createTime,status,lastLoginTime,merchant)values(#{po.userId},#{po.userName},#{po.password},#{po.createTime},#{po.status},#{po.lastLoginTime},#{po.merchant})")
    void addUserInfo(@Param("po") TbUserInfo tbUserInfo);

    /**
     * 新增关联
     * @param tbPersonUserRef
     */
    @Insert("insert into TB_PERSON_USER_REF(refId,personId,userId)values(#{po.refId},#{po.personId},#{po.userId})")
    void addUserPersonRef(@Param("po") TbPersonUserRef tbPersonUserRef);

    /**
     * 更新用户
     * @param tbUserInfo
     */
    @Update("update TB_USER_INFO set userName=#{po.userName} where userId=#{po.userId}")
    void updateUserInfo(@Param("po") TbUserInfo tbUserInfo);

    /**
     *根据userId找personid
     * @param userId
     * @return
     */
    @Select("select personId from TB_PERSON_USER_REF where userId=#{userId}")
    String getPersonIdByUserId(@Param("userId") String userId);

    /**
     * 删除用户信息
     * @param userId
     */
    @Delete("delete from TB_USER_INFO where userId=#{userId}")
    void deleteUserInfo(@Param("userId") String userId);

    /**
     * 删除关联
     * @param userId
     * @param personId
     */
    @Delete("delete from TB_PERSON_USER_REF where userId=#{userId} and personId=#{personId}")
    void delePersonUserRef(@Param("userId") String userId, @Param("personId") String personId);
}
