package com.bxs.controller;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.dict.DataState;
import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.Role;
import com.bxs.pojo.UserRole;
import com.bxs.service.RoleService;
import com.bxs.service.UserRoleService;

/**
 * 
 * 用户角色
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年3月28日 上午8:39:03
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/userRole")
public class UserRoleController extends BaseController {
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired
	private RoleService roleService;
	
	/**
	 * 
	 * 给用户授权
	 * @author: wyc
	 * @createTime: 2018年3月28日 上午8:44:29
	 * @history:
	 * @param userid
	 * @param sysadmin void
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Object add(String userId,String sysadmin){
		Role role=roleService.getRoleByCode(SystemConstant.ROLE_SYS_ADMIN);
		//添加
		if("1".equals(sysadmin)){
			List<UserRole> list=userRoleService.findByUserIdAndRoleCode(userId, SystemConstant.ROLE_SYS_ADMIN);
			if(list.isEmpty()){
				UserRole userRole=new UserRole();
				userRole.setUserId(userId);
				userRole.setRoleId(role.getId());
				userRole.setDataState(DataState.Use.getCode());
				userRole.setCreateDate(new Date());
				userRole.setUpdateDate(new Date());
				userRoleService.save(userRole);
			}
		}else{
		//移除	
			userRoleService.delete(userId,role.getId());
		}
		return new JsonMsg(true);
	}
	
	
	/**
	 * 
	 * 是否拥有"系统管理员"角色
	 * @author: wyc
	 * @createTime: 2018年3月28日 上午9:15:50
	 * @history:
	 * @param userId
	 * @return Object
	 */
	@RequestMapping("/isSysAdmin")
	@ResponseBody
	public Object isSysAdmin(String userId){
		List<UserRole> list=userRoleService.findByUserIdAndRoleCode(userId, "SYSADMIN");
		if(list.isEmpty()){
			return new JsonMsg(false,"非管理员");
		}else{
			return new JsonMsg(true,"管理员");
		}
		
	}
	

	/**
	 * 
	 * 根据用户Id,获取授权角色列表
	 * @author: wyc
	 * @createTime: 2018年4月3日 上午9:34:11
	 * @history:
	 * @param userId
	 * @param isAuthorized
	 * @return List
	 */
	public EUIGrid getAuthorizedRole(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return userRoleService.pagerList(ePager,param);
		//List<Role> list=userRoleService.getAuthorizedRole(userId, isAuthorized);
		//return null;
	}
	
	
	
	
}
