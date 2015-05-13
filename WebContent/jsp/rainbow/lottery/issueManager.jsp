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
.table{font-size:12px;}
</style>

<script type="text/javascript">
	
	jQuery.ajaxSetup({cache:false});//ajax不缓存
	
	jQuery(function($){
		
		//加载datagride
		$('#isuseTable').datagrid({
			method:'post',
			singleSelect:false, 			//多选
			height:366, 					//高度
			fitColumns: true, 				//自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
			striped: true, 					//奇偶行颜色不同                        
			collapsible:true,				//可折叠
			url:"lottery/queryList", 			//数据来源
			sortName: 'id',				//排序的列
			sortOrder: 'asc', 				//顺序
			remoteSort: true, 				//服务器端排序
			idField:'id', 				//主键字段 
			queryParams:{}, 				//查询条件
			pagination:true, 				//显示分页
			rownumbers:true, 				//显示行号
			columns:[[
			         {field:'ck',checkbox:true,width:2}, //显示复选框 
					{field:'isuse',title:'期号名称',width:20,sortable:false,
						formatter:function(value,row,index){return row.isuse;}
					},{field:'lottery_id',title:'彩种名称',width:20,sortable:false,hidden:true,
						formatter:function(value,row,index){return row.lottery_id;}		
					},
					{field:'start_datetime',title:'开始时间',width:20,sortable:false,hidden:false,
						formatter:function(value,row,index){return row.start_datetime;}
					},
					{field:'end_datetime',title:'截止时间',width:20,sortable:false,hidden:false,
						formatter:function(value,row,index){return row.end_datetime;}
					}
					]],
			//一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
			onLoadSuccess:function(){$('#isuseTable').datagrid('clearSelections');}
		});
		
	});
			
	//新增
	function addIsuseRow(){
		var r = $('#isuseForm').form('validate');
		var id = $("#lottery_id").val();
		//alert(id);
		if(!r) {
			return false;
		}
		showWindow({
			title:'增加期号信息',
			href:'lottery/popWinAddIsuse?id=' + id,
			width:400,
			height:220,
			onLoad: function(){$('#isuseAddForm').form('reset');}
		});
	}
			
	//动态生成彩种下拉列表框
	$.getJSON("lottery/winningGetLotteryId",function(json){
	  for(i=0;i<json.length;i++){
	  var tname=json[i].name;
	  var tid=json[i].id;
	  $("#lottery_id").append("<option value='"+tid+"'>"+tname+"</option>");
	  }
			 
	});	
	
	//弹出窗口
	function showWindow(options){
		jQuery("#myPopWindow").window(options);
	}
	//关闭弹出窗口
	function closeWindow(){
		$("#myPopWindow").window('close');
	}
	
</script>

<form id="isuseForm" method="post">
		<div style="height: 40px;line-height: 50px;color: #3977C3;padding: 0px 0px 2px 12px;
         font-weight: bold; font-size:13px;  background-color:#fdfdfd;border-bottom:1px solid #dfdfdf">期号列表</div>
		<!-- 隐藏域 -->
		<input type="hidden" name="id" id="lotteryid">
		<table style="width:100%">
				<tr>
					<td style="width:4%; text-align:right; padding-right:8px;font-size:13px">彩种</td>
					<td style="width:40%; height:25px; padding:0px 5px">
					<select name="lottery_id" id="lottery_id" style="width: 140px;height:25px" class="easyui-validatebox" required="true">
					<option selected="selected" value = "">请选择彩种</option>
					</select> &nbsp;
					<a href="#" id="btnGO" onclick="addIsuseRow();" class="easyui-linkbutton" iconCls="icon-add">增加</a>&nbsp;
					<span style="width:5%; text-align:right; padding-right:8px;font-size:13px">已添加的最后期号：-， 开始时间：-， 截止时间：-</span>
					</td>
				</tr>
			</table>
</form>

<div style="padding:5" id="tabdiv">
	<table id="isuseTable"></table>
</div>

</body>

</html>