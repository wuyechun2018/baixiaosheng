package com.bxs.controller.ierp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.support.json.JSONUtils;
import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.UserInfoVo;
import com.bxs.pojo.jpa.ierp.BizAccount;
import com.bxs.service.ierp.BizAccountService;

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
@RequestMapping("/bizAccount")
public class BizAccountController extends BaseController{
	
	private static final Logger logger =LoggerFactory.getLogger(BizAccountController.class);
	
	@Autowired
	private BizAccountService bizAccountService;

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
	public JsonMsg save(BizAccount bizAccount,HttpSession session){
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
