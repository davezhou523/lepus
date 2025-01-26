<?php 
class Servers_os_model extends CI_Model{

    protected $table='db_servers_os';
    protected $tree_table='servers_os_tree';
	function select_index($where)
	{
		$sql="
			SELECT 	id, 
					level_2_id, 
					level_3_id, 
					level_4_id, 
					level_2_name, 
					level_3_name, 
					level_4_name, 
					`host`, 
					`port`, 
					`user`, 
					rsa,
					password,
					community, 
					tags, 
					monitor, 
					exclude_start_time, 
					exclude_end_time, 
					send_mail, 
					send_mail_to_list, 
					send_sms, 
					send_sms_to_list, 
					alarm_os_process, 
					alarm_os_load, 
					alarm_os_cpu, 
					alarm_os_network, 
					alarm_os_disk, 
					alarm_os_memory, 
					threshold_warning_os_process, 
					threshold_warning_os_load, 
					threshold_warning_os_cpu, 
					threshold_warning_os_network, 
					threshold_warning_os_disk, 
					threshold_warning_os_memory, 
					threshold_critical_os_process, 
					threshold_critical_os_load, 
					threshold_critical_os_cpu, 
					threshold_critical_os_network, 
					threshold_critical_os_disk, 
					threshold_critical_os_memory, 
					filter_os_disk, 
					is_delete, 
					display_order, 
					remark, 
					create_time	 
					FROM 
					db_servers_os 
					WHERE 1=1  $where ";
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
	 * 得到表 db_servers_os总行数
	 */
	function get_total_nums($where='')
	{
		$sql="SELECT COUNT(id) as nums FROM db_servers_os where 1=1 {$where} limit 1";		
		
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
	
	function get_total_rows(){
		$this->db->from($this->table);
        return $this->db->count_all_results();
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
		$query = $this->db->get_where($this->table, array('id' =>$id));
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
             return $result['host'];
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
		$this->db->insert($this->table, $data);
		return $this->db->insert_id();
	}
    
	public function tree_insert($data){		
		$this->db->insert($this->tree_table, $data);
		return $this->db->insert_id();
	}
    /*
	 * 更新信息
	*/
	public function update($data,$id){
		$this->db->where('id', $id);
		$this->db->update($this->table, $data);
		return $this->db->affected_rows();
	}
    
	public function tree_update($data,$id){
		$this->db->where('id', $id);
		$this->db->update($this->tree_table, $data);
		return $this->db->affected_rows();
	}
    /*
	 * 删除信息
	*/
	public function delete($id=''){
		if ($id==true)
		{
			$sql="DELETE t1,
				  t2
				FROM db_servers_os AS t1
				  LEFT JOIN servers_os_tree AS t2
				    ON t1.id = t2.os_id
				WHERE t1.id IN($id)";
			$this->db->query($sql);	
			return $this->db->affected_rows();	
		}else 
		{
			return false;
		}
	}
	
	public function tree_delete($id){		
		if ($id==true)
		{
			$sql="SELECT GROUP_CONCAT(os_id) AS os_id FROM servers_os_tree WHERE pId=".$id;
			
			$query=$this->db->query($sql);
			$os_id_arr=$query->row_array();
			if($os_id_arr['os_id']==true)
			{
				$sql="DELETE FROM db_servers_os WHERE id IN ({$os_id_arr['os_id']})";
				$this->db->query($sql);
			}
			
			$this->db->where('pId', $id);
			$this->db->delete($this->tree_table);
			
			$this->db->where('id', $id);
			$this->db->delete($this->tree_table);
			return $this->db->affected_rows();
		}else 
		{
			return false;
		}
		
		
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