<?php 
class Servers_web_model extends CI_Model{

    protected $table='db_servers_web';    
    
	function get_total_rows(){
		$this->db->from($this->table);
        return $this->db->count_all_results();
	}
    
	function select_index($where)
	{
		$sql="SELECT
			  db_servers_web.id,
			  os_id,
			  db_servers_web.web_port,
			  db_servers_web.tags,
			  frequency_monitor,
			  CASE frequency_monitor WHEN 86400 THEN '天' WHEN '3600' THEN '小时' END AS frequency_monitor_time,
			  web_name,
			  CASE web_name WHEN 1 THEN 'apache' WHEN 2 THEN 'nginx' WHEN 3 THEN 'tomcat' END AS web_server_name,
			  domain,
			  web_access_path,
			  web_access_name,
			  web_log_rules,
			  log_extend_name,
			  CONCAT(web_access_path,web_access_name,web_log_rules,log_extend_name) AS web_access_log,
			  db_servers_web.monitor,
			  db_servers_web.send_mail,
			  db_servers_web.send_sms,
			  db_servers_os.host,
			  web_error_path,
			  web_error_name,
			  web_error_log_rules,
			  log_error_extend_name,
			  CONCAT(web_error_path,web_error_name,web_error_log_rules,log_error_extend_name) AS web_error_log,
			  alarm_process_mem,
			  alarm_process
			FROM db_servers_web
			  LEFT JOIN db_servers_os
			    ON db_servers_web.os_id = db_servers_os.id 
			    where 1=1  $where ";
		//var_dump($sql);exit;
		$query = $this->db->query($sql);
        if ($query->num_rows() > 0)
		{
			$result=$query->result_array();       
            return $result;
		}else 
		{
			return false;
		}
	}
	
	/**
	 * 
	 * 得到表 db_servers_web总行数
	 */
	function get_total_nums($where='')
	{
		$sql="SELECT COUNT(id) as nums FROM db_servers_web where 1=1 {$where} limit 1";		
		
		$query=$this->db->query($sql);
				
		if($query->num_rows() > 0)
		{
			$res=$query->result_array();
			return $res[0]['nums'];
		}else 
		{
			return 0;
		}
	}
	/**
	 * 
	 * 得到具有登陆rsa权限的主机
	 */
	function  get_rsa_host()
	{
		$sql="SELECT id AS os_id ,`host`,`user`,`port` AS server_port,rsa FROM db_servers_os WHERE rsa !='' AND `user` !='' ORDER BY `host` asc";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	
	/**
	 * 新增界面 服务器树
	 */
	function  get_host_tree($flag='')
	{
		$sql='SELECT 	id, 				
				`name`, 
				tree_level, 
				pId, 
				IF(`is_parent`,"true","false")AS isParent,
				os_id	 
			FROM 
			servers_os_tree order by id asc ';
		$query = $this->db->query($sql);
		$result=$query->result_array();
		if ($result==true) 
		{
			foreach ($result as $key=>$value) {
				$result[$key]['iconOpen'] = '';
                $result[$key]['iconClose'] = '';               
                if ($value['tree_level']==1)
                {
                	$result[$key]['icon'] = 'lib/ztree/img/diy/1_open.png';
                	$result[$key]['open']=true;
                }
                
                if ($value['tree_level']==2)
                {
                	$result[$key]['icon'] = 'lib/ztree/img/diy/server_1.png';
                	$result[$key]['open']=true;
                }
				if ($value['tree_level']==3)
                {
                	$result[$key]['icon'] = 'lib/ztree/img/diy/server_2.png';
                	
                }
				if ($value['tree_level']==4)
                {
                	$result[$key]['icon'] = 'lib/ztree/img/diy/server_3.png';
                	
                }
                if ($value['tree_level']==5)
                {
                	$result[$key]['icon'] = 'lib/ztree/img/diy/server_4.png';
                }	
                
                if ($flag=='edit' && $value['isParent']=="true" )
                {
	                
						$result[$key]['nocheck']=true;
//						$result[$key]['chkDisabled']=false;
//						$result[$key]['checked']=true;
					
                }			
				
			}	
			
			return $result;		
		}else 
		{
			return FALSE;
		}
	}
	
	
	
	/**
	 * 修改界面 得到一个host多个domain
	 */
	function  get_host_domain_tree()
	{
		
		$host_tree=$this->get_host_tree();
		$sql="SELECT * FROM db_servers_web";
		$query=$this->db->query($sql);
		$web_host=$query->result_array();
		
		if($host_tree==true)
		{
			
			foreach($host_tree as $k=>$v)
			{
				
				if ($v['os_id']==true && $web_host==true)
				{
					
					foreach ($web_host as $kk=>$vv) 
					{
						
						if ($v['os_id']==$vv['os_id'])
						{
							$host_tree[$k]['isParent']=true;
							$arr['web_id'] = $vv['id'];
							$arr['name'] = $vv['domain'];
							$arr['host'] = $v['name'];
							$arr['pId'] = $v['id'];
							$arr['tree_level'] = "6";
							$arr['os_id'] = $v['os_id'];
							$arr['isParent'] = false;
							$arr['iconOpen'] = '';
							$arr['iconClose'] = '';
							$arr['open'] = false;
							$arr['icon'] = 'lib/ztree/img/diy/domain.png';
							$host_tree[] = $arr;
						}
						
					}
				
				}
				if ($host_tree[$k]['isParent']==true)
				{
					$host_tree[$k]['nocheck']=true;
					$host_tree[$k]['chkDisabled']=false;
					$host_tree[$k]['checked']=true;
				}
				
			}
			return $host_tree;
		}else 
		{
			return FALSE;
		}
		
	}
	
	/**
	 * 
	 * 通过树级别id获得树节点下的主机id
	 */
	function get_os_id_by_tree_level($where='')
	{
		if ($where==true)
		{
			$sql="SELECT GROUP_CONCAT(id )  AS ids FROM db_servers_os WHERE 1=1 ".$where;			
			
			$query=$this->db->query($sql);
			
			if ($query->num_rows() > 0)
			{
				$res=$query->row_array();
				
				return $res['ids'];
			}else 
			{
				return false;
			}
			
			
		}else 
		{
			return false;
		}
		
	}
	
    function get_total_record(){
        $query = $this->db->get($this->table);
		if ($query->num_rows() > 0)
		{
			return $query->result_array();
		}
	}
    
    function get_total_record_usage(){
        $this->db->where('is_delete',0);
        $this->db->order_by('host','asc');
        $query = $this->db->get($this->table);
		if ($query->num_rows() > 0)
		{
			return $query->result_array();
		}
	}
    
    
    
    function get_total_record_paging($limit,$offset){
        $query = $this->db->get($this->table,$limit,$offset);
		if ($query->num_rows() > 0)
		{
			return $query->result_array();
		}
	}
    
    function get_total_record_sql($sql){
        $query = $this->db->query($sql);
        if ($query->num_rows() > 0)
		{
			$result['datalist']=$query->result_array();
            $result['datacount']=$query->num_rows();
            
            return $result;
		}
    }
    
    
   	/*
	 * 根据id获取单条记录
	 */
	function get_record_by_id($id){
		$sql="SELECT db_servers_web.id,
				 os_id,db_servers_web.web_port,
				 db_servers_web.tags,
				 web_name,
				 CASE web_name WHEN 1 THEN 'apache' WHEN 2 THEN 'nginx' WHEN 3 THEN 'tomcat' END AS web_server_name, 
				 domain,
				 web_access_path, 
				 web_access_name,
				 web_log_rules, 
				 frequency_monitor,
				 CASE frequency_monitor WHEN 86400 THEN '1天' WHEN '3600' THEN '1小时' END AS frequency_monitor_time,
				 log_extend_name, 				 
				 CONCAT(web_access_path,web_access_name,web_log_rules,log_extend_name) AS web_access_log,
				 db_servers_web.monitor,
				 db_servers_web.send_mail,
				 db_servers_web.send_sms,
				 db_servers_web.send_mail_to_list,
				 db_servers_web.send_sms_to_list,
				  db_servers_os.host,
				  db_servers_web.is_delete,
				  web_error_path,
				 web_error_name,
				 web_error_log_rules,
				 log_error_extend_name,
				 alarm_process_mem,
				 alarm_process,
				 CONCAT(web_error_path,web_error_name,web_error_log_rules,log_error_extend_name) AS web_error_log
				FROM db_servers_web LEFT JOIN db_servers_os ON db_servers_web.os_id = db_servers_os.id
				WHERE 1=1 AND  db_servers_web.id=".$id;
		
		$query = $this->db->query($sql);
		if ($query->num_rows() > 0)
		{
			return $query->row_array();
		}
	}
    
    function get_host_by_id($id)
    {
		$query = $this->db->get_where($this->table, array('id' =>$id));		
		if ($query->num_rows() > 0)
		{
			 $result=$query->row_array();
             return $result;
		}
	}
    
    function get_servers($server_id){
        $query = $this->db->get_where($this->table, array('id' =>$server_id));
		if ($query->num_rows() > 0)
		{
			$data=$query->row_array();
            return $data['host'].":".$data['port'];
		}
    }
    
    /*
    * 插入数据
    */
   	public function insert($data){		
		return $this->db->insert($this->table, $data);
	}
    
    /*
	 * 更新信息
	*/
	public function update($data,$id){
		$this->db->where('id', $id);
		return $this->db->update($this->table, $data);
	}
    
    /*
	 * 删除信息
	*/
	public function delete($id){
		$sql="DELETE t1,t2,t3,t4 
				FROM db_servers_web AS t1 
				LEFT JOIN web_error_log AS t2 ON t1.id=t2.web_id 
				LEFT JOIN web_log AS t3 ON t1.id=t3.web_id
				LEFT JOIN web_status AS t4  ON t1.id=t4.web_id 
				WHERE t1.id IN ($id)";
		
		return $query = $this->db->query($sql);	
			
//		$this->db->where('id', $id);
//		$this->db->delete($this->table);
//		
//		$this->db->where('web_id', $id);
//		$this->db->delete('web_status');
//		
//		$this->db->where('web_id', $id);
//		$this->db->delete('web_status_history');
//		
//		$this->db->where('web_id', $id);
//		$this->db->delete('web_log');
	}
	
	public function remove_hosts($host){
		$this->db->where('ip', $host)->delete('os_status');
		$this->db->where('ip', $host)->delete('os_disk');
		$this->db->where('ip', $host)->delete('os_net');
		$this->db->where('ip', $host)->delete('os_diskio');
	}
    
}

/* End of file servers_os_model.php */
/* Location: ./application/models/servers_os_model.php */