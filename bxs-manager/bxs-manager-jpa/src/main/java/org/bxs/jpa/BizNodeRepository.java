package org.bxs.jpa;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.bxs.pojo.jpa.BizNode;

public interface BizNodeRepository extends CrudRepository<BizNode, String>{
	
	@Query(value="select * from t_biz_node a where a.TYPE_Code = ?1 AND a.pid=?2", nativeQuery = true ) 
	List<BizNode> findNodeListByTypeCodeAndPid(String typeCode, String pid);
}
