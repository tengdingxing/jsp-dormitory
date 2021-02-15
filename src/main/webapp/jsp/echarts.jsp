<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>统计图表-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport"
    content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="stylesheet" href="./static/css/font.css">
  <link rel="stylesheet" href="./static/css/weadmin.css">
  <script src="js/echarts.min.js" type="text/javascript"></script>
  <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
</head>

<body>

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

  </ul>


</div>

<div class="left-nav">
  <div id="side-nav">
    <ul id="nav">
      <li>
        <a href="javascript:;" onclick="xadmin.add_tab('订单已支付报表','echartsAll.html')">
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
  <div id="main" style="width: 600px;height:400px;"></div>
  <script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例

    var chartDom = document.getElementById('main');
    var myChart = echarts.init(chartDom);
    var option;

    option = {
      tooltip: {
        trigger: 'item'
      },
      legend: {
        top: '5%',
        left: 'center'
      },
      series: [
        {
          name: '访问来源',
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          itemStyle: {
            borderRadius: 10,
            borderColor: '#fff',
            borderWidth: 2
          },
          label: {
            show: false,
            position: 'center'
          },
          emphasis: {
            label: {
              show: true,
              fontSize: '40',
              fontWeight: 'bold'
            }
          },
          labelLine: {
            show: false
          },
          data: [
            {value: 1048, name: '搜索引擎'},
            {value: 735, name: '直接访问'},
            {value: 580, name: '邮件营销'},
            {value: 484, name: '联盟广告'},
            {value: 300, name: '视频广告'},
            {value: 300, name: '视频广告'}

          ]
        }
      ]
    };

    option && myChart.setOption(option);
  </script>
</div>
</body>

</html>