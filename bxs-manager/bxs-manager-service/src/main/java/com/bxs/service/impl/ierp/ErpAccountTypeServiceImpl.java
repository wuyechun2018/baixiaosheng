package com.bxs.service.impl.ierp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.bxs.jpa.ErpAccountTypeRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bxs.common.vo.EUITree;
import com.bxs.jdbc.ierp.ErpAccountTypeDao;
import com.bxs.pojo.jpa.ierp.ErpAccountType;
import com.bxs.service.ierp.ErpAccountTypeService;

@Service
public class ErpAccountTypeServiceImpl implements ErpAccountTypeService {
	
	@Autowired
	private ErpAccountTypeRespository erpAccountTypeRespostory;
	
	@Autowired
	private ErpAccountTypeDao erpAccountTypeDao;
	

	@Override
	public List<EUITree> getListByPid(String pid) {
		List<EUITree> list=new ArrayList<EUITree>();
		List<ErpAccountType> erpAccountTypeList=erpAccountTypeDao.getListByPid(pid);
		for (ErpAccountType erpAccountType : erpAccountTypeList) {
			EUITree easyTree=new EUITree();
			easyTree.setId(erpAccountType.getId());
			easyTree.setText(erpAccountType.getAccountTypeName());
			easyTree.setState(hasChild(erpAccountType.getId())?"closed":"open");
			Map<String, String> attr=new HashMap<String, String>();
			attr.put("accountTypePid", erpAccountType.getAccountTypePid());
			attr.put("accountTypeCode",erpAccountType.getAccountTypeCode());
			attr.put("displayOrder", erpAccountType.getDisplayOrder()+"");
			attr.put("incomeExpense",erpAccountType.getIncomeExpense());
			attr.put("memo",erpAccountType.getMemo());
			attr.put("dataState", erpAccountType.getDataState());
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
		List<ErpAccountType> list=erpAccountTypeDao.getListByPid(pid);
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}
	
	@Override
	public void save(ErpAccountType erpAccountType) {
		erpAccountTypeRespostory.save(erpAccountType);
	}
	
	@Override
	public void delete(String id) {
		ErpAccountType erpAccountType=erpAccountTypeRespostory.findOne(id);
		erpAccountType.setDataState("0");
		erpAccountTypeRespostory.save(erpAccountType);
	}

	@Override
	public Object getListByPidAndType(String pid, String type) {
		List<EUITree> list=new ArrayList<EUITree>();
		List<ErpAccountType> erpAccountTypeList=erpAccountTypeDao.getListByPidAndType(pid,type);
		for (ErpAccountType erpAccountType : erpAccountTypeList) {
			EUITree easyTree=new EUITree();
			easyTree.setId(erpAccountType.getId());
			easyTree.setText(erpAccountType.getAccountTypeName());
			easyTree.setState(hasChild(erpAccountType.getId())?"closed":"open");
			Map<String, String> attr=new HashMap<String, String>();
			attr.put("accountTypePid", erpAccountType.getAccountTypePid());
			attr.put("accountTypeCode",erpAccountType.getAccountTypeCode());
			attr.put("displayOrder", erpAccountType.getDisplayOrder()+"");
			attr.put("incomeExpense",erpAccountType.getIncomeExpense());
			attr.put("memo",erpAccountType.getMemo());
			attr.put("dataState", erpAccountType.getDataState());
			easyTree.setAttributes(attr);
			list.add(easyTree);
		}
		return list;
	}

}
