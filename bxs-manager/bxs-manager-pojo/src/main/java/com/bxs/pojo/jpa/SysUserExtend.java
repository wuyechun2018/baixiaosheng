package com.bxs.pojo.jpa;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import org.hibernate.annotations.GenericGenerator;



/***
 * 
 * 系统用户扩展信息表
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年8月29日 上午9:27:14
 * @history:
 * @version: v1.0
 */
@Entity(name = "t_user_extend")
public class SysUserExtend implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	
	//主键
	private String id;
	
	//用户Id
	private String userId;
	
	//电子邮箱
	private String email;
	
	//使用邮箱重置账号关键字
	private String resetMailKey;

	
	@Id
	@Column(name = "ID", unique = true, nullable = false, length = 32)
	@GenericGenerator(name = "generator", strategy = "uuid.hex")
	@GeneratedValue(generator = "generator")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "USER_ID", length = 32)
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "EMAIL", length = 100)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "RESET_MAIL_KEY", length = 100)
	public String getResetMailKey() {
		return resetMailKey;
	}

	public void setResetMailKey(String resetMailKey) {
		this.resetMailKey = resetMailKey;
	}
	
	
}
