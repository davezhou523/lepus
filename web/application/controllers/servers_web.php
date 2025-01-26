<?php if ( ! defined("BASEPATH")) exit("No direct script access allowed");

class Servers_web extends Front_Controller {
    function __construct(){    	  
		parent::__construct();
        $this->load->model('servers_web_model');
		$this->load->library('form_validation');	
	
	}
    
    /**
     * 首页
     */
    public function index(){
        parent::check_privilege();   
          
        $ext_where=''; 
        if(!empty($host)){
            $ext_where=$ext_where."  and db_servers_os.host like '%$host%' ";
        }
        if(!empty($tags)){
            $ext_where.=" and db_servers_web.tags like '%$tags%' ";
        }
        $ext_where.=' and db_servers_web.is_delete=0 ';       
        
        
         //从db_os_servers_os表获得私钥的服务器进行登陆，获得web日志信息
       // $data['hosts']=$this->servers_web_model->get_rsa_host(); 
        //添加界面 得到有rsa服务器树
        $data['hosts_tree_add']=json_encode($this->servers_web_model->get_host_tree());  
        //编辑界面得到有域名的host树
        $data['hosts_tree']=json_encode($this->servers_web_model->get_host_domain_tree());  
        //web服务器名称
        $data['web_name']=array('1'=>'apache','2'=>'nginx','3'=>'tomcat');
        //监控频率
        $data['frequency_monitor']=array('86400'=>'天');     
        
        $this->layout->view("servers_web/index",$data);
    }
    
    public function flexigrid()
    {
    	$ext_where=''; 
    	$event=isset($_GET['event']) ? $_GET['event'] : '';
    	$page = isset($_POST['page']) ? $_POST['page'] : 1;
		$rp = isset($_POST['rp']) ? $_POST['rp'] : 10;
		$sortname = isset($_POST['sortname']) ? $_POST['sortname'] : 'id';
		$sortorder = isset($_POST['sortorder']) ? $_POST['sortorder'] : 'desc';		
		$query = isset($_POST['query']) ? $_POST['query'] : '';
		$qtype = isset($_POST['qtype']) ? $_POST['qtype'] : '';
		$limit = !empty($rp) ? " LIMIT ".($page-1)*$rp.','.$rp : ' ';		
       //$order=!empty($sortname)?' order by db_servers_web'.$sortname.' '.$sortorder: ' order by db_servers_web.id asc ';
        $order=' order by db_servers_web.id asc ';
        $ext_where.=' and db_servers_web.is_delete=0 ';
       
        switch ($event)
        {
        	case 'index': 		
		        $result=$this->servers_web_model->select_index($ext_where.$order.$limit);
		        $total=$this->servers_web_model->get_total_nums();   
				$this->flexigrid_result($result,$total,$page);
				unset($result,$total);
				exit;
        	case 'search':        		
	        		$ext_where.=" and {$qtype} like '%".$query."%'";
	        		$result=$this->servers_web_model->select_index($ext_where.$order.$limit);
			        $total=$this->servers_web_model->get_total_nums();   
					$this->flexigrid_result($result,$total,$page);
					unset($result,$total);        		
				exit;
        		break;
        	case "click_tree":
        		$level_2_id=isset($_GET['level_2_id'])?$_GET['level_2_id'] : '0';
        		$level_2_name=isset($_GET['level_2_name']) ? urldecode($_GET['level_2_name']) : '';
        		$level_3_id=isset($_GET['level_3_id']) ? $_GET['level_3_id'] : '0';
        		$level_3_name=isset($_GET['level_3_name']) ? urldecode($_GET['level_3_name']) : '';
        		$level_4_id=isset($_GET['level_4_id']) ? urldecode($_GET['level_4_id']) : '0';
        		$level_4_name=isset($_GET['level_4_name']) ? urldecode($_GET['level_4_name']) : '';
        		$os_id=isset($_GET['os_id']) ? urldecode($_GET['os_id']) : '0';
        		$host=isset($_GET['host']) ? urldecode($_GET['host']) : '';
        		$web_id=isset($_GET['web_id']) ? urldecode($_GET['web_id']) : '';
        		if ($level_2_id==true && $level_2_name==true)
        		{
        			$where=" and level_2_id={$level_2_id} and level_2_name='{$level_2_name}'";
        			$os_ids=$this->servers_web_model->get_os_id_by_tree_level($where);
        			if ($os_ids==true)
        			{
        				
        				$where=" and db_servers_web.os_id in($os_ids) ";
        				$result=$this->servers_web_model->select_index($where.$ext_where.$order.$limit);
				        $total=$this->servers_web_model->get_total_nums($where);   
						$this->flexigrid_result($result,$total,$page);
						unset($result,$total);
        			}else 
        			{
        				echo json_encode('');exit;
        			}
        		}elseif ($level_3_id==true && $level_3_name==true)
        		{
        			$where=" and level_3_id={$level_3_id} and level_3_name='{$level_3_name}'";
        			$os_ids=$this->servers_web_model->get_os_id_by_tree_level($where);
        			if ($os_ids==true)
        			{
        				$where=" and db_servers_web.os_id in({$os_ids}) ";
        				$result=$this->servers_web_model->select_index($where.$ext_where.$order.$limit);
				        $total=$this->servers_web_model->get_total_nums($where);   
						$this->flexigrid_result($result,$total,$page);
						unset($result,$total);
        			}else 
        			{
        				echo json_encode('');exit;
        			}
        			
        		}elseif ($level_4_id==true && $level_4_name==true)
        		{
        			$where=" and level_4_id={$level_4_id} and level_4_name='{$level_4_name}'";
        			$os_ids=$this->servers_web_model->get_os_id_by_tree_level($where);
        			if ($os_ids==true)
        			{
        				$where=" and db_servers_web.os_id in({$os_ids}) ";
        				$result=$this->servers_web_model->select_index($where.$ext_where.$order.$limit);
				        $total=$this->servers_web_model->get_total_nums($where);   
						$this->flexigrid_result($result,$total,$page);
						unset($result,$total);
        			}else 
        			{
        				echo json_encode('');exit;
        			}
        			
        		}elseif ($os_id==true && $host==true)
        		{
        			$where=" and db_servers_web.os_id={$os_id}";        			
        			$result=$this->servers_web_model->select_index($where.$ext_where.$order.$limit);
				    $total=$this->servers_web_model->get_total_nums($where);   
					$this->flexigrid_result($result,$total,$page);
					unset($result,$total);
        			
        		}elseif ($web_id==true)
        		{
        			$where=" and db_servers_web.id={$web_id}";        			
        			$result=$this->servers_web_model->select_index($where.$ext_where.$order.$limit);
				    $total=$this->servers_web_model->get_total_nums($where);   
					$this->flexigrid_result($result,$total,$page);
					unset($result,$total);
        		}
        		else 
        		{
        			echo json_encode('');exit;
        		}        		
        }
    }
    
    //flexigrid输出db_servers_web结果集 
    protected  function flexigrid_result($result=array(),$total=0,$page=0)
    {
    	if ($result==true)
    	{
    			header("Content-type: application/json");
				$jsonData = array('page'=>$page,'total'=>$total,'rows'=>array());
				foreach($result AS $row){					
//					$fn_edit='<a href="javascript:;" onclick="fn_edit('.$row['id'].')">修改</a>&nbsp;&nbsp;';
//		        	$fn_delete='<a href="javascript:;" onclick="fn_delete('.$row['id'].')">删除</a>';
					$entry = array('id'=>$row['id'],
						'cell'=>array(
							'select' =>'<input type="checkbox" web_id="'.$row['id'].'" os_id="'.$row['os_id'].'" value="'.$row['id'].'" name="chk">',
							'host'=>$row['host'],
							'web_port'=>$row['web_port'],
							'tags'=>$row['tags'],
							'web_server_name'=>$row['web_server_name'],
							'domain'=>$row['domain'],
							'web_access_log'=>$row['web_access_log'],
							'web_error_log'=>$row['web_error_log'],
							'monitor'=>check_on_off($row['monitor']),
							'alarm_process'=>$row['alarm_process'],
							'alarm_process_mem'=>$row['alarm_process_mem'],
							'frequency_monitor_time'=>$row['frequency_monitor_time'],
							'send_mail'=>check_on_off($row['send_mail']),
							'send_sms'=>check_on_off($row['send_sms'])							
							
						),
					);
					$jsonData['rows'][] = $entry;
				}
				echo json_encode($jsonData);
				exit;
    	}else 
    	{
    		 echo json_encode('');
    		 exit;
    	}
    }
    
    /**
     * 得到db_servers_web表数据
     * by dave
     * 2017/1/16
     */
    public function get_server_web_data()
    {
        $web_id=isset($_POST['web_id'])?$_POST['web_id']:'';
        if ($web_id==true)
        {
       		 $result=$this->servers_web_model->get_record_by_id($web_id);
       		 if ($result==true)
       		 {
       		 	echo json_encode($result);exit;
       		 } else
       		 {
       		 	echo json_encode('');exit;
       		 }
        }else
        {
        	echo json_encode('');exit;
        }
    }
    
    
    /**
     * 添加
     */
    public function add(){
        parent::check_privilege();      	
		if(isset($_POST['flag']) && $_POST['flag']=='add')
        {
        		$os_ids=$this->input->post('os_id');
				if ($os_ids==true)
				{
					$data = array(						
						'web_port'=>$this->input->post('port'),	
					    'tags'=>$this->input->post('tags'),
                        'monitor'=>$this->input->post('monitor'),
						'frequency_monitor'=>$this->input->post('frequency_monitor'),					
                        'send_mail'=>$this->input->post('send_mail'),
						'send_sms'=>$this->input->post('send_sms'),
                        'send_mail_to_list'=>$this->input->post('send_mail_to_list'),
						'send_sms_to_list'=>$this->input->post('send_sms_to_list'),
						'web_name'=>$this->input->post('web_name'),
						'alarm_process'=>$this->input->post('alarm_process'),
						'alarm_process_mem'=>$this->input->post('alarm_process_mem'),					
						'domain'=>$this->input->post('domain'),
						'web_access_path'=>$this->input->post('web_access_path'),
						'web_access_name'=>$this->input->post('web_access_name'),
						'web_log_rules'=>$this->input->post('web_log_rules'),
						'log_extend_name'=>$this->input->post('log_extend_name'),
						'web_error_path'=>$this->input->post('web_error_path'),
						'web_error_name'=>$this->input->post('web_error_name'),
						'web_error_log_rules'=>$this->input->post('web_error_log_rules'),
						'log_error_extend_name'=>$this->input->post('log_error_extend_name'),
					);
					$os_id_arr=explode(',', $os_ids);
					foreach ($os_id_arr as $os_id)
					{
						$data['os_id']=$os_id;
						$res=$this->servers_web_model->insert($data);
					}
					
				}
				
                    if ($res)
                    {
                    	$response['status']=true;
                    	$response['msg']='添加成功';
                    	
                    }else 
                    {
                    	$response['status']=FALSE;
                    	$response['msg']='添加失败';
                    }
                    echo json_encode($response);exit;
                    
            
        }
       
    }
    
    /**
     * 编辑
     */
    public function edit(){
        parent::check_privilege();
        $num=0;
        $web_ids=(isset($_POST['web_id'])?$_POST['web_id']:'');
        if ($web_ids==true)
        {
        	$web_id_arr=explode(',',$web_ids);
        	$data = array(							
							'web_port'=>$this->input->post('port'),	
						    'tags'=>$this->input->post('tags'),
	                        'monitor'=>$this->input->post('monitor'),
							'frequency_monitor'=>$this->input->post('frequency_monitor'),
	                        'send_mail'=>$this->input->post('send_mail'),
							'send_sms'=>$this->input->post('send_sms'),
	                        'send_mail_to_list'=>$this->input->post('send_mail_to_list'),
							'send_sms_to_list'=>$this->input->post('send_sms_to_list'),
							'web_name'=>$this->input->post('web_name'),
							'domain'=>$this->input->post('domain'),
							'alarm_process'=>$this->input->post('alarm_process'),
							'alarm_process_mem'=>$this->input->post('alarm_process_mem'),
							'web_access_path'=>$this->input->post('web_access_path'),
							'web_access_name'=>$this->input->post('web_access_name'),
							'web_log_rules'=>$this->input->post('web_log_rules'),
							'log_extend_name'=>$this->input->post('log_extend_name'),
							'web_error_path'=>$this->input->post('web_error_path'),
							'web_error_name'=>$this->input->post('web_error_name'),
							'web_error_log_rules'=>$this->input->post('web_error_log_rules'),
							'log_error_extend_name'=>$this->input->post('log_error_extend_name'),
							
						);
        	foreach ($web_id_arr as $id)
        	{
				$res=$this->servers_web_model->update($data,$id);
				$num+=1;				
        	}
        	
        	if ($num)
             {
                 $response['status']=true;
                 $response['msg']='修改成功';
                    	
             }else 
             {
                $response['status']=FALSE;
                $response['msg']='修改失败';
             }
             echo json_encode($response);exit;
        	
        }
        echo json_encode('');exit;
      
    }
    
    /**
     * 删除
     */
    function delete(){
        parent::check_privilege();
        $web_id=isset($_POST['web_id'])?$_POST['web_id']:'';
        if ($web_id==true)
        {
        	$res=$this->servers_web_model->delete($web_id);
        	if ($res)
             {
                 $response['status']=true;
                 $response['msg']='删除成功';
                    	
             }else 
             {
                $response['status']=FALSE;
                $response['msg']='删除失败';
             }
             echo json_encode($response);exit;
        }
        echo json_encode('');exit;
		
    }
    
    /**
     * 验证一台host不能重复的域名
     */
    function domain_host(){
    	
    	$os_id=isset($_POST['os_id'])?$_POST['os_id']:'';
    	$domain=isset($_POST['domain'])?$_POST['domain']:'';
    	if ($os_id==true && $domain==true)
    	{
    		$os_id_arr=array_unique(explode(',',$os_id));
    		$os_id_str=implode(",", $os_id_arr);
    		$where=" and db_servers_web.os_id in(".$os_id_str.")  and  db_servers_web.domain='".trim($domain)."'";
    		$res = $this->servers_web_model->select_index($where);
    		$hosts='';
    		if ($res==true)
    		{
    			foreach ($res as $value)
    			{
		    		foreach ($os_id_arr as $os_id)
		    		{
		    			if ($os_id==$value['os_id'] && $domain==$value['domain'])
		    			{
		    				if($hosts==true)
		    				{
		    					$hosts.=','.$value['host'];
		    				}else 
		    				{
		    					$hosts=$value['host'];
		    				}
		                 
		    			}
		    		}
    			}
    			if ($hosts ==true)
    			{
    				$response['status']='exists';
		            $response['msg']=$hosts.'已经存在'.$domain.'域名,不能重复添加';
		            echo json_encode($response);exit;	
    			}
    		}
    	}    
        
    }  
 
}

