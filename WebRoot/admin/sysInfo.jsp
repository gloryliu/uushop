<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>显示系统信息</title>
<script type="text/javascript" src="../js/jquery-1.8.3.js" ></script>
<link  rel="stylesheet" href="../css/global.css" />
<link  rel="stylesheet" href="../css/controlContent.css" />


</head>

<body>
<div id="showGoods">

<div class="box">
    <!-- Box Head -->
    <div class="box-head">
        <h2 class="left">系统信息</h2>
    </div>
    <!-- End Box Head -->	

    <!-- Table -->
    <div class="table">
        <table width="100%" border="0" cellspacing="10" cellpadding="10" style="font-size: 14px; padding: 10px;">
            <tr>
                <td>操作系统</td>
                <td>${infoBean.osName}&nbsp;${hostInfo.systemPlatform }</td>
                <td>CPU使用率</td>
                <td>&nbsp;${infoBean.cpuRatio}</td>
            </tr>
            <tr>
              <td>最大可使用内存</td>
              <td>&nbsp;${infoBean.maxMemory}</td>
              <td>占用内存大小</td>
              <td>&nbsp;${infoBean.totalMemory}</td>
            </tr>
            <tr>
              <td>剩余内存</td>
              <td>&nbsp;${infoBean.freeMemory}</td>
              <td>总的物理内存大小</td>
              <td>&nbsp;${infoBean.totalMemorySize}</td>
            </tr>
            <tr>
              <td>剩余物理内存大小</td>
              <td>&nbsp;${infoBean.freePhysicalMemorySize}</td>
              <td>已使用的物理内存</td>
              <td>&nbsp;${infoBean.usedMemory}</td>
            </tr>
            <tr>
              <td>线程总数</td>
              <td>&nbsp;${infoBean.totalThread}</td>
              <td>用户工作目录</td>
              <td>&nbsp;${hostInfo.workPath }</td>
            </tr>
            <tr>
              <td>服务器地址</td>
              <td>&nbsp;${hostInfo.hostPath }</td>
              <td>服务器端口</td>
              <td>&nbsp;${hostInfo.hostPort }</td>
            </tr>
            <tr>
              <td>Java版本</td>
              <td>&nbsp;${hostInfo.javaEdition }</td>
              <td>Java安装路径</td>
              <td>&nbsp;${hostInfo.javaPath }</td>
            </tr>
            <tr>
              <td>项目路径</td>
              <td>&nbsp;${hostInfo.realPath }</td>
              <td>项目名称</td>
              <td>&nbsp;${hostInfo.appName }</td>
            </tr>
        </table>      
    </div>
    <!-- Table -->
    
</div>

</div>
</body>
</html>
