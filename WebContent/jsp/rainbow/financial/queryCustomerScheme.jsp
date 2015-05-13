<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 用户中奖方案查询 -->
<script type="text/javascript">
jQuery.ajaxSetup({cache:false});//ajax不缓存

jQuery(function($){
	document.getElementById("");
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>中奖方案</title>
</head>
<body>
 <form id="customerSchme" method="post" style="margin:0;text-align: center;">
		<table class="table" width="100%" height="100%" border="0px"  style="background-color: #EEF2FB" >
			<tr>
				<td align="left"><a style="color:blue">&nbsp;&nbsp;&nbsp;用户中奖方案</a></td>
				<td></td>
			</tr>
			<tr>
				<td align="right"><a style="color:red"></a>用户名:</td>
				<td align="left">
					<input id="name" name="name" disabled style="width:200;">
				</td>
				<td align="right"><a style="color:red">*</a>电子邮箱：</td>
				<td align="left">
					<input id="email" disabled name="email" style="width:200">
				</td>
			</tr>
			<tr>
				
				<td align="right">
					<input id="email_valid" name="email_valid" type="checkbox">
				</td>
				<td align="left"><a style="color:red"></a>已通过验证</td>
			</tr>
			<tr>
				<td align="left"><a style="color:blue">1、投注信息及投注密码：</a></td>
				<td></td>
			</tr>
			<tr>
				<td align="right">真是姓名：</td>
				<td align="left" >
					<input disabled name="reality_name" style="width:200;">
				</td>
			
				<td align="right">身份证号：</td>
				<td align="left"><input name="id_card_number" disabled
					style="width: 200;"/></td>
			</tr>
			<tr>
				<td align="right">省份：</td>
				<td align="left"><input name="province" style="width: 200;"  disabled class="easyui-combobox" /></td>
				<td align="right">城市：</td>
				<td align="left"><input name="city" style="width: 200;" disabled class="easyui-combobox" /></td>
			</tr>
			<tr>
				<td align="left"><a style="color:blue">2、联系方式和个人信息：</a></td>
				<td></td>
			</tr>
			<tr>
				<td align="right">联系电话：</td>
				<td align="left"><input name="telphone" disabled="disabled" style="width: 200;"/></td>
				<td align="right">手机号码：</td>
				<td align="left"><input name="mobile" disabled="disabled" style="width: 200;"/></td>
			</tr>
			<tr>
				
				<td align="right">
					<input id="isMobileAccept" name="mobile_valid" type="checkbox">
				</td>
				<td align="left"><a style="color:red"></a>已通过验证</td>
			</tr>
			<tr>
				<td align="right">QQ号码：</td>
				<td align="left"><input name="qq" disabled="disabled" style="width: 200;"/></td>
				<td align="right">联系地址：</td>
				<td align="left"><input name="address" disabled="disabled" style="width: 200;"/></td>
			</tr>
			<tr>
				<td align="right">性别：</td>
				<td align="left">
					<table>
						<tr>
							<td><input type="radio" name="sex"/>男</td>
							<td><input type="radio" name="sex"/>女</td>
						</tr>
					</table>
				</td>
				<td align="right">生日：</td>
				<td align="left"><input name="birthday" disabled="disabled" style="width: 200;"/></td>
			</tr>
			<tr>
				<td align="left"><a style="color:blue">3、银行卡信息：</a></td>
				<td></td>
			</tr>
			<tr>
				<td align="right">银行所在省份：</td>
				<td align="left"><input name="province" disabled="disabled" style="width: 200;" class="easyui-combobox"/></td>
				<td align="right">银行所在城市：</td>
				<td align="left"><input name="city" disabled="disabled" style="width: 200;" class="easyui-combobox"/></td>
			</tr>
			<tr>
				<td align="right">发卡行：</td>
				<td align="left"><input name="bank_name" disabled="disabled" style="width: 200;" class="easyui-combobox"/></td>
				<td align="right">支行信息：</td>
				<td align="left"><input name="BankBranch" disabled="disabled" style="width: 200;" class="easyui-combobox"/></td>
			</tr>
			<tr>
				<td align="right">银行卡号：</td>
				<td align="left"><input name="bank_card_number" disabled="disabled" style="width: 200;"/></td>
				<td align="right">持卡人姓名：</td>
				<td align="left"><input name="reality_name" disabled="disabled" style="width: 200;" /></td>
			</tr>
			<tr>
				<td align="left"><a style="color:blue">4、其他信息：</a></td>
				<td></td>
			</tr>
				<tr>
				<td align="right">购彩积分：</td>
				<td align="left">
					<table>
						<tr>
							<td><input name="scoring" disabled="disabled" style="width: 100;"/></td>
							<td>&nbsp;&nbsp;分/元</td>
						</tr>
					</table>
				</td>
				<td align="right">下级购彩积分：</td>
				<td align="left">
					<table>
						<tr>
							<td><input name="LowScore" disabled="disabled" style="width: 100;"/></td>
							<td>&nbsp;&nbsp;分/元</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right">
					<input id="privacy" name="privacy" type="checkbox">
				</td>
				<td align="left"><a style="color:red"></a>用户资料保密</td>
				<td align="right">
					<input id="isAllowLogin" name="isAllowLogin" type="checkbox">
				</td>
				<td align="left"><a style="color:red"></a>允许登录</td>
			</tr>
			<tr></tr>
			<tr>
				<td colspan="2" align="right">
					<a href="#" id="btn-back" onclick="closeWindow();" class="easyui-linkbutton" iconCls="icon-back">返回</a>
				</td> 
				<td colspan="2" align="left" >
					<a href="#" id="btn-no" onclick="closeWindow();" class="easyui-linkbutton" iconCls="icon-no">关闭</a>
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>