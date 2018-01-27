package com.bxs.service;
import java.util.List;
import com.bxs.common.vo.EasyTree;

public interface SysMenuService {

	List<EasyTree> getListByPid(String pid);

}
