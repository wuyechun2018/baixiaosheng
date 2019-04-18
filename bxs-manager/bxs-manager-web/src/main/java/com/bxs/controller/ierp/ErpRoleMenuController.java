package com.bxs.controller.ierp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.EUITree;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.jpa.ierp.ErpRoleMenu;
import com.bxs.service.ierp.ErpRoleMenuService;

@Controller
@RequestMapping("/erpRoleMenu")
public class ErpRoleMenuController  extends BaseController{

	@Autowired
	private ErpRoleMenuService erpRoleMenuService;
	
	
	/**
	 * 
	 * 根据 角色Id 和 上级目录Id 获取下级节点
	 * @author: wyc
	 * @createTime: 2019年4月10日 下午5:15:12
	 * @history:
	 * @param roleId 角色Id
	 * @param pid  上级目录Id
	 * @return List<EUITree>
	 */
	@RequestMapping("/getErpMenuListByPid")
	@ResponseBody
	public List<EUITree> getErpMenuListByPid(String roleId,String pid){
		return erpRoleMenuService.getErpMenuListByPid(roleId,pid);
	}
	
	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2019年4月12日 下午2:39:50
	 * @history:
	 * @param roleId
	 * @param menuIds void
	 * @return 
	 */
	@RequestMapping("/save")
	@ResponseBody
	public JsonMsg save(String roleId,String menuIds){
		//先移除roleId下所有相关菜单
		List<ErpRoleMenu> list=erpRoleMenuService.getErpRoleMenuListByRoleId(roleId);
		for (ErpRoleMenu erpRoleMenu : list) {
			erpRoleMenu.setDataState("0");
			erpRoleMenuService.save(erpRoleMenu);
		}
		String[] menuIdArray=menuIds.split(",");
		for (String menuId : menuIdArray) {
			ErpRoleMenu erpRoleMenu=new ErpRoleMenu();
			erpRoleMenu.setDataState("1");
			erpRoleMenu.setMenuId(menuId);
			erpRoleMenu.setRoleId(roleId);
			erpRoleMenuService.save(erpRoleMenu);
		}
		return new JsonMsg();
	
	}
	
	
}
