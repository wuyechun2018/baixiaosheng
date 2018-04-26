INSERT INTO sitaoke.t_user SELECT * FROM t_user t WHERE t.login_name='zhanghaiyang';
INSERT INTO sitaoke.t_role SELECT * FROM t_role t;
INSERT INTO sitaoke.t_user_role SELECT * FROM t_user_role t;
INSERT INTO sitaoke.t_menu SELECT * FROM t_menu;
INSERT INTO sitaoke.t_topic SELECT * FROM t_topic t WHERE t.pid='0';
INSERT INTO sitaoke.t_dept SELECT * FROM t_dept t WHERE t.pid='0';
INSERT INTO sitaoke.t_config_type SELECT * FROM t_config_type t WHERE t.pid='0';
