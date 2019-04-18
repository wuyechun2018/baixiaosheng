package com.bxs.controller.ierp;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.jpa.ierp.ErpUserRole;
import com.bxs.service.ierp.ErpUserRoleService;

/**
 * 
 * 用户角色
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2019年3月22日 下午2:42:29
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/erpUserRole")
public class ErpUserRoleController extends BaseController{
	private static final Logger logger = LoggerFactory.getLogger(ErpUserRole.class);

	@Autowired
	private ErpUserRoleService erpUserRoleService;
	
	
	/**
	 * 
	 * 分页获取已授权/未授权的用户列表
	 * @author: wyc
	 * @createTime: 2019年4月9日 上午9:24:43
	 * @history:
	 * @param roleId 角色Id
	 * @param isWait 是否 已授权 1  未授权 0
	 * @param request
	 * @return EUIGrid
	 */
	@RequestMapping("/getUserListByRoleId")
	@ResponseBody
	public EUIGrid getUserListByRoleId(String roleId,String isWait,HttpServletRequest request) {
		EUIPager ePager=getPager(request);
		//Map<String,Object> param=new HashMap<String,Object>();
		//param.put("roleId", roleId);
		//param.put("isWait", isWait);
		Map<String,Object> param=getParamMap(request);
		return erpUserRoleService.getUserListByRoleId(ePager,param);
	}
	
	
	
	@RequestMapping("/pagerList")
	@ResponseBody
	public EUIGrid pagerList(HttpServletRequest request) {
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return erpUserRoleService.pagerList(ePager,param);
	}

	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2019年4月9日 下午3:02:01
	 * @history:
	 * @param erpUserRole
	 * @param session
	 * @return Object
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Object save(ErpUserRole erpUserRole, HttpSession session) {
		erpUserRole.setDataState("1");
		erpUserRoleService.save(erpUserRole);
		if (StringUtils.isBlank(erpUserRole.getId())) {
		}
		erpUserRoleService.save(erpUserRole);
		return new JsonMsg();
	}

	
	/**
	 * 
	 * 逻辑删除
	 * @author: wyc
	 * @createTime: 2019年4月9日 下午3:02:13
	 * @history:
	 * @param request
	 * @return Object
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(HttpServletRequest request) {
		String userId=request.getParameter("userId");
		String roleId=request.getParameter("roleId");
		erpUserRoleService.delete(userId,roleId);
		return new JsonMsg();
	}

}
