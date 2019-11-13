BXS 是“百晓生”的中文拼音首字符简写，起源于自己想做一个“排行榜”网站，放一些新奇好玩的东西。


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

3、访问数据库；
==
&nbsp;1)在bxs-manager-jdbc项目pom.xml中添加mysql和数据库连接池驱动jar包配置;  

4、关于Spring的注解疑问；
==
&nbsp;1)问曰：@service这个注解是标注在接口上还是接口的实现类上？  
&nbsp;&nbsp;答曰：@Service注解是标注在实现类上的，因为@Service是把spring容器中的bean进行实例化，也就是等同于new操作，只有实现类是可以进行new实例化的，而接口则不能，所以是加在实现类上的;但是，值得一提的是，在controller层注入的是接口，而非实现类。

5、关于视图的选择配置；  
==
&nbsp;&nbsp;采用SpringMVC的多视图解析器，管理页面采用jsp,前端展示页面采用FreeMarker。在视图选择时，先找ftl下的视图，再寻找Jsp下的视图。  

6、富文本编辑器ckeditor的使用；
==
使用起来非常简单；  
1）引入jquery和ckeditor.js;  
2)在页面上添加 textarea,设置好元素id,在第三步初始化中要用到；  
3)在页面加载完成的js中进行初始化即可，注意其配置文件config.js； 
4）提交时使用表单，作为实体字段进行提交。  参考：'bxs-manager-web/src/main/webapp/WEB-INF/jsp/article/add.jsp'  







0、常见问题记录；
==
1、406 Not Acceptable ，访问/user/list时出现该错误，检查发现正常引用了Json的相关包,但是仍然出现改错误，后发现spring-mvc.xml中没有配置 <mvc:annotation-driven /> ,添加该配置后，正常返回json数据；  
2、数据库中设计，对于大段文字采用何总类型的字段进行存储。在orcle中使用clob进行存储，在mysql中使用Txt进行存储。注：BLOB和CLOB都是大字段类型，BLOB是按二进制来存储的，而CLOB是可以直接存储文字的。其实两个是可以互换的的，或者可以直接用LOB字段代替这两个。但是为了更好的管理ORACLE数据库，通常像图片、文件、音乐等信息就用BLOB字段来存储，先将文件转为二进制再存储进去。而像文章或者是较长的文字，就用CLOB存储，这样对以后的查询更新存储等操作都提供很大的方便。  


3、MySQL 错误： Packet for query is too large (6391 > 1024)  
解决方式：在mysql的命令行设置：  
登录命令行：
mysql -u root -p  
set global max_allowed_packet = 20*1024*1024; 
重启Mysql服务：  
service mysql stop;    
serivce mysql start;  


# 几个值得一看的页面
## 1）http://localhost:2468/bxs-manager-web/stk/index  基于metronic-4.7的后台管理页面
## 2）http://localhost:2468/bxs-manager-web/index  后台管理登录页
## 3）http://localhost:2468/bxs-manager-web/stk/icalendar 记上一笔
## 4）http://localhost:2468/bxs-manager-web/stk/peach 树与标签
## 5）http://localhost:2468/bxs-manager-web/fan/index  爱好者内容发布页
## 6）http://localhost:2468/bxs-manager-web/portal/index 传统网站主页面
## 7）http://localhost:2468/bxs-manager-web/sois/login 信息报送登录页
## 8）http://localhost:2468/bxs-manager-web/sois/doLogin 会员系统主页面（基于easyui的会员系统）
## 9）http://localhost:2468/bxs-manager-web/sois/index 会员系统页面（基于LayUI的会员系统）










