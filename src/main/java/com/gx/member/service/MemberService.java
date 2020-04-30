package com.gx.member.service;

import com.gx.member.domain.TbMemberPO;

import java.util.List;

public interface MemberService {
    /**
     * 判断手机号是否存在
     * @param phoneNumber
     * @return
     */
    TbMemberPO checkphoneNumber(String phoneNumber);

    /**
     * 会员登录
     * @param phoneNumber
     * @param password
     * @return
     */
    TbMemberPO login(String phoneNumber, String password);

    /**
     * 判断是否为新用户
     * @param mobileNumber
     * @return
     */
    TbMemberPO isNewMemberByMobile(String mobileNumber);

    /**
     * 更新用户
     * @param po1
     */
    void updatePO(TbMemberPO po1);

    /**
     * 新增用户信息
     * @param tbMemberPO
     */
    void insertPO(TbMemberPO tbMemberPO);

    /**
     * 根据id查找
     * @param s
     * @return
     */
    TbMemberPO getMemberById(String s);

    /**
     * 查找全部会员
     * @return
     */
    List<TbMemberPO> getAllMemberInfo();

    /**
     * 分页查询会员
     * @param i
     * @param rows
     * @return
     */
    List<TbMemberPO> getPageMemberInfo(int i, Integer rows);
}
