package com.bxs.controller.business;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bxs.common.vo.JsonMsg;
import com.bxs.pojo.jpa.business.Shop;
import com.bxs.service.business.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	/**
	 * http://localhost:2468/bxs-manager-web/shop/save?shopName=黄山茶行&shopManager=谢裕大&telephone=18019563065&address=黄山之巅&bizDesc=日月精华正宗好茶
	 * 保存
	 * @author: wyc
	 * @createTime: 2018年11月15日 下午4:28:04
	 * @history:
	 * @param shop
	 * @return JsonMsg
	 */
	@RequestMapping("/save")
	@ResponseBody
	public JsonMsg save(Shop shop){
		//编辑
		if(StringUtils.isBlank(shop.getId())){
			shop.setCreateDate(new Date());
		}
		shop.setUpdateDate(new Date());
		shop.setDataState("1");
		shopService.save(shop);
		return new JsonMsg(true,"保存成功！");
	}

}
