<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html public "-/w3c/dtd html 4.01 transitional/en" "http://www.w3.org/tr/html4/loose.dtd">
<%
	Map<String,Object> map1 = (Map<String,Object>)request.getSession().getAttribute("map1");
	//System.out.print("jsp money=" + map2.get("totalWinMoney"));
	//String money = (String)request.getParameter("money");
	
%>
<html>
<!-- 用户中奖明细 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>晓风彩票管理系统</title>
</head>
<body bgcolor="#EEF2FB">
<!-- 用户充值明细表 -->
<style type="text/css">
</style>

<script type="text/javascript">
	
	jQuery.ajaxSetup({cache:false});//ajax不缓存
	
	jQuery(function($){
		//加载datagride
		$('#customerWinningDetailTable').datagrid({
			title:'用户充值明细表', 				//标题
			method:'post',
			iconCls:'icon-tip', 			//图标
			singleSelect:false, 			//多选
			height:366, 					//高度
			fitColumns: true, 				//自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
			striped: true, 					//奇偶行颜色不同                        
			collapsible:true,				//可折叠
			url:"financial/queryCustomerWinningDetail", 	//数据来源
			sortName: 'id',					//排序的列
			sortOrder: 'desc', 				//倒序
			remoteSort: true, 				//服务器端排序
			idField:'id', 					//主键字段 
			queryParams:{}, 				//查询条件
			pagination:true, 				//显示分页
			rownumbers:true, 				//显示行号
			columns:[[
					{field:'ck',checkbox:true,width:2}, //显示复选框 
					{field:'id',title:'ID',width:20,sortable:true,hidden:true,                        
						formatter:function(value,row,index){return row.id;} 
					},
					{field:'name',title:'用户名',width:20,sortable:true,                              
						formatter:function(value,row,index){return row.name;} //需要formatter一下才能显示正确的数据                                
					},
					{field:'reality_name',title:'真实姓名',width:20,sortable:true,hidden:true,                         
						formatter:function(value,row,index){return row.reality_name;} //需要formatter一下才能显示正确的数据                         		
					},
					{field:'datetime',title:'时间',width:30,sortable:true,
						formatter:function(value,row,index){return row.datetime;}
					},
					{field:'win_money',title:'税前金额',width:20,sortable:false,
						formatter:function(value,row,index){return row.win_money;}
					},
					{field:'win_money_no_with_tax',title:'税后金额',width:30,sortable:false,
						formatter:function(value,row,index){return row.win_money_no_with_tax;}
					}
					]],
			toolbar:[
			         {text:'查看方案', iconCls:'icon-search',
						handler:function(){queryScheme();}
					},'-',
			        {text:"中奖总金额：<font color=#FF0000 >"+'${map1.totalWinMoney}'},'-'						
					],
			//一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
			onLoadSuccess:function(){$('#customerWinningDetailTable').datagrid('clearSelections');}
		});
		
	});
	//表格查询
	function serachCustomerWinningDetail(){
		//alert("helol kitty!");
		var params = $('#customerWinningDetailTable').datagrid('options').queryParams;
		//先取得 datagrid 的查询参数
		var fields =$('#customerWinningDetailForm').serializeArray(); //自动序列化表单元素为JSON对象
		$.each( fields, function(i, field){
			//alert("["+field.name+":"+field.value+"]");
			params[field.name] = field.value; //设置查询参数
		}); 
		$('#customerWinningDetailTable').datagrid('reload'); //设置好查询参数 reload 一下就可以了
	}
			
	//清空查询条件
	function clearcustomerWinningDetailForm(){
		$('#customerWinningDetailForm').form('clear');
		//searchUser();
	}
	
	//查看方案
	function queryScheme(){
		var rows = $('#customerWinningDetailTable').datagrid('getSelections');
		//这里有一个jquery easyui datagrid的一个小bug，必须把主键单独列出来，要不然不能多选 
		if(rows.length==0){
			$.messager.alert('提示',"请选择你要预览的客户信息！",'info');
			return;
		}
		if(rows.length > 1){
			$.messager.alert('提示',"只能选择一条客户信息进行预览！",'info');
			return;
		}
		var id = rows[0].id;
		showWindow({
			title:'客户基本信息',
			href:'financial/queryCustomerScheme',
			width:750,
			height:580,
			onLoad: function(){
				$("#customerSchme").form('load', rows[0]);
			}
		});
	}
	
	//动态生成彩种下拉列表框
	$.getJSON("lottery/winningGetLotteryId",function(json){
	  for(i=0;i<json.length;i++){
	  var tname=json[i].name;
	  var tid=json[i].id;
	  $("#lottery_ID").append("<option value='"+tid+"'>"+tname+"</option>");
	  }
			 
	});	
	
</script>

<form id="customerWinningDetailForm" style="margin:0; text-align:center;">
	<div style="margin:10px 5px; padding:5px 0px; border:0px solid;">
	<table style="width:98%; font-size:12px; border:0px solid #f0f0f0; background-color:#EEF2FB">
		<tr>
			<td width="10%" align="left">用户名：</td>
			<td width="15%" align="left"><select name="name" style="width:150"></select></td>
			<td width="10%" align="left">彩种：</td>
			<td width="15%" align="left"><select name=lottery_ID id="lottery_ID" style="width:150"></select></td>
			<td width="10%" align="left">购彩方式：</td>
			<td width="15%" align="left"><select name="buy_lottery_type" style="width:150">
				<option value="">全部</option>
        		<option value="1">手机</option>
        		<option value="2">网站</option>
			</select></td>
			<td  width="25%" align="center">
				<a href="#" onclick="clearcustomerWinningDetailForm();" class="easyui-linkbutton" iconCls="icon-undo">清空</a>
			</td>
		</tr>
		<tr>
			<td width="7%" align="left">开始时间：</td>
			<td width="10%" align="left"><input name="startTime" type="text" class="Wdate" style="width:150" placeholder="开始时间" data-options="required:true"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></td>
			<td width="7%" align="left">截止时间：</td>
			<td width="10%" align="left"><input name="endTime" type="text" class="Wdate" style="width:150" placeholder="截止时间" data-options="required:true"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></td>
			<td width="7%" align="left">中奖金额：</td>
			<td width="10%" align="left">
			<input name="startWinMoneyNoWithTax" type="text" style="width:66" placeholder="开始金额"/>
			 - <input name="endWinMoneyNoWithTax" type="text" style="width:66" placeholder="结束金额"/>
			</td>
			<td align="center">
				<a href="#" onclick="serachCustomerWinningDetail();" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			</td>
		</tr>
	</table>
	</div>
</form>

<div style="padding:5;background-color: #EEF2FB" id="tabdiv">
	<table id="customerWinningDetailTable"></table>
</div>

</body>

</html>