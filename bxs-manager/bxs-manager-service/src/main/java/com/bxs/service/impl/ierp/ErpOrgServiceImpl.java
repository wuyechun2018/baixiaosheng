package com.bxs.service.impl.ierp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bxs.jpa.ErpOrgRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bxs.common.vo.EUIGrid;
import com.bxs.common.vo.EUIPager;
import com.bxs.common.vo.EUITree;
import com.bxs.jdbc.ierp.ErpOrgDao;
import com.bxs.pojo.jpa.ierp.ErpOrg;
import com.bxs.service.ierp.ErpOrgService;

@Service
public class ErpOrgServiceImpl implements ErpOrgService{

	@Autowired
	private ErpOrgDao erpOrgDao;
	
	@Autowired
	private ErpOrgRepository erpOrgRepository;
	
	
	@Override
	public EUIGrid pagerList(EUIPager ePager, Map<String, Object> param) {
		EUIGrid grid = new EUIGrid();
		grid.setTotal(erpOrgDao.getTotalCount(param));
		grid.setRows(erpOrgDao.getPagerList(ePager,param));
		return grid;
	}


	@Override
	public List<EUITree> getListByPid(String pid) {
		List<EUITree> list=new ArrayList<EUITree>();
		List<ErpOrg> erpOrgList=erpOrgDao.getListByPid(pid);
		for (ErpOrg erpOrg : erpOrgList) {
			EUITree easyTree=new EUITree();
			easyTree.setId(erpOrg.getId());
			easyTree.setText(erpOrg.getOrgName());
			easyTree.setState(hasChild(erpOrg.getId())?"closed":"open");
			Map<String, String> attr=new HashMap<String, String>();
			attr.put("parentOrgId", erpOrg.getParentOrgId());
			attr.put("orgCode",erpOrg.getOrgCode());
			attr.put("orgLeaderId", erpOrg.getOrgLeaderId());
			attr.put("orgDesc", erpOrg.getOrgDesc());
			attr.put("dataState", erpOrg.getDataState());
			attr.put("contactUserId", erpOrg.getContactUserId());
			attr.put("contactMobile",erpOrg.getContactMobile());
			attr.put("contactEmail", erpOrg.getContactEmail());
			attr.put("contactAddress", erpOrg.getContactAddress());
			attr.put("displayOrder", erpOrg.getDisplayOrder()+"");
			easyTree.setAttributes(attr);
			list.add(easyTree);
		}
		return list;
	}


	/**
	 * 
	 * 是否有子节点
	 * @author: wyc
	 * @createTime: 2019年3月26日 上午10:21:52
	 * @history:
	 * @param pid
	 * @return boolean
	 */
	private boolean hasChild(String pid) {
		List<ErpOrg> list=erpOrgDao.getListByPid(pid);
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}


	@Override
	public void save(ErpOrg erpOrg) {
		erpOrgRepository.save(erpOrg);
	}


	@Override
	public void delete(String id) {
		ErpOrg erpOrg=erpOrgRepository.findOne(id);
		erpOrg.setDataState("0");
		erpOrgRepository.save(erpOrg);
	}

}
