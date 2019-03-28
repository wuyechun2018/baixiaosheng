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
import com.bxs.pojo.jpa.ierp.ErpRole;
import com.bxs.service.ierp.ErpRoleService;

@Controller
@RequestMapping("/erpRole")
public class ErpRoleController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(ErpRoleController.class);

	@Autowired
	private ErpRoleService erpRoleService;
	
	
	@RequestMapping("/pagerList")
	@ResponseBody
	public EUIGrid pagerList(HttpServletRequest request) {
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return erpRoleService.pagerList(ePager,param);
	}

	@RequestMapping("/save")
	@ResponseBody
	public Object save(ErpRole erpRole, HttpSession session) {
		return erpRoleService.save(erpRole);
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(HttpServletRequest request) {
		String id=request.getParameter("id");
		return erpRoleService.delete(id);
	}

}
