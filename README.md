# uushop

JavaWeb实现的优优图书商城

---
主要功能介绍：
> * 用户注册、登录、个人信息管理、通过邮件找回密码
> * 图书搜索、购买、在线浏览，购物车管理
> * 后台echart图表显示、源代码在线编辑

主要技术：
> * 数据库　: `mysql`
> * 后台语言: `Java`
> * 后台框架: `Hibernate` `Spring` `JPA` `Compass`
> * 前台插件: `jquery` `kindeditor` `echart`

使用方式：
> * 在eclipse中新建名称为uushop的web project
> * 拷贝src和WebRoot目录下的文件分别覆盖对应的文件夹
> * 在mysql中建立名为uushop的数据库，导入目录下的uushop.sql
> * 修改src/META-INF/persistence.xml中的数据库连接信息
> * 所需要的JAR包在 [我的网盘][1]

修改src\com\liaoyu\utils\EmailSender.java文件中的邮件配置信息
```java
return new PasswordAuthentication("test@163.com","test");   //登录用户名/密码
mimeMessage.setFrom(new InternetAddress("test@163.com"));   //发件人邮件
```
修改src\beans.xml文件中的关于compass搜索缓存目录地址，该文件也在源代码目录下
```xml
<prop key="compass.engine.connection">file://d:/compass_index</prop>
```
---
#### 下面贴出一些系统截图供参考
##### 1. 注册
![image-list](http://images.cnitblog.com/i/477737/201407/312131237127226.png)
##### 2. 首页
![image-list](http://images.cnitblog.com/i/477737/201407/312132460409307.png)
##### 3. 个人信息
![image-list](http://images.cnitblog.com/i/477737/201407/312134022741152.png)
##### 4. 图书搜索
![image-list](http://images.cnitblog.com/i/477737/201407/312134496965231.png)
##### 5. 图表图示
![image-list](http://images.cnitblog.com/i/477737/201407/312135476333030.png)
##### 6. 源代码编辑
![image-list](http://images.cnitblog.com/i/477737/201407/312136509158396.png)




  [1]: http://pan.baidu.com/s/1o6lwvEy