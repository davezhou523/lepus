<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); ?>

<!--<div class="header">  -->
<!--            <h1 class="page-title">WEB配置</h1>-->
<!--</div>-->
     
<!--<ul class="breadcrumb">
            <li><a href="<?php echo site_url(); ?>"><?php echo $this->lang->line('home'); ?></a> <span class="divider">/</span></li>
            <li class="active"><?php echo $this->lang->line('_Servers Configure'); ?></li><span class="divider">/</span></li>
            <li class="active"><?php echo $this->lang->line('_web'); ?></li>
</ul>

-->
	<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
	
	<div class="row-fluid">

		<!--<div class="btn-toolbar">
		    <a class="btn btn-primary " href="<?php echo site_url('servers_web/add') ?>"><i class="icon-plus"></i> <?php echo $this->lang->line('add'); ?></a>
		     <a class="btn btn-primary " href="<?php echo site_url('servers_web/batch_add') ?>"><i class="icon-plus"></i> <?php echo $this->lang->line('batch_add'); ?></a>
		    <a class="btn btn " href="<?php echo site_url('servers_web/trash') ?>"><i class="icon-trash"></i> <?php echo $this->lang->line('trash'); ?></a>
		</div>	
		
		--><div class="tree">
			<ul id="tree_id" class="ztree"></ul>
		</div>
		<div class="flexigrid_table over-auto">
			<table style="display:none" id="js_data_table"></table>
		</div>
		<div id="dialog_div_add" style="display:none" >
			<form name="dialog_form" id="dialog_form" >		
			<input type="hidden" id="os_id" name="os_id" value="">
			<table  border="0">
				<tr>
					<td>web主机</td>
					<td>
						<input type="text" id="os_host" name="os_host" value="" class="required">
						 <div id="menuContent" class="float-style-03  " style="top: 37px; left: 104px; display: none;">        						
        						<div class="over-auto" style=" height: 208px; width: 214px;max-height:203px;" id="treeContainer">
        							<ul id="js_add_dialog_host_tree" class="ztree"></ul>
        						</div>
    					  </div>
	        		</td>        		
					<td><span style="color:red">*</span>web端口</td>
					<td><input type="text" id="" name="port" value="80" class="digits"><td>
				</tr>
				<tr>
					<td><span style="color:red">*</span>web标签</td>
					<td>
					<input type="text" id="tags" name="tags" value="" >
					</td>
					<td>web服务器名称</td>
					<td> 
						<select name="web_name" id="web_name" class="" style=" width: 215px;">
			        	<?php foreach ($web_name as $key=>$value){?>
			         		<option value="<?php echo $key?>"><?php echo $value; ?></option>
			       		<?php }?>
			        	</select>
	        		</td>
				</tr>
				<tr>
					<td>域名</td>
					<td><input type="text" id="domain" class="required"  name="domain" placeholder="xx.com" value="" ></td>
					<td>访问日志收集频率</td>
					<td>
						<select name="frequency_monitor" id="frequency_monitor" class="" style=" width: 215px;">
	        			<?php foreach ($frequency_monitor as $key=>$value){?>
	         				<option value="<?php echo $key?>"><?php echo $value; ?></option>
	       				<?php }?>
	        			</select>
	        		</td>
				</tr>
				<tr>
					<td>访问日志路径</td>
					<td> <input type="text" id="web_access_path"  name="web_access_path" value="" ></td>
					<td>访问日志文件名</td>
					<td>
					<input type="text" id="web_access_name" class="" placeholder="xx.com_access_" name="web_access_name" value="" >
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>访问日志规则</td>
	    			<td><input type="text" id="web_log_rules" class="" placeholder="%Y%m%d" name="web_log_rules" value="" ></td>
	    			<td>访问日志扩展名</td>
	    			<td><input type="text" id="log_extend_name" class="" placeholder=".log" name="log_extend_name" value="" ></td>
				</tr>
				<tr>
					<td>错误日志路径</td>
					<td>
						<input type="text" id="web_error_path"  name="web_error_path" value="" >
	    			</td>
	    			<td>
	    				错误日志文件名
	    			</td>
	    			<td>
	    			<input type="text" id="web_error_name" class="" placeholder="xx.com_error_" name="web_error_name" value="" >
	    			</td>
	    		</tr>
	    		<tr>
					<td>错误日志规则</td>
					<td><input type="text" id="web_error_log_rules" class="" placeholder="%Y%m%d" name="web_error_log_rules" value="" ></td>
					<td>错误日志扩展名</td>
					<td>
						<input type="text" id="log_error_extend_name" class="" placeholder=".log" name="log_error_extend_name" value="" >
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
				</tr>	
				
				<tr>
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
				</tr>
				
				<tr>
					<td><span style="color:red">*</span>告警web进程数</td>
					<td><input type="text" id="alarm_process" class="digits"  name="alarm_process" placeholder="" value="200" ></td>
				
					<td><span style="color:red">*</span>单个web进程内存阈值(MB)</td>
					<td><input type="text" id="alarm_process_mem"  class="digits" name="alarm_process_mem" placeholder="" value="100" style=""></td>
				</tr>
				<input type="hidden" id="flag" name="flag" value="" >
				<input type="hidden" id="web_id" name="web_id" value="" >				
				</table>
			</form>	
		</div>	
	</div>
</div>

<script type="text/javascript">

$(document).ready(function(){	
	//初始化树
	var setting = {
			check: {
				enable: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback:{
				onClick:zTreeOnClick
			}
				
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
		switch(treeNode.tree_level)		
		{
			case "1":		
				return false;
			case "2":
				var level_2_id=treeNode.id;
				var level_2_name=treeNode.name;
				id_parms +='&level_2_id= ' +level_2_id+'&level_2_name='+level_2_name;
				break;
			case "3":
				var level_3_id=treeNode.id;
				var level_3_name=treeNode.name;
				id_parms +='&level_3_id= ' +level_3_id+'&level_3_name='+level_3_name;
				break;
			case "4":
				var level_4_id=treeNode.id;
				var level_4_name=treeNode.name;
				id_parms +='&level_4_id= ' +level_4_id+'&level_4_name='+level_4_name;
				break;
			case "5":
				id_parms +='&os_id= ' +treeNode.os_id+'&host='+treeNode.name;
				break;
			case "6":
				id_parms +='&web_id='+treeNode.web_id;
				break;
				
		}
		
		var url='/servers_web/flexigrid?event=click_tree'+id_parms;
		$("#js_data_table").flexOptions({newp:1,rp:25,useRp:true,url:encodeURI(url)});
		$('#js_data_table').flexReload();
		
	}
	function edit_check(event,treeId,treeNode)
	{
		 if(treeNode.web_id>0 && treeNode.checked==true)
		 {
			 $.ajax({
				   type: "POST",
				   url: "/servers_web/get_server_web_data",
				   data: "web_id="+treeNode.web_id,
				   success: function(json){
					   var data=eval('('+json+')');
					   $('[name="port"]').val(data.web_port);
					   $('[name="tags"]').val(data.tags);
					   $("#web_name option[value='"+data.web_name+"']").attr('selected','selected');
					   $('#domain').val(data.domain);
					   $('#domain').attr('old_domain',data.domain);
					   $("#frequency_monitor option[value='"+data.frequency_monitor+"']").attr('selected','selected');
					   $("#web_access_path").val(data.web_access_path);
					   $('#web_access_name').val(data.web_access_name);
					   $('#web_log_rules').val(data.web_log_rules);
					   $('#log_extend_name').val(data.log_extend_name);
					   $('#web_error_path').val(data.web_error_path);
					   $('#web_error_name').val(data.web_error_name);
					   $('#web_error_log_rules').val(data.web_error_log_rules);
					   $('#log_error_extend_name').val(data.log_error_extend_name);
					   $("#monitor option[value='"+data.monitor+"']").attr('selected','selected');
					   $("#send_mail option[value='"+data.send_mail+"']").attr('selected','selected');
					   $("#send_mail_to_list").val(data.send_mail_to_list);
					   $("#send_sms option[value='"+data.send_sms+"']").attr('selected','selected');
					   $("#send_sms_to_list").val(data.send_sms_to_list);
					   $("#alarm_process").val(data.alarm_process);
					   $("#alarm_process_mem").val(data.alarm_process_mem);
				    // alert( "Data Saved: " + msg );
				   }
				});
		 }
		
	}
	
	zNodes=<?php if($hosts_tree==true){ echo $hosts_tree ;}else{?> "";<?php }?>	
	zNodes_add=<?php if($hosts_tree_add==true){ echo $hosts_tree_add ;}else{?> "";<?php }?>	
	
	$.fn.zTree.init($("#tree_id"), setting, zNodes);
	
	//弹出树div
	$('#os_host').click(function(){	
		var flag=$('[name="flag"]').val();
		if(flag=='add')
		{
			//添加界面初始化树
			$.fn.zTree.init($("#js_add_dialog_host_tree"), add_setting, zNodes_add);
		}else if(flag=='edit')
		{
			//修改界面初始化树
			$.fn.zTree.init($("#js_add_dialog_host_tree"), edit_setting, zNodes);
		}
		$('#menuContent').show();
	});
	

	
	//鼠标移开menuContent div 选择checbox获取os_id
	$("#menuContent").mouseleave(function(){
		  var treeObj = $.fn.zTree.getZTreeObj("js_add_dialog_host_tree");
		  var nodes = treeObj.getCheckedNodes(true);
		  if(nodes.length>0)
		  {
			  var str='';
			  var web_id='';
			  var num=0;
			  var name='';
			  var arr=new Array();
			  for(var i=0;i<nodes.length;i++)
			  {
				  
				  if(nodes[i].tree_level>=5)
				  {
					  if(nodes[i].os_id>0 && nodes[i].web_id <0)
					  {
						  num+=1;
						  if(str=='')
						  {
							  name=nodes[i].name;
							  str=nodes[i].os_id;
							  web_id=nodes[i].web_id;
						  }else
						  {
							  name+=','+nodes[i].name;
							  str+=','+nodes[i].os_id;
							  web_id+=','+nodes[i].web_id;
						  }
					  }else if(nodes[i].os_id>0 && nodes[i].web_id >0 && typeof(nodes[i].web_id) != "undefined")
					  {
						  num+=1;
						  if(str=='')
						  {
							  name=nodes[i].host;
							  str=nodes[i].os_id;
							  web_id=nodes[i].web_id;
						  }else
						  {
							  name+=','+nodes[i].host;
							  str+=','+nodes[i].os_id;
							  web_id+=','+nodes[i].web_id;
							 
						  }
						  
					  }else if(nodes[i].os_id>0)
					  {
						  num+=1;
						  if(str=='')
						  {
							  name=nodes[i].name;
							  str=nodes[i].os_id;
							  web_id=nodes[i].web_id;
						  }else
						  {
							  name+=','+nodes[i].name;
							  str+=','+nodes[i].os_id;
							  web_id+=','+nodes[i].web_id;
							 
						  }
					  }
				  }
			  }
			  if(num>0)
			  {
				  $('#os_id').val(str);
				  $('#os_host').val(name);				 
				  $('#web_id').val(web_id);				 
				  $('#menuContent').css('display','none');				  
			  }			  
		  }
		  
		});
	
			//初始化flexigrid表格数据	
            $("#js_data_table").flexigrid({            
	            url:"/servers_web/flexigrid?event=index",
	            dataType: 'json',
	            colModel : [
					 {display: '<input type="checkbox" name="check_all" id="check_all_id">',name:'select',width:30,sortable:false,align:'left'},
					 {display: '主机',name:'host',width:80,sortable:true,align:'left'},
					 {display: 'web端口',name:'web_port',width:50,sortable:false,align:'left'},
					 {display: '标签',name:'tags',width:80,sortable:false,align:'left'},
					 {display: 'web名称',name:'web_server_name',width:50,sortable:false,align:'left'},
					 {display: '域名',name:'domain',width:100,sortable:true,align:'left'},
					 {display: 'web访问日志',name:'web_access_log',width:410,sortable:true,align:'left'},
					 {display: 'web错误日志',name:'web_error_log',width:310,sortable:true,align:'left'},
					 {display: '监控状态',name:'monitor',width:50,sortable:true,align:'left'},
					 {display: '进程数阈值',name:'alarm_process',width:60,sortable:true,align:'left'},
					 {display: '单进程内存阈值(MB)',name:'alarm_process_mem',width:104,sortable:true,align:'left'},
					 {display: '监控频率',name:'frequency_monitor_time',width:50,sortable:true,align:'left'},
					 {display: '邮件提醒',name:'send_mail',width:80,sortable:true,align:'left'},
					 {display: '短信提醒',name:'send_sms',width:80,sortable:true,align:'left'} 				 
	            ],
	            searchitems:[
						{display: '主机',name: 'host' },  
						{display: '域名',name: 'domain',isdefault: true}
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
				
					url='/servers_web/flexigrid?event=search';				
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
                		$('[name="flag"]').val('add');                		
            			$('#dialog_div_add').dialog('open');
            		break;
            		case '修改':
            			$('[name="flag"]').val('edit');
            			$('#dialog_div_add').dialog('open');
            		break;
            		case  '删除':
                		var web_id='';
            			$("#js_data_table  [name='chk']:visible").each(function(){
        					if($(this).prop('checked'))
        					{
            					if(web_id !='')
            					{
            						web_id+=','+$(this).attr('web_id');
            						
            					}else
            					{
            						web_id=$(this).attr('web_id');
            					}
        					}
        				});
        				if(web_id !='')
        				{
            				$.ajax({
									type:'post',
									data:'web_id='+web_id,
									dataType: "json",										
									url:'/servers_web/delete',
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
		width:768,
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
				        			url:"/servers_web/add",
				        			type:'post',
				        			dataType:'json',
				        			resetForm:true,			
				        			success:function(data){
				        				if(data.status){		
				        					Lobibox.notify('success',{msg: data.msg});		
				        					$('#js_data_table').flexReload();
				        					$.fn.zTree.init($("#js_add_dialog_host_tree"), add_setting, zNodes);
				        					$('#dialog_div_add').dialog('close');				
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
						       
						        if($('#web_id').val() !='')
						        {
					        		$('#dialog_form').ajaxSubmit({		
					        			url:"/servers_web/edit",
					        			type:'post',
					        			dataType:'json',
					        			resetForm:true,			
					        			success:function(data){
					        				if(data.status){		
					        					Lobibox.notify('success',{msg: data.msg});		
					        					$('#js_data_table').flexReload();
					        					$.fn.zTree.init($("#js_add_dialog_host_tree"), add_setting, zNodes);
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
						        	Lobibox.notify('error', {msg: '选择web主机下的域名'});	
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
					url:'/servers_web/domain_host',
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