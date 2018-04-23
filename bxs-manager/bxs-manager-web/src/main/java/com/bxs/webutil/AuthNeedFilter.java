package com.bxs.webutil;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bxs.common.dict.SystemConstant;
import com.bxs.pojo.UserInfoVo;

public class AuthNeedFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		String servletPath = httpServletRequest.getServletPath();
		//不需要登录页能访问的地址
		String[] needFilterPathArray = new String[] {"/sois/index","/manager/index","/sois/list","/sois/signList","/sois/videoList","/sois/feedbackList","/sois/add","/sois/signAdd","/sois/feedbackAdd"};
		boolean doFilter=false;
		for (String needFilterPath : needFilterPathArray) {  
        	if (servletPath.indexOf(needFilterPath) != -1) {  
        		doFilter = true;  
        		break;  
        	}  
	     }
		 if(doFilter){
			 String loginPath=httpServletRequest.getContextPath()+"/login";
			 if(servletPath.indexOf("sois")!=-1){
				loginPath=httpServletRequest.getContextPath()+"/sois/login";
			 }
			
			 if (!isAlreadyLogin(httpServletRequest)){
				 httpServletResponse.sendRedirect(loginPath);
				 return;
			 }
		 } 
		 chain.doFilter(request, response);
	}

	private boolean isAlreadyLogin(HttpServletRequest httpServletRequest) {
		UserInfoVo info=(UserInfoVo) httpServletRequest.getSession().getAttribute(SystemConstant.CURRENT_SESSION_USER_INFO);
		if(info!=null){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
