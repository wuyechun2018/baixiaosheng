package com.bxs.service.impl.ierp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bxs.jpa.ErpRoleMenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.vo.EUITree;
import com.bxs.jdbc.ierp.ErpRoleMenuDao;
import com.bxs.pojo.SysMenu;
import com.bxs.pojo.ierp.SysMenuVo;
import com.bxs.pojo.jpa.ierp.ErpRoleMenu;
import com.bxs.service.ierp.ErpRoleMenuService;


@Service
public class ErpRoleMenuServiceImpl implements ErpRoleMenuService{
	
	@Autowired
	private ErpRoleMenuDao erpRoleMenuDao;
	
	@Autowired
	private ErpRoleMenuRepository erpRoleMenuRepository;
	

	@Override
	public List<EUITree> getErpMenuListByPid(String roleId, String pid) {
		List<EUITree> childList=new ArrayList<EUITree>();
		List<SysMenuVo> menuList=erpRoleMenuDao.getErpMenuListByPid(roleId,pid);
		for (SysMenuVo menu : menuList) {
			EUITree tree=new EUITree();
			tree.setId(menu.getId());
			tree.setText(menu.getMenuName());
			tree.setChecked(!"0".equals(menu.getChecked()));
			//节点状态，有两个值  'open' or 'closed', 默认为'open'. 当为‘closed’,说明此节点下有子节点否则此节点为叶子节点
			tree.setState(hasChildren(menu.getId())?"closed":"open");
			
			Map<String, String> attr=new HashMap<String, String>();
			attr.put("menuPid", menu.getPid());
			attr.put("menuAddr", menu.getMenuUrl());
			tree.setAttributes(attr);
			childList.add(tree);
		}
		return childList;
	}


	/**
	 * 
	 * 是否有子节点
	 * @author: wyc
	 * @createTime: 2019年4月11日 下午6:29:43
	 * @history:
	 * @return boolean
	 */
	private boolean hasChildren(String menuId) {
		List<SysMenu> list=erpRoleMenuDao.getMenuListByPid(menuId);
		return !list.isEmpty();
	}


	@Override
	public List<ErpRoleMenu> getErpRoleMenuListByRoleId(String roleId) {
		return erpRoleMenuDao.getErpRoleMenuListByRoleId(roleId);
	}


	@Override
	public void save(ErpRoleMenu erpRoleMenu) {
		erpRoleMenuRepository.save(erpRoleMenu);
	}

}
