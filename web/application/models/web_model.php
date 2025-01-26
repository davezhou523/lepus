<?php 
class web_model extends CI_Model{

	function insert($table,$data){		
		$this->db->insert($table, $data);
	}   

	function get_total_rows($table){
		$this->db->from($table);
		return $this->db->count_all_results();
	}


    
    function get_total_record($table){
        $query = $this->db->get($table);
		if ($query->num_rows() > 0)
		{
			return $query->result_array();
		}
	}
    
    function get_total_record_paging($table,$limit,$offset){
        $query = $this->db->get($table,$limit,$offset);
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
    
	
    function get_status_total_record($health=''){
        
        $this->db->select('db_servers_os.host,
						   db_servers_web.web_port,
						   db_servers_web.tags,
						   db_servers_web.web_name,
						   db_servers_web.alarm_process,
						   db_servers_web.alarm_process_mem,
						   web_status.process_num,
						   web_status.listen,
						   web_status.established,
						   web_status.time_wait,
        					db_servers_web.id as web_id');
        $this->db->from('web_status');
		$this->db->join('db_servers_web', 'db_servers_web.id = web_status.web_id', 'left');
		$this->db->join('db_servers_os', 'db_servers_os.id = db_servers_web.os_id', 'left');
		$this->db->where("db_servers_web.is_delete", 0);
       

        !empty($_GET["host"]) && $this->db->like("db_servers_os.host", $_GET["host"]);
        !empty($_GET["tags"]) && $this->db->like("db_servers_web.tags", $_GET["tags"]);
        
        $query = $this->db->get();

        if ($query->num_rows() > 0)
		{
			return $query->result_array();
		}
    }
    
    /**
     * 
     * 得到日pv访问量
     * by dave
     * 2016/10/18
     */
    function get_web_daily_pv($data='')
    {
    	if ($data==true)
    	{
      		$sql="SELECT * FROM web_daily_pv WHERE domain='".$data['domain']."' AND  cur_date <='".$data['cur_time']."'  ORDER BY cur_date desc LIMIT 30";
      		$query = $this->db->query($sql);
      		return $query->result_array();
    	}else 
    	{
    		return '';
    	}
    	
    }
    
    

}

/* End of file mysql_model.php */
/* Location: ./application/models/mysql_model.php */