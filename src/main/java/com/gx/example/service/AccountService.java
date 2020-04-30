package com.gx.example.service;

//import com.gx.domain.Account;

import com.gx.example.domain.Account;

import java.util.List;

public interface AccountService {
    // 查询所有账户
    public List<Account> findAll();

    // 保存帐户信息
    public void saveAccount(Account account);
}
