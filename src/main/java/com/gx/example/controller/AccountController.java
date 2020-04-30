package com.gx.example.controller;

//import com.gx.domain.Account;
//import com.gx.service.AccountService;
import com.gx.example.domain.Account;
import com.gx.example.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/account/findAll")
    public String findAll(Model model){  //存数据， Model对象
        System.out.println("Controller表现层：查询所有账户...");
        // 调用service的方法
        List<Account> list = accountService.findAll();
        model.addAttribute("list",list);
        return "list";
    }

    @RequestMapping("/account/save")
    public void save(Account account, HttpServletRequest request, HttpServletResponse response) throws IOException {
        accountService.saveAccount(account);
        response.sendRedirect(request.getContextPath()+"/account/findAll");
        return;
    }

    @RequestMapping("/account/message")
    public String  message(Account account, HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "personalMember/PersonalMembers_Home";
    }
}
