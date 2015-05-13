<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html public "-/w3c/dtd html 4.01 transitional/en" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>晓风彩票管理系统</title>
</head>
<body bgcolor="#EEF2FB">
	
<style type="text/css">
</style>

<script type="text/javascript">
	
	jQuery.ajaxSetup({cache:false});//ajax不缓存
	
	jQuery(function($){
		//加载datagride
		$('#customerLogTable').datagrid({
			title:'用户登录日志', 				//标题
			method:'post',
			iconCls:'icon-tip', 			//图标
			singleSelect:false, 			//多选
			height:366, 					//高度
			fitColumns: true, 				//自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
			striped: true, 					//奇偶行颜色不同                        
			collapsible:true,				//可折叠
			url:"customer/queryLoginLog", 	//数据来源
			sortName: 'id',					//排序的列
			sortOrder: 'desc', 				//倒序
			remoteSort: true, 				//服务器端排序
			idField:'id', 					//主键字段 
			queryParams:{}, 				//查询条件
			pagination:true, 				//显示分页
			rownumbers:true, 				//显示行号
			columns:[[
					{field:'ck',checkbox:true,width:2}, //显示复选框 
					{field:'id',title:'ID',width:20,sortable:true, hidden:true,                             
						formatter:function(value,row,index){return row.id;} 
					},
					{field:'name',title:'用户名',width:20,sortable:true,                              
						formatter:function(value,row,index){return row.name;} //需要formatter一下才能显示正确的数据                                
					},
					{field:'reality_name',title:'真实姓名',width:20,sortable:true,                             
						formatter:function(value,row,index){return row.reality_name;} //需要formatter一下才能显示正确的数据                         		
					},
					{field:'province',title:'省份',width:30,sortable:true,
						formatter:function(value,row,index){return row.province;}
					},
					{field:'city',title:'城市',width:20,sortable:false,
						formatter:function(value,row,index){return row.city;}
					},
					{field:'ip',title:'IP地址',width:30,sortable:false,
						formatter:function(value,row,index){return row.ip;}
					},
					{field:'login_time',title:'登录时间',width:20,sortable:false,
						formatter:function(value,row,index){return row.login_time;}
					},
					{field:'last_login_ip',title:'最近登录IP',width:20,sortable:false,
						formatter:function(value,row,index){return row.last_login_ip;}
					},
					{field:'login_num',title:'登录次数',width:20,sortable:false,
						formatter:function(value,row,index){return row.login_num;}
					},
					{field:'last_login_time',title:'最后登录时间',width:20,sortable:false,
						formatter:function(value,row,index){return row.last_login_time;}
					},
					{field:'description',title:'描述信息',width:20,sortable:false,
						formatter:function(value,row,index){return row.description;}	
					}
					]],
			toolbar:[
						{text:'清除日志', iconCls:'icon-remove',
							handler:function(){deleteCustomerLog();}
						},'-'
					],
			//一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
			onLoadSuccess:function(){$('#customerLogTable').datagrid('clearSelections');}
		});
		
	});
	//表格查询
	function searchCustomerLog(){
		var params = $('#customerLogTable').datagrid('options').queryParams;
		//先取得 datagrid 的查询参数
		var fields =$('#customerLogForm').serializeArray(); //自动序列化表单元素为JSON对象
		$.each( fields, function(i, field){
			params[field.name] = field.value; //设置查询参数
		});
		$('#customerLogTable').datagrid('reload'); //设置好查询参数 reload 一下就可以了
	}
			
	//清空查询条件
	function clearCustomerLogForm(){
		$('#customerLogForm').form('clear');
		//searchUser();
	}
	
	//清除登录日志
	function deleteCustomerLog(){
		var rows = $('#customerLogTable').datagrid('getSelections');
		if(rows.length == 0){
			$.messager.alert('提示',"请选择要删除的日志信息!",'info');
			return;
		}
		$.messager.confirm('提示','确定要删除吗?',function(result){
			if (result){
				var ps = "";
				$.each(rows,function(i,n){
					if(i==0){
						ps += "?id="+n.id;
					} else {
						ps += "&id="+n.id;
					}	
				});
				$.post('customer/deleteCustomerlog'+ps,function(data){
					$('#customerLogTable').datagrid('reload');
					$.messager.alert('提示',data.mes,'info');
				});
			}
		});
		
	}
	
</script>

<form id="customerLogForm" style="margin:0; text-align:center;">
	<div style="margin:10px 5px; padding:5px 0px; border:0px solid;">
	<table style="width:98%; font-size:12px; border:0px solid #f0f0f0;background-color:#EEF2FB" >
	<input name=flag id=flag value=0 type=hidden>
		<tr>
			<td width="10%" align="left">用户名：</td>
			<td width="30%" align="left"><input name="name" style="width:200"></td>
			<td width="10%" align="left">真实姓名：</td>
			<td width="30%" align="left"><input name="reality_name" style="width:200"></td>
			<td width="20%" align="center">
				<a href="#" onclick="clearCustomerLogForm();" class="easyui-linkbutton" iconCls="icon-undo">清空</a>
			</td>                        
		</tr>
		<tr>
			<td align="left">开始日期：</td>
			<td align="left">
				<input id="startTime" name="startTime" class="Wdate" type="text"
					style="width: 200" data-options="required:true"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
			</td>
			<td align="left">结束日期：</td>
			<td align="left">
				<input id="endTime" name="endTime" class="Wdate" type="text"
					style="width: 200" data-options="required:true"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
			</td>
			<td align="center">
				<a href="#" onclick="searchCustomerLog();" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			</td>
		</tr>
	</table>
	</div>
</form>

<div style="padding:5;background-color: #EEF2FB" id="tabdiv">
	<table id="customerLogTable"></table>
</div>

</body>

</html>