package com.bxs.service;
import java.util.List;
import com.bxs.common.vo.EUITree;

public interface SysMenuService {

	List<EUITree> getListByPid(String pid);

	List<EUITree> getListByPidAndUserId(String pid, String userId);

}
