package com.gx.user.service.Impl;

import com.gx.user.dao.IUserdao;
import com.gx.user.domain.TbPersonUserRef;
import com.gx.user.domain.TbUserInfo;
import com.gx.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private IUserdao userdao;

    /**
     * 获取去全部用户信息
     * @return
     */
    @Override
    public List<Map<String,String>> getAllInfo() {
        return userdao.getAllInfo();
    }

    /**
     * 分页获取用户信息
     * @param i
     * @param rows
     * @return
     */
    @Override
    public List<Map<String, String>> getAPagellInfo(Integer i, Integer rows) {
        return userdao.getAPagellInfo(i,rows);
    }

    /**
     * 新增用户
     * @param tbUserInfo
     */
    @Override
    public void addUserInfo(TbUserInfo tbUserInfo) {
        userdao.addUserInfo(tbUserInfo);
    }

    /**
     * 新增关联
     * @param tbPersonUserRef
     */
    @Override
    public void addUserPersonRef(TbPersonUserRef tbPersonUserRef) {
        userdao.addUserPersonRef(tbPersonUserRef);
    }

    /**
     * 更新用户
     * @param tbUserInfo
     */
    @Override
    public void updateUserInfo(TbUserInfo tbUserInfo) {
        userdao.updateUserInfo(tbUserInfo);
    }

    /**
     * 查找personId
     * @param userId
     * @return
     */
    @Override
    public String getPersonIdByUserId(String userId) {
        return userdao.getPersonIdByUserId(userId);
    }

    /**
     * 删除用户
     * @param userId
     */
    @Override
    public void deleteUserInfo(String userId) {
        userdao.deleteUserInfo(userId);
    }

    /**
     * 删除关联
     * @param userId
     * @param personId
     */
    @Override
    public void delePersonUserRef(String userId, String personId) {
        userdao.delePersonUserRef(userId,personId);
    }
}
