package com.bxs.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUICombobox;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.jdbc.PostDao;
import com.bxs.pojo.Post;
import com.bxs.pojo.PostInfoVo;
import com.bxs.service.PostService;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao postDao;
	
	
	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(postDao.getTotalCount(param));
		grid.setRows(postDao.pagerPostList(ePager,param));
		return grid;
	}


	@Override
	public void save(Post post) {
		// 更新操作
		if (StringUtils.isNotBlank(post.getId())) {
			postDao.update(post);
		} else {
		// 保存操作
			postDao.save(post);
		}
		
	}

	@Override
	public void delete(String id) {
		postDao.delete(id);
	}


	@Override
	public List<EUICombobox> getPostByDeptId(String deptId) {
		List<EUICombobox> result=new ArrayList<EUICombobox>();
		List<PostInfoVo> list=postDao.getPostByDeptId(deptId);
		for (PostInfoVo postInfoVo : list) {
			EUICombobox combo=new EUICombobox();
			combo.setId(postInfoVo.getId());
			combo.setText(postInfoVo.getPostName());
			result.add(combo);
		}
		return result;
	}
}
