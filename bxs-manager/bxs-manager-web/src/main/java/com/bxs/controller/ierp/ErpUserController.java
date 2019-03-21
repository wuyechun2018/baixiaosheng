package com.bxs.controller.ierp;
import java.util.Date;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bxs.common.utils.BaseController;
import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.jpa.ierp.ErpUser;
import com.bxs.service.ierp.ErpUserService;

@Controller
@RequestMapping("/erpUser")
public class ErpUserController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(ErpUserController.class);

	@Autowired
	private ErpUserService erpUserService;
	
	
	/**
	 * 
	 * 保存用户
	 * 
	 * @author: wyc
	 * @createTime: 2019年3月21日 下午4:43:51
	 * @history:
	 * @param erpUser
	 * @param session
	 * @return JsonMsg
	 */
	@RequestMapping("/save")
	@ResponseBody
	public JsonMsg save(ErpUser erpUser, HttpSession session) {
		// 新增时设置创建人和创建时间
		if (StringUtils.isBlank(erpUser.getId())) {
			logger.info("新增操作");
			erpUser.setCreateUserId(erpUser.getId());
			erpUser.setCreateDate(new Date());
			// 设置为有效
			erpUser.setDataState("1");
		}
		// 设置更新人和更新时间，第一次新增时，和 创建人和创建时间一致
		erpUser.setUpdateUserId(erpUser.getId());
		erpUser.setUpdateDate(new Date());
		// 保存
		erpUserService.save(erpUser);
		return new JsonMsg(true, "保存成功！");
	}

}
