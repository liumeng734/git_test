<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html public "-/w3c/dtd html 4.01 transitional/en" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<!-- 各期玩法设置 -->
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
		$('#customerTable').datagrid({
			title:'各玩法时间设置', 				//标题
			method:'post',
			iconCls:'icon-tip', 			//图标
			singleSelect:false, 			//多选
			height:366, 					//高度
			fitColumns: true, 				//自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
			striped: true, 					//奇偶行颜色不同                        
			collapsible:true,				//可折叠
			url:"customer/queryList", 			//数据来源
			sortName: 'id',				//排序的列
			sortOrder: 'desc', 				//倒序
			remoteSort: true, 				//服务器端排序
			idField:'id', 				//主键字段 
			queryParams:{}, 				//查询条件
			pagination:true, 				//显示分页
			rownumbers:true, 				//显示行号
			columns:[[
					{field:'id',title:'ID',width:20,sortable:true, hidden:true,                             
						formatter:function(value,row,index){return row.id;} 
					},
					{field:'Name',title:'彩种',width:20,sortable:true,align:'center',                              
						formatter:function(value,row,index){return row.Name;} //需要formatter一下才能显示正确的数据                                
					},
					{field:'RealityName',title:'投注提前截止分钟',width:20,sortable:true,align:'center',                             
						formatter:function(value,row,index){return row.RealityName;} //需要formatter一下才能显示正确的数据                         		
					},
					{field:'IDCardNumber',title:'追号任务执行时间',width:20,sortable:false,align:'center',
						formatter:function(value,row,index){return row.IDCardNumber;}                          
					},
					{field:'Email',title:'保存',width:20,sortable:true,align:'center',                              
						formatter:function(value,row,index){return row.Email;}                          
					}]],
			//一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
			onLoadSuccess:function(){$('#customerTable').datagrid('clearSelections');}
		});
		
	});
	
</script>

<div style="padding:5;background-color: #EEF2FB" id="tabdiv">
	<table id="customerTable"></table>
</div>

</body>
</html>