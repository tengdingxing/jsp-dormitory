<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>基于jsp的宿舍管理系统</title>
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="shortcut icon" href="./static/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="../../resources/static/static/css/font.css">
  <link rel="stylesheet" href="../../resources/static/static/css/weadmin.css">
  <script src="../../resources/static/lib/layui/layui.js" charset="utf-8"></script>
</head>

<body>



<div class="left-nav">
  <div id="side-nav">
    <ul id="nav">
      <li>
        <a href="javascript:;" onclick="xadmin.add_tab('订单已支付报表','echartsAll.html')">
          <i class="layui-icon left-nav-li" lay-tips="首页">&#xe68e;</i>
          <cite>首页</cite></a>
      </li>

      <li>
        <a href="/testpermission">
          <i class="layui-icon left-nav-li" lay-tips="首页">&#xe68e;</i>
          <cite>床位管理</cite></a>
      </li>

      <li>
        <a href="/testpermission">
          <i class="layui-icon left-nav-li" lay-tips="首页">&#xe68e;</i>
          <cite>权限管理</cite></a>
      </li>



      <li class="layui-nav-item">
        <a href="/studentList">
          <i class="layui-icon left-nav-li" lay-tips="订单管理">&#xe63b;</i>
          <cite>学生管理</cite>
          <i class="iconfont nav_right">&#xe697;</i></a>
      </li>


      <li class="layui-nav-item">
        <a href="javascript:;">
          <i class="layui-icon left-nav-li" lay-tips="订单管理">&#xe63b;</i>
          <cite>床位统计</cite>
          <i class="iconfont nav_right">&#xe697;</i></a>
      </li>

      <li class="layui-nav-item">
        <a href="javascript:;">
          <i class="layui-icon left-nav-li" lay-tips="订单管理">&#xe63b;</i>
          <cite>审批</cite>
          <i class="iconfont nav_right">&#xe697;</i></a>
      </li>

    </ul>
  </div>
</div>




  <div class="weadmin-body">
    <div class="layui-row">
      <form class="layui-form layui-col-md12 we-search">
        会员搜索：
        <div class="layui-inline">
          <input class="layui-input" placeholder="开始日" name="start" id="start" />
        </div>
        <div class="layui-inline">
          <input class="layui-input" placeholder="截止日" name="end" id="end" />
        </div>
        <div class="layui-inline">
          <input type="text" name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input" />
        </div>
        <button class="layui-btn" lay-submit="" lay-filter="sreach">
          <i class="layui-icon layui-icon-search"></i>
        </button>
      </form>
    </div>
    <div class="weadmin-block">
      <button class="layui-btn layui-btn-danger" onclick="delAll()">
        <i class="layui-icon layui-icon-delete"></i>批量删除
      </button>
      <button class="layui-btn" onclick="WeAdminShow('添加用户','./add.html',600,400)">
        <i class="layui-icon layui-icon-add-circle-fine"></i>添加
      </button>
      <span class="fr" style="line-height:40px">共有数据：88 条</span>
    </div>
    <table class="layui-table" id="memberList">
      <thead>
        <tr>
          <th>
            <div class="layui-unselect header layui-form-checkbox" lay-skin="primary">
              <i class="layui-icon layui-icon-ok"></i>
            </div>
          </th>
          <th>ID</th>
          <th>用户名</th>
          <th>性别</th>
          <th>手机</th>
          <th>邮箱</th>
          <th>地址</th>
          <th>加入时间</th>
          <th>状态</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
        <tr data-id="1">
          <td>
            <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="1">
              <i class="layui-icon layui-icon-ok"></i>
            </div>
          </td>
          <td>1</td>
          <td>小张</td>
          <td>男</td>
          <td>17600000000</td>
          <td>admin@mail.com</td>
          <td>北京市 海淀区</td>
          <td>2017-01-01 11:11:42</td>
          <td class="td-status">
            <span class="layui-btn layui-btn-normal layui-btn-xs">已启用</span>
          </td>
          <td class="td-manage">
            <a onclick="member_stop(this,'10001')" href="javascript:;" title="启用">
              <i class="layui-icon layui-icon-download-circle"></i>
            </a>
            <a title="编辑" onclick="WeAdminEdit('编辑','./edit.html', 1, 600, 400)" href="javascript:;">
              <i class="layui-icon layui-icon-edit"></i>
            </a>
            <a onclick="WeAdminShow('修改密码','./password.html',600,400)" title="修改密码" href="javascript:;">
              <i class="layui-icon layui-icon-util"></i>
            </a>
            <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
              <i class="layui-icon layui-icon-delete"></i>
            </a>
          </td>
        </tr>
        <tr data-id="2">
          <td>
            <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="2">
              <i class="layui-icon layui-icon-ok"></i>
            </div>
          </td>
          <td>2</td>
          <td>小明</td>
          <td>女</td>
          <td>13000000000</td>
          <td>admin@mail.com</td>
          <td>北京市 海淀区</td>
          <td>2017-01-01 11:11:42</td>
          <td class="td-status">
            <span class="layui-btn layui-btn-normal layui-btn-xs">已启用</span>
          </td>
          <td class="td-manage">
            <a onclick="member_stop(this,'10001')" href="javascript:;" title="启用">
              <i class="layui-icon layui-icon-download-circle"></i>
            </a>
            <a title="编辑" onclick="WeAdminEdit('编辑','./edit.html', 2, 600, 400)" href="javascript:;">
              <i class="layui-icon layui-icon-edit"></i>
            </a>
            <a onclick="WeAdminShow('修改密码','./password.html',600,400)" title="修改密码" href="javascript:;">
              <i class="layui-icon layui-icon-util"></i>
            </a>
            <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
              <i class="layui-icon layui-icon-delete"></i>
            </a>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="page">
      <div>
        <a class="prev" href="">&lt;&lt;</a> <a class="num" href="">1</a>
        <span class="current">2</span> <a class="num" href="">3</a>
        <a class="num" href="">489</a> <a class="next" href="">&gt;&gt;</a>
      </div>
    </div>
  </div>
  <script src="../../resources/static/lib/layui/layui.js" type="text/javascript"></script>
  <script src="../../resources/static/static/js/eleDel.js" type="text/javascript"></script>
</body>

</html>