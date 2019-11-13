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
		String opInfo="新增";
		
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
		ErpBill savedBill=erpBillService.save(erpBill);
		
		//操作日志
		ErpLog erpLog=new ErpLog();
		erpLog.setLoginClientIp(CommonUtil.getClientIP(request));
		erpLog.setLoginUserId(userInfo.getId());
		erpLog.setOperateInfo(opInfo);
		//业务账单
		erpLog.setOperateType(BizConstant.ERP_LOG_OPTYPE_BILL);
		erpLog.setOperateTime(new Date());
		//业务主体Id
		erpLog.setBizId(savedBill.getId());
		erpLogService.save(erpLog);
		
		return new JsonMsg();
	}
	
	
	
	/**
	 * 
	 * 上报
	 * @author: wyc
	 * @createTime: 2019年5月6日 下午6:30:11
	 * @history:
	 * @return JsonMsg
	 */
	@RequestMapping("/report")
	@ResponseBody
	public JsonMsg report(ErpBill erpBill, HttpSession session,HttpServletRequest request){
		UserInfoVo userInfo=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);

		ErpBill existErpBill=erpBillService.getErpBillById(erpBill.getId());
		//设置业务状态，1待提交、2待审核（可取回，可打回）、3已审核、4已归档
		existErpBill.setBizStatus("2");
		erpBillService.save(existErpBill);
		
		//操作日志
		ErpLog erpLog=new ErpLog();
		erpLog.setLoginClientIp(CommonUtil.getClientIP(request));
		erpLog.setLoginUserId(userInfo.getId());
		//提交 操作，从 待提交 到 待审核
		erpLog.setOperateInfo("提交");
		//业务账单
		erpLog.setOperateType(BizConstant.ERP_LOG_OPTYPE_BILL);
		erpLog.setOperateTime(new Date());
		//业务主体Id
		erpLog.setBizId(existErpBill.getId());
		erpLogService.save(erpLog);
		
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * 审批操作
	 * @author: wyc
	 * @createTime: 2019年5月10日 上午8:59:03
	 * @history:
	 * @param erpBill
	 * @param session
	 * @param request
	 * @return JsonMsg
	 */
	@RequestMapping("/spReport")
	@ResponseBody
	public JsonMsg spReport(ErpBill erpBill, HttpSession session,HttpServletRequest request){
		UserInfoVo userInfo=(UserInfoVo) session.getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		//TG 通过 DH 打回
		String spFlag=request.getParameter("spFlag");
		ErpBill existErpBill=erpBillService.getErpBillById(erpBill.getId());
		//审核意见
		String shDesc=request.getParameter("shDesc");
		String operateInfo="";
		if("TG".equals(spFlag)){
			//如果通过则状态为 已审核
			existErpBill.setBizStatus("3");
			operateInfo="审核通过，审批意见为："+shDesc;
		}else if("DH".equals(spFlag)){
			//打回
		    existErpBill.setBizStatus("1");
		    operateInfo="打回，审批意见为："+shDesc;
		}
		erpBillService.save(existErpBill);

		//操作日志
		ErpLog erpLog=new ErpLog();
		erpLog.setLoginClientIp(CommonUtil.getClientIP(request));
		erpLog.setLoginUserId(userInfo.getId());
		//提交 操作，从 待提交 到 待审核
		erpLog.setOperateInfo(operateInfo);
		//业务账单
		erpLog.setOperateType(BizConstant.ERP_LOG_OPTYPE_BILL);
		erpLog.setOperateTime(new Date());
		//业务主体Id
		erpLog.setBizId(existErpBill.getId());
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
