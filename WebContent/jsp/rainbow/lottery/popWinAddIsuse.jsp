<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html public "-/w3c/dtd html 4.01 transitional/en" "http://www.w3.org/tr/html4/loose.dtd">
<%
	String id = (String)request.getParameter("id");
%>
<html>
<head></head>
<!-- 增加期号 -->
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
		//alert($("#lottery_Id").val());
		if(!r) {
			return false;
		}
		 /* alert(jQuery("#isuseName").val()); */
		/* $.post("lottery/addIsuse",$("#isuseAddForm").serializeArray(),function(data){
			$('#myPopWindow').window('close');
			$('#isuseTable').datagrid('reload');
			$.messager.alert('提示',"系统正在生成期号，请稍后...",'info');
		}); */
		$.post("lottery/addIsuse",$("#isuseAddForm").serializeArray());
		$.messager.alert('提示',"系统正在生成期号，请稍后刷新!",'info');
			$('#myPopWindow').window('close');
			$('#isuseTable').datagrid('reload');
			
		
	}
	
   /*  //文本框限输入数字
    $("input[id^='days']").keydown(function () {
        //alert(window.event.keyCode);
        var e = $(this).event || window.event;
        var code = parseInt(e.keyCode);
        if (code >= 96 && code <= 105 || code >= 48 && code <= 57 || code == 8 || code==110 || code==190) {
            return true;
        } else {
        	$.messager.alert('提示',"只能输入正整数!",'info');
        	document.getElementById('days').value='';
        }
    }); */
    
    function checkDays(){
    	var number = $('#days').val();
    	if(number == '' || number == null){
    		
    	}else{
    		var re = /^[0-9]*[1-9][0-9]*$/ ;  
    	       if(!re.test(number)){
    	    	   $.messager.alert('提示',"只能输入正整数!",'info');
    	    	   document.getElementById('days').value='';
    	       }
    	}
    	
    }
    
    function checkTime(){
    	var start_datetime = $('#start_datetime').val();
    	var id = <%=id%>;
    	if(start_datetime == '' || start_datetime == null){
    		
    	}else{
    		$.post('lottery/checkTime'+"?start_datetime="+start_datetime+"&id=" + id, function(data) {
    			if(data.mes != 1){
    				document.getElementById('start_datetime').value='';
    				$.messager.alert('提示', "您已添加["+data.mes+"]的期号，请往后添加!", 'info');
    			}
				
			});
    	}
    }
	</script>

	<!-- 验证使用jquery-validation -->
	<form id="isuseAddForm" method="post"
		style="margin: 0; text-align: center;">
		<input type="hidden" name="lottery_Id" id="lottery_Id">
		<table
			style="width: 100%; font-size: 12px; border: 0px solid #f0f0f0; padding: 15 5 5 5" >
			<tr>
				<td width="30%" align="right">开始时间：</td>
				<td width="70%" align="left"><input name="start_datetime" onblur = "checkTime()" id="start_datetime" onfocus="WdatePicker({minDate:'%y-%M-#{%d}'})"
					type="text" class="Wdate" style="width: 200" class="easyui-validatebox" data-options="required:true"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></td>
			</tr>
			<tr>
				<td width="30%" align="right">增加天数：</td>
				<td width="70%" align="left"><input name="days" id="days" class="easyui-validatebox" data-options="required:true" onblur="checkDays()"
					type="text" style="width: 200" required="true"></td>
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
