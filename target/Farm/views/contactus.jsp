
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>联系我们</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript"
            src="${APP_PATH}/js/jquery-3.3.1.js"></script>
    <link
            href="${APP_PATH}/css/font.css"
            rel="stylesheet">
    <script
            src="${APP_PATH}/js/bootstrap.min.js"></script>
    <script src="../js/sign.js"></script>
</head>
<body style="background-image:url(../agro/UIpic/managementbackground.jpg);background-repeat:no-repeat;background-attachment:fixed;background-size: 100%">
<div class="col-md-9">
    <div class="col-md-12 col-md-offset-4" style="margin-top:25px; margin-bottom:20px">
        <img src="../agro/UIpic/agro.png" style="height:50px">
    </div>
    <div class="col-md-8 col-md-offset-4" style="background-color:rgba(80,77,77,0.9);height:100%;color:#FFFFFF">
        <div class="row" style="height:50px">
            <div class="col-md-3" style="margin-top:10px;text-align:center;font-size:20px">联系我们</div>
        </div>
        <div style="font-size:20px"><br>农场信息管理系统<br><br>泰山学院 2016级 信息科学技术学院<br><br>作者：<br>袁梦<br><br>项目开源地址：<br><a
                href="https://github.com/Eternity-Myth/Farm" style="color:#ffffff">https://github.com/Eternity-Myth/Farm</a> <br><br>邮箱：1345440683@QQ.com<br><br>TEL：18253800317<br><br>
        </div>
    </div>
</div>
</body>
</html>
