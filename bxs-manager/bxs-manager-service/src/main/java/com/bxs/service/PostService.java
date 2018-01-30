package com.bxs.service;
import java.util.List;
import java.util.Map;

import com.bxs.common.vo.EUICombobox;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.Post;

public interface PostService {
	
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param);

	public void save(Post post);

	void delete(String id);

	public List<EUICombobox> getPostByDeptId(String deptId);

}
