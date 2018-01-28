1、引入 com.baidu.ueditor 源码包
2、修改ConfigManager.java中的getConfigPath方法
private String getConfigPath () {
	//return this.parentPath + File.separator + ConfigManager.configFileName;
	//此处需要修改
	return this.rootPath + File.separator + "conf"+ File.separator + ConfigManager.configFileName;
}
此外：config.json 的放置位置为src/main/webapp/conf/config.json 

3、修改ueditor.config.js 中配置项
//, serverUrl: URL + "jsp/controller.jsp"
修改为：
 , serverUrl: ctx + "/ueditor/config"

4、修改文件存储的地方
com.baidu.ueditor.upload.BinaryUploader.java

String physicalPath = (String) conf.get("rootPath") + savePath;
//此处做了修改,将文件保存路径设置为当前盘符的media-data下
physicalPath=savePath;

5、在config.json中调整图片、视频、文件的上传路径
"imagePathFormat": "/media-data/ueditor/image/{yyyy}{mm}{dd}/{time}{rand:6}", 
"videoPathFormat": "/media-data/ueditor/video/{yyyy}{mm}{dd}/{time}{rand:6}", 
"filePathFormat": "/media-data/ueditor/file/{yyyy}{mm}{dd}/{time}{rand:6}", 

6、采用服务器虚拟路径的方式访问上传的文件
1)在pom.xml中的jetty配置项中添加：
<contextHandlers>
	<contextHandler implementation="org.eclipse.jetty.webapp.WebAppContext">
		<contextPath>/media-data</contextPath>
		<resourceBase>/media-data</resourceBase>
	</contextHandler>
</contextHandlers>
2)在tomcat的server.xml中添加：
<Context docBase="C:\media-data" path="/media-data" reloadable="true" />
如果是linux服务器，则路径需要调整为：
<Context docBase="/media-data" path="/media-data" reloadable="true" /> 

7、配置springmvc的文件上传处理器后
<bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
		<property name="maxUploadSize" value="104857600" />
		<property name="maxInMemorySize" value="4096" />
</bean>

出现错误了"未找到上传数据" 错误
原因：SpringMVC封装了conmmons-fileupload的相关方法后，获取不了上传数据
解决方式：对BinaryUploader.java 进行了修改，解决了问题。

8、修复打开上传图片空间较慢的问题
1）针对单图片上传， 将/ueditor/ueditor.all.js or /ueditor.all.min.js (根据自己引用的文件来确定) 文件下的以下代码
accept="image/*"
改为：
accept="image/gif,image/jpeg,image/png,image/jpg,image/bmp"
2）针对多图片上传， 将/ueditor/dialogs/image/image.js 文件下的以下代码
accept: {
                    title: 'Images',
                    extensions: acceptExtensions,
                    mimeTypes: 'image/*'
                },
改为：
accept: {
                    title: 'Images',
                    extensions: acceptExtensions,
                    mimeTypes: 'image/gif,image/jpeg,image/png,image/jpg,image/bmp'
          },



