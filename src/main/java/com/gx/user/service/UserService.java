package com.gx.user.service;



import com.gx.user.domain.TbPersonUserRef;
import com.gx.user.domain.TbUserInfo;

import java.util.List;
import java.util.Map;


/**
 * @author admin
 */
public interface UserService {

    /**
     * 获取用户全部信息
     * @return
     */
    List<Map<String,String>> getAllInfo();

    /**
     * 分页获取用户信息
     * @param i
     * @param rows
     * @return
     */
    List<Map<String, String>> getAPagellInfo(Integer i, Integer rows);

    /**
     * 新增用户
     * @param tbUserInfo
     */
    void addUserInfo(TbUserInfo tbUserInfo);

    /**
     * 新增关联
     * @param tbPersonUserRef
     */
    void addUserPersonRef(TbPersonUserRef tbPersonUserRef);

    /**
     * 更新用户
     * @param tbUserInfo
     */
    void updateUserInfo(TbUserInfo tbUserInfo);

    /**
     * 根据userId找personId
     * @param userId
     * @return
     */
    String getPersonIdByUserId(String userId);

    /**
     * 删除用户信息
     * @param userId
     */
    void deleteUserInfo(String userId);

    /**
     * 删除关联
     * @param userId
     * @param personId
     */
    void delePersonUserRef(String userId, String personId);
}
