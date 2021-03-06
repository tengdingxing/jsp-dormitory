<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员登录-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="./static/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./static/css/font.css">
    <link rel="stylesheet" href="./static/css/weadmin.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>

</head>

<body class="login-bg">

<div class="login">
    <div class="message">基于JSP的学生宿舍管理系统</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form" action="">
        <input name="username" placeholder="用户名" type="text" lay-verify="required" class="layui-input">
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码" type="password" class="layui-input">
        <hr class="hr15">
        <input class="loginin" value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20">
        <div>

        </div>
    </form>
</div>

<!--<script type="text/javascript">

  // layui.extend({
  //   admin: '{/}./static/js/admin'
  // });
  layui.config({
              base: './static/js/'
              ,version: '101100'
          }).extend({ //设定模块别名
      admin: 'admin'
      ,http: 'http'
          });
  layui.use(['form', 'admin', 'http'], function () {
    var form = layui.form
      , admin = layui.admin
      , http = layui.http;
    //监听提交
    form.on('submit(login)', function (data) {
      // alert(888)
      http.login(data.field)
      return false;
    });
  });
</script>-->
<!-- 底部结束 -->
</body>

</html>
