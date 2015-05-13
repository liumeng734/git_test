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
<script type="text/javascript">
	jQuery.ajaxSetup({
		cache : false
	});//ajax不缓存

	function clearRechargeForm(){
		//alert("hello kitty!");
		$('#rechargeForm').form('clear');
		$('#customerRechargeTable').datagrid('reload'); //设置好查询参数 reload 一下就可以了
	}
	//充值
	function recharge() {
		if (!$("#rechargeForm").form('validate')){
			return;
		}
		var Name = $('#name').val();
		var Money = $('#money').val();
		var type = $('input:radio:checked').val();
		var reamrk = $('#description').val();
		var radio1=document.getElementsByName("pay_type");
		var flag = 0;
		if(type != '1' && type != '2' && type != '3' && type != '4' && type != '5'){
			flag = 1;
		}
		if(Name == ""){
			$.messager.alert("提示", "请输入充值账户名称！");
			return;
		}if(Money == ""){
			$.messager.alert("提示", "请输入充值金额！");
			return;
		}if(flag == '1'){
			$.messager.alert("提示", "请选择充值方式！");
			return;
		}
		$.post("customer/customerRecharge",$("#rechargeForm").serializeArray(),function(data){
			$.messager.alert('提示',data.mes,'info');
			$('#rechargeForm').form('clear');
		});
		
	}
	function press(e) {
		{
			e.style.color = "black";
		} 
		}
	function defaulstyle(e) {
			{
				e.style.color = "black";
			}
			
		}
</script>
<form action="" id="rechargeForm" name="rechargeForm">
<div style="margin:10px 5px; padding:5px 0px; border:0px solid;">
	<table class="table" width="50%" height="50%" border="0px">
			<tr>
				<td align="left" colspan="2"><a style="color:blue">&nbsp;&nbsp;<font size="5">客户账户充值</font></a></td>
			</tr>
			<tr>
				<td align="left">&nbsp;&nbsp;选择站点：</td>
				<td align="left">
					<select name="Site" id="site" panelHeight="25"  class="easyui-combobox" value="晓风彩票网"
					 style="width: 200px;">
						<option value="1">晓风彩票网</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">用户名称：</td>
				<td align="left" >
					<input name="name" id="name" required="true" class="easyui-validatebox"  style="width:200;"onfocus="if (value =='请输入用户名称'){value =''}" onblur="if (value ==''){value='请输入用户名称';defaulstyle(this)}"  onkeypress="press(this)">
				</td>
			
			</tr>
			<tr>
				<td align="right">充值金额：</td>
				<td align="left"><input name="money" id="money" class="easyui-validatebox"  required="true" onfocus="if (value =='请输入充值金额'){value =''}" onblur="if (value ==''){value='请输入充值金额';defaulstyle(this)}"  onkeypress="press(this)"
					style="width: 200;"/></td>
			</tr>
			<tr>
				<td align="right">充值方式：</td>
				<td align="left">
					<table>
						<tr>
							<td><input type="radio" name="pay_type" value="1"/>正常手动充值</td>
							<td><input type="radio" name="pay_type" value="2"/>奖励</td>
							<td><input type="radio" name="pay_type" value="3"/>购彩</td>
							<td><input type="radio" name="pay_type" value="4"/>预付款</td>
							<td><input type="radio" name="pay_type" value="5"/>转账户</td>
							<td><input type="radio" name="pay_type" value="6"/>其他</td>
						</tr>
					</table>
				</td>
				
			</tr>
			<tr>
				<td align="right">摘&nbsp;&nbsp;&nbsp;&nbsp;要：</td>
				<td align="left"><input name="description" id="description" style="width: 200;"/></td>
			</tr>
			<tr>
				<td align="right" >
					<a href="#" onclick="recharge();" class="easyui-linkbutton" iconCls="icon-ok">充值</a>
				</td>
				<td align="left">
					<a href="#" onclick="clearRechargeForm();" class="easyui-linkbutton" iconCls="icon-back">返回</a>
				</td> 
				
			</tr>
		</table>
		</div>
</form>

</body>
</html>