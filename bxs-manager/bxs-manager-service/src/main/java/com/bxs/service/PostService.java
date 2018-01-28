package com.bxs.service;
import java.util.Map;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.Post;

public interface PostService {
	
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	public void save(Post post);

	void delete(String id);

}
