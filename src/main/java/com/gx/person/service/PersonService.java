package com.gx.person.service;

import com.gx.person.domain.TbPersonInfo;

/**
 * @author admin
 */
public interface PersonService {
    /**
     * 新增用户信息
     * @param tbPersonInfo
     */
    void addPersonInfo(TbPersonInfo tbPersonInfo);

    /**
     * 更新用户信息
     * @param tbPersonInfo
     */
    void updatePersonInfo(TbPersonInfo tbPersonInfo);

    /**
     * 删除用户
     * @param personId
     */
    void deletePersonInfo(String personId);
}
