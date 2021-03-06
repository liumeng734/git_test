<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html public "-/w3c/dtd html 4.01 transitional/en" "http://www.w3.org/tr/html4/loose.dtd">

<html>
	<head></head>
    
    <body>
    
  	<style type="text/css">
    </style>
    
    <script type="text/javascript">

  	jQuery(function($){

		//校验密码
		$.extend($.fn.validatebox.defaults.rules, {
		    chkPwd: {
		        validator: function(value,param){
	        		if(value.length < param[0]){
	        			$.fn.validatebox.defaults.rules.chkPwd.message = '密码不能少于'+param[0]+'位';
		        	}else{
		        		if(RegExp("[\\u4E00-\\u9FFF]+", "g").test(value)){
							$.fn.validatebox.defaults.rules.chkPwd.message = '密码不能出现汉字';
							return false;
						}else{
							if(value.length > param[1]){
								$.fn.validatebox.defaults.rules.chkPwd.message = '密码长度不能超过'+param[1]+'位';
							}else{
								return true;
							}
						}
			        }
		        }
		    }
		});
		
	});

	//更新用户
	function updateUser(){
		//判断是否需要更新密码
		var oldpwd = $("#oldpwd")[0].value;
		var newpwd = $("#newpwd")[0].value;
		var uppwd = true;
		if(oldpwd == newpwd){
			uppwd = false;
		}
		//校验其他输入项
		var r = $('#userUpForm').form('validate');
		if(!r) {
			return false;
		}
		//更新
		$.post("user/updateUser?uppwd="+uppwd, $("#userUpForm").serializeArray(),function(data){
			$('#myPopWindow').window('close');
			$('#userTable').datagrid('reload');  
			$.messager.alert('提示',data.mes,'info');
		});
	}
	</script>
    
	<form id="userUpForm" method="post" style="margin:0;text-align:center;">
		<!-- 隐藏域，存放用户主键 -->
		<input type="hidden" name="userId">
		<input id="oldpwd" type="hidden" name="userPassword">
		<input type="hidden" name="userAccount" >
		<table style="width:100%; font-size:12px; border:0px solid #f0f0f0;">
			<tr>
				<td width="30%" align="right">姓名：</td>
				<td width="70%" align="left">
					<input name="userName" style="width:200" class="easyui-validatebox" required="true" validType="length[2,16]">
				</td>
			</tr>
			<tr>
				<td width="30%" align="right">密码：</td>
				<td width="70%" align="left">
					<input id="newpwd" name="userPassword" type="password" style="width:200" class="easyui-validatebox" 
					required="true" validType="chkPwd[1,32]">
				</td>
			</tr>
			<!--
			<tr>
				<td width="30%" align="right">性别：</td>
				<td width="70%" align="left">
					<input type="radio" name="userGender" value="1" />男
					<input type="radio" name="userGender" value="2" />女
				</td>
			</tr>
			<tr>
				<td width="30%" align="right">出生日期：</td>
				<td width="70%" align="left">
					<input name="userBirthday" class="Wdate" type="text" style="width:200" onclick="WdatePicker()">
				</td>
			</tr>
			-->
			<tr>
				<td width="30%" align="right">职务：</td>
				<td width="70%" align="left">
					<input name="userDuty" style="width:200" maxlength="16">
				</td>
			</tr>
			<tr>
				<td width="30%" align="right">联系电话：</td>
				<td width="70%" align="left">
					<input name="userTelephone" style="width:200" maxlength="16">
				</td>
			</tr>
			<tr>
				<td width="30%" align="right">邮件地址：</td>
				<td width="70%" align="left">
					<input name="mail" style="width:200" maxlength="32">
				</td>
			</tr>
			<tr>
				<td width="30%" align="right">QQ或微信：</td>
				<td width="70%" align="left">
					<input name="qqWeixin" style="width:200" maxlength="16">
				</td>
			</tr>
			<tr>
				<td width="30%" align="right">用户描述：</td>
				<td width="70%" align="left">
					<textarea style="font-size:12px;width:200" name="userDesc" cols="25" rows="4"></textarea>
				</td>
			</tr>
			<tr>
				<td width="30%" align="right">用户状态：</td>
				<td width="70%" align="left">
					<input type="radio" name="enable" value="1" />正常
					<input type="radio" name="enable" value="0" />禁用
				</td>
			</tr>
			<tr>
				<td width="30%" align="right">是否系统用户：</td>
				<td width="70%" align="left">
					<input type="radio" name="isSys" value="1" />是&nbsp;&nbsp;
					<input type="radio" name="isSys" value="0" />否
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="#" id="btn-back" onclick="closeWindow();" class="easyui-linkbutton" iconCls="icon-back">返回</a>
					<a href="#" id="btn-add" onclick="updateUser();" class="easyui-linkbutton" iconCls="icon-save">保存</a>
				</td>
			</tr>
		</table>
		
	</form>
	
	<div id="upTreeContent" style="display:none; position: absolute; z-index:1; background: #ffffff; border: 1px solid #808080; 
		height:200px; overflow-y:auto;">
		<ul id="upOrgTree" class="ztree" style="margin-left:5; margin-top:0; width:193px;"></ul>
	</div>
	
	</body>
	
</html>