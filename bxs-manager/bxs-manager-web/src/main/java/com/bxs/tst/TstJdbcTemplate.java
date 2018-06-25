package com.bxs.tst;

import java.util.List;
import java.util.Map;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 * 
 * 演示jdbcTemplate的使用方法
 * @desc: bxs-manager-web
 * @author: wyc
 * @createTime: 2018年6月25日 下午2:50:24
 * @history:
 * @version: v1.0
 */
public class TstJdbcTemplate {
	
	public static void main(String[]args){
		loadFromConfig();
		loadFromCode();
		
	}
	
	/**
	 * 
	 * 从配置文件获取jdbcTemplate
	 * @author: wyc
	 * @createTime: 2018年6月25日 下午2:45:47
	 * @history: void
	 */
	public static void loadFromConfig(){
		 System.out.println("从配置文件获取jdbcTemplate");
		 ApplicationContext ctx=new ClassPathXmlApplicationContext("classpath:spring/tst-jdbc.xml");
	     JdbcTemplate jdbcTemplate=(JdbcTemplate)ctx.getBean("tstTdbcTemplate");
	     String sql="SELECT * FROM VIEW_JKJTYKT_DATA t WHERE MOTHER_IDCARD=?";
		 List<Map<String,Object>> list =jdbcTemplate.queryForList(sql,new Object[]{"341221199008069305"});
		 if(!list.isEmpty()){
			 Map<String,Object> mapData=list.get(0);
			  for (Map.Entry<String,Object> entry : mapData.entrySet()) {
				  System.out.println("key= " + entry.getKey() + " and value= "+entry.getValue());
			  }
		 }
	}
	
	/**
	 * 
	 * 代码获取jdbcTemplate
	 * @author: wyc
	 * @createTime: 2018年6月25日 下午2:45:31
	 * @history: void
	 */
	public static void loadFromCode(){
		 System.out.println("从代码获取jdbcTemplate");
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		dataSource.setUrl("jdbc:oracle:thin:@172.23.9.43:1521/zwywdb");
		dataSource.setUsername("U_YZT");
		dataSource.setPassword("U_YZT_2018");
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		 String sql="SELECT * FROM VIEW_JKJTYKT_DATA t WHERE MOTHER_IDCARD=?";
		 List<Map<String,Object>> list =jdbcTemplate.queryForList(sql,new Object[]{"341221199008069305"});
		 if(!list.isEmpty()){
			 Map<String,Object> mapData=list.get(0);
			  for (Map.Entry<String,Object> entry : mapData.entrySet()) {
				  System.out.println("key= " + entry.getKey() + " and value= "+entry.getValue());
			  }
		 }
		
	}

}
