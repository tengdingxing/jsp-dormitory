<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<!doctype html>
<html class="x-admin-sm" lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" content="no-cache">
    <title>基于jsp的宿舍管理系统</title>
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
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="">基于jsp学生宿舍管理系统</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>

    <ul class="layui-nav right" lay-filter="">

        <li class="layui-nav-item">
            <a href="javascript:;" id="userName"><label>${username}</label></a>
        </li>

        <li class="layui-nav-item">
            <a href="/logout" >退出</a>
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
                <a href="/goShenPi">
                    <i  lay-tips="订单管理">&#xe63b;</i>
                    <cite>审批</cite>
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
    <!-- 条目中可以是任意内容，如：<img src=""> -->


    <script>
        layui.use('carousel', function(){
            var carousel = layui.carousel;
            //建造实例
            carousel.render({
                elem: '#test1'
                ,width: '100%' //设置容器宽度
                ,arrow: 'always' //始终显示箭头
                //,anim: 'updown' //切换动画方式
            });
        });
    </script>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->

</body>
<script src="js/jquery.min.js"></script>

</html>

