<?php if ( ! defined("BASEPATH")) exit("No direct script access allowed");

class lp_web extends Front_Controller {

    function __construct(){
		parent::__construct();
        $this->load->model('servers_web_model','server');
        $this->load->model("option_model","option");
		$this->load->model("web_model","web");
        $this->load->model("os_model","os");  
	}
    
    public function visit(){
    	$data=array();
    	$data['cur_time']=date("Y-m-d",time());
		$pv_arr=array();
	    $data['domain']=$this->db->query("SELECT DISTINCT(domain) FROM db_servers_web WHERE is_delete=0  ")->result_array();
	    $web_daily_pv=false;$domain='';
		if(isset($data['domain'][0]['domain']) && $data['domain'][0]['domain']==true)
		{
			$domain=$data['domain'][0]['domain'];
			foreach ($data['domain'] as $value)
			{
				if($value['domain']=='eu.fookii.com')
				{
					$domain=$value['domain'];
					break;
				}
			}
			
			$where_arr=array('domain'=>$domain,'cur_time'=>$data['cur_time']);
			$web_daily_pv=$this->web->get_web_daily_pv($where_arr);
		}
		$pv_str=$uv_str=$ip_str='';
		if ($web_daily_pv==true)
		{

			$pv_array=array();$uv_array=array();$date_array=array();$ip_array=array();$date_array=array();
			
			foreach ($web_daily_pv as $v)
			{
				array_unshift($pv_array, $v['pv']);
				array_unshift($uv_array, $v['uv']);
				array_unshift($ip_array, $v['ip']);
				array_unshift($date_array, $v['cur_date']);
			}
		}
		$data['cur_domain']=$domain;
		$data['pv']=!empty($pv_array)?json_encode($pv_array):'';
		$data['cur_date']=!empty($date_array)?json_encode($date_array):'';
		$data['uv']=!empty($uv_array)?json_encode($uv_array):'';
		$data['ip']=!empty($ip_array)?json_encode($ip_array):'';
        $this->layout->view("web/visit",$data);
        unset($data,$web_daily_pv,$pv_array,$uv_array,$date_array,$ip_array,$date_array);        
    }
    
    /**
     * ajxj动态更新日pv uv ip
     * by dave
     * 2016/10/18
     */
    public function ajax_charts()
    {
    	$get['domain']=(!empty($_GET['domain'])? $_GET['domain']:'');
    	$get['cur_time']=(!empty($_GET['time'])? $_GET['time']:'');
    	$res=$this->web->get_web_daily_pv($get);
    	$pv_array=$uv_array=$date_array=$ip_array=array();
    	if ($res==true)
		{

			foreach ($res as $v)
			{
				array_unshift($pv_array, intval($v['pv']));
				array_unshift($uv_array, $v['uv']);
				array_unshift($ip_array, $v['ip']);
				array_unshift($date_array, $v['cur_date']);
			}
		}
		$data['pv']=($pv_array);
		$data['cur_date']=($date_array);		
		$data['uv']=($uv_array);
		$data['ip']=($ip_array);		
		echo ( json_encode($data));
		unset($data,$pv_array,$uv_array,$date_array,$ip_array,$date_array);  
    	
    }
    
	/**
     * ajxj动态更新 月 pv uv ip
     * by dave
     * 2016/10/18
     */
    public function ajax_month_charts()
    {
    	$res=$pv_array=$uv_array=$date_array=$ip_array=array();
    	$get['domain']=(!empty($_GET['domain'])? $_GET['domain']:'');
    	$get['cur_time']=(!empty($_GET['time'])? $_GET['time']:'');
    	if ($get['domain'] ==true && $get['cur_time']==true)
    	{
	    	$sql="SELECT
				  SUM(pv) AS pv,
				  SUM(uv) AS uv,
				  SUM(ip) AS ip,
				  DATE_FORMAT(cur_date,'%Y-%m') AS cur_date
				FROM web_daily_pv
				WHERE domain = '".$get['domain']."'
				GROUP BY DATE_FORMAT(cur_date,'%Y-%m')
				HAVING cur_date <= '".$get['cur_time']."'
				ORDER BY cur_date desc
				LIMIT 12";
	    	
	    	$res=$this->db->query($sql)->result_array();
    	}
    	if ($res==true)
		{
			foreach ($res as $v)
			{
				array_unshift($pv_array, intval($v['pv']));
				array_unshift($uv_array, $v['uv']);
				array_unshift($ip_array, $v['ip']);
				array_unshift($date_array, $v['cur_date']);
			}
		}
		$data['pv']=($pv_array);
		$data['cur_date']=($date_array);		
		$data['uv']=($uv_array);
		$data['ip']=($ip_array);		
		echo ( json_encode($data));
		unset($data,$pv_array,$uv_array,$date_array,$ip_array,$date_array);  
    	
    }

	/**
     * ajxj动态更新 月 pv uv ip
     * by dave
     * 2016/10/18
     */
    public function ajax_year_charts()
    {
    	$res=$pv_array=$uv_array=$date_array=$ip_array=array();
    	$get['domain']=(!empty($_GET['domain'])? $_GET['domain']:'');
    	$get['cur_time']=(!empty($_GET['time'])? $_GET['time']:'');
    	if ($get['domain'] ==true && $get['cur_time']==true)
    	{
	    	$sql="SELECT
				  SUM(pv) AS pv,
				  SUM(uv) AS uv,
				  SUM(ip) AS ip,
				  DATE_FORMAT(cur_date,'%Y') AS cur_date
				FROM web_daily_pv
				WHERE domain = '".$get['domain']."'
				GROUP BY DATE_FORMAT(cur_date,'%Y')
				HAVING cur_date <= '".$get['cur_time']."'
				ORDER BY cur_date desc
				LIMIT 12";
	    	
	    	$res=$this->db->query($sql)->result_array();
    	}
    	if ($res==true)
		{

			foreach ($res as $v)
			{
				array_unshift($pv_array, $v['pv']);
				array_unshift($uv_array, $v['uv']);
				array_unshift($ip_array, $v['ip']);
				array_unshift($date_array, $v['cur_date']);
			}
		}
		$data['pv']=($pv_array);
		$data['cur_date']=($date_array);		
		$data['uv']=($uv_array);
		$data['ip']=($ip_array);		
		echo ( json_encode($data));
		unset($data,$pv_array,$uv_array,$date_array,$ip_array,$date_array);  
    	
    }
	public function index()
	{
        parent::check_privilege();
        $data["datalist"]=$this->web->get_status_total_record();        
        $setval["host"]=isset($_GET["host"]) ? $_GET["host"] : "";
        $setval["tags"]=isset($_GET["tags"]) ? $_GET["tags"] : "";
        $data["setval"]=$setval;
		
        $this->layout->view("web/index",$data);
	}
    
    public function chart()
    {
        parent::check_privilege();
        $data=array();
        $process_arr=$listen_arr=$established_arr=$time_wait_arr=$date_arr=array();        
        $web_id=!empty($_GET['web_id']) ? $_GET['web_id'] : "0";
        $cur_time=(!empty($_GET['time'])?$_GET['time']:date("Y-m-d H:i",time()));
     	$sql="SELECT
			  web_status_history.process_num,
			  web_status_history.listen,
			  web_status_history.established,
			  web_status_history.time_wait,
			  DATE_FORMAT(web_status_history.create_time,'%Y-%m-%d %H:%i') AS create_time
			FROM web_status_history			
			WHERE web_id = ".$web_id." AND web_status_history.create_time <= '".$cur_time."'
			ORDER BY create_time desc LIMIT 30";
        $res=$this->db->query($sql)->result_array();
      	if ($res==true)
		{
			foreach ($res as $v)
			{
				array_unshift($process_arr, $v['process_num']);
				array_unshift($listen_arr, $v['listen']);
				array_unshift($established_arr, $v['established']);
				array_unshift($time_wait_arr, $v['time_wait']);
				array_unshift($date_arr, $v['create_time']);
			}
		}
		
		$ajax=!empty($_GET['ajax']) ? $_GET['ajax'] : "0";
		if ($ajax ==true)
		{
			$data['process_num']=($process_arr);
			$data['listen']=($listen_arr);		
			$data['established']=($established_arr);
			$data['time_wait']=($time_wait_arr);		
			$data['cur_date']=($date_arr);
			echo json_encode($data);
			exit;
		}else 
		{
			$data['process_num']=json_encode($process_arr);
			$data['listen']=json_encode($listen_arr);		
			$data['established']=json_encode($established_arr);
			$data['time_wait']=json_encode($time_wait_arr);		
			$data['cur_date']=json_encode($date_arr);
			$data['cur_time']=$cur_time;
			$data['web_id']=$web_id;
        	$this->layout->view('web/chart',$data);
		}
    }
    
   
    
    
}

