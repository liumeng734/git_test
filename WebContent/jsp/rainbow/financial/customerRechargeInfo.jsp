<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html public "-/w3c/dtd html 4.01 transitional/en" "http://www.w3.org/tr/html4/loose.dtd">
<%
	Map<String,Object> map = (Map<String,Object>)request.getSession().getAttribute("map");
	//System.out.print("jsp money=" + map.get("totalMoney"));
	
%>
<html>

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
		$('#customerRechargeInfo').datagrid({
			title:'用户充值明细表', 				//标题
			method:'post',
			iconCls:'icon-tip', 			//图标
			singleSelect:false, 			//多选
			height:366, 					//高度
			fitColumns: true, 				//自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
			striped: true, 					//奇偶行颜色不同                        
			collapsible:true,				//可折叠
			url:"server/queryHandleUserRecharge", 	//数据来源
			sortName: 'id',					//排序的列
			sortOrder: 'desc', 				//倒序
			remoteSort: true, 				//服务器端排序
			idField:'id', 					//主键字段 
			queryParams:{}, 				//查询条件
			pagination:true, 				//显示分页
			rownumbers:true, 				//显示行号
			columns:[[
					{field:'ck',checkbox:true,width:2}, //显示复选框 
					{field:'id',title:'ID',width:20,sortable:true,                            
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
					{field:'pay_type',title:'充值方式',width:20,sortable:false,
						formatter:function(value,row,index){
							if(row.pay_type==1) return '正常手动充值';
							if(row.pay_type==2) return '奖励';
							if(row.pay_type==3) return '购彩';
							if(row.pay_type==4) return '预付款';
							if(row.pay_type==5) return '转账户';
							if(row.pay_type==6) return '其他';}						
					},
					{field:'money',title:'充值金额',width:30,sortable:false,
						formatter:function(value,row,index){return row.money;}
					},
					{field:'datetime',title:'充值时间',width:20,sortable:false,
						formatter:function(value,row,index){return row.datetime;}
					},
					{field:'result',title:'充值状态',width:20,sortable:false,
						formatter:function(value,row,index){
							if(row.result==1) return '成功';
							if(row.result==2) return '失败';
							if(row.result==3) return '待支付';}						
					},
					{field:'balance',title:'账户余额',width:20,sortable:false,
						formatter:function(value,row,index){return row.balance;}
					},
					{field:'description',title:'描述信息',width:20,sortable:false,
						formatter:function(value,row,index){return row.description;}	
					}
					]],
			toolbar:[
			        {text:'导出', iconCls:'icon-remove',
						handler:function(){exportCustomerRechargeInfo();}
					},'-',{text:"支付总金额：<font color=#FF0000 >"+'${map.totalMoney}' +"</font> &nbsp;&nbsp手续费："+
						"<font color=#FF0000 >"+'${map.totalCommission}'},'-'
						
					],
			//一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
			onLoadSuccess:function(){$('#customerRechargeInfo').datagrid('clearSelections');}
		});
		
	});
	//表格查询
	function searchHandlerRechargeInfo(){
		//alert("helol kitty!");
		var params = $('#customerRechargeInfo').datagrid('options').queryParams;
		//先取得 datagrid 的查询参数
		var fields =$('#customerRechargeInfoForm').serializeArray(); //自动序列化表单元素为JSON对象
		$.each( fields, function(i, field){
			//alert("["+field.name+":"+field.value+"]");
			params[field.name] = field.value; //设置查询参数
		}); 
		$('#customerRechargeInfo').datagrid('reload'); //设置好查询参数 reload 一下就可以了
	}
			
	//清空查询条件
	function clearcustomerRechargeInfoForm(){
		$('#customerRechargeInfoForm').form('clear');
		//searchUser();
	}
	
	//-----------------------导出led节目监控开始-----------------------
	function exportCustomerRechargeInfo(){
		var url='server/downloadCustomerRechargeExcel';
        var f  = document.getElementById('customerRechargeInfoForm');		                
        f.action = url;	
        f.target="blankFrame";
        f.submit();	
	}
	
</script>

<form id="customerRechargeInfoForm" style="margin:0; text-align:center;">
	<div style="margin:10px 5px; padding:5px 0px; border:0px solid;">
	<table style="width:98%; font-size:12px; border:0px solid #f0f0f0;background-color:#EEF2FB" >
		<tr>
			<td width="10%" align="left">用户名：</td>
			<td width="30%" align="left"><input name="name" style="width:200"></td>
			<td width="10%" align="left">充值状态：</td>
			<td width="30%" align="left"><select name="result"  panelHeight="85" data-options="editable:false" class="easyui-combobox"
					 style="width: 200px;">
						<option value="">全部</option>
						<option value="1">成功</option>
						<option value="2">失败</option>
						<option value="3">待支付</option>
					</select></td>
			<td width="20%" align="center">
				<a href="#" onclick="clearcustomerRechargeInfoForm();" class="easyui-linkbutton" iconCls="icon-undo">清空</a>
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
				<a href="#" onclick="searchHandlerRechargeInfo();" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			</td>
		</tr>
	</table>
	</div>
</form>

<div style="padding:5;background-color: #EEF2FB" id="tabdiv">
	<table id="customerRechargeInfo"></table>
</div>

</body>

</html>