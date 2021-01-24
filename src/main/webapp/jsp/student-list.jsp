<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>����jsp���������ϵͳ</title>
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
        <a href="javascript:;" onclick="xadmin.add_tab('������֧������','echartsAll.html')">
          <i class="layui-icon left-nav-li" lay-tips="��ҳ">&#xe68e;</i>
          <cite>��ҳ</cite></a>
      </li>

      <li>
        <a href="/testpermission">
          <i class="layui-icon left-nav-li" lay-tips="��ҳ">&#xe68e;</i>
          <cite>��λ����</cite></a>
      </li>

      <li>
        <a href="/testpermission">
          <i class="layui-icon left-nav-li" lay-tips="��ҳ">&#xe68e;</i>
          <cite>Ȩ�޹���</cite></a>
      </li>



      <li class="layui-nav-item">
        <a href="/studentList">
          <i class="layui-icon left-nav-li" lay-tips="��������">&#xe63b;</i>
          <cite>ѧ������</cite>
          <i class="iconfont nav_right">&#xe697;</i></a>
      </li>


      <li class="layui-nav-item">
        <a href="javascript:;">
          <i class="layui-icon left-nav-li" lay-tips="��������">&#xe63b;</i>
          <cite>��λͳ��</cite>
          <i class="iconfont nav_right">&#xe697;</i></a>
      </li>

      <li class="layui-nav-item">
        <a href="javascript:;">
          <i class="layui-icon left-nav-li" lay-tips="��������">&#xe63b;</i>
          <cite>����</cite>
          <i class="iconfont nav_right">&#xe697;</i></a>
      </li>

    </ul>
  </div>
</div>




  <div class="weadmin-body">
    <div class="layui-row">
      <form class="layui-form layui-col-md12 we-search">
        ��Ա������
        <div class="layui-inline">
          <input class="layui-input" placeholder="��ʼ��" name="start" id="start" />
        </div>
        <div class="layui-inline">
          <input class="layui-input" placeholder="��ֹ��" name="end" id="end" />
        </div>
        <div class="layui-inline">
          <input type="text" name="username" placeholder="�������û���" autocomplete="off" class="layui-input" />
        </div>
        <button class="layui-btn" lay-submit="" lay-filter="sreach">
          <i class="layui-icon layui-icon-search"></i>
        </button>
      </form>
    </div>
    <div class="weadmin-block">
      <button class="layui-btn layui-btn-danger" onclick="delAll()">
        <i class="layui-icon layui-icon-delete"></i>����ɾ��
      </button>
      <button class="layui-btn" onclick="WeAdminShow('����û�','./add.html',600,400)">
        <i class="layui-icon layui-icon-add-circle-fine"></i>���
      </button>
      <span class="fr" style="line-height:40px">�������ݣ�88 ��</span>
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
          <th>�û���</th>
          <th>�Ա�</th>
          <th>�ֻ�</th>
          <th>����</th>
          <th>��ַ</th>
          <th>����ʱ��</th>
          <th>״̬</th>
          <th>����</th>
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
          <td>С��</td>
          <td>��</td>
          <td>17600000000</td>
          <td>admin@mail.com</td>
          <td>������ ������</td>
          <td>2017-01-01 11:11:42</td>
          <td class="td-status">
            <span class="layui-btn layui-btn-normal layui-btn-xs">������</span>
          </td>
          <td class="td-manage">
            <a onclick="member_stop(this,'10001')" href="javascript:;" title="����">
              <i class="layui-icon layui-icon-download-circle"></i>
            </a>
            <a title="�༭" onclick="WeAdminEdit('�༭','./edit.html', 1, 600, 400)" href="javascript:;">
              <i class="layui-icon layui-icon-edit"></i>
            </a>
            <a onclick="WeAdminShow('�޸�����','./password.html',600,400)" title="�޸�����" href="javascript:;">
              <i class="layui-icon layui-icon-util"></i>
            </a>
            <a title="ɾ��" onclick="member_del(this,'Ҫɾ����id')" href="javascript:;">
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
          <td>С��</td>
          <td>Ů</td>
          <td>13000000000</td>
          <td>admin@mail.com</td>
          <td>������ ������</td>
          <td>2017-01-01 11:11:42</td>
          <td class="td-status">
            <span class="layui-btn layui-btn-normal layui-btn-xs">������</span>
          </td>
          <td class="td-manage">
            <a onclick="member_stop(this,'10001')" href="javascript:;" title="����">
              <i class="layui-icon layui-icon-download-circle"></i>
            </a>
            <a title="�༭" onclick="WeAdminEdit('�༭','./edit.html', 2, 600, 400)" href="javascript:;">
              <i class="layui-icon layui-icon-edit"></i>
            </a>
            <a onclick="WeAdminShow('�޸�����','./password.html',600,400)" title="�޸�����" href="javascript:;">
              <i class="layui-icon layui-icon-util"></i>
            </a>
            <a title="ɾ��" onclick="member_del(this,'Ҫɾ����id')" href="javascript:;">
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