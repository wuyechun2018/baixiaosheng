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
import com.bxs.pojo.Article;
import com.bxs.pojo.InfoRank;
import com.bxs.pojo.InfoRankVo;

/**
 * 
 * 信息排名
 * @desc: bxs-manager-jdbc
 * @author: wyc
 * @createTime: 2018年3月1日 下午4:12:53
 * @history:
 * @version: v1.0
 */
@Repository
public class InfoRankDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 
	 * 保存
	 * @author: wyc
	 * @createTime: 2018年3月1日 下午8:37:44
	 * @history:
	 * @param infoRank void
	 */
	public void save(final InfoRank infoRank) {
		String sql ="INSERT INTO t_info_rank (\n" +
						"  id,\n" + 
						"  stat_year,\n" + 
						"  dept_id,\n" + 
						"  bumen,\n" + 
						"  zhidui,\n" + 
						"  shiju,\n" + 
						"  zongdui,\n" + 
						"  shengdui,\n" + 
						"  buju,\n" + 
						"  create_user_id,\n" + 
						"  create_date,\n" + 
						"  update_user_id,\n" + 
						"  update_date,\n" + 
						"  show_state,\n" + 
						"  data_state\n" + 
						")\n" + 
						"VALUES\n" + 
						"  (\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?,\n" + 
						"    ?\n" + 
						"  )";



		jdbcTemplate.execute(sql, new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
				ps.setString(1, UUID.randomUUID().toString());
				ps.setString(2, infoRank.getStatYear());
				ps.setString(3,infoRank.getDeptId());
				
				ps.setInt(4,infoRank.getBumen());
				ps.setInt(5,infoRank.getZhidui());
				ps.setInt(6, infoRank.getShiju());
				ps.setInt(7, infoRank.getZongdui());
				ps.setInt(8, infoRank.getShengdui());
				ps.setInt(9, infoRank.getBuju());
				
				ps.setString(10, infoRank.getCreateUserId());
				ps.setTimestamp(11, new java.sql.Timestamp(infoRank.getCreateDate().getTime()));
				ps.setString(12, infoRank.getUpdateUserId());
				ps.setTimestamp(13, new java.sql.Timestamp(infoRank.getUpdateDate().getTime()));
				
				ps.setString(14, infoRank.getShowState());
				ps.setString(15, infoRank.getDataState());
			
			}
		});

	}

	/**
	 * 
	 * 获取信息排名
	 * @author: wyc
	 * @createTime: 2018年5月11日 上午11:48:32
	 * @history:
	 * @param statYear
	 * @param deptId
	 * @return Long
	 */
	public InfoRank getInfoRankByStatYearAndDeptId(String statYear,String deptId) {
		String sql="SELECT * FROM t_info_rank T WHERE  T.stat_year=? AND t.dept_id=?";
		List<InfoRank> list = jdbcTemplate.query(sql,new Object[]{statYear,deptId},new BeanPropertyRowMapper(InfoRank.class));
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}
	
	
	
	public Long getTotalCountByStatYearAndDeptId(String statYear,String deptId) {
		String sql="SELECT COUNT(1) FROM V_INFO_RANK T WHERE  T.stat_year=? AND t.dept_id=?";
		return  jdbcTemplate.queryForObject(sql,new Object[]{statYear,deptId},Long.class);
	}

	/**
	 * 
	 * 获取查询条件筛选后的记录总数
	 * @author: wyc
	 * @createTime: 2018年3月1日 下午8:49:35
	 * @history:
	 * @param param
	 * @return Long
	 */
	public Long getTotalCount(Map<String, Object> param) {
		String sql="SELECT COUNT(1) FROM V_INFO_RANK T WHERE 1=1 \n"+getParamSql(param);
		return  jdbcTemplate.queryForObject(sql,Long.class);
	}

	/**
	 * 
	 * 获取查询条件SQL
	 * @author: wyc
	 * @createTime: 2018年3月1日 下午8:50:00
	 * @history:
	 * @param param
	 * @return String
	 */
	private String getParamSql(Map<String, Object> param) {
		StringBuffer sqlBuff=new StringBuffer();
		//开始时间
		if(param.get("statYear")!=null&&StringUtils.isNotBlank(param.get("statYear").toString())){
			sqlBuff.append(" AND stat_year = '" + param.get("statYear").toString() + "'\n");
		}
		if(param.get("showState")!=null&&StringUtils.isNotBlank(param.get("showState").toString())){
			sqlBuff.append(" AND show_state = '" + param.get("showState").toString() + "'\n");
		}
		sqlBuff.append(" ORDER BY zhidui DESC");
		return sqlBuff.toString();
	}

	/**
	 * 
	 * 翻页查询
	 * @author: wyc
	 * @createTime: 2018年3月1日 下午8:49:17
	 * @history:
	 * @param ePager
	 * @param param
	 * @return List<?>
	 */
	public List<?> pagerList(EUIPager ePager, Map<String, Object> param) {
		String  querySql="SELECT * FROM V_INFO_RANK T WHERE 1=1 \n"+getParamSql(param);
		String sql="SELECT * FROM ("+querySql+")S limit ?,?";
		List<InfoRankVo> list = jdbcTemplate.query(sql,new Object[]{ePager.getStart(),ePager.getRows()},new BeanPropertyRowMapper(InfoRankVo.class));
		return list;
	}

	/**
	 * 
	 * 更新
	 * @author: wyc
	 * @createTime: 2018年3月1日 下午8:31:02
	 * @history:
	 * @param infoRank void
	 */
	public void update(final InfoRank infoRank) {
		String sql=	"UPDATE\n" +
						"  t_info_rank\n" + 
						"SET\n" + 
						"  stat_year= ?,\n" + 
						"  dept_id= ?,\n" + 
						"  bumen= ?,\n" + 
						"  zhidui= ?,\n" + 
						"  shiju= ?,\n" + 
						"  zongdui= ?,\n" + 
						"  shengdui= ?,\n" + 
						"  buju= ?,\n" + 
						"  update_user_id= ?,\n" + 
						"  update_date= ?,\n" + 
						"  show_state= ?,\n" + 
						"  data_state= ?\n" + 
						"WHERE id= ?";

		jdbcTemplate.execute(sql, new AbstractLobCreatingPreparedStatementCallback(new DefaultLobHandler()) {
			protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
				
				ps.setString(1, infoRank.getStatYear());
				ps.setString(2,infoRank.getDeptId());
				
				ps.setInt(3,infoRank.getBumen());
				ps.setInt(4,infoRank.getZhidui());
				ps.setInt(5, infoRank.getShiju());
				ps.setInt(6, infoRank.getZongdui());
				ps.setInt(7, infoRank.getShengdui());
				ps.setInt(8, infoRank.getBuju());
				
				ps.setString(9, infoRank.getUpdateUserId());
				ps.setTimestamp(10, new java.sql.Timestamp(infoRank.getUpdateDate().getTime()));
				
				ps.setString(11, infoRank.getShowState());
				ps.setString(12, infoRank.getDataState());
				
				ps.setString(13, infoRank.getId());
			}
		});
		
	}

	/**
	 * 
	 * 根据主键获取信息排名
	 * @author: wyc
	 * @createTime: 2018年3月1日 下午8:51:05
	 * @history:
	 * @param id
	 * @return InfoRankVo
	 */
	public InfoRankVo getInfoRankById(String id) {
		List<InfoRankVo> list = jdbcTemplate.query("SELECT * FROM V_INFO_RANK WHERE ID=?",new Object[]{id},new BeanPropertyRowMapper(InfoRankVo.class));
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}

}
