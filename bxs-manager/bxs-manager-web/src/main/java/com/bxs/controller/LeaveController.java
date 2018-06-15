package com.bxs.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.activiti.engine.ActivitiException;
import org.activiti.engine.runtime.ProcessInstance;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.pojo.BizWf;
import com.bxs.pojo.Leave;
import com.bxs.pojo.UserInfoVo;
import com.bxs.service.BizWfService;

/**
 * 
 * 请假流程演示
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年6月13日 下午4:47:55
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/leave")
public class LeaveController extends BaseController {
	
	private static final Logger logger =LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private BizWfService  bizWfService;
	
	
	/**
	 * 
	 * 启动流程
	 * @author: wyc
	 * @createTime: 2018年6月13日 下午5:23:58
	 * @history:
	 * @param leave
	 * @param redirectAttributes
	 * @param session
	 * @return String
	 */
    @RequestMapping(value = "/start")
    public String startWorkflow(Leave leave, RedirectAttributes redirectAttributes, HttpSession session) {
		UserInfoVo info=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
    	try {
    		BizWf wfObj=new BizWf();
    		wfObj.setUserId(info.getId());
    		//设置流程名称
    		wfObj.setBizTypeName("leave");
            Map<String, Object> variables = new HashMap<String, Object>();
            //启动流程
            ProcessInstance processInstance =bizWfService.startWorkflow(wfObj, variables);
            redirectAttributes.addFlashAttribute("message", "流程已启动，流程ID：" + processInstance.getId());
        } catch (ActivitiException e) {
            if (e.getMessage().indexOf("no processes deployed with key") != -1) {
                logger.warn("没有部署流程!", e);
                redirectAttributes.addFlashAttribute("error", "没有部署流程，请在[工作流]->[流程管理]页面点击<重新部署流程>");
            } else {
                logger.error("启动请假流程失败：", e);
                redirectAttributes.addFlashAttribute("error", "系统内部错误！");
            }
        } catch (Exception e) {
            logger.error("启动请假流程失败：", e);
            redirectAttributes.addFlashAttribute("error", "系统内部错误！");
        }
        return "/leave/list";
    }
	

}
