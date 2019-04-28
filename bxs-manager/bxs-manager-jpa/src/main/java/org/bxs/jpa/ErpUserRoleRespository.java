package org.bxs.jpa;

import org.springframework.data.repository.CrudRepository;

import com.bxs.pojo.jpa.ierp.ErpUserRole;

public interface ErpUserRoleRespository extends CrudRepository<ErpUserRole, String>{

	ErpUserRole findByUserIdAndRoleId(String userId, String roleId);

}
