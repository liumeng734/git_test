<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html public "-/w3c/dtd html 4.01 transitional/en" "http://www.w3.org/tr/html4/loose.dtd">
<%
	String id = (String)request.getParameter("id");
	System.out.println("id="+id);
%>
<html>
<head></head>
<!-- 新增期号  页面作废-->
<body>

	<style type="text/css">
</style>

	<script type="text/javascript">

    jQuery(function($){
    });

	//添加期号
	function addIsuse(){
		var r = $('#isuseAddForm').form('validate');
		
		document.getElementById('lottery_Id').value=<%=id%>;
		var acd = jQuery("#lottery_Id").val();
		alert(acd);
		if(!r) {
			return false;
		}
		 /* alert(jQuery("#isuseName").val()); */
		$.post("lottery/addIsuse",$("#isuseAddForm").serializeArray(),function(data){
			$('#myPopWindow').window('close');
			$('#is 	useTable').datagrid('reload');
			$.messager.alert('提示',data.mes,'info');
		});
	}
	</script>

	<!-- 验证使用jquery-validation -->
	<form id="isuseAddForm" method="post"
		style="margin: 0; text-align: center;">
		<input type="hidden" name="lotteryId" id="lottery_Id">
		<table
			style="width: 100%; font-size: 12px; border: 0px solid #f0f0f0;">
			<tr>
				<td width="30%" align="right">开始时间：</td>
				<td width="70%" align="left"><input name="startTime"
					type="text" class="Wdate" style="width: 200" required="true"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></td>
			</tr>
			<tr>
				<td width="30%" align="right">截至时间：</td>
				<td width="70%" align="left"><input name="endTime"
					type="text" class="Wdate" style="width: 200" required="true"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a href="#" id="btn-back"
					onclick="closeWindow();" class="easyui-linkbutton"
					iconCls="icon-back">返回</a> <a href="#" id="btn-add"
					onclick="addIsuse();" class="easyui-linkbutton" iconCls="icon-save">保存</a>
				</td>
			</tr>
		</table>
	</form>

</body>

</html>
