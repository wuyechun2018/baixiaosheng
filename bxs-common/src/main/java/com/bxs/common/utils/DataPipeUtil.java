package com.bxs.common.utils;

import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.LayUIGrid;

/**
 * 
 * 数据管道工具类
 * @desc: bxs-common
 * @author: wyc
 * @createTime: 2018年2月8日 下午4:35:14
 * @history:
 * @version: v1.0
 */
public class DataPipeUtil {
	
	
	/**
	 * 
	 * 将EasyUI的Grid转换成LayUI的grid
	 * @author: wyc
	 * @createTime: 2018年2月8日 下午4:37:29
	 * @history:
	 * @param grid
	 * @return LayUIGrid
	 */
	public static LayUIGrid toLayUIGrid(EUIGrid grid){
		LayUIGrid layGrid=new LayUIGrid();
		layGrid.setCount(grid.getTotal());
		layGrid.setData(grid.getRows());
		layGrid.setCode("0");
		layGrid.setMsg("");
		return layGrid;
	}
}
