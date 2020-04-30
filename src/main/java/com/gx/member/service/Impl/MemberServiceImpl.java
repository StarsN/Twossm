package com.gx.member.service.Impl;

import com.gx.member.dao.IMemberdao;
import com.gx.member.domain.TbMemberPO;
import com.gx.member.service.MemberService;
import com.gx.merchandise.dao.IMerchandisedao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

    @Autowired
    private IMemberdao memberdao;

    /**
     * 判断手机号是否存在
     * @param phoneNumber
     * @return
     */
    @Override
    public TbMemberPO checkphoneNumber(String phoneNumber) {
        return memberdao.checkphoneNumber(phoneNumber);
    }

    /**
     * 会员登录
     * @param phoneNumber
     * @param password
     * @return
     */
    @Override
    public TbMemberPO login(String phoneNumber, String password) {
        return memberdao.login(phoneNumber , password);
    }

    /**
     * 判断是否为新用户
     * @param mobileNumber
     * @return
     */
    @Override
    public TbMemberPO isNewMemberByMobile(String mobileNumber) {
        return memberdao.isNewMemberByMobile(mobileNumber);
    }

    /**
     * 更新用户
     * @param po1
     */
    @Override
    public void updatePO(TbMemberPO po1) {
        memberdao.updatePO(po1);
    }

    /**
     * 新增用户信息
     * @param tbMemberPO
     */
    @Override
    public void insertPO(TbMemberPO tbMemberPO) {
        memberdao.insertPO(tbMemberPO);
    }

    /**
     * 根据id查找
     * @param s
     * @return
     */
    @Override
    public TbMemberPO getMemberById(String s) {
        return memberdao.getMemberById(s);
    }

    /**
     * 查询全部会员
     * @return
     */
    @Override
    public List<TbMemberPO> getAllMemberInfo() {
        return memberdao.getAllMemberInfo();
    }

    /**
     * 分页查询
     * @param i
     * @param rows
     * @return
     */
    @Override
    public List<TbMemberPO> getPageMemberInfo(int i, Integer rows) {
        return memberdao.getPageMemberInfo(i,rows);
    }
}
