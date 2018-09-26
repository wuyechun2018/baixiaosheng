package com.bxs.jdbc;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.bxs.pojo.jpa.BizCalendar;

@Repository
public class BizCalendarDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 
	 * 获取一个月的记录
	 * @author: wyc
	 * @createTime: 2018年9月26日 下午2:29:00
	 * @history:
	 * @param month
	 * @return List<BizCalendar>
	 */
	public List<BizCalendar> list(String month,String userId) {
		//MySql
		String sql="SELECT S.* FROM t_biz_calendar S WHERE DATA_STATE='1' AND DATE_FORMAT(S.BIZ_DAY,'%Y-%m')=? AND S.USER_ID=?";
		List<BizCalendar> list = jdbcTemplate.query(sql,new Object[]{month,userId},new BeanPropertyRowMapper(BizCalendar.class));
		return list;
	}
	
	
	

}
