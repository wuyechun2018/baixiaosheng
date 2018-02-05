package com.bxs.jdbc;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.stereotype.Repository;

import com.bxs.common.vo.EUIPager;
import com.bxs.pojo.ArticleInfoVo;
import com.bxs.pojo.SysUser;
import com.bxs.pojo.WeatherForecast;
@Repository
public class WeatherForecastDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void save(final WeatherForecast weatherForecast) {
		String sql ="INSERT INTO t_weather_forecast (\n" +
						"  id,\n" + 
						"  weather_date,\n" + 
						"  weather_conditions,\n" + 
						"  weather_desc\n" + 
						")\n" + 
						"VALUES\n" + 
						"  (\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?\n" + 
						"  )";

		jdbcTemplate.execute(sql, new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
				ps.setString(1, UUID.randomUUID().toString());
				ps.setDate(2, new java.sql.Date(weatherForecast.getWeatherDate().getTime()));
				ps.setString(3, weatherForecast.getWeatherConditions());
				ps.setString(4, weatherForecast.getWeatherDesc());
			}
		});

	}

	public Long getTotalCountByDataStr(String dataStr) {
		String sql="SELECT COUNT(1) FROM t_weather_forecast T WHERE T.weather_date=?";
		return  jdbcTemplate.queryForObject(sql,new Object[]{dataStr},Long.class);
	}

	public Long getTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM t_weather_forecast T WHERE 1=1 \n"+getParamSql(param);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}

	private String getParamSql(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		
		//开始时间
		if(param.get("weatherDateStart")!=null&&StringUtils.isNotBlank(param.get("weatherDateStart").toString())){
			sqlBuff.append(" AND weather_date >= '" + param.get("weatherDateStart").toString() + "'\n");
		}
		//结束时间
		if(param.get("weatherDateEnd")!=null&&StringUtils.isNotBlank(param.get("weatherDateEnd").toString())){
			sqlBuff.append(" AND weather_date <= '" + param.get("weatherDateEnd").toString() + "'\n");
		}
		sqlBuff.append(" ORDER BY weather_date");
		
		return sqlBuff.toString();
	}

	public List<?> pagerList(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT * FROM t_weather_forecast T WHERE 1=1 \n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<ArticleInfoVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(WeatherForecast.class));
		return list;
	}

	public void update(final WeatherForecast weatherForecast) {
		String sql=	"UPDATE\n" +
						"  t_weather_forecast\n" + 
						"SET\n" + 
						" weather_date =  ?,\n" + 
						"  weather_conditions =  ?,\n" + 
						"  weather_desc =  ?\n" + 
						"WHERE id = ?";
		jdbcTemplate.execute(sql, new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
				ps.setDate(1, new java.sql.Date(weatherForecast.getWeatherDate().getTime()));
				ps.setString(2, weatherForecast.getWeatherConditions());
				ps.setString(3, weatherForecast.getWeatherDesc());
				ps.setString(4, weatherForecast.getId());
			}
		});
		
	}

	public WeatherForecast getWeatherForecastById(String id) {
		List<WeatherForecast> list = jdbcTemplate.query("SELECT * FROM t_weather_forecast WHERE ID=?",new Object[]{id},new BeanPropertyRowMapper(WeatherForecast.class));
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}

	public WeatherForecast getWeatherForecastByWeatherDate(String weatherDateStr) {
		List<WeatherForecast> list = jdbcTemplate.query("SELECT * FROM t_weather_forecast WHERE weather_date=?",new Object[]{weatherDateStr},new BeanPropertyRowMapper(WeatherForecast.class));
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}

}
