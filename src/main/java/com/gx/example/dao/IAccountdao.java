package com.gx.example.dao;

//import com.gx.domain.Account;
import com.gx.example.domain.Account;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAccountdao {
/*基于mybatis的注解开发，使用的是注解，如果看不懂再温顾mybatis吧~*/
    @Select("select * from account")
    public List<Account> findAll();
    @Insert("insert into account (name,money) value(#{name},#{money})")
    public void saveAccount(Account account);
}
