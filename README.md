1、初始化成一个Maven项目；  
==
&nbsp;1)bxs-parent:全局的配置,公司级别的,管理依赖的jar包版本；  
&nbsp;2)bxs-commmon:是一个通用组件，工具类，继承于bxs-parent;  
&nbsp;3)bxs-manager:是一个聚合工程的后台系统，继承于bxs-parent,依赖于bxs-common;  
&nbsp;&nbsp;(1)bxs-manager-pojo:是一个Maven构建的组件，用于管理实体类；  
&nbsp;&nbsp;(2)bxs-manager-jdbc:是一个Maven构建的组件，用于管理数据层，依赖于bxs-manager-pojo；  
&nbsp;&nbsp;(3)bxs-manager-service:是一个Maven构建的组件，用于管理服务层,依赖于bxs-manager-jdbc;  
&nbsp;&nbsp;(4)bxs-manager-web：是一个Maven构建的组件，用于管理控制层；  

2、项目的日志配置；  
==
&nbsp;1)使用SLF4J和Log4j 进行日志记录，后期会使用logback替换Log4j,jar包配置参见pbxs-parent中的pom.xml中日志配置；  
&nbsp;2)SLF4J(Simple logging Facade for Java)不是一个真正的日志实现，而是一个抽象层（ abstraction layer），它允许你在后台使用任意一个日志类库;  
