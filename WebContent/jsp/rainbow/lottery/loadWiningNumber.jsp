<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html public "-/w3c/dtd html 4.01 transitional/en" "http://www.w3.org/tr/html4/loose.dtd">

<html>
<head>
<title>晓风彩票管理系统</title>
</head>
 <body>
 <style type="text/css">
 </style>
    
 <script type="text/javascript">

    jQuery(function($){
    	//校验账号
/* 		$.extend($.fn.validatebox.defaults.rules, {
		    chkAccount: {
		        validator: function(value,param){
	        		if(value.length < param[0]){
	        			$.fn.validatebox.defaults.rules.chkAccount.message = '账号不能少于'+param[0]+'位';
		        	}else{
		        		if(!/^[\w]+$/.test(value)){
							$.fn.validatebox.defaults.rules.chkAccount.message = '账号只能是英文字母、数字及下划线的组合';
							return false;
						}else{
							if(value.length > param[1]){
								$.fn.validatebox.defaults.rules.chkAccount.message = '账号长度不能超过'+param[1]+'位';
							}else{
								return true;
							}
						}
			        }
		        }
		    }
		}); */
    	
    	//动态生成下拉列表框
		$.getJSON("lottery/getLotteryId",function(json){
		  for(i=0;i<json.length;i++){
		  var tname=json[i].name;
		  var tid=json[i].id;
		  $("#lottery_id").append("<option value='"+tid+"'>"+tname+"</option>");
		  }
				 
		});
    	
    	//联动生成选择彩种对应的期号
		$("#lotteryId").bind("change", function() {
			//每次清空下拉列表框，以免重复添加
			$("#isuse").find("option").remove();
			var lotteryId= jQuery("#lottery_id").val();
			$.getJSON("lottery/getIsuse",$("#loadWiningNumberForm").serializeArray(),function(json){
				  for(i=0;i<json.length;i++){
				  var tisuse=json[i].Isuse;
				  $("#isuse").append("<option value='"+tisuse+"'>"+tisuse+"</option>");
				  }
				});
		});	
    });

	//添加开奖号码
	function loadWiningNumber(){
		var r = $('#loadWiningNumberForm').form('validate');
		if(!r) {
			return false;
		}
		$.post("lottery/updateWiningNumber",$("#loadWiningNumberForm").serializeArray(),function(data){
			$.messager.alert('提示',data.mes,'info');
		});
	}
	</script>
  	
  	<!-- 验证使用jquery-validation -->
	<form id="loadWiningNumberForm" method="post">
	<div style="width:98%; border:0px solid;border: 1px solid #EAEEF1;border-radius: 5px;min-height: 700px;
           font-size:12px;  margin:10px auto; min-width:1000px">
			<div style="height: 40px;line-height: 50px;color: #3977C3;padding: 0px 0px 2px 12px;
         font-weight: bold; font-size:13px;  background-color:#fdfdfd;border-bottom:1px solid #dfdfdf">录入开奖号码</div>
		<!-- 隐藏域 -->
		<input type="hidden" name="id">
		<table style="width:100%">
				<tr style="height:65px">
					<td style="width:10%; text-align:right; padding-right:10px">彩种:</td>
					<td style="width:40%; height:25px; padding:0px 5px">
					<select name="lottery_id" id="lottery_id" style="width: 140px;" class="easyui-validatebox" required="true">
					<option selected="selected" value = "">请选择彩种</option>
					</select> &nbsp;
					<select name="isuse" id="isuse" style="width: 120px;">
					<option selected="selected" value = "">请选择期号</option>
					</select></td>
				</tr>
				<tr style="height:65px">
					<td style="width:10%; text-align:right; padding-right:10px">开奖号码:</td>
					<td style="width:70%; height:25px; padding:0px 5px">
					<input id="win_lottery_number" name="win_lottery_number" style="width:290" class="easyui-validatebox" placeholder="请录入开奖号码"
					required="true" validType="chkAccount[3,22]">
					<span id="labTip" style="color: Red;">格式：01 02 03 04 05 06 + 01</span></td>
				</tr>
				<tr style="height:65px">
					<td style="width:10%; text-align:right; padding-right:10px">&nbsp;</td>
					<td>
					<a href="#" id="btnGO" onclick="loadWiningNumber();" class="easyui-linkbutton" iconCls="icon-save">保存</a>
					</td>
				</tr>
			</table>
		</div>
	</form>
	
	</body>
	
</html> 