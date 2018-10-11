package com.bxs.controller;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.CommonUtil;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.SysLog;
import com.bxs.pojo.UserInfoVo;
import com.bxs.pojo.jpa.BizCalendar;
import com.bxs.pojo.jpa.BizNode;
import com.bxs.service.BizCalendarService;
import com.bxs.service.SysLogService;

/**
 * 
 * 记上一笔
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年9月25日 下午3:12:55
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/bizCalendar")
public class BizCalendarController {
	
	private static final Logger logger =LoggerFactory.getLogger(BizCalendarController.class);

	
	@Autowired
	private BizCalendarService bizCalendarService;
	
	
	@Autowired
	private SysLogService sysLogService;
	
	/**
	 * 
	 * 保存方法
	 * @author: wyc
	 * @createTime: 2018年7月16日 下午8:56:23
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Object save(BizCalendar bizCalendar,HttpServletRequest request){
		HttpSession session = request.getSession();
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		logger.info("用户于{}尝试使用[记上一笔]功能，登录名为{}，电话{}",new Object[]{new DateTime().toString("yyyy-MM-dd HH:mm:ss"),info.getLoginName(),info.getMobilePhone()});
		//Id存在，则为更新操作
		if(StringUtils.isBlank(bizCalendar.getId())){
			bizCalendar.setCreateDate(new Date());
		}
		//当前用户的Id
		bizCalendar.setUserId(info.getId());
		bizCalendar.setDataState("1");
		bizCalendar.setUpdateDate(new Date());
		BizCalendar existBizCalendar=bizCalendarService.save(bizCalendar);
		logger.info("用户于{}使用[记上一笔]功能保存成功",new Object[]{new DateTime().toString("yyyy-MM-dd HH:mm:ss")});
		
		//记录访问日志
		SysLog sysLog=new SysLog();
		sysLog.setBizId(existBizCalendar.getId());
		sysLog.setModelName("记上一笔");
		sysLog.setOpTime(new Date());
		sysLog.setOpType("CALENDAR");
		sysLog.setOpUserId(info.getId());
		//获取客户端IP
		sysLog.setClientIp(CommonUtil.getClientIP(request));
		sysLog.setOpDesc(new SimpleDateFormat("yyyy-MM-dd").format(existBizCalendar.getBizDay()));
		sysLogService.save(sysLog);
		
		return new JsonMsg(true,existBizCalendar);
	}
	
	
	/**
	 * 
	 * 保存方法
	 * @author: wyc
	 * @createTime: 2018年7月16日 下午8:56:23
	 * @history:
	 * @return Object
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(String id){
		BizCalendar bizCalendar=bizCalendarService.findById(id);
		bizCalendar.setDataState("0");
		bizCalendarService.save(bizCalendar);
		return new JsonMsg(true,"删除成功！");
	}
	
	
	/**
	 * 
	 * 获取当月的记录列表
	 * @author: wyc
	 * @createTime: 2018年9月26日 上午11:50:14
	 * @history:
	 * @param month
	 * @return List<BizCalendar>
	 */
	@RequestMapping("/list")
	@ResponseBody
	public List<BizCalendar> list(String month,HttpSession session){
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		return bizCalendarService.list(month,info.getId());
	}
	
	
	/**
	 * 
	 * 针对bizDay字段进行处理
	 * @author: wyc
	 * @createTime: 2018年9月25日 下午4:36:48
	 * @history:
	 * @param binder void
	 */
	@InitBinder  
    public void initBinder(WebDataBinder binder) {  
       DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
       binder.registerCustomEditor(Date.class,new CustomDateEditor(format, true)); 
   }
	

}
