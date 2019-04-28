package org.bxs.jpa;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import com.bxs.pojo.jpa.ierp.ErpRoleMenu;

public interface ErpRoleMenuRepository extends CrudRepository<ErpRoleMenu, String>{

	List<ErpRoleMenu> getErpRoleMenuListByRoleId(String roleId);

}
