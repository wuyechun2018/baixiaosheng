package com.bxs.service;
import java.util.List;

import com.bxs.pojo.Sign;

public interface SignService {

	void save(Sign sign);

	void delete(String id);

	List<Sign> getSignListByArticleId(String id);

	void deleteSignByArticleId(String keyId);

}
