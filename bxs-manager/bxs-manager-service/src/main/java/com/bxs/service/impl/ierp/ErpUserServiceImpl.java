package com.bxs.service.impl.ierp;
import org.bxs.jpa.ErpUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bxs.jdbc.ierp.ErpUserDao;
import com.bxs.pojo.jpa.ierp.ErpUser;
import com.bxs.service.ierp.ErpUserService;

@Service
public class ErpUserServiceImpl implements ErpUserService{

	@Autowired
	private ErpUserRepository erpUserRepository;
	
	@Autowired
	private ErpUserDao erpUserDao;
	
	
	@Override
	public void save(ErpUser erpUser) {
		erpUserRepository.save(erpUser);
	}

}
