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
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.jpa.ierp.ErpLog;
import com.bxs.service.ierp.ErpLogService;

/**
 *  日志控制类
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2019年3月22日 下午5:03:18
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/erpLog")
public class ErpLogController extends BaseController implements ErpBaseController  {
	
	private static final Logger logger = LoggerFactory.getLogger(ErpLogController.class);
	
	@Autowired
	private ErpLogService erpLogService;
	
	
	@RequestMapping("/save")
	@ResponseBody
	@Override
	public void save(Object object, HttpSession session) {
		erpLogService.save((ErpLog)object);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	@Override
	public Object delete(HttpServletRequest request) {
		String id=request.getParameter("id");
		erpLogService.delete(id);
		return new JsonMsg();
	}

	@RequestMapping("/pagerList")
	@ResponseBody
	@Override
	public EUIGrid pagerList(HttpServletRequest request) {
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return erpLogService.pagerList(ePager,param);
	}

	
	
	
}
