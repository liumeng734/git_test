<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		$('#winningTable').datagrid({
			title:'中奖信息', 				//标题
			method:'post',
			iconCls:'icon-tip', 			//图标
			singleSelect:false, 			//多选
			height:366, 					//高度
			fitColumns: true, 				//自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
			striped: true, 					//奇偶行颜色不同                        
			collapsible:true,				//可折叠
			url:"lottery/queryList", 		//数据来源
			sortName: 'userId',				//排序的列
			sortOrder: 'desc', 				//倒序
			remoteSort: true, 				//服务器端排序
			idField:'userId', 				//主键字段 
			queryParams:{}, 				//查询条件
			pagination:true, 				//显示分页
			rownumbers:true, 				//显示行号
			columns:[[
					{field:'name',title:'彩种',width:20,sortable:true,                              
						formatter:function(value,row,index){return row.name;} //需要formatter一下才能显示正确的数据                                
					},
					{field:'userPassword',title:'发起人',width:20,sortable:true,	//密码隐藏
						formatter:function(value,row,index){return row.userPassword;}                          
					},
					{field:'userName',title:'方案号',width:30,sortable:true,                              
						formatter:function(value,row,index){return row.userName;}                          
					},
					{field:'userGender',title:'时间',width:30,sortable:true,
						formatter:function(value,row,index){return row.userGender == '1'?'男':'女';}
					},
					{field:'userBirthday',title:'方案金额',width:20,sortable:true,
						formatter:function(value,row,index){return row.userBirthday;}
					},
					{field:'userOrg',title:'中奖情况',width:50,sortable:true, //机构代码隐藏
						formatter:function(value,row,index){return row.userOrg;}
					},
					{field:'orgDescId',title:'中奖金额',width:20,sortable:true, //机构描述id隐藏
						formatter:function(value,row,index){return row.orgDescId;}
					},
					{field:'OrgName',title:'税后奖金',width:20,sortable:true,
						formatter:function(value,row,index){return row.orgName;}
					},
					{field:'userDuty',title:'倍数',width:10,sortable:true,
						formatter:function(value,row,index){return row.userDuty;}
					}
					]],
			//一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
			onLoadSuccess:function(){$('#winningTable').datagrid('clearSelections');}
		});
		
	});
			
	//表格查询
	function searchUser(){
		var params = $('#winningTable').datagrid('options').queryParams;
		//先取得 datagrid 的查询参数
		var fields =$('#userQuForm').serializeArray(); //自动序列化表单元素为JSON对象
		$.each( fields, function(i, field){
			//alert("["+field.name+":"+field.value+"]");
			params[field.name] = field.value; //设置查询参数
		});
		$('#winningTable').datagrid('reload'); //设置好查询参数 reload 一下就可以了
	}
			
	//清空查询条件
	function clearUserForm(){
		$('#userQuForm').form('clear');
		//searchUser();
	}
	
	//动态生成彩种下拉列表框
	$.getJSON("lottery/winningGetLotteryId",function(json){
	  for(i=0;i<json.length;i++){
	  var tname=json[i].Name;
	  var tid=json[i].id;
	  $("#lottery_id").append("<option value='"+tid+"'>"+tname+"</option>");
	  }
			 
	});
	
	//动态生成期号下拉列表框
	$.getJSON("lottery/winningGetIsuseId",function(json){
	  for(i=0;i<json.length;i++){
	  var tname=json[i].Isuse;
	  var tid=json[i].id;
	  $("#isuse_id").append("<option value='"+tid+"'>"+tname+"</option>");
	  }
			 
	});
	
</script>

<form id="userQuForm" style="margin:0; text-align:center;">
	<div style="margin:10px 5px; padding:5px 0px; border:0px solid #f0f0f0;">
	<table style="width:98%; font-size:12px; border:0px solid #f0f0f0;" >
		<tr>
			<td width="7%" align="right">彩种：</td>
			<td width="10%" align="left"><select name="lottery_id" id="lottery_id" style="width:150"></select></td>
			<td width="7%" align="right">期号：</td>
			<td width="10%" align="left"><select name="isuse_id" id="isuse_id" style="width:150"></select></td>
			<td width="7%" align="right">购彩方式：</td>
			<td width="10%" align="left"><select name="isuse1" id="isuse1" style="width:150">
				<option value="">全部</option>
        		<option value="1">手机</option>
        		<option value="0">网站</option>
			</select></td>
			<td width="7%" align="right">方案号：</td>
			<td width="10%" align="left"><input name="schemeNumber" type="text" style="width:150" placeholder="方案号"></td>
		</tr>
		<tr>
			<td width="7%" align="right">开始时间：</td>
			<td width="10%" align="left"><input name="startTime" type="text" class="Wdate" style="width:150" placeholder="开始时间" data-options="required:true"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></td>
			<td width="7%" align="right">截止时间：</td>
			<td width="10%" align="left"><input name="endTime" type="text" class="Wdate" style="width:150" placeholder="截止时间" data-options="required:true"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></td>
			<td width="7%" align="right">用户名：</td>
			<td width="10%" align="left"><input name="userName" type="text" style="width:150" placeholder="用户名"></td>
			<td width="7%" align="right">税后金额：</td>
			<td width="10%" align="left">
			<input name="startWinMoneyNoWithTax" type="text" style="width:66" placeholder="开始金额"/>
			 - <input name="endWinMoneyNoWithTax" type="text" style="width:66" placeholder="结束金额"/>
			</td>
			<td align="center">
				<a href="#" onclick="searchWinningInfo();" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			</td>
		</tr>
	</table>
	</div>
</form>

<div style="padding:5" id="tabdiv">
	<table id="winningTable"></table>
</div>

</body>

</html>