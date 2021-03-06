<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html public "-/w3c/dtd html 4.01 transitional/en" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
<!-- 代付款用户一览表 -->
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
		$('#customerGenerationOfPaymentTable').datagrid({
			title:'代付款用户一览表', 				//标题
			method:'post',
			iconCls:'icon-tip', 			//图标
			singleSelect:false, 			//多选
			height:366, 					//高度
			fitColumns: true, 				//自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
			striped: true, 					//奇偶行颜色不同                        
			collapsible:true,				//可折叠
			url:"server/queryCustomerDistill?result=" + 6, 	//数据来源
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
					},{field:'user_id',title:'用户ID',width:20,sortable:true, hidden:true,                        
						formatter:function(value,row,index){return row.user_id;}	
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
					{field:'id_card_number',title:'身份证号',width:30,sortable:false,
						formatter:function(value,row,index){return row.id_card_number;}
					},
					{field:'bank_name',title:'开户银行',width:20,sortable:false,
						formatter:function(value,row,index){return row.bank_name;}
					},
					{field:'bank_card_number',title:'卡号',width:20,sortable:false,
						formatter:function(value,row,index){return row.bank_card_number;}
					},
					{field:'accept_datetime',title:'同意时间',width:30,sortable:false,
						formatter:function(value,row,index){return row.accept_datetime;}
					},
					{field:'money',title:'提取金额',width:20,sortable:false,
						formatter:function(value,row,index){return row.money;}
					},
					{field:'balance',title:'账户余额',width:30,sortable:false,
						formatter:function(value,row,index){return row.balance;}
					},
					{field:'datetime',title:'提现时间',width:30,sortable:false,
						formatter:function(value,row,index){return row.datetime;}				
					},
					{field:'freeze_money',title:'冻结金额',width:20,sortable:false,
						formatter:function(value,row,index){return row.freeze_money;}
					},
					{field:'result',title:'提现状态',width:20,sortable:false,
						formatter:function(value,row,index){
							if(row.result==1) return '申请';
							if(row.result==2) return '等待';
							if(row.result==3) return '成功';
							if(row.result==4) return '拒绝';
							if(row.result==5) return '失败';}						
					},
					{field:'memo',title:'描述信息',width:20,sortable:false,
						formatter:function(value,row,index){return row.memo;}	
					}
					]],
			toolbar:[
						
					],
			//一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
			onLoadSuccess:function(){$('#customerGenerationOfPaymentTable').datagrid('clearSelections');}
		});
		
	});
	//表格查询
	function searchCustomerGenerationOfPayment(){
		//alert("helol kitty!");
		var params = $('#customerGenerationOfPaymentTable').datagrid('options').queryParams;
		//先取得 datagrid 的查询参数
		var fields =$('#customerGenerationOfPaymentForm').serializeArray(); //自动序列化表单元素为JSON对象
		$.each( fields, function(i, field){
			//alert("["+field.name+":"+field.value+"]");
			params[field.name] = field.value; //设置查询参数
		}); 
		$('#customerGenerationOfPaymentTable').datagrid('reload'); //设置好查询参数 reload 一下就可以了
	}
			
	//清空查询条件
	function clearcustomerGenerationOfPaymentForm(){
		$('#customerGenerationOfPaymentForm').form('clear');
		//searchUser();
	}
	
	
	
</script>

<form id="customerGenerationOfPaymentForm" style="margin:0; text-align:center;">
	<div style="margin:10px 5px; padding:5px 0px; border:0px solid;">
	<table style="width:98%; font-size:12px; border:0px solid #f0f0f0;background-color:#EEF2FB" >
		<tr>
			<td width="10%" align="left">用户名：</td>
			<td width="30%" align="left"><input name="name" style="width:200"></td>
			<td width="10%" align="left">提款状态：</td>
			<td width="30%" align="left"><select name="result"  panelHeight="125" data-options="editable:false" class="easyui-combobox"
					 style="width: 200px;">
						<option value="">全部</option>
						<option value="1">申请</option>
						<option value="2">等待</option>
						<option value="3">成功</option>
						<option value="4">拒绝</option>
						<option value="5">失败</option>
					</select></td>
			<td width="20%" align="center">
				<a href="#" onclick="clearcustomerGenerationOfPaymentForm();" class="easyui-linkbutton" iconCls="icon-undo">清空</a>
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
				<a href="#" onclick="searchCustomerGenerationOfPayment();" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			</td>
		</tr>
	</table>
	</div>
</form>

<div style="padding:5;background-color: #EEF2FB" id="tabdiv">
	<table id="customerGenerationOfPaymentTable"></table>
</div>

</body>

</html>