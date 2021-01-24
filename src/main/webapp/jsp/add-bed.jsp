<%@ page import="com.msq.entity.Major" %>
<%@ page import="com.msq.service.MajorService" %>
<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>添加床位</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport"
    content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="./static/css/font.css">
  <link rel="stylesheet" href="./static/css/weadmin.css">
</head>

<body>

  <div class="weadmin-body">
    <form class="layui-form" action="/addBed" accept-charset="UTF-8" method="post">

      <div class="layui-form-item">
        <label class="layui-form-label">宿舍名</label>
        <div class="layui-input-block">
          <input type="text" name="roomname" required  lay-verify="required"  autocomplete="off" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">床位名</label>
        <div class="layui-input-block">
          <input type="text" name="bedname" required  lay-verify="required"  autocomplete="off" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      </div>
    </form>

    <h1><span style="color: red">${msg}</span></h1>

    <script>
      //Demo
      layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
          layer.msg(JSON.stringify(data.field));
          return false;
        });
      });
    </script>
  </div>
  <script src="./lib/layui/layui.js" type="text/javascript"></script>
  <script src="./pages/admin/add.js" type="text/javascript"></script>

</body>

</html>