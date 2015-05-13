<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp" %>
<!doctype html public "-/w3c/dtd html 4.01 transitional/en" "http://www.w3.org/tr/html4/loose.dtd">
<%
String userAcc = request.getSession().getAttribute("userAccount").toString();
String userName = request.getSession().getAttribute("userName").toString();
%>
<html>
<head>
    <title>晓风彩票系统管理软件</title>  
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="Simple">
	
	<style type="text/css">
    .table
    {
    	font-size:13px;
    }
    
    </style>
    
    <SCRIPT type="text/javascript">
    
    jQuery.ajaxSetup({cache:false});//ajax不缓存
    
    $(function (){
		//菜单树参数设定
    	var menuTreeSetting = {
      		async : {
      		  	enable : true, 				//设置 zTree是否开启异步加载模式
      		  	url : "menu/getUserMenu", 	//Ajax 获取数据的 URL 地址
      		  	autoParam : [ "id" ]		//异步加载时自动提交父节点属性的参数,假设父节点 node = {id:1, name:"test"}，异步加载时，提交参数 zId=1
      		},
      		data:{ //必须使用data
      		  	simpleData : {
      		  		enable : true,
      		  		idKey : "id", 	//id编号命名 默认
      		  		pIdKey : "pId", //父id编号命名 默认
      		  		rootPId : 0 	//用于修正根节点父节点数据，即 pIdKey 指定的属性值
      		  	}
      		},
      		//回调函数
      		callback : {
      		  	//单击树形菜单，打开新页面至tab页中(此处将资源url放在了[title]属性中,放在[url]属性中时会打开两遍url连接)
      		  	onClick : function(event, treeId, treeNode, clickFlag) {
      		  		var zTree = $.fn.zTree.getZTreeObj("menuTree");
    	        	var nodes = zTree.getSelectedNodes();
    	        	if(nodes[0].title != undefined){
    		        	var param = nodes[0].title.split("_");
    		        	param[1] = '${ctx}'+param[1];
    		        	if(param[0] == "i"){
    			        	//将iframe添加到tab页中(适用于页面较复杂的刷新页面)
    		        		var iframe = document.createElement("iframe");
    		        		iframe.src = param[1];  
    		            	iframe.frameBorder = 0;   
    		            	iframe.height = '100%';   
    		            	iframe.width = '100%'; 
    		        		OpenIframe(nodes[0].name, iframe);
    			    	}else if (param[0] == "a") {
    				    	//将url添加到tab页中(适用于Ajax不刷新页面)
    			    		OpenAjax(nodes[0].name, param[1]);
    					}
    		    	}
      		  	},
      			//捕获异步加载出现异常错误的事件回调函数 和 成功的回调函数
      			onAsyncError : function(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {  
      		  		alert("加载错误：" + XMLHttpRequest);  
      			},
      		  	onAsyncSuccess : function(event, treeId, treeNode, msg){
      		  		//alert("加载成功!");
      		  		var zTree = $.fn.zTree.getZTreeObj("menuTree");
      		  		zTree.expandAll(true);//展开全部菜单
      		  	}
      		}
      	};

    	//在右边center区域打开菜单，新增tab(Iframe方式)
	    function OpenIframe(text, iframe) {
	        if ($("#tabs").tabs('exists', text)) {
	            $('#tabs').tabs('select', text);
	        } else {
	            $('#tabs').tabs('add', {
	                title : text,
	                closable : true,
	                content : iframe
	            });
	        }
	    };

		//在右边center区域打开菜单，新增tab(Ajax方式)
	    function OpenAjax(text, url) {
	        if ($("#tabs").tabs('exists', text)) {
	            $('#tabs').tabs('select', text);
	        } else {
	            $('#tabs').tabs('add', {
	                title : text,
	                closable : true,
	                href : url
	            });
	        }
	    };
	    
	    //绑定tabs的右键菜单
	    $("#tabs").tabs({
	        onContextMenu : function (e, title) {
	            e.preventDefault();
	            $('#tabsMenu').menu('show', {
	                left : e.pageX,
	                top : e.pageY
	            }).data("tabTitle", title);
	        }
	    });
	    
	    //实例化menu的onClick事件
	    $("#tabsMenu").menu({
	        onClick : function (item) {
	            CloseTab(this, item.name);
	        }
	    });
	    
	    //几个关闭事件的实现
	    function CloseTab(menu, type) {
	        var curTabTitle = $(menu).data("tabTitle");
	        var tabs = $("#tabs");
	        
	        if (type === "close") {
	            tabs.tabs("close", curTabTitle);
	            return;
	        }
	        
	        var allTabs = tabs.tabs("tabs");
	        var closeTabsTitle = [];
	        
	        $.each(allTabs, function () {
	            var opt = $(this).panel("options");
	            if (opt.closable && opt.title != curTabTitle && type === "Other") {
	                closeTabsTitle.push(opt.title);
	            } else if (opt.closable && type === "All") {
	                closeTabsTitle.push(opt.title);
	            }
	        });
	        
	        for (var i = 0; i < closeTabsTitle.length; i++) {
	            tabs.tabs("close", closeTabsTitle[i]);
	        }
	    };

		$(document).ready(function(){
			//加载菜单树
			$.fn.zTree.init($("#menuTree"), menuTreeSetting);
		});
    });

	//弹出窗口
	function showWindow(options){
		jQuery("#myPopWindow").window(options);
	}
	
	//关闭弹出窗口
	function closeWindow(){
		$("#myPopWindow").window('close');
	}
	//定时器，定时查询
	/* window.onload=function(){	
		var timeId = setInterval("checkSessionTimeout()",(1000*0.5+500));
	}; */
	function checkSessionTimeout(){
		$.post('checkSessionTimeout',function(data){
		 alert("hello kitty!");
			var flag = data.flag;
			if(flag == 'yes'){
				clearInterval(timeId);
				alert('由于长时间没有刷新页面，请重新登录!');
				$.post('logOff');
				
			}
		});
		
	}
	</SCRIPT>
    
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height:62px;">
    	<table class="table" width="100%" height="62px" border="0px" cellspacing="0px">
    		<tr >
     			<td width="25%" align="left" valign="middle" style="background: url('${ctx}/resources/image/header_bg.png') repeat-x;">
    			<img  src="${ctx}/resources/image/logo.png"> 
    			</td>
    			
    			<td width="25%" align="left" valign="middle" style="background: url('${ctx}/resources/image/header_bg.png')">
    			<font align="left" style="FONT-SIZE: 28px;color:BLACK;font-family:楷体;">晓风彩票后台管理软件</font>
     			</td>
     			<td width="35%" align="right" valign="middle" style="background: url('${ctx}/resources/image/header_bg.png')">
     				<font style="FONT-SIZE: 18px;color:BLACK;font-family:楷体;">当前登录用户：<%=userAcc%> [<%=userName%>]</font>
     			</td>
     			<td width="10%" align="right" valign="middle" style="background: url('${ctx}/resources/image/header_bg.png')">
     				<a href="${ctx}/logout">
						<img border="0" src="${ctx}/resources/image/icon/icon-exit.png" alt="退出系统" />
					</a>
     			</td>
     			<td width="5%" align="left" valign="middle" style="background: url('${ctx}/resources/image/header_bg.png')">
     				<a href="${ctx}/logout" style="text-decoration: none;">
     					<font style="FONT-SIZE: 13px;color:BLACK;font-family:楷体;">退出系统</font>
     				</a>
     			</td>
     		</tr>
    	</table>
    </div>
    
    <div data-options="region:'west',split:true" title="导航菜单" style="width:200px;background-color:#EEF2FB ">
    	<div style="background-color: :#EEF2FB">
			<ul id="menuTree" class="ztree"></ul>
		</div>
    </div>
    
    <div data-options="region:'center'" style="background-color: #EEF2FB ">
    	<div class="easyui-tabs" fit="true" border="false" id="tabs">
      		<div title="首页" style="background: url('${ctx}/resources/image/main_bg.png'); background-repeat: repeat-y;" >
      			<%-- <ul class="tx">
      				<img src="${ctx}/resources/image/main_bg.png"> 
      			</ul>	 --%>
      		</div>
    	</div>
    </div>
    
    <div id="tabsMenu" class="easyui-menu" style="width:120px;">  
    	<div name="close">关闭</div>  
    	<div name="Other">关闭其他</div>  
    	<div name="All">关闭所有</div>
  	</div>
  	
  	<div id="myPopWindow" modal="true" shadow="false" minimizable="false" cache="false" maximizable="false" 
  		collapsible="false" resizable="false" style="margin: 0px;padding: 0px;overflow: auto;">
  	</div>
  	
	<div id="myPop2Window" modal="true" shadow="false" minimizable="false" cache="false" maximizable="false" 
	  	collapsible="false" resizable="false" style="margin: 0px;padding: 0px;overflow: auto;">
	</div>
  
</body>
</html>