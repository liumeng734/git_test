<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html public "-/w3c/dtd html 4.01 transitional/en" "http://www.w3.org/tr/html4/loose.dtd">

<html>
<head>
	<title>晓风彩票管理系统</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="Simple">
</head>

<body>

<style type="text/css">
</style>

<script type="text/javascript">
	
	jQuery.ajaxSetup({cache:false});//ajax不缓存
	
	jQuery(function($){
		//加载datagride
		$('#userTable').datagrid({
			title:'用户列表', 				//标题
			method:'post',
			iconCls:'icon-tip', 			//图标
			singleSelect:false, 			//多选
			height:366, 					//高度
			fitColumns: true, 				//自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
			striped: true, 					//奇偶行颜色不同                        
			collapsible:true,				//可折叠
			url:"user/queryList", 			//数据来源
			sortName: 'userId',				//排序的列
			sortOrder: 'desc', 				//倒序
			remoteSort: true, 				//服务器端排序
			idField:'userId', 				//主键字段 
			queryParams:{}, 				//查询条件
			pagination:true, 				//显示分页
			rownumbers:true, 				//显示行号
			columns:[[
					{field:'ck',checkbox:true,width:2}, //显示复选框 
					{field:'userAccount',title:'用户账号',width:20,sortable:true,                              
						formatter:function(value,row,index){return row.userAccount;} //需要formatter一下才能显示正确的数据                                
					},
					{field:'userPassword',title:'密码',width:20,sortable:false,hidden:true,	//密码隐藏
						formatter:function(value,row,index){return row.userPassword;}                          
					},
					{field:'userName',title:'用户姓名',width:20,sortable:true,                              
						formatter:function(value,row,index){return row.userName;}                          
					},
					{field:'userGender',title:'用户性别',width:20,sortable:false,hidden:true,
						formatter:function(value,row,index){return row.userGender == '1'?'男':'女';}
					},
					{field:'userBirthday',title:'出生日期',width:30,sortable:true,hidden:true,
						formatter:function(value,row,index){return row.userBirthday;}
					},
					{field:'userOrg',title:'机构代码',width:30,sortable:false,hidden:true, //机构代码隐藏
						formatter:function(value,row,index){return row.userOrg;}
					},
					{field:'orgDescId',title:'机构描述ID',width:30,sortable:false,hidden:true, //机构描述id隐藏
						formatter:function(value,row,index){return row.orgDescId;}
					},
					{field:'OrgName',title:'所属机构',width:30,sortable:true,hidden:true,
						formatter:function(value,row,index){return row.orgName;}
					},
					{field:'userDuty',title:'职务',width:20,sortable:false,
						formatter:function(value,row,index){return row.userDuty;}
					},
					{field:'userTelephone',title:'联系电话',width:20,sortable:false,
						formatter:function(value,row,index){return row.userTelephone;}
					},
					{field:'mail',title:'邮件地址',width:30,sortable:false,
						formatter:function(value,row,index){return row.mail;}
					},
					{field:'qqWeixin',title:'QQ或微信',width:20,sortable:false,
						formatter:function(value,row,index){return row.qqWeixin;}
					},
					{field:'userDesc',title:'用户描述',width:20,sortable:false,
						formatter:function(value,row,index){return row.userDesc;}
					},
					{field:'enable',title:'用户状态',width:20,sortable:false,
						formatter:function(value,row,index){return row.enable == '0'?'禁用':'正常';}
					},
					{field:'isSys',title:'是否系统用户',width:20,sortable:false,
						formatter:function(value,row,index){return row.isSys == '0'?'否':'是';}
					}
					]],
			toolbar:[
					{text:'新增', iconCls:'icon-add', 
						handler:function(){addUserRow();}
					},'-',
					{text:'更新', iconCls:'icon-edit',
						handler:function(){updateUserRow();}
					},'-',
					{text:'删除', iconCls:'icon-remove',
						handler:function(){deleteUserRow();}
					},'-',
					{text:'角色管理', iconCls:'icon-role',
						handler:function(){updateUserRoleRow();}
					},'-'
					],
			//一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
			onLoadSuccess:function(){$('#userTable').datagrid('clearSelections');}
		});
		
	});
			
	//新增
	function addUserRow(){
		showWindow({
			title:'增加用户信息',
			href:'user/addPopWin',
			width:420,
			height:500,
			onLoad: function(){$('#userAddForm').form('reset');}
		});
	}
			
	//更新    
	function updateUserRow(){
		var rows = $('#userTable').datagrid('getSelections');
		//alert(rows[0].userId);
		//这里有一个jquery easyui datagrid的一个小bug，必须把主键单独列出来，要不然不能多选 
		if(rows.length==0){
			$.messager.alert('提示',"请选择你要更新的用户",'info');
			return;
		}
		if(rows.length > 1){
			$.messager.alert('提示',"只能选择一位用户进行更新",'info');
			return;
		}
		showWindow({
			title:'更新用户信息',
			href:'user/updatePopWin',
			width:420,
			height:480,
			onLoad: function(){
				$("#userUpForm").form('load', rows[0]);
			}
		});
	}
			
	//删除
	function deleteUserRow(){
		$.messager.confirm('提示','确定要删除吗?',function(result){
			if (result){
				var rows = $('#userTable').datagrid('getSelections');
				var ps = "";
				$.each(rows,function(i,n){
					if(i==0){
						ps += "?userId="+n.uid;
					} else {
						ps += "&userId="+n.uid;
					}	
				});
				$.post('user/delUsers'+ps,function(data){
					$('#userTable').datagrid('reload');
					$.messager.alert('提示',data.mes,'info');
				});
			}
		});
	}

	//编辑用户角色
	function updateUserRoleRow(){
		var rows = $('#userTable').datagrid('getSelections');
		//这里有一个jquery easyui datagrid的一个小bug，必须把主键单独列出来，要不然不能多选 
		if(rows.length==0){
			$.messager.alert('提示',"请选择您要编辑角色的用户",'info');
			return;
		}
		if(rows.length > 1){
			$.messager.alert('提示',"只能选择一位用户进行编辑",'info');
			return;
		}
		showWindow({
			title:'编辑用户角色',
			href:'user/updateRolePopWin?userId='+rows[0].userId,
			width:520,
			height:480,
			onLoad: function(){
				$("#userRoleForm").form('load', rows[0]);
			}
		});
	}
			
	//表格查询
	function searchUser(){
		var params = $('#userTable').datagrid('options').queryParams;
		//先取得 datagrid 的查询参数
		var fields =$('#userQuForm').serializeArray(); //自动序列化表单元素为JSON对象
		$.each( fields, function(i, field){
			//alert("["+field.name+":"+field.value+"]");
			params[field.name] = field.value; //设置查询参数
		});
		$('#userTable').datagrid('reload'); //设置好查询参数 reload 一下就可以了
	}
			
	//清空查询条件
	function clearUserForm(){
		$('#userQuForm').form('clear');
		//searchUser();
	}
	
</script>

<form id="userQuForm" style="margin:0; text-align:center;">
	<div style="margin:10px 5px; padding:5px 0px; border:0px solid #f0f0f0;">
	<table style="width:98%; font-size:12px; border:0px solid #f0f0f0;" >
		<tr>
			<td width="10%" align="left">账号：</td>
			<td width="30%" align="left"><input name="userAccount" style="width:250"></td>
			<td width="10%" align="left">姓名：</td>
			<td width="30%" align="left"><input name="userName" style="width:250"></td>
			<!--
			<td width="10%" align="left">性别：</td>
			<td width="20%" align="left">
				<select class="easyui-combobox" name="userGender" style="width:180;" data-options="editable:false">
					<option value="">全部</option>
        			<option value="1">男</option>
        			<option value="2">女</option>
    			</select>
			</td>
			-->
			<td width="20%" align="center">
				<a href="#" onclick="clearUserForm();" class="easyui-linkbutton" iconCls="icon-undo">清空</a>
			</td>                        
		</tr>
		<tr>
			<td align="left">其他：</td>
			<td align="left">
				<input id="userOrg" type="text" name="userOrg" style="width:250">
			</td>
			<td align="left">用户状态：</td>
			<td align="left">
				<select class="easyui-combobox" name="enable" style="width:250;"panelHeight="65" data-options="editable:false">
					<option value="">全部</option>
        			<option value="1">正常</option>
        			<option value="0">禁用</option>
    			</select>
			</td>
			<!--
			<td align="left">出生日期：</td>
			<td align="left"><input name="userBirthday" class="Wdate" type="text" style="width:180" onclick="WdatePicker()"></td>
			-->
			<td align="center">
				<a href="#" onclick="searchUser();" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			</td>
		</tr>
	</table>
	</div>
</form>

<div style="padding:5" id="tabdiv">
	<table id="userTable"></table>
</div>

</body>

</html>