package com.bxs.controller.ierp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bxs.common.vo.EUIGrid;

public interface ErpBaseController<T> {

	
	/**
	 * 
	 * 列表
	 * 
	 * @author: wyc
	 * @createTime: 2019年3月22日 下午5:06:07
	 * @history:
	 * @param request
	 * @return EUIGrid
	 */
	public EUIGrid pagerList(HttpServletRequest request);
	
	/**
	 * 
	 * 保存
	 * 
	 * @author: wyc
	 * @createTime: 2019年3月22日 下午5:05:57
	 * @history:
	 * @param entity   void
	 */
	public void save(T entity,HttpSession session);

	/**
	 * 
	 * 删除
	 * 
	 * @author: wyc
	 * @createTime: 2019年3月22日 下午5:06:44
	 * @history:
	 * @param request
	 * @return Object
	 */
	public Object delete(HttpServletRequest request);
}
