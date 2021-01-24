<%@ page import="com.msq.entity.Major" %>
<%@ page import="com.msq.service.MajorService" %>
<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>添加学生</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport"
    content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="./static/css/font.css">
  <link rel="stylesheet" href="./static/css/weadmin.css">
</head>

<body>
<h1><span style="color: red">${msg}</span></h1>
  <div class="weadmin-body">
    <form class="layui-form" action="/addStudent" accept-charset="UTF-8">

      <div class="layui-form-item">
        <label class="layui-form-label">学号</label>
        <div class="layui-input-block">
          <input type="text" name="snumber" required  lay-verify="required" placeholder="请输入学号" autocomplete="off" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
          <input type="text" name="name" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
          <input type="radio" name="sex" value="男" title="男">
          <input type="radio" name="sex" value="女" title="女" checked>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">专业</label>
        <div class="layui-input-block">

          <select id="majorselectclass" name="major" lay-verify="required"  >
            <c:forEach items="${majors}" var="m">
            <option value="${m.majorid}">${m.majorname}</option>

<%--            <option value="0"></option>--%>
<%--            <option value="1">上海</option>--%>
<%--            <option value="2">广州</option>--%>
<%--            <option value="3">深圳</option>--%>
<%--            <option value="4">杭州</option>--%>
            </c:forEach>
          </select>


        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">班级</label>
        <div class="layui-input-block">
          <select name="class" lay-verify="required">

            <c:forEach items="${classes}" var="cs">
            <option value="${cs.id}">${cs.classname}</option>
           <%-- <option value="1">上海</option>
            <option value="2">广州</option>
            <option value="3">深圳</option>
            <option value="4">杭州</option>--%>
            </c:forEach>
          </select>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">宿舍</label>
        <div class="layui-input-block">
          <input type="text" name="room" required  lay-verify="required" placeholder="请输入宿舍号" autocomplete="off" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">床号</label>
        <div class="layui-input-block">
          <select name="bedname" lay-verify="required">
            <option value=""></option>
            <option value="A上">A上</option>
            <option value="A下">A下</option>
            <option value="B上">B上</option>
            <option value="B下">B下</option>
            <option value="C上">C上</option>
            <option value="C下">C下</option>
          </select>
        </div>
      </div>


      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      </div>
    </form>


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