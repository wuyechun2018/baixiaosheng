package com.bxs.service.ierp;
import java.util.List;
import com.bxs.common.vo.EUITree;
import com.bxs.pojo.jpa.ierp.ErpAccountType;

public interface ErpAccountTypeService {
	
	List<EUITree> getListByPid(String pid);

	void save(ErpAccountType erpAccountType);

	void delete(String id);

}
