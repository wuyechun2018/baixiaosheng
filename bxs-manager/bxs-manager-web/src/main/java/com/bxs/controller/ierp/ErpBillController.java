package com.bxs.controller.ierp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.dict.BizConstant;
import com.bxs.common.dict.SystemConstant;
import com.bxs.common.utils.BaseController;
import com.bxs.common.utils.CommonUtil;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.UserInfoVo;
import com.bxs.pojo.jpa.ierp.ErpBill;
import com.bxs.pojo.jpa.ierp.ErpLog;
import com.bxs.service.ierp.ErpBillService;
import com.bxs.service.ierp.ErpLogService;

@Controller
@RequestMapping("/erpBill")
public class ErpBillController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ErpBillController.class);
	
	@Autowired
	private ErpBillService erpBillService;
	
	@Autowired
	private ErpLogService erpLogService;
	
	
	/**
	 * 
	 * 分页查询
	 * @author: wyc
	 * @createTime: 2019年4月29日 下午3:51:35
	 * @history:
	 * @param request
	 * @return EUIGrid
	 */
	@RequestMapping("/pagerList")
	@ResponseBody
	public  EUIGrid pagerList(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return erpBillService.pagerList(ePager,param);
	}
	
	
	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2019年4月29日 下午6:57:02
	 * @history:
	 * @param erpBill
	 * @param session
	 * @param request
	 * @return JsonMsg
	 */
	@RequestMapping("/save")
	@ResponseBody
	public JsonMsg save(ErpBill erpBill, HttpSession session,HttpServletRequest request) {
		UserInfoVo userInfo=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		logger.info("开始保存账单操作[erpBill-save]");
		String opInfo="保存";
		
		erpBill.setDataState("1");
		//新增操作
		if(StringUtils.isBlank(erpBill.getId())){
			erpBill.setCreateDate(new Date());
			erpBill.setCreateUserId(userInfo.getId());
		}else{
			erpBill.setUpdateDate(new Date());
			erpBill.setUpdateUserId(userInfo.getId());
			opInfo="更新";
		}
		//设置业务状态，1待提交、2待审核（可取回，可打回）、3已审核、4已归档
		erpBill.setBizStatus("1");
		erpBillService.save(erpBill);
		
		//操作日志
		ErpLog erpLog=new ErpLog();
		erpLog.setLoginClientIp(CommonUtil.getClientIP(request));
		erpLog.setLoginUserId(userInfo.getId());
		erpLog.setOpreateInfo(opInfo);
		//业务账单
		erpLog.setOpreateType(BizConstant.ERP_LOG_OPTYPE_BILL);
		erpLog.setOpreateTime(new Date());
		erpLogService.save(erpLog);
		
		return new JsonMsg();
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
