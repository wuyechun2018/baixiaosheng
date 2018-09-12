package com.bxs.service;

import com.bxs.pojo.jpa.SysUserExtend;

public interface SysUserExtendService  {

	void save(SysUserExtend userExtend);

	SysUserExtend findByUserId(String id);

}
