<%@ page import="com.msq.entity.Major" %>
<%@ page import="com.msq.service.MajorService" %>
<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html class="x-admin-sm" lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>����jsp���������ϵͳ</title>
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


    <%--����jq--%>
    <script type="text/javascript" src="./js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">


    </script>




</head>
<body class="index">
<!-- ������ʼ -->
<div class="container">
    <div class="logo">
        <a href="">����jspѧ���������ϵͳ</a></div>
    <div class="left_open">
        <a><i title="չ�������" class="iconfont">&#xe699;</i></a>
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
                <a href="/index" onclick="xadmin.add_tab('������֧������','echartsAll.html')">
                    <i  lay-tips="��ҳ">&#xe68e;</i>
                    <cite>��ҳ</cite></a>
            </li>

            <li>
                <a href="/goBedList">
                    <i  lay-tips="��ҳ">&#xe68e;</i>
                    <cite>��λ����</cite></a>
            </li>

            <li>
                <a href="/goRoomList">
                    <i  lay-tips="��ҳ">&#xe68e;</i>
                    <cite>Ȩ�޹���</cite></a>
            </li>

            <li>
                <a href="/goRoomList">
                    <i  lay-tips="��ҳ">&#xe68e;</i>
                    <cite>�������</cite></a>
            </li>




            <li class="layui-nav-item">
                <a href="/studentList">
                    <i  lay-tips="��������">&#xe63b;</i>
                    <cite>ѧ������</cite>
                </a>
            </li>


            <li class="layui-nav-item">
                <a href="/echarts6">
                    <i  lay-tips="��������">&#xe63b;</i>
                    <cite>��λͳ��</cite>
                </a>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i  lay-tips="��������">&#xe63b;</i>
                    <cite>����</cite>
                </a>
            </li>

        </ul>
    </div>
</div>

<div class="page-content">



    <div class="weadmin-body">
        <div class="layui-row">
            <form class="layui-form layui-col-md12 we-search" method="get" action="/findBedsByName" accept-charset="UTF-8">
                ������������λ��Ϣ��
                <div class="layui-inline">
                    <input type="text" name="roomname" placeholder="����ţ���5B604" autocomplete="off" class="layui-input" />
                </div>
                <button class="layui-btn" lay-submit="" lay-filter="sreach">
                    <i ></i>����
                </button>
            </form>
        </div>
        <div class="weadmin-block">
            <%--<button class="layui-btn layui-btn-danger" onclick="delAll()">
                <i class="layui-icon layui-icon-delete"></i>ɾ��
            </button>--%>
            <button class="layui-btn" onclick="WeAdminShow('����ѧ��','/goAddBed',600,400)">
                <i ></i>����
            </button>
            <span class="fr" style="line-height:40px">�������ݣ�${fn:length(beds)}  ��</span>
        </div>
        <table class="layui-table" id="memberList">
            <thead>

            <tr>
                <%--<th>
                    <div class="layui-unselect header layui-form-checkbox" lay-skin="primary">
                        <i class="layui-icon layui-icon-ok"></i>
                    </div>
                </th>--%>
                <th>ID</th>
                <th>����</th>
                <th>�����</th>
                <th>״̬</th>
                <th>����</th>
            </tr>

            </thead>
            <tbody>
           <c:forEach items="${beds}" var="bed" >
            <tr data-id="1" >
              <%--  <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="1">
                        <i class="layui-icon layui-icon-ok"></i>
                    </div>
                </td>--%>
                <td>${bed.id}</td>
                <td>${bed.name}</td>
                <td>${bed.roomname}</td>
                <td>${bed.flag eq 0 ?"����":"������"}</td>

                <td class="td-manage">
                    <%--<a onclick="member_stop(this,'10001')" href="javascript:;" title="����">
                        ����
                    </a>--%>
                   <%-- <a title="����" onclick="WeAdminEdit('����','./edit.html', 1, 600, 400)" href="javascript:;">
                        <i class="layui-icon layui-icon-edit"></i>
                    </a>--%>
                    <a  title="�޸�" onclick="WeAdminShow('�޸Ĵ�λ״̬','/goUpdateBed?id=${bed.id}',600,400)" >
                        <span style="color: #0000FF; font-weight: bolder" >�޸�</span>
                    </a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a title="ɾ��" onclick="member_del(this,'Ҫɾ����id')" href="/deleteBed/${bed.id}" >
                        <span style="color: #0000FF; font-weight: bolder" >ɾ��</span>
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
                <i class="layui-icon">&#xe68e;</i>��ҳ
            </li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">�رյ�ǰ</dd>
                <dd data-type="other">�ر�����</dd>
                <dd data-type="all">�ر�ȫ��</dd>
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
<!-- �Ҳ�������� -->
<!-- �в����� -->

</body>


</html>
