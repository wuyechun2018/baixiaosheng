package com.bxs.service;

import java.util.List;

import com.bxs.common.vo.EUITree;
import com.bxs.pojo.LinkType;

public interface LinkTypeService {

	List<EUITree> getListByPid(String pid);

	void save(LinkType linkType);

	void delete(String id);

}
