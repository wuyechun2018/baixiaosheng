package com.bxs.controller.ierp;
import java.util.Date;
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
import com.bxs.common.utils.CommonUtil;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.UserInfoVo;
import com.bxs.pojo.jpa.ierp.ErpAccountType;
import com.bxs.pojo.jpa.ierp.ErpLog;
import com.bxs.service.ierp.ErpAccountTypeService;
import com.bxs.service.ierp.ErpLogService;

@Controller
@RequestMapping("/erpAccountType")
public class ErpAccountTypeController {
	
	private static final Logger logger =LoggerFactory.getLogger(ErpAccountTypeController.class);
	
	@Autowired
	private ErpAccountTypeService erpAccountTypeService;
	
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
		return erpAccountTypeService.getListByPid(pid);
	}
	
	
	
	/**
	 * 
	 * 根据父主键和类型（0 ：收入  1：支出）
	 * @author: wyc
	 * @createTime: 2019年4月29日 下午5:19:08
	 * @history:
	 * @param pid
	 * @param type
	 * @return Object
	 */
	@RequestMapping("/getListByPidAndType")
	@ResponseBody
	public Object getListByPidAndType(String pid,String type){
		if(pid==null){
			pid="0";
		}
		return erpAccountTypeService.getListByPidAndType(pid,type);
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
		erpAccountTypeService.delete(id);
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2019年3月28日 下午4:31:23
	 * @history:
	 * @param erpAccountType
	 * @param session
	 * @param request
	 * @return JsonMsg
	 */
	@RequestMapping("/save")
	@ResponseBody
	public JsonMsg save(ErpAccountType erpAccountType, HttpSession session,HttpServletRequest request) {
		UserInfoVo userInfo=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(StringUtils.isBlank(erpAccountType.getId())){
			logger.info("新增操作");
			//设置为有效
			erpAccountType.setDataState("1");
		}
		//设置更新人和更新时间，第一次新增时，和 创建人和创建时间一致
		erpAccountTypeService.save(erpAccountType);
		//记录日志
		ErpLog erpLog=new ErpLog();
		erpLog.setLoginClientIp(CommonUtil.getClientIP(request));
		erpLog.setLoginUserId(userInfo.getId());
		erpLog.setOperateInfo("保存账单类型");
		erpLog.setOperateType("1");
		erpLog.setOperateTime(new Date());
		erpLogService.save(erpLog);
		
		return new JsonMsg();
	}

}
