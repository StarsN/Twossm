package com.gx.member.dao;

import com.gx.member.domain.TbMemberPO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IMemberdao {
    /**
     * 检测手机号是否存在
     * @param phoneNumber
     * @return
     */
    @Select("select * from tb_member t where 1=1 and t.phoneNumber=#{phoneNumber}")
    TbMemberPO checkphoneNumber(@Param("phoneNumber") String phoneNumber);

    /**
     * 会员登录
     * @param phoneNumber
     * @param password
     * @return
     */
    @Select("select * from tb_member t where 1=1 and t.phoneNumber=#{phoneNumber} and t.password=#{password}")
    TbMemberPO login(@Param("phoneNumber") String phoneNumber, @Param("password") String password);

    /**
     * 判断是否为新用户
     * @param mobileNumber
     * @return
     */
    @Select("select * from tb_member where phoneNumber=#{mobileNumber}")
    TbMemberPO isNewMemberByMobile(@Param("mobileNumber") String mobileNumber);

    /**
     * 更新用户
     * @param po1
     */
    @Update("update tb_member set nickName=#{po.nickName},password=#{po.password},phoneNumber=#{po.phoneNumber},account=#{po.account},oauthId=#{po.oauthId},registerType=#{po.registerType},registerTime=#{po.registerTime},memberStatus=#{po.memberStatus}," +
            "wechatNumber=#{po.wechatNumber},lastTime=#{po.lastTime},loginCount=#{po.loginCount},verificationCode=#{po.verificationCode},openId=#{po.openId},agentUser=#{po.agentUser},changePwd=#{po.changePwd},changeTime=#{po.changeTime},agreeDisProtocol=#{po.agreeDisProtocol},unionId=#{po.unionId},miniOpenid=#{po.miniOpenid},isVerification=#{po.isVerification} where memberId=#{po.memberId}")
    void updatePO(@Param("po") TbMemberPO po1);

    /**
     * 新增用户信息
     * @param tbMemberPO
     */
    @Insert("insert into tb_member(memberId,nickName,password,phoneNumber,account,oauthId,registerType,registerTime,memberStatus,wechatNumber,lastTime,loginCount,verificationCode,openId,agentUser,changePwd,changeTime,agreeDisProtocol,unionId,miniOpenid,isVerification)" +
            "values(#{po.memberId},#{po.nickName},#{po.password},#{po.phoneNumber},#{po.account},#{po.oauthId},#{po.registerType},#{po.registerTime},#{po.memberStatus},#{po.wechatNumber},#{po.lastTime},#{po.loginCount},#{po.verificationCode},#{po.openId},#{po.agentUser},#{po.changePwd}," +
            "#{po.changeTime},#{po.agreeDisProtocol},#{po.unionId},#{po.miniOpenid},#{po.isVerification})")
    void insertPO(@Param("po") TbMemberPO tbMemberPO);

    /**
     * 根据id查找
     * @param s
     * @return
     */
    @Select("select * from tb_member where memberId=#{memberId}")
    TbMemberPO getMemberById(@Param("memberId") String s);

    /**
     * 查找全部会员
     * @return
     */
    @Select("select * from tb_member")
    List<TbMemberPO> getAllMemberInfo();

    /**
     * 分页查询
     * @param i
     * @param rows
     * @return
     */
    @Select("select * from tb_member limit #{start},#{end}")
    List<TbMemberPO> getPageMemberInfo(@Param("start") int i, @Param("end") Integer rows);
}
