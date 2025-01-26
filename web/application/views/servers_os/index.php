<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); ?>



	
	<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
	
	<div class="row-fluid">		
		
		<div class="tree">
			<ul id="tree_id" class="ztree"></ul>
		</div>
		<div class="flexigrid_table over-auto">
<!--			<div class="btn-group">-->
<!--				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">新增服务器资源-->
<!--					<span class="caret"></span>-->
<!--				</button>-->
<!--				<ul class="dropdown-menu" role="menu">-->
<!--					<li><a href="javascript:;" id="add_project">级别2</a></li>-->
<!--			        <li><a href="javascript:;" id="add_group">级别3</a></li>-->
<!--			        <li><a href="javascript:;" id="add_build">级别4</a></li>-->
<!--				</ul>			-->
<!--			</div>-->
		

			<table style="display:none" id="js_data_table"></table>
		</div>
		
		<div id="dialog_div_add" style="display:none" >
			<form name="dialog_form" id="dialog_form" >		
			<input type="hidden" id="os_id" name="os_id" value="">
			<table  border="0">
<!--				<tr>-->
<!--					<td>启用批量</td>-->
<!--					<td><div class="checkbox">-->
<!--						    <label>-->
<!--						      <input type="checkbox" id="is_batch" name="is_batch" >-->
<!--						    </label>-->
<!--						  </div>-->
<!--					 </td>-->
<!--					<td></td>-->
<!--					<td></td>-->
<!--					<td></td>-->
<!--					<td></td>-->
<!--				</tr>-->
				<tr>
					<td><span style="color:red">*</span>主机</td>
					<td><input type="text" id="os_host" name="os_host" value="" class="required" style="">
						<div id="menuContent" class="float-style-03  " style="top:24px;left:104px; display: none;">        						
        						<div class="over-auto" style=" height: 208px; width: 214px;max-height:203px;" id="treeContainer">
        							<ul id="js_add_dialog_host_tree" class="ztree"></ul>
        						</div>
    					  </div>
					</td>
					<td><span style="color:red">*</span>SSH端口</td>
					<td><input type="text" id="" name="port" value="22" class="digits"></td>
					<td><span style="color:red">*</span>Host标签</td>
					<td><input type="text" id="tags" name="tags" class="required" value="" ></td>
				</tr>
				<tr>
					<td>用户</td>
					<td> 
						<input type="text" id="user" name="user" value="root" class="required" style="">						
					</td>
					<td>密码</td>
					<td> 
					    <input type="password" id="password" name="password" value="" class="required" style="">						
					</td>
				
<!--					<td>私钥(RSA)</td>
					<td >
						<input type="text" name="rsa" >
					</td>-->
					<td>SNMP团体名</td>
					<td >
						<input type="text" name="community" value="public" class="" >
					</td>
				</tr>
			
				<tr>
					<td>监控</td>
					<td>
						<select name="monitor" id="monitor" class="">
				         <option value="1"  ><?php echo $this->lang->line('on'); ?></option>
				         <option value="0"  ><?php echo $this->lang->line('off'); ?></option>
				        </select>
			        </td>
				
					<td>发送邮件</td>
					<td>
						<select name="send_mail" id="send_mail" class="">
				         <option value="1"  >开</option>
				         <option value="0"  >关</option>
				        </select>
			        </td>
				
					<td>告警邮件收件人</td>
					<td>
						<input type="text" id="send_mail_to_list"  class="" placeholder="多人用分号;分隔" name="send_mail_to_list" value="" >
						
					</td>
				</tr>
				
				<tr>
					<td>发送短信</td>
					<td>
						<select name="send_sms" id="send_sms" class="">
						 <option value="1">开</option>
				         <option value="0">关</option>			         
				        </select>
					</td>
				
					<td>告警短信收件人</td>
					<td>        
					    <input type="text" id="send_sms_to_list"   placeholder="多人用分号;分隔" name="send_sms_to_list" value="" >
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>进程数告警</td>
					<td>
						<select name="alarm_os_process" id="alarm_os_process" class="">
				         <option value="1">开</option>
				         <option value="0">关</option>
				        </select>
					</td>
					
				
					<td>警告阈值 </td>
					<td><input type="text" id="threshold_warning_os_process" class="required"  placeholder="" name="threshold_warning_os_process" value="300"></td>
					<td>紧急阈值</td>
					<td><input type="text" id="threshold_critical_os_process" class="required"   placeholder="" name="threshold_critical_os_process" value="500"></td>
				</tr>
				
				<tr>
					<td>负载告警</td>
					<td>
						<select name="alarm_os_load" id="alarm_os_load" class="">
				         <option value="1">开</option>
				         <option value="0">关</option>
				        </select>
					</td>
					
				
					<td>警告阈值 </td>
					<td><input type="text" id="threshold_warning_os_load" class="required"  placeholder="" name="threshold_warning_os_load" value="3"></td>
					<td>紧急阈值</td>
					<td><input type="text" id="threshold_critical_os_load" class="required"  placeholder="" name="threshold_critical_os_load" value="10"></td>
				</tr>
				
				<tr>
					<td>网络告警</td>
					<td>
						<select name="alarm_os_network" id="alarm_os_network" class="">
				         <option value="1">开</option>
				         <option value="0">关</option>
				        </select>
					</td>
					<td>警告阈值 </td>
					<td><input type="text" id="threshold_warning_os_network" class="required"  placeholder="" name="threshold_warning_os_network" value="10">MB/s</td>
					<td>紧急阈值</td>
					<td><input type="text" id="threshold_critical_os_network" class="required"  placeholder="" name="threshold_critical_os_network" value="20">MB/s</td>
				</tr>
				
				<tr>
					<td>CPU使用率告警</td>
					<td>
						<select name="alarm_os_cpu" id="alarm_os_cpu" class="">
				         <option value="1">开</option>
				         <option value="0">关</option>
				        </select>
					</td>					
				
					<td>警告阈值 </td>
					<td><input type="text" id="threshold_warning_os_cpu" class="required"  placeholder="" name="threshold_warning_os_cpu" value="70">%</td>
					<td>紧急阈值</td>
					<td><input type="text" id="threshold_critical_os_cpu" class="required"  placeholder="" name="threshold_critical_os_cpu" value="90">%</td>
				</tr>
				
				<tr>
					<td>磁盘使用率告警</td>
					<td>
						<select name="alarm_os_disk" id="alarm_os_disk" class="">
				         <option value="1">开</option>
				         <option value="0">关</option>
				        </select>
					</td>
					
					<td>警告阈值 </td>
					<td><input type="text" id="threshold_warning_os_disk" class="required"  placeholder="" name="threshold_warning_os_disk" value="85">%</td>
					<td>紧急阈值</td>
					<td><input type="text" id="threshold_critical_os_disk" class="required"  placeholder="" name="threshold_critical_os_disk" value="90">%</td>
				
			  </tr>
			  <tr>
					
<!--					<td>过滤磁盘</td>-->
<!--					<td><input type="text" id="filter_os_disk" class="" placeholder="" name="filter_os_disk" value=""></td>-->
<!--					-->
					<td>内存使用率告警</td>
					<td>
					<select name="alarm_os_memory" id="alarm_os_memory" class="">
				         <option value="1">开</option>
				         <option value="0">关</option>
				        </select>
					</td>					
					<td>警告阈值 </td>
					<td><input type="text" id="threshold_warning_os_memory" class="required"  placeholder="" name="threshold_warning_os_memory" value="85">%</td>
					<td>紧急阈值</td>
					<td><input type="text" id="threshold_critical_os_memory" class="required"  placeholder="" name="threshold_critical_os_memory" value="95">%</td>
				</tr>
				<input type="hidden" id="flag" name="flag" value="" >
				<input type="hidden" id="web_id" name="web_id" value="" >	
				<input type="hidden" id="node_id" name="node_id" value="" >		
				<input type="hidden" id="level_2_id" name="level_2_id" value="" >	
				<input type="hidden" id="level_2_name" name="level_2_name" value="" >	
				<input type="hidden" id="level_3_id" name="level_3_id" value="" >	
				<input type="hidden" id="level_3_name" name="level_3_name" value="" >	
				<input type="hidden" id="level_4_id" name="level_4_id" value="" >
				<input type="hidden" id="level_4_name" name="level_4_name" value="" >			
				</table>
			</form>	
		</div>	
	</div>
</div>

<script type="text/javascript">

$(document).ready(function(){
	
	//初始化树
	var setting = {
			view: {
                addHoverDom: addHoverDom,
                removeHoverDom:removeHoverDom,
                selectedMulti: false
            },			
			check: {
				enable: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback:{
				onClick:zTreeOnClick,
				onRename:zTreeOnRename,
				beforeRemove: zTreeBeforeRemove
			},
			edit: {
                enable: true,
                editNameSelectAll: true
            },
            async:{enable:false}
			
				
		};
	//添加界面初始化树
	var add_setting = {
			check: {
				enable: true,
				nocheckInherit: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback:{
				
			}
				
		};
	//界面界面初始化树
	var edit_setting = {
			check: {
				enable: true,
				chkDisabledInherit: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback:{
				onCheck:edit_check
			}
				
		};
	
	function zTreeOnClick(event,treeId,treeNode)
	{
		var id_parms='';
		$('[name="check_all"]:visible').prop('checked', false);
		$('[name="level_2_id"]').val('');
		$('[name="level_3_id"]').val('');
		$('[name="level_4_id"]').val('');
		$('[name="level_2_name"]').val('');
		$('[name="level_3_name"]').val('');
		$('[name="level_4_name"]').val('');
		
		switch(treeNode.tree_level)		
		{
		
			case "1":		
				return false;
			case "2":                     
                console.log(treeNode.id);
				var level_2_id=treeNode.id;
				var level_2_name=treeNode.name;
				id_parms +='&level_2_id=' +level_2_id+'&level_2_name='+level_2_name;
				$('[name="node_id"]').val(treeNode.id);
				$('[name="level_2_id"]').val(level_2_id);
				$('[name="level_2_name"]').val(level_2_name);
				break;
			case "3":
				var level_3_id=treeNode.id;
				var level_3_name=treeNode.name;
				id_parms +='&level_3_id=' +level_3_id+'&level_3_name='+level_3_name;
				$('[name="node_id"]').val(treeNode.id);
				$('[name="level_3_id"]').val(level_3_id);
				$('[name="level_3_name"]').val(level_3_name);
				var level2_node=treeNode.getParentNode();
				$('[name="level_2_id"]').val(level2_node.id);
				$('[name="level_2_name"]').val(level2_node.name);
				break;
			case "4":
				var level_4_id=treeNode.id;
				var level_4_name=treeNode.name;
				id_parms +='&level_4_id=' +level_4_id+'&level_4_name='+level_4_name;
				$('[name="node_id"]').val(treeNode.id);
				$('[name="level_4_id"]').val(level_4_id);
				$('[name="level_4_name"]').val(level_4_name);
				
				var level3_node=treeNode.getParentNode();
				$('[name="level_3_id"]').val(level3_node.id);
				$('[name="level_3_name"]').val(level3_node.name);
				
				var level2_node=level3_node.getParentNode();
				$('[name="level_2_id"]').val(level2_node.id);
				$('[name="level_2_name"]').val(level2_node.name);
				break;
			case "5":
				id_parms +='&os_id=' +treeNode.os_id+'&host='+treeNode.name;
				$('[name="node_id"]').val('');
				break;
		}
		
		var url='/servers_os/flexigrid?event=click_tree'+id_parms;
		
		$("#js_data_table").flexOptions({newp:1,rp:25,useRp:true,url:encodeURI(url)});
		$('#js_data_table').flexReload();
		
	}
	function ajax_get_data_by_id(id=0)
	{
		if(id >0)
		{
			$.ajax({
				   type: "POST",
				   url: "/servers_os/get_server_data",
				   data: "os_id="+id,
				   dataType:'json',
				   success: function(data){
					   
					   $('[name="os_host"]').val(data.host);		   
					   $('[name="port"]').val(data.port);
					   $('[name="tags"]').val(data.tags);
					   $('[name="user"]').val(data.user);
					   $('[name="rsa"]').val(data.rsa);
					   $('[name="password"]').val(data.password);
					   $('[name="community"]').val(data.community);				 
					   $("#monitor option[value='"+data.monitor+"']").attr('selected','selected');
					   $("#send_mail option[value='"+data.send_mail+"']").attr('selected','selected');
					   $('#send_mail_to_list').val(data.send_mail_to_list);
					   $("#send_sms option[value='"+data.send_sms+"']").attr('selected','selected');
					   $('#send_sms_to_list').val(data.send_sms_to_list);
					   $("#alarm_os_process option[value='"+data.alarm_os_process+"']").attr('selected','selected');
					   $('#threshold_warning_os_process').val(data.threshold_warning_os_process);
					   $('#threshold_critical_os_process').val(data.threshold_critical_os_process);
					   $("#alarm_os_load option[value='"+data.alarm_os_load+"']").attr('selected','selected');
					   $('#threshold_warning_os_load').val(data.threshold_warning_os_load);
					   $('#threshold_critical_os_load').val(data.threshold_critical_os_load);
					   
					   $("#alarm_os_network option[value='"+data.alarm_os_network+"']").attr('selected','selected');
					   $('#threshold_warning_os_network').val(data.threshold_warning_os_network);
					   $('#threshold_critical_os_network').val(data.threshold_critical_os_network);
					   
					   $("#alarm_os_cpu option[value='"+data.alarm_os_cpu+"']").attr('selected','selected');
					   $('#threshold_warning_os_cpu').val(data.threshold_warning_os_cpu);
					   $('#threshold_critical_os_cpu').val(data.threshold_critical_os_cpu);
					   
					   $("#alarm_os_disk option[value='"+data.alarm_os_disk+"']").attr('selected','selected');
					   $('#threshold_warning_os_disk').val(data.threshold_warning_os_disk);
					   $('#threshold_critical_os_disk').val(data.threshold_critical_os_disk);
					   $('#filter_os_disk').val(data.filter_os_disk);
					   
					   $("#alarm_os_memory option[value='"+data.alarm_os_memory+"']").attr('selected','selected');
					   $('#threshold_warning_os_memory').val(data.threshold_warning_os_memory);
					   $('#threshold_critical_os_memory').val(data.threshold_critical_os_memory);
					  
				   }
				});
		}
	}
	function edit_check(event,treeId,treeNode)
	{
		 if(treeNode.os_id>0 && treeNode.checked==true)
		 {
			 ajax_get_data_by_id(treeNode.os_id);
		 }
		
	}
	//编辑树节点,回调函数必须在$.fn.zTree.init之前       
    function zTreeOnRename(event, treeId, treeNode, isCancel){
    		$.ajax({
				type:'post',
				dataType:'json',
				url:'/servers_os/tree_node?event=edit',
				data:'name='+treeNode.name+'&id='+treeNode.id,
				success:function(json)
				{
					if(json.state==true)
					{
						console.log(json);
					}
				}
			});
	}
	//树节点删除之前回调
    function zTreeBeforeRemove(treeId, treeNode) 
    {
    	if(treeNode.name =="服务器资源" ||  treeNode.tree_level ==1 || treeNode.id ==1)
      	 {
      		 Lobibox.notify('error',{msg:'根节点不能删除',delay: 2000,width: 300});
       		 return false;
      	 }else
      	 {
          	 return true;
      	 }        	 
    	     	
    }
	zNodes=<?php if($hosts_tree==true){ echo $hosts_tree ;}else{?> "";<?php }?>	
	zNodes_edit=<?php if($hosts_tree_edit==true){ echo $hosts_tree_edit ;}else{?> "";<?php }?>	
	
	$.fn.zTree.init($("#tree_id"), setting, zNodes);


	//树节点添加事件
	 var newCount = 1;	
	 function addHoverDom(treeId, treeNode) 
	 {
         var sObj = $("#" + treeNode.tId + "_span");
         if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
         var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
             + "' title='add node' onfocus='this.blur();'></span>";
         sObj.after(addStr);  
         var add_btn = $("#addBtn_"+treeNode.tId);         
         var delete_btn=$("#"+treeNode.tId+"_remove");
         //添加树节点
         if (add_btn)
         {
        	 add_btn.bind("click", function()
	         {
    	         
	        	if(treeNode.tree_level<=4)
	        	{
		        	 var tree_level=parseInt(treeNode.tree_level)+1;
		        	 var name='new_nodes'+(newCount++);
		             $.ajax({
							type:'post',
							dataType:'json',
							url:'/servers_os/tree_node?event=add',
							data:'name='+name+'&tree_level='+tree_level+'&pId='+treeNode.id+'&is_parent=1',	
							success:function(json) 
							{
								if(json.state==true)
								{
									 var zTree = $.fn.zTree.getZTreeObj("tree_id");
						             zTree.addNodes(treeNode, {id:json.id, pId:treeNode.id, name:name,tree_level:tree_level,is_parent:1,icon:json.icon});   
                                     location.reload();                                    
						             return false;
								}
							}
			             });
	        	}else if(treeNode.tree_level=5)
                {
                    Lobibox.notify('warning',{msg:'主机节点不能添加,请点击父节点',delay: 2000,width: 400});
                }
                else
	        	{
	        		Lobibox.notify('warning',{msg:'点击“新增“按钮添加服务器信息',delay: 3000,width: 400});
	        	}
	        	
	            
	         });
         }
       
         
         //删除树节点
         if(delete_btn)
         {
        	 delete_btn.bind("click", function()
        	 {
        	        	 if(treeNode.name !="服务器资源" ||  treeNode.tree_level !=1 || treeNode.id !=1)
        	        	 {
        		        	 var tree_level=parseInt(treeNode.tree_level)+1;
        		        	 var name=treeNode.name+'_new'+(newCount++);
        		             $.ajax({
        							type:'post',
        							dataType:'json',
        							url:'/servers_os/tree_node?event=delete',
        							data:'id='+treeNode.id,	
        							success:function(json) 
        							{
        								if(json.state==true)
        								{
        									Lobibox.notify('success',{msg:json.msg,delay: 2000,width: 300});
        								}else
        								{
        									Lobibox.notify('error',{msg:json.msg,delay: 2000,width: 300});
        								}
        							}
        			             });
        	        	 }else{

        	        		 return false;
        	        	 }
        	            
        	         });
         }
     };
     
     function removeHoverDom(treeId, treeNode)
     {
    	 if(treeNode.name !="服务器资源" ||  treeNode.tree_level !=1 || treeNode.id !=1)
    	 {
         	$("#addBtn_"+treeNode.tId).unbind().remove();
    	 }else
    	 {
    		 //Lobibox.notify('error',{msg:'根节点不能删除',delay: 2000,width: 300});
    	 }
     };
	
	//弹出树div
//	$('#os_host').click(function(){	
//		var flag=$('[name="flag"]').val();
//		if(flag=='add')
//		{
//			//添加界面初始化树
//			$.fn.zTree.init($("#js_add_dialog_host_tree"), add_setting, zNodes_add);
//		}else if(flag=='edit')
//		{
//			//修改界面初始化树
//			$.fn.zTree.init($("#js_add_dialog_host_tree"), edit_setting, zNodes);
//		}
//		$('#menuContent').show();
//	});

	$('#is_batch').click(function(){	
		var flag=$('[name="flag"]').val();
		var checked=$(this).prop('checked');
//		if(flag=='add')
//		{
//			//添加界面初始化树
//			//$.fn.zTree.init($("#js_add_dialog_host_tree"), add_setting, zNodes_add);
//		}
	    if(flag=='edit')
		{
			if(checked)
			{
			//修改界面初始化树
			$.fn.zTree.init($("#js_add_dialog_host_tree"), edit_setting, zNodes_edit);
			$('#menuContent').show();
			}else
			{
				$('#menuContent').hide();
			}
		}
		
	});

	
	//鼠标移开menuContent div 选择checbox获取os_id
	$("#menuContent").mouseleave(function(){
		  var treeObj = $.fn.zTree.getZTreeObj("js_add_dialog_host_tree");
		  var nodes = treeObj.getCheckedNodes(true);
		  if(nodes.length>0)
		  {
			  var str='';			
			  var num=0;
			  var name='';
			  var arr=new Array();
			  for(var i=0;i<nodes.length;i++)
			  {
				  
				  if(nodes[i].tree_level>=5)
				  {
					  if(nodes[i].os_id>0)
					  {
						  num+=1;
						  if(str=='')
						  {
							  name=nodes[i].name;
							  str=nodes[i].os_id;
							 
						  }else
						  {
							  name+=','+nodes[i].name;
							  str+=','+nodes[i].os_id;							  
							 
						  }
					  }
				  }
			  }
			  if(num>0)
			  {
				  $('#os_id').val(str);
				  $('#os_host').val(name);			 
				  $('#menuContent').css('display','none');				  
			  }			  
		  }
		  
		});
	
			//初始化flexigrid表格数据	
            $("#js_data_table").flexigrid({            
	            url:"/servers_os/flexigrid?event=index",
	            dataType: 'json',
	            colModel : [
					 {display: '<input type="checkbox" name="check_all" id="check_all_id">',name:'select',width:30,sortable:false,align:'left'},
					 {display: '主机',name:'host',width:80,sortable:true,align:'left'},
					 {display: 'ssh端口',name:'port',width:50,sortable:false,align:'left'},
					 {display: '用户名',name:'user',width:50,sortable:false,align:'left'},
					 {display: '标签',name:'tags',width:80,sortable:false,align:'left'},					 
					 {display: '监控状态',name:'monitor',width:50,sortable:true,align:'left'},
					 {display: '发送邮件',name:'send_mail',width:50,sortable:true,align:'left'},
					 {display: '发送短信',name:'send_sms',width:50,sortable:true,align:'left'},
					 {display: '进程数',name:'alarm_os_process',width:50,sortable:true,align:'left'},
					 {display: '负载',name:'alarm_os_load',width:50,sortable:true,align:'left'},
					 {display: 'CPU',name:'alarm_os_cpu',width:50,sortable:true,align:'left'},
					 {display: '网络',name:'alarm_os_network',width:50,sortable:true,align:'left'},
					 {display: '磁盘',name:'alarm_os_disk',width:50,sortable:true,align:'left'},
					 {display: '内存',name:'alarm_os_memory',width:50,sortable:true,align:'left'}			 
	            ],
	            searchitems:[
						{display: '主机',name: 'host',isdefault:true },  
						{display: '标签',name: 'tags'}
				],
				buttons:[
						{name: '新增', bclass: 'add',onpress:opt},
						{name: '修改', bclass: 'edit',onpress:opt},
						{name: '删除', bclass: 'delete',onpress:opt},
						{separator:true}
	            ],
				sortname: "id",
				sortorder: "asc",
	            usepager : true,
	            useRp : false,
	            rp: 20,            
	            showcheckbox : false,
	            showTableToggleBtn : true,
	            singleSelect: true,		
	            height: $(document).height()-285,           
	            width:"auto",
	            showTableToggleBtn: true,
	            procmsg: '加载中, 请稍等 ...',
	            errormsg: '暂无数据'
            
                
    	});
        	
        //flexigrid实现全选
		$(document).on('click','#check_all_id',function(){
			if(this.checked)
			{
				$("#js_data_table  [name='chk']").each(function(){
					$(this).prop('checked',true);
				})
			}else
			{
				$("#js_data_table  [name='chk']").each(function(){
					$(this).prop('checked',false);
				})
			}
			
		});
		//flexigrid实现单选
		$(document).on('click','#js_data_table tr',function(e){
			//根据单击返回的dom元素判断input还是div
			targetDomName=e.target.tagName;
			var checkbox=$(this).find('[name="chk"]');	
			if(targetDomName=='INPUT')
			{
				if(checkbox.prop('checked')==true)
				{
					checkbox.prop('checked',true);
					$(this).addClass('trSelected');
				}else
				{
					checkbox.prop('checked',false);
					$(this).removeClass('trSelected');
				}
			}else
			{
				if(checkbox.prop('checked')==true)
				{
					checkbox.prop('checked',false);
					$(this).removeClass('trSelected');
				}else
				{
					checkbox.prop('checked',true);
					$(this).addClass('trSelected');
				}
				
			}

			//处理选中所有行时，自动选中全选框
			var chk_total_num=0;
			var chk_check_num=0;
			chk_total_num=$('#js_data_table tr input[name="chk"]:checked').length;
			chk_check_num=$('#js_data_table  tr input[name="chk"]').not(':disabled').length;	
			if(chk_total_num == chk_check_num)
			{
				//flexigrid有个隐藏name="check_all"所以筛选可见dom元素
				$('[name="check_all"]:visible').prop('checked', true);
			}
			else
			{
				$('[name="check_all"]:visible').prop('checked', false);
			}
			
		});
		//flexigrid 搜索
		$(document).on('click','[name="qsubmitbtn"]',function(){				
				var query='';var qtype='';
				query=$('[name="q"]').val();			
				qtype=$('[name="qtype"]').val();
				
					url='/servers_os/flexigrid?event=search';				
//					var data1 = {name:'search_name',value:qtype};
//					var data2 = {name:'search_value',value:query};					
					$('#js_data_table').flexOptions({
						url:url,
						//params : [data1,data2],
					    newp:1,
					    qtype : qtype,
					    query : query,
					    }).flexReload(); 
					
				
				
		});
		//清除搜索的内容
		$(document).on('click','[name="qclearbtn"]',function(){
			$('[name="q"]').val('');
		});
			//按钮点击触发事件
            function opt(name,grid)
            {
            	switch(name)
            	{
            		case '新增': 
                        
                		if($('[name="node_id"]').val())
                		{
	                		$('[name="flag"]').val('add');
	            			$('#dialog_div_add').dialog('open');
                		}else
                		{
                			Lobibox.notify('warning',{msg:'选择服务器资源下父节点',delay: 4000,width: 400});
                    		return false;
                		}
            		break;
            		case '修改':
            			$('[name="flag"]').val('edit');
            			
            			var os_id=$('#js_data_table .trSelected').find('[name="chk"]').val();
            			if(typeof(os_id) !='undefined' && os_id>0 )
            			{
                			$('#os_id').val(os_id);
                			ajax_get_data_by_id(os_id);
            				$('#dialog_div_add').dialog('open');
            			}else
            			{
            				Lobibox.notify('warning',{msg:'先选择修改的行',delay: 4000,width: 400});
                    		return false;
            			}
			        	console.log(os_id);
            			
            		break;
            		case  '删除':
                		var os_id='';
            			$("#js_data_table  [name='chk']:visible").each(function(){
        					if($(this).prop('checked'))
        					{
            					if(os_id !='')
            					{
            						os_id+=','+$(this).val();
            						
            					}else
            					{
            						os_id=$(this).val();
            					}
        					}
        				});
        				if(os_id !='')
        				{
            				$.ajax({
									type:'post',
									data:'os_id='+os_id,
									dataType: "json",										
									url:'/servers_os/delete',
									success:function(json)
									{
										$('[name="check_all"]').prop('checked',false);
										if(json.status==true)
										{
											Lobibox.notify('success',{msg:json.msg,delay: 2000,width: 200,height:200});
										}else
										{
											Lobibox.notify('error',{msg:json.msg,delay: 2000,width: 200});
										}
										$('#js_data_table').flexReload();
									}
                				});
        				}else
        				{
        					Lobibox.notify('warning',{msg:'请选择行,再执行删除',delay: 3000,width: 300});	
        					return false;
        				}
            			break;
            	}
            	
            }
       
	/**
	* 添加/修改对话框
	*/
	$('#dialog_div_add').dialog({
		hide:false,
		autoOpen:false,
		width:1050,
		modal:true,
		title:'新增/修改(按域名进行单个、批量添加与修改)',
		draggable: true,
		overlay:{
				opacity:0.5,
				background:'black'
			},
			buttons: [{
		        id:"btn-confirm",
		        text:"提交",
		        click:function(){
			        	var flag=$('[name="flag"]').val();
			        	if(flag=='add')
			        	{			        	
				        	if ( $('#dialog_form').valid() == true ) 
					        {
				        		$('#dialog_form').ajaxSubmit({		
				        			url:"/servers_os/add",
				        			type:'post',
				        			dataType:'json',
				        			resetForm:true,			
				        			success:function(data){
				        				if(data.status){		
				        					Lobibox.notify('success',{msg: data.msg});		
				        					$('#js_data_table').flexReload();
				        					var treeObj = $.fn.zTree.getZTreeObj("tree_id");
				        					treeObj.refresh();
				        					//$.fn.zTree.init($("#js_add_dialog_host_tree"), add_setting, zNodes);
				        					//$('#dialog_div_add').dialog('close');				
				        				}else
				        				{
				        					Lobibox.notify('error', {msg: data.msg});
				        					return false;
				        				}
				        			},
				        			error:function(){}	
				        			
				        		});
					        	
				        	}
			        	}else if(flag=='edit')
			        	{
				        	
			        		
			        		if ( $('#dialog_form').valid() == true ) 
					        {			        		
			        			
						        if($('#os_id').val() !='')
						        {
					        		$('#dialog_form').ajaxSubmit({		
					        			url:"/servers_os/edit",
					        			type:'post',
					        			dataType:'json',
					        			resetForm:true,			
					        			success:function(data){
					        				if(data.status){		
					        					Lobibox.notify('success',{msg: data.msg});		
					        					$('#js_data_table').flexReload();
					        					$.fn.zTree.init($("#js_add_dialog_host_tree"), edit_setting, zNodes_edit);
					        					$('#dialog_div_add').dialog('close');				
					        				}else
					        				{
					        					Lobibox.notify('error', {msg: data.msg});	
					        					return false;
					        				}
					        			},
					        			error:function(){}	
					        			
					        		});
						        }else
						        {
						        	Lobibox.notify('error', {msg: '选择主机'});	
		        					return false;
						        }
					        	
				        	}
			        	}
				        	
			        }
		    },{
		        id: "btn-close",
		        text:"关闭", 
		        click: function(){
		        	    $('#os_id').val('');
					    $('#os_host').val('');	
				        $(this).dialog('close');
				        location.reload();				  
				       // $('#js_data_table').flexReload();
			        }     
		   }]
		
	});

	$(document).on('mouseleave','[name="domain"]',function(){
		
		var domain='';var os_id='';var old_domain='';
		os_id=$('[name="os_id"]').val();		
		domain=$(this).val();
		old_domain=$(this).attr('old_domain');
		if(old_domain != domain)
		{
			if(domain !='')
			{
				$.ajax({
					type:'POST',
					dataType:'json',
					url:'/servers_os/domain_host',
					data:'domain='+domain+'&os_id='+os_id,
					success:function(json){
							if(json.status=='exists')
							{
								$('[name="domain"]:visible').attr('value','');
								Lobibox.notify('error', {msg:json.msg,width:600,delay:6000});
								return false;
							}
						}
				});
			}
		}
	});


	
        	
});




</script>