package org.bxs.jpa;
import org.springframework.data.repository.CrudRepository;
import com.bxs.pojo.jpa.SysUserExtend;

public interface SysUserExtendRepository extends CrudRepository<SysUserExtend, String> {

	SysUserExtend findByUserId(String userId);

}
