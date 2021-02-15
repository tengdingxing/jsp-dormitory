<%@ page import="com.msq.entity.Major" %>
<%@ page import="com.msq.service.MajorService" %>
<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html class="x-admin-sm" lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>基于jsp的宿舍管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="./static/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./static/css/font.css">

    <link rel="stylesheet" href="./static/css/weadmin.css">

   <script src="./lib/layui/layui.js" type="text/javascript"></script>
     <script src="./static/js/admin.js" type="text/javascript"></script>
    <script src="./static/js/eleDel.js" type="text/javascript"></script>


    <%--引入jq--%>
    <script type="text/javascript" src="./js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">


    </script>




</head>
<body class="index">
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="">基于jsp学生宿舍管理系统</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>

    <ul class="layui-nav right" lay-filter="">

        <li class="layui-nav-item">
            <a href="javascript:;" id="userName"><label>${sessionScope.login}</label></a>
        </li>

    </ul>


</div>

<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="/index" onclick="xadmin.add_tab('订单已支付报表','echartsAll.html')">
                    <i  lay-tips="首页">&#xe68e;</i>
                    <cite>首页</cite></a>
            </li>

            <li>
                <a href="/goBedList">
                    <i  lay-tips="首页">&#xe68e;</i>
                    <cite>床位管理</cite></a>
            </li>

            <li>
                <a href="/goRoomList">
                    <i  lay-tips="首页">&#xe68e;</i>
                    <cite>权限管理</cite></a>
            </li>

            <li>
                <a href="/goRoomList">
                    <i  lay-tips="首页">&#xe68e;</i>
                    <cite>宿舍管理</cite></a>
            </li>




            <li class="layui-nav-item">
                <a href="/studentList">
                    <i  lay-tips="订单管理">&#xe63b;</i>
                    <cite>学生管理</cite>
                </a>
            </li>


            <li class="layui-nav-item">
                <a href="/echarts6">
                    <i  lay-tips="订单管理">&#xe63b;</i>
                    <cite>床位统计</cite>
                </a>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i  lay-tips="订单管理">&#xe63b;</i>
                    <cite>审批</cite>
                </a>
            </li>

        </ul>
    </div>
</div>

<div class="page-content">



    <div class="weadmin-body">
        <div class="layui-row">
          <%--  <form class="layui-form layui-col-md12 we-search" action="/findStudentByNumber" method="get">
                姓名搜索：
                <div class="layui-inline">
                    <input type="text" name="number" placeholder="请输入学号" autocomplete="off" class="layui-input" />
                </div>

                <button class="layui-btn" lay-submit="" lay-filter="sreach">
                   搜索
                </button>
            </form>--%>
            <span>（备注 ：审批允许修改专业、班级、宿舍、床位）</span>
        </div>

        <h1 style="color: #FF5722">${msg}</h1>

        <div class="weadmin-block">
            <%--<button class="layui-btn layui-btn-danger" onclick="delAll()">
                <i class="layui-icon layui-icon-delete"></i>删除
            </button>--%>
         <%--   <button class="layui-btn" onclick="WeAdminShow('添加学生','/add',600,400)">添加
            </button>--%>
            <span class="fr" style="line-height:40px">共有数据：${fn:length(shenPiList)}  条</span>
        </div>
        <table class="layui-table" id="memberList">
            <thead>

            <tr>
                <%--<th>
                    <div class="layui-unselect header layui-form-checkbox" lay-skin="primary">
                        <i class="layui-icon layui-icon-ok"></i>
                    </div>
                </th>--%>
                <th>学号</th>
                <th>姓名</th>
                <th>专业</th>
                <th>班级</th>
                <th>宿舍号</th>
                <th>床号</th>
                    <th>状态</th>
                <th>申请理由</th>
                <th>操作</th>
            </tr>

            </thead>
            <tbody>
           <c:forEach items="${shenPiList}" var="sp" >
            <tr data-id="1" >
              <%--  <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="1">
                        <i class="layui-icon layui-icon-ok"></i>
                    </div>
                </td>--%>
                <td>${sp.number}</td>
                <td>${sp.name}</td>
                <td>${sp.majorname}</td>
                <td>${sp.classname}</td>
                <td>${sp.roomname}</td>
                <td>${sp.bedname}</td>
                <td>${sp.flag eq 0?"未处理":"已处理"}</td>
                  <td>${sp.reason}</td>

                <td class="td-manage">
                    <%--<a onclick="member_stop(this,'10001')" href="javascript:;" title="审批"><span style="font-weight:bolder;color: #0000FF">发起审批</span>

                    </a>--%>

                    <a title="同意"  href="/confirm?number=${sp.number}&&sid=${sp.sid}">
                        <span style="font-weight:bolder;color: #0000FF">批准</span>
                    </a>
                    <a title="删除"  href="/deleteSp?number=${sp.number}&&sid=${sp.sid}">
                            <span style="font-weight:bolder;color: #0000FF">不批准</span>
                    </a>
                </td>
            </tr>
           </c:forEach>

            </tbody>
        </table>
        <div class="page">
            <div >
                <a class="current" href="">&lt;&lt;</a>
                <a class="current" href="">1</a>
                <span class="current" >2</span>
                <a class="num" href="">3</a>
                <a class="num" href="">489</a> <a class="next" href="">&gt;&gt;</a>
            </div>
        </div>
    </div>


    <%--<div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>首页
            </li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='echartsAll.html' width="100%" frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>--%>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->

</body>


</html>

