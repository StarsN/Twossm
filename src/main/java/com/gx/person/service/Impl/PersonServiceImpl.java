package com.gx.person.service.Impl;

import com.gx.person.dao.IPersondao;
import com.gx.person.domain.TbPersonInfo;
import com.gx.person.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author admin
 */
@Service("personService")
public class PersonServiceImpl implements PersonService {

    @Autowired
    private IPersondao persondao;
    /**
     * 新增用户信息
     * @param tbPersonInfo
     */
    @Override
    public void addPersonInfo(TbPersonInfo tbPersonInfo) {
        persondao.addPersonInfo(tbPersonInfo);
    }

    @Override
    public void updatePersonInfo(TbPersonInfo tbPersonInfo) {
        persondao.updatePersonInfo(tbPersonInfo);
    }

    @Override
    public void deletePersonInfo(String personId) {
        persondao.deletePersonInfo(personId);
    }
}
