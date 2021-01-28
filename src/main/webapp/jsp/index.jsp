<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<!doctype html>
<html class="x-admin-sm" lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" content="no-cache">
    <title>����jsp���������ϵͳ</title>
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
            <a href="javascript:;" id="userName"><label>${username}</label></a>
        </li>

        <li class="layui-nav-item">
            <a href="/logout" >�˳�</a>
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
                <a href="/goShenPi">
                    <i  lay-tips="��������">&#xe63b;</i>
                    <cite>����</cite>
                  </a>
            </li>

        </ul>
    </div>
</div>

<div class="page-content">
    <div class="layui-carousel" id="test1">
        <div carousel-item>
            <div><center><img src="nav.png"></center></div>
            <div><center><img src="nav.png"></center></div>
            <div><center><img src="nav.png"></center></div>
            <div><center><img src="nav.png"></center></div>
            <div><center><img src="nav.png"></center></div>
        </div>
    </div>
    <!-- ��Ŀ�п������������ݣ��磺<img src=""> -->


    <script>
        layui.use('carousel', function(){
            var carousel = layui.carousel;
            //����ʵ��
            carousel.render({
                elem: '#test1'
                ,width: '100%' //�����������
                ,arrow: 'always' //ʼ����ʾ��ͷ
                //,anim: 'updown' //�л�������ʽ
            });
        });
    </script>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- �Ҳ�������� -->
<!-- �в����� -->

</body>
<script src="js/jquery.min.js"></script>

</html>

