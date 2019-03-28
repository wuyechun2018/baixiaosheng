package com.bxs.controller.ierp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
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
	
	@RequestMapping("/pagerList")
	@ResponseBody
	public EUIGrid pagerList(HttpServletRequest request) {
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return erpUserRoleService.pagerList(ePager,param);
	}

	@RequestMapping("/save")
	@ResponseBody
	public Object save(ErpUserRole erpUserRole, HttpSession session) {
		return erpUserRoleService.save(erpUserRole);
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(HttpServletRequest request) {
		String id=request.getParameter("id");
		return erpUserRoleService.delete(id);
	}


}
