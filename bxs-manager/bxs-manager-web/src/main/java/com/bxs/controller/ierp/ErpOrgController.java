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

import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.common.utils.CommonUtil;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.UserInfoVo;
import com.bxs.pojo.jpa.ierp.ErpLog;
import com.bxs.pojo.jpa.ierp.ErpOrg;
import com.bxs.service.ierp.ErpLogService;
import com.bxs.service.ierp.ErpOrgService;

@Controller
@RequestMapping("/erpOrg")
public class ErpOrgController extends BaseController{
	private static final Logger logger = LoggerFactory.getLogger(ErpOrgController.class);

	@Autowired
	private ErpOrgService erpOrgService;
	
	@Autowired
	private ErpLogService erpLogService;
	
	
	/**
	 * 
	 * 根据父主键获取子公司
	 * @author: wyc
	 * @createTime: 2019年3月26日 上午10:10:47
	 * @history:
	 * @param pid
	 * @return Object
	 */
	@RequestMapping("/getListByPid")
	@ResponseBody
	public Object getListByPid(String pid){
		if(pid==null){
			pid="0";
		}
		return erpOrgService.getListByPid(pid);
	}
	
	
	/**
	 * 
	 * 翻页列表
	 * @author: wyc
	 * @createTime: 2019年3月25日 下午2:32:56
	 * @history:
	 * @param request
	 * @return EUIGrid
	 */
	@RequestMapping("/pagerList")
	@ResponseBody
	public EUIGrid pagerList(HttpServletRequest request) {
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return erpOrgService.pagerList(ePager,param);
	}

	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2019年3月25日 下午2:33:06
	 * @history:
	 * @param erpOrg
	 * @param session
	 * @return JsonMsg
	 */
	@RequestMapping("/save")
	@ResponseBody
	public JsonMsg save(ErpOrg erpOrg, HttpSession session,HttpServletRequest request) {
		UserInfoVo userInfo=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(StringUtils.isBlank(erpOrg.getId())){
			logger.info("新增操作");
			erpOrg.setCreateUserId(userInfo.getId());
			erpOrg.setCreateDate(new Date());
			//设置为有效
			erpOrg.setDataState("1");
		}
		//设置更新人和更新时间，第一次新增时，和 创建人和创建时间一致
		erpOrg.setUpdateUserId(userInfo.getId());
		erpOrg.setUpdateDate(new Date());
		
		erpOrgService.save(erpOrg);
		
		ErpLog erpLog=new ErpLog();
		erpLog.setLoginClientIp(CommonUtil.getClientIP(request));
		erpLog.setLoginUserId(userInfo.getId());
		erpLog.setOpreateInfo("保存单位");
		erpLog.setOpreateType("1");
		erpLog.setOpreateTime(new Date());
		erpLogService.save(erpLog);
		
		return new JsonMsg();
	}

	/**
	 * 
	 * 删除操作
	 * @author: wyc
	 * @createTime: 2019年3月25日 下午2:33:17
	 * @history:
	 * @param request
	 * @return Object
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(HttpServletRequest request) {
		String id=request.getParameter("id");
		erpOrgService.delete(id);
		return new JsonMsg();
	}

	

}
