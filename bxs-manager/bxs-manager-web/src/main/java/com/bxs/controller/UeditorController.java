package com.bxs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baidu.ueditor.ActionEnter;

@Controller
@RequestMapping("/ueditor")
public class UeditorController {

	@RequestMapping(value = "/config")
	public void config(HttpServletRequest request, HttpServletResponse response) {
		//response.setContentType("application/json");
		//重要调整，解决IE下上传图片下载Json文件的问题
		response.setContentType("text/html");  
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		
		//String tPath = request.getSession().getServletContext().getRealPath("/static"); 
		//String sPath = request.getSession().getServletContext().getRealPath("/resources"); 
		//E:\baixiaosheng\bxs-manager\bxs-manager-web\src\main\webapp
		//E:\baixiaosheng\bxs-manager\bxs-manager-web\src\main\webapp\static
		//E:\baixiaosheng\bxs-manager\bxs-manager-web\src\main\webapp\resources
		
		try {
			String exec = new ActionEnter(request, rootPath).exec();
			PrintWriter writer = response.getWriter();
			writer.write(exec);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

}
