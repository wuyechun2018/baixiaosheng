1、初始化成一个Maven项目；  
==
&nbsp;1)bxs-parent:全局的配置,公司级别的,管理依赖的jar包版本；  
&nbsp;2)bxs-commmon:是一个通用组件，工具类，继承于bxs-parent;  
&nbsp;3)bxs-manager:是一个聚合工程的后台系统，继承于bxs-parent,依赖于bxs-common;  
&nbsp;&nbsp;4)bxs-manager-pojo:是一个Maven构建的组件，用于管理实体类；  
&nbsp;&nbsp;5)bxs-manager-jdbc:是一个Maven构建的组件，用于管理数据层，依赖于bxs-manager-pojo；  
&nbsp;&nbsp;6)bxs-manager-service:是一个Maven构建的组件，用于管理服务层,依赖于bxs-manager-jdbc;  
&nbsp;7)bxs-manager-web：是一个Maven构建的组件，用于管理控制层；  

