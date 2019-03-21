package org.bxs.jpa;

import org.springframework.data.repository.CrudRepository;

import com.bxs.pojo.jpa.ierp.ErpAccount;

public interface BizAccountRepository extends CrudRepository<ErpAccount, String>{

}
