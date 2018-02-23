package com.bxs.service;
import java.util.List;

import com.bxs.pojo.Sign;
import com.bxs.pojo.SignInfoVo;

public interface SignService {

	void save(Sign sign);

	void delete(String id);

	List<SignInfoVo> getSignListByArticleId(String id);

	void deleteSignByArticleId(String keyId);

}
