<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="${ctx}/resources/fan/images/sitaoke.ico" />
<link rel="icon" href="${ctx}/resources/fan/images/sitaoke.ico" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--手机版设置-->
<meta http-equiv="X-UA-Compatible" content="IE=11">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!--/手机版设置-->
<title>思淘客</title>
<link href="${ctx}/resources/fan/css/login.css" rel="stylesheet" />

</head>
        
        <body class="">
          <div id="a-page">
            <div class="a-section a-padding-medium auth-workflow">
              <div class="a-section a-spacing-none auth-navbar">
                <div class="a-section a-spacing-medium a-text-center">
                  <a class="a-link-nav-icon" tabindex="-1" href="/ref=ap_frn_logo">
                    <i class="a-icon a-icon-logo-china" >
                      <span class="a-icon-alt">Sitaoke.vip</span>
                    </i>
                  </a>
                </div>
              </div>
              <div id="authportal-center-section" class="a-section">
                <div id="authportal-main-section" class="a-section">
                  <div class="a-section auth-pagelet-container">
                    <div class="a-section auth-pagelet-container">
                      <form id="ap_register_form" name="register" method="post" novalidate="" action="${ctx}/fan/doRegister" class="ap_ango_default ">
                        <div class="a-box a-spacing-extra-large">
                          <div class="a-box-inner">
                            <h1 class="a-spacing-small moa_desktop_signup">创建账户</h1>
                            <div class="a-row a-spacing-base">
                              <label for="loginName" class="a-form-label">登录名</label>
                              <input type="text" maxlength="50" name="loginName" value="${rLoginName}" class="a-input-text a-span12 ">
                            </div>
                            <div class="a-spacing-base">
                              <div class="a-row">
                                <label for="mobilePhone" class="a-form-label">手机号码</label>
                              	<input type="text" maxlength="50"  name="mobilePhone" value="${rMobilePhone}"  class="a-input-text a-span12 ">
                              </div>
                            </div>
                            
                            <div class="auth-require-fields-match-group">
                              <div class="a-row a-spacing-base">
                                <label for="loginPassword" class="a-form-label">密码</label>
                                <input type="password" maxlength="1024"  placeholder="至少 6 个字符" value="${rLoginPassword}" name="loginPassword" tabindex="5" class="a-input-text a-span12 ">
                              </div>
                            </div>
                            <div class="a-row a-spacing-large">
                              <div data-a-input-name="legalAgreementCheckBox" class="a-checkbox auth-required-field">
                                <label>
                                  <input type="checkbox" name="legalAgreementCheckBox" value="true" tabindex="7">
                                  <i class="a-icon a-icon-checkbox"></i>
                                  <span class="a-label a-checkbox-label">我已阅读并同意网站的
                                    <a href="">使用条件</a>及
                                    <a href="">隐私声明</a>。</span></label>
                              </div>
                            </div>
                           
                            <div class="a-section a-spacing-extra-large ap_mobile_number_fields">
                              <span id="auth-continue" class="a-button a-button-span12 a-button-primary auth-requires-verify-modal">
                                <span class="a-button-inner">
                                  <input id="continue" tabindex="8" class="a-button-input" type="submit" aria-labelledby="auth-continue-announce">
                                  <span id="auth-continue-announce" class="a-button-text" aria-hidden="true">确认注册</span>
                                  </span>
                              </span>
                            </div>
                            <div class="a-divider a-divider-section">
                              <div class="a-divider-inner"></div>
                            </div>
                            <div class="a-row" style="font-size:16px;text-align: center;color:red;font-weight:bold;">
                           		${infoMsg}
                              </div>
                          </div>
                        </div>
                      </form>
                    </div>
                  	
                  </div>
                </div>
              </div>
              <div id="right-2"></div>
              <div class="a-section a-spacing-top-extra-large auth-footer">
                <div class="a-divider a-divider-section">
                  <div class="a-divider-inner"></div>
                </div>
                <%--
                <div class="a-section a-spacing-small a-text-center a-size-mini">
                  <span class="auth-footer-seperator"></span>
                  <a class="a-link-normal" target="_blank"  href="">使用条件</a>
                  <span class="auth-footer-seperator"></span>
                  <a class="a-link-normal" target="_blank"  href="">隐私声明</a>
                  <span class="auth-footer-seperator"></span>
                  <a class="a-link-normal" target="_blank"  href="">帮助</a>
                  <span class="auth-footer-seperator"></span>
                </div>
                <div class="a-section a-spacing-none a-text-center">
                  <span class="a-size-mini a-color-secondary">版权所有©1996-2018，亚马逊公司或其关联公司</span></div>
              </div>
               --%>
            </div>
            <div id="auth-external-javascript" class="auth-external-javascript" data-external-javascripts=""></div>
          </div>
          </div>
          <div id="be" style="display: none; visibility: hidden;">
            <form name="ue_backdetect" action="get">
              <input type="hidden" name="ue_back" value="2"></form>
          </div>
          <div id="a-popover-root" style="z-index: -1; position: absolute;"></div>
          <div class="fwcim-container"></div>
        </body>
      
      </html>