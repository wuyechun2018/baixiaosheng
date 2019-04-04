package com.bxs.controller.ierp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.common.utils.EncryptionUtil;
import com.bxs.common.vo.EUICombobox;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.ConfigInfoVo;
import com.bxs.pojo.UserInfoVo;
import com.bxs.pojo.jpa.ierp.ErpUser;
import com.bxs.service.ConfigService;
import com.bxs.service.ierp.ErpUserService;

@Controller
@RequestMapping("/erpUser")
public class ErpUserController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(ErpUserController.class);

	@Autowired
	private ErpUserService erpUserService;
	
	//系统配置
	@Autowired
	private ConfigService configService;
	
	
	@Value("${login.page.flag}")
	private String LOGIN_PAGE_FLAG;
	
	
	/**
	 * 
	 * 获取用户下拉框数据
	 * @author: wyc
	 * @createTime: 2019年3月26日 下午3:37:29
	 * @history:
	 * @param deptId
	 * @return List<EUICombobox>
	 */
	@RequestMapping("/getUserComboboxData")
	@ResponseBody
	public List<EUICombobox> getUserComboboxData(){
		return erpUserService.getUserComboboxData();
	}
	
	
	/**
	 * 
	 * 系统登录
	 * @author: wyc
	 * @createTime: 2019年3月25日 上午11:03:39
	 * @history:
	 * @param username
	 * @param password
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping("/doLogin")
	public ModelAndView doLogin(String username,String password,HttpSession session){
		ModelAndView mv=new ModelAndView();
		//从 t_erp_user 中获取数据
		List<ErpUser> list=erpUserService.getUserByLoginName(username);
		mv.setViewName(LOGIN_PAGE_FLAG);
		if(!list.isEmpty()){
			ErpUser info=list.get(0);
			//密码相等
			if(info.getLoginPwd().equals(EncryptionUtil.getMd5String(password))){
			//用户信息存入Session
			session.setAttribute(SystemConstant.CURRENT_SESSION_USER_INFO,covertToUserInfo(info));
			//是管理员
			session.setAttribute(SystemConstant.CURRENT_SESSION_IS_ADMIN, true);
			//携带用户信息
			mv.addObject(SystemConstant.CURRENT_SESSION_USER_INFO, info);
			logger.info("{}登录成功,时间为{}",info.getEmpName()+"["+info.getLoginName()+"]",new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
			
			//获取基础配置信息
			List<ConfigInfoVo> sysConfigList=configService.getConfigByTypeCode("JCXX");
			for (ConfigInfoVo configInfoVo : sysConfigList) {
				if("XTMC".equals(configInfoVo.getConfigCode())){
					mv.addObject("XTMC",configInfoVo.getConfigValue());
				}
				
				if("LOGO".equals(configInfoVo.getConfigCode())){
					mv.addObject("LOGO",configInfoVo.getConfigValue());
				}
			}
				//跳转到后台管理主页面
				mv.setViewName("/manager/index");
			}else{
				mv.addObject(SystemConstant.SYSTEM_ERROR_MSG, "用户名或者密码错误");
				logger.info("{}登录[管理系统]失败,时间为{},密码错误",info.getEmpName()+"["+info.getLoginName()+"]",new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
				//登录失败，跳转到登录页面
				mv.setViewName(LOGIN_PAGE_FLAG);
			}
			
		}else{
			logger.info("账号{}登录[管理系统]失败,时间为{},系统中无该用户",username,new DateTime().toString("yyyy-MM-dd HH:mm:ss"));
			mv.addObject(SystemConstant.SYSTEM_ERROR_MSG, "用户名或者密码错误");
		}
		
		return mv;
		
	}
	
	/**
	 * 
	 * 将ErpUser 转换成Session中存的UserInfo
	 * @author: wyc
	 * @createTime: 2019年3月25日 上午11:10:24
	 * @history:
	 * @param info
	 * @return Object
	 */
	private UserInfoVo covertToUserInfo(ErpUser info) {
		UserInfoVo userInfoVo=new UserInfoVo();
		userInfoVo.setUserName(info.getEmpName());
		userInfoVo.setLoginName(info.getLoginName());
		userInfoVo.setLoginPassword(info.getLoginPwd());
		return userInfoVo;
	}

	/**
	 * 
	 * 保存用户
	 * 
	 * @author: wyc
	 * @createTime: 2019年3月21日 下午4:43:51
	 * @history:
	 * @param erpUser
	 * @param session
	 * @return JsonMsg
	 */
	@RequestMapping("/save")
	@ResponseBody
	public JsonMsg save(ErpUser erpUser, HttpSession session) {
		// 新增时设置创建人和创建时间
		if (StringUtils.isBlank(erpUser.getId())) {
			logger.info("新增操作");
			erpUser.setCreateUserId(erpUser.getId());
			erpUser.setCreateDate(new Date());
			// 设置为有效
			erpUser.setDataState("1");
		}
		// 设置更新人和更新时间，第一次新增时，和 创建人和创建时间一致
		erpUser.setUpdateUserId(erpUser.getId());
		erpUser.setUpdateDate(new Date());
		// 保存
		erpUserService.save(erpUser);
		return new JsonMsg(true, "保存成功！");
	}
	
	
	/**
	 * 
	 * 分页列表
	 * @author: wyc
	 * @createTime: 2019年3月25日 上午11:23:54
	 * @history:
	 * @param request
	 * @return EUIGrid
	 */
	@RequestMapping("/pagerList")
	@ResponseBody
	public  EUIGrid pagerList(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return erpUserService.pagerList(ePager,param);
	}
	

}
