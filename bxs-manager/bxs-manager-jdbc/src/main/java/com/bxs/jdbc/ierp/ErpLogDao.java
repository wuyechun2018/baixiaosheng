package com.bxs.jdbc.ierp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ErpLogDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
}
