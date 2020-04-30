package com.gx.login.dao;

import com.gx.user.domain.TbUserInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

/**
 * @author admin
 */
@Repository
public interface ILogindao {

    /**
     * 根据用户名查找用户
     * @param userName
     * @return
     */
    @Select("select * from TB_USER_INFO where userName=#{userName}")
    TbUserInfo getUserByUserName(@Param("userName") String userName);
}
