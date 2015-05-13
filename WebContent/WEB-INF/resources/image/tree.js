	jQuery.ajaxSetup( {
		cache : false
	});//ajax不缓存
var wzTree;
		var setting ={
						async : {
							enable : true, //设置 zTree是否开启异步加载模式
							url : "domain/getDomainByAsync", //Ajax 获取数据的 URL 地址
							autoParam : [ "id=id" ]
						//异步加载时自动提交父节点属性的参数,假设父节点 node = {id:1, name:"test"}，异步加载时，提交参数 zId=1
						},
						data : { //必须使用data
							simpleData : {
								enable : true,
								idKey : "id", //id编号命名 默认
								pIdKey : "pId", //父id编号命名 默认
								rootPId : 1
							//用于修正根节点父节点数据，即 pIdKey 指定的属性值
							}
						},
						edit: {
							enable: true
						},
						callback : {
							onRightClick : function(event, treeId, treeNode) {
												wzTree.selectNode(treeNode);
												showRightMenu(treeNode, {
													x : event.clientX,
													y : event.clientY
												});
											},
								 onClick : zTreeOnClick
						}												
			};
		
		
		function zTreeOnClick(event, treeId, treeNode) {
		  if(treeNode.level==0){
		  hideItem(["#modelForm","#modelNumberForm","#r_dg","#qb"]);
			  rootInfo();
			  }
		  if(treeNode.level==1){
			  hideItem(["#rootForm","#modelNumberForm","#r_dg","#qb"]);
			  modelPlayTime();
			  }
		  if(treeNode.level==2){
			  hideItem(["#rootForm","#modelForm","#r_dg","#qb"]);
			  modelNumber();
			  }
		  if(treeNode.level==3){
			  hideItem(["#rootForm","#modelForm","#modelNumberForm"]);
				  modellistInfo(treeNode.name);
				  }
		  
		};
		 function  showRightMenu(treeNode,postionJson){
					//设置右键菜单的位置
		            $("#rMenu").css({
		                top:postionJson.y + "px",
		                left:postionJson.x + "px",
		                display:"block"
		            });
		            if(treeNode.id==1){//如果是根节点则禁用“删除”、“修改名称”选项
		            	showItem(["#r_addFolder","#r_addNode"]);
		            }else if(treeNode.isParent){//如果是文件夹节点，则显示所有菜单选项
		            	showItem(["#r_addFolder","#r_addNode","#r_updateNode","#r_deleteNode"]);
		            }else{//此选项为节点，则禁用“增加节点”、“增加文件夹”选项
		            	showItem(["#r_deleteNode","#r_updateNode"]);
		            } 
		            $("body").bind("mousedown", onBodyMouseDown);           
		        }
		//显示某些域
		function showItem(itemArray){
	            for(var i = 0; i<itemArray.length; i++){
	                $(itemArray[i]).show();
	            }
	        }
        // 隐藏某些域
		function hideItem(itemArray) {
			   if(itemArray==undefined){//如果为传入值，则禁用缺省的域
	                hideItem(["#rMenu","#r_addFolder","#r_addNode","#r_updateNode","#r_deleteNode"]);
	            }else {
	            for(var i = 0; i<itemArray.length; i++){
	                $(itemArray[i]).hide();
	            	}
	            }
	         $("body").unbind("mousedown", onBodyMouseDown);
		  }
		//鼠标点击别处时，隐藏右键菜单
		function onBodyMouseDown(event){
			if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
				hideItem();
			}
		}
		//绑定click事件
       function bindClick(obj,fn){
	        obj.unbind("click");
	        obj.bind("click",fn);
		  }	
		//添加节点，其中flag 0表示添加文件夹，1表示节点
       function addTreeNode(flag) {
    	   hideItem();
    	   var folderName = window.prompt("请输入节点的名称");
			var url="domain/addTreeNode";
			var getIdUrl="domain/getId";
			var nodeId=zTreeOption(getIdUrl,null).nodeId;
    	   var sNode=wzTree.getSelectedNodes()[0];
    	   if(''==folderName){
        	   alert("请输入节点名称");
        	   return ;
        	   }
    	   if(flag=="0"){
    		   var newNode = {id:nodeId,pId:sNode.id,name:folderName,isParent:true,level:sNode.level+1,zAsync:false};
        	   }
    	   else{
        		var newNode = {id:nodeId,pId:sNode.id,name:folderName,isParent:false,level:sNode.level+1};
            	}
			if (wzTree.getSelectedNodes()[0]) {
				newNode.checked = sNode.checked;
				wzTree.addNodes(sNode, newNode,true);
				zTreeOption(url, newNode);
				} 
			else{
			//	wzTree.addNodes(null, newNode);
				alert("请选择一个节点进行添加");
				return ;
			}
		 }
		//编辑当前选中节点
       function editTreeNode() {
    	 	   hideItem();
		   var url="domain/updateTreeNode";
    	   var sNode=wzTree.getSelectedNodes()[0];
    	   var folderName = window.prompt("请输入要修改后的名称",sNode.name);
    	   sNode.name=folderName;
    	   wzTree.updateNode(sNode);
    	   zTreeOption(url, sNode);
		}
		//删除节点
       function deleteTreeNode() {
    	   hideItem();
    	   var sNode=wzTree.getSelectedNodes()[0];
    	   if(sNode.isParent){
    			alert("不能删除父节点");
    				return ;
        	   }
    	   else{
           	   wzTree.removeNode(sNode);
            	}
			var url="domain/deleteTreeNode";
			 zTreeOption(url, sNode);
		}
		//后台交互
       function zTreeOption(url, backParams){
	    	   var tempdata ;
	    	   $.ajax({
		    	   async: false,
		    	   url: url,
		    	   type: 'post', 
		    	   dataType: 'json',
		    	   data: backParams,
		    	   success: function(data) { 
		    	 		  tempdata = data; 
		    	  		 }
	    	   });
	    	   return tempdata;
    	   }
		//渲染
		$(document).ready(function() {
			wzTree=$.fn.zTree.init($("#orgTree"), setting);

		});