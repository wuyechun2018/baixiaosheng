package com.bxs.controller.ierp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
//import net.sf.json.JSONArray;
//import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.support.json.JSONUtils;
import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.UserInfoVo;
import com.bxs.pojo.jpa.ierp.ErpAccount;
import com.bxs.service.ierp.ErpAccountService;

/**
 * 
 * 业务账单控制层
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2019年3月7日 上午9:51:43
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/erpAccount")
public class ErpAccountController extends BaseController{
	
	private static final Logger logger =LoggerFactory.getLogger(ErpAccountController.class);
	
	@Autowired
	private ErpAccountService bizAccountService;

	/**
	 * 
	 * 保存业务账单
	 * @author: wyc
	 * @createTime: 2019年3月7日 上午11:36:33
	 * @history:
	 * @param bizAccount
	 * @param session
	 * @return JsonMsg
	 */
	@RequestMapping("/save")
	@ResponseBody
	public JsonMsg save(ErpAccount bizAccount,HttpSession session){
		String bizStamp=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		UserInfoVo userInfo=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		logger.info("==================开始处理"+bizStamp+"==================");
		logger.info("时间："+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		logger.info("当前用户："+userInfo.getUserName()+"["+userInfo.getLoginName()+"]");
		logger.info("数据内容："+bizAccount.getAccountItem()+","+bizAccount.getAmount()+","+bizAccount.getActualAmount()+","+bizAccount.getAccountUserId());
		
		//新增时设置创建人和创建时间
		if(StringUtils.isBlank(bizAccount.getId())){
			logger.info("新增操作");
			bizAccount.setCreateUserId(userInfo.getId());
			bizAccount.setCreateDate(new Date());
			//设置为有效
			bizAccount.setDataState("1");
		}
		//设置更新人和更新时间，第一次新增时，和 创建人和创建时间一致
		bizAccount.setUpdateUserId(userInfo.getId());
		bizAccount.setUpdateDate(new Date());
		
		//JSONArray array=JSONArray.fromObject(JSONObject.fromObject(bizAccount));
		//logger.info("数据内容为："+JSONUtils.toJSONString(bizAccount));
		
		//保存
		bizAccountService.save(bizAccount);
		logger.info("=================="+bizStamp+"处理完成==================");
		return new JsonMsg(true,"保存成功！");
	}
	
	
	
	/**
	 * 
	 * 删除-逻辑删除
	 * @author: wyc
	 * @createTime: 2018年1月23日 上午9:19:39
	 * @history:
	 * @param id
	 * @return String
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public JsonMsg delete(HttpServletRequest request,HttpSession session) {
		String id=request.getParameter("id");
		String bizStamp=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		UserInfoVo userInfo=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		logger.info("==================删除操作"+bizStamp+"==================");
		logger.info("时间："+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		logger.info("当前用户："+userInfo.getUserName()+"["+userInfo.getLoginName()+"]");
		logger.info("删除主键："+id);
		bizAccountService.delete(id);
		logger.info("=================="+bizStamp+"处理完成==================");
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * 分页列表
	 * @author: wyc
	 * @createTime: 2019年3月7日 下午9:03:35
	 * @history:
	 * @param request
	 * @return EUIGrid
	 */
	@RequestMapping("/pagerList")
	@ResponseBody
	public  EUIGrid pagerList(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return bizAccountService.pagerList(ePager,param);
	}
	
	
	/**
	 * 
	 * 处理"出生日期字段",对于日期字段,前端不传也是可以的，但是，如果传了值，必须进行格式转换
	 * @author: wyc
	 * @createTime: 2018年1月30日 下午1:38:30
	 * @history:
	 * @param binder void
	 */
	@InitBinder  
    public void initBinder(WebDataBinder binder) {  
       DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
       binder.registerCustomEditor(Date.class,new CustomDateEditor(format, true)); 
   }
	
}
