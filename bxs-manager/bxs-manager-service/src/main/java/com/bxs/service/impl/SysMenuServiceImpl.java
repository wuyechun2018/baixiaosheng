package com.bxs.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EasyTree;
import com.bxs.jdbc.SysMenuDao;
import com.bxs.pojo.SysMenu;
import com.bxs.service.SysMenuService;

@Service
public class SysMenuServiceImpl  implements SysMenuService{
	
	@Autowired
    private SysMenuDao sysMenuDao;
	

	@Override
	public List<EasyTree> getListByPid(String pid) {
		List<EasyTree> list=new ArrayList<EasyTree>();
		List<SysMenu> menuList=sysMenuDao.getListByPid(pid);
		for (SysMenu sysMenu : menuList) {
			EasyTree easyTree=new EasyTree();
			easyTree.setId(sysMenu.getId());
			easyTree.setText(sysMenu.getMenuName());
			//节点状态，有两个值  'open' or 'closed', 默认为'open'. 当为‘closed’,说明此节点下有子节点否则此节点为叶子节点
			if("1".equals(sysMenu.getMenuType())){
				easyTree.setState("closed");
			}else{
				easyTree.setState("open");
			}
			Map<String, String> attr=new HashMap<String, String>();
			attr.put("menuPid", sysMenu.getPid());
			attr.put("menuAddr", sysMenu.getMenuUrl());
			easyTree.setAttributes(attr);
			list.add(easyTree);
		}
		return list;
	}

}
