package com.bxs.controller;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.FloatWin;
import com.bxs.service.FloatWinService;

/**
 * 
 *  链接管理 控制层
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年1月28日 上午10:34:10
 * @history:
 * @version: v1.0
 */
@Controller
@RequestMapping("/floatWin")
public class FloatWinController extends BaseController {
	
	@Autowired
	private FloatWinService floatWinService;
	
	/**
	 * 
	 * 返回链接列表数据
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午8:25:08
	 * @history:
	 * @return EUIGrid EasyUI可识别的固定数据集合
	 */
	@RequestMapping("/pagerList")
	@ResponseBody
	public  EUIGrid pagerList(HttpServletRequest request){
		EUIPager ePager=getPager(request);
		Map<String,Object> param=getParamMap(request);
		return floatWinService.pagerList(ePager,param);
	}
	
	
	/**
	 * 
	 * 保存操作
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午2:03:52
	 * @history:
	 * @param link
	 * @return Object
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Object save(FloatWin floatWin) {
		floatWinService.save(floatWin);
		return new JsonMsg();
	}
	
	
	/**
	 * 
	 * 删除操作
	 * @author: wyc
	 * @createTime: 2018年1月28日 下午2:21:58
	 * @history:
	 * @param request
	 * @return Object
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(HttpServletRequest request){
		String id=request.getParameter("id");
		floatWinService.delete(id);
		return new JsonMsg();
	}
}
