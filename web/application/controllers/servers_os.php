<?php

if (!defined("BASEPATH"))
    exit("No direct script access allowed");

class Servers_os extends Front_Controller {

    function __construct() {
	parent::__construct();
	$this->load->model('servers_os_model');
	$this->load->model('servers_web_model');
	$this->load->library('form_validation');
    }

    public function tree_node() {
	$event = isset($_GET['event']) ? $_GET['event'] : '';
	switch ($event) {
	    case 'add':
		$data['name'] = isset($_POST['name']) ? $_POST['name'] : '';
		$data['tree_level'] = isset($_POST['tree_level']) ? $_POST['tree_level'] : '';
		$data['pId'] = isset($_POST['pId']) ? $_POST['pId'] : '';
		$data['is_parent'] = isset($_POST['is_parent']) ? $_POST['is_parent'] : '';

		$id = $this->servers_os_model->tree_insert($data);
		if ($id == true) {
		    if ($data['tree_level'] == 1) {
			$response['icon'] = 'lib/ztree/img/diy/1_open.png';
			$response['open'] = true;
		    }

		    if ($data['tree_level'] == 2) {
			$response['icon'] = 'lib/ztree/img/diy/server_1.png';
			$response['open'] = true;
		    }
		    if ($data['tree_level'] == 3) {
			$response['icon'] = 'lib/ztree/img/diy/server_2.png';
		    }
		    if ($data['tree_level'] == 4) {
			$response['icon'] = 'lib/ztree/img/diy/server_3.png';
		    }
		    if ($data['tree_level'] == 5) {
			$response['icon'] = 'lib/ztree/img/diy/server_4.png';
		    }
		    $response['state'] = true;
		    $response['id'] = $id;
		} else {
		    $response['state'] = false;
		    $response['id'] = '';
		}
		echo json_encode($response);
		exit;

		break;
	    case "edit":
		$data['name'] = isset($_POST['name']) ? $_POST['name'] : '';
		$id = isset($_POST['id']) ? $_POST['id'] : '';
		if ($id == true) {

		    $res = $this->servers_os_model->tree_update($data, $id);
		    if ($res == true) {
			$response['state'] = true;
			$response['id'] = $id;
			$response['res'] = $res;
		    } else {
			$response['state'] = false;
			$response['id'] = '';
		    }
		    echo json_encode($response);
		    exit;
		}
		echo json_encode('');
		exit;
		break;
	    case 'delete';
		$id = isset($_POST['id']) ? $_POST['id'] : '';
		if ($id == true && $id > 1) {

		    $res = $this->servers_os_model->tree_delete($id);
		    if ($res == true) {
			$response['state'] = true;
			$response['id'] = $id;
			$response['msg'] = '删除成功';
		    } else {
			$response['state'] = false;
			$response['msg'] = '删除失败';
		    }
		    echo json_encode($response);
		    exit;
		}
		echo json_encode('');
		exit;
		break;
	}
    }

    /**
     * 首页
     */
    public function index() {

	parent::check_privilege();
	$host = isset($_GET["host"]) ? $_GET["host"] : "";
	$tags = isset($_GET["tags"]) ? $_GET["tags"] : "";
	$ext_where = '';
	//添加界面 得到有rsa服务器树
	$data['hosts_tree_edit'] = json_encode($this->servers_web_model->get_host_tree('edit'));
	//编辑界面得到有域名的host树
	$data['hosts_tree'] = json_encode($this->servers_web_model->get_host_tree());
	//web服务器名称
	$data['web_name'] = array('1' => 'apache', '2' => 'nginx', '3' => 'tomcat');
	//监控频率
	$data['frequency_monitor'] = array('86400' => '天');

	$this->layout->view("servers_os/index", $data);
    }

    public function flexigrid() {
	$ext_where = '';
	$event = isset($_GET['event']) ? $_GET['event'] : '';
	$page = isset($_POST['page']) ? $_POST['page'] : 1;
	$rp = isset($_POST['rp']) ? $_POST['rp'] : 10;
	$sortname = isset($_POST['sortname']) ? $_POST['sortname'] : 'id';
	$sortorder = isset($_POST['sortorder']) ? $_POST['sortorder'] : 'desc';
	$query = isset($_POST['query']) ? $_POST['query'] : '';
	$qtype = isset($_POST['qtype']) ? $_POST['qtype'] : '';
	$limit = !empty($rp) ? " LIMIT " . ($page - 1) * $rp . ',' . $rp : ' ';
	//$order=!empty($sortname)?' order by db_servers_os'.$sortname.' '.$sortorder: ' order by db_servers_os.id asc ';
	$order = ' order by db_servers_os.id asc ';
	$ext_where .= ' and db_servers_os.is_delete=0 ';

	switch ($event) {
	    case 'index':
		$result = $this->servers_os_model->select_index($ext_where . $order . $limit);
		$total = $this->servers_os_model->get_total_nums();
		$this->flexigrid_result($result, $total, $page);
		unset($result, $total);
		exit;
	    case 'search':
		$ext_where .= " and {$qtype} like '%" . $query . "%'";
		$result = $this->servers_os_model->select_index($ext_where . $order . $limit);
		$total = $this->servers_os_model->get_total_nums();
		$this->flexigrid_result($result, $total, $page);
		unset($result, $total);
		exit;
		break;
	    case "click_tree":
		$level_2_id = isset($_GET['level_2_id']) ? $_GET['level_2_id'] : '0';
		$level_2_name = isset($_GET['level_2_name']) ? urldecode($_GET['level_2_name']) : '';
		$level_3_id = isset($_GET['level_3_id']) ? $_GET['level_3_id'] : '0';
		$level_3_name = isset($_GET['level_3_name']) ? urldecode($_GET['level_3_name']) : '';
		$level_4_id = isset($_GET['level_4_id']) ? urldecode($_GET['level_4_id']) : '0';
		$level_4_name = isset($_GET['level_4_name']) ? urldecode($_GET['level_4_name']) : '';
		$os_id = isset($_GET['os_id']) ? urldecode($_GET['os_id']) : '0';
		$host = isset($_GET['host']) ? urldecode($_GET['host']) : '';
		$web_id = isset($_GET['web_id']) ? urldecode($_GET['web_id']) : '';
		if ($level_2_id == true && $level_2_name == true) {
		    $where = " and level_2_id={$level_2_id} and level_2_name='{$level_2_name}'";
		    $os_ids = $this->servers_web_model->get_os_id_by_tree_level($where);
		    if ($os_ids == true) {

			$where = " and db_servers_os.id in($os_ids) ";
			$result = $this->servers_os_model->select_index($where . $ext_where . $order . $limit);
			$total = $this->servers_os_model->get_total_nums($where);
			$this->flexigrid_result($result, $total, $page);
			unset($result, $total);
		    } else {
			echo json_encode('');
			exit;
		    }
		} elseif ($level_3_id == true && $level_3_name == true) {
		    $where = " and level_3_id={$level_3_id} and level_3_name='{$level_3_name}'";
		    $os_ids = $this->servers_web_model->get_os_id_by_tree_level($where);
		    if ($os_ids == true) {
			$where = " and db_servers_os.id in({$os_ids}) ";
			$result = $this->servers_os_model->select_index($where . $ext_where . $order . $limit);
			$total = $this->servers_os_model->get_total_nums($where);
			$this->flexigrid_result($result, $total, $page);
			unset($result, $total);
		    } else {
			echo json_encode('');
			exit;
		    }
		} elseif ($level_4_id == true && $level_4_name == true) {
		    $where = " and level_4_id={$level_4_id} and level_4_name='{$level_4_name}'";
		    $os_ids = $this->servers_web_model->get_os_id_by_tree_level($where);
		    if ($os_ids == true) {
			$where = " and db_servers_os.id in({$os_ids}) ";
			$result = $this->servers_os_model->select_index($where . $ext_where . $order . $limit);
			$total = $this->servers_os_model->get_total_nums($where);
			$this->flexigrid_result($result, $total, $page);
			unset($result, $total);
		    } else {
			echo json_encode('');
			exit;
		    }
		} elseif ($os_id == true && $host == true) {
		    $where = " and db_servers_os.id={$os_id}";
		    $result = $this->servers_os_model->select_index($where . $ext_where . $order . $limit);
		    $total = $this->servers_os_model->get_total_nums($where);
		    $this->flexigrid_result($result, $total, $page);
		    unset($result, $total);
		} else {
		    echo json_encode('');
		    exit;
		}
	}
    }

    //flexigrid输出db_servers_web结果集 
    protected function flexigrid_result($result = array(), $total = 0, $page = 0) {
	if ($result == true) {
	    header("Content-type: application/json");
	    $jsonData = array('page' => $page, 'total' => $total, 'rows' => array());
	    foreach ($result AS $row) {
//					$fn_edit='<a href="javascript:;" onclick="fn_edit('.$row['id'].')">修改</a>&nbsp;&nbsp;';
//		        	$fn_delete='<a href="javascript:;" onclick="fn_delete('.$row['id'].')">删除</a>';

		$entry = array('id' => $row['id'],
		    'cell' => array(
			'select' => '<input type="checkbox"   value="' . $row['id'] . '" name="chk">',
			'host' => $row['host'],
			'port' => $row['port'],
			'user' => $row['user'],
			'tags' => $row['tags'],
			'monitor' => check_on_off($row['monitor']),
			'send_mail' => check_on_off($row['send_mail']),
			'send_sms' => check_on_off($row['send_sms']),
			'alarm_os_process' => check_on_off($row['alarm_os_process']),
			'alarm_os_load' => check_on_off($row['alarm_os_load']),
			'alarm_os_cpu' => check_on_off($row['alarm_os_cpu']),
			'alarm_os_network' => check_on_off($row['alarm_os_network']),
			'alarm_os_disk' => check_on_off($row['alarm_os_disk']),
			'alarm_os_memory' => check_on_off($row['alarm_os_memory'])
		    ),
		);
		$jsonData['rows'][] = $entry;
	    }
	    echo json_encode($jsonData);
	    exit;
	} else {
	    echo json_encode('');
	    exit;
	}
    }

    /**
     * 得到db_servers_os表数据
     * by dave
     * 2017/1/16
     */
    public function get_server_data() {
	$id = isset($_POST['os_id']) ? $_POST['os_id'] : '';
	if ($id == true) {
	    $result = $this->servers_os_model->get_record_by_id($id);
	    if ($result == true) {
		echo json_encode($result);
		exit;
	    } else {
		echo json_encode('');
		exit;
	    }
	} else {
	    echo json_encode('');
	    exit;
	}
    }

    /**
     * 添加
     */
    public function add() {
	parent::check_privilege();
	/*
	 * 提交添加后处理
	 */

	if (isset($_POST['flag']) && $_POST['flag'] == 'add') {


	    $data = array(
		'host' => $this->input->post('os_host'),
		'port' => ($this->input->post('port') == true ? $this->input->post('port') : 22),
		'user' => $this->input->post('user'),
		'rsa' => $this->input->post('rsa'),
		'password' => $this->input->post('password'),
		'community' => $this->input->post('community'),
		'tags' => $this->input->post('tags'),
		'monitor' => $this->input->post('monitor'),
		'send_mail' => $this->input->post('send_mail'),
		'send_sms' => $this->input->post('send_sms'),
		'send_mail_to_list' => $this->input->post('send_mail_to_list'),
		'send_sms_to_list' => $this->input->post('send_sms_to_list'),
		'alarm_os_process' => $this->input->post('alarm_os_process'),
		'alarm_os_load' => $this->input->post('alarm_os_load'),
		'alarm_os_cpu' => $this->input->post('alarm_os_cpu'),
		'alarm_os_network' => $this->input->post('alarm_os_network'),
		'alarm_os_disk' => $this->input->post('alarm_os_disk'),
		'alarm_os_memory' => $this->input->post('alarm_os_memory'),
		'threshold_warning_os_process' => $this->input->post('threshold_warning_os_process'),
		'threshold_warning_os_load' => $this->input->post('threshold_warning_os_load'),
		'threshold_warning_os_cpu' => $this->input->post('threshold_warning_os_cpu'),
		'threshold_warning_os_network' => $this->input->post('threshold_warning_os_network'),
		'threshold_warning_os_disk' => $this->input->post('threshold_warning_os_disk'),
		'threshold_warning_os_memory' => $this->input->post('threshold_warning_os_memory'),
		'threshold_critical_os_process' => $this->input->post('threshold_critical_os_process'),
		'threshold_critical_os_load' => $this->input->post('threshold_critical_os_load'),
		'threshold_critical_os_cpu' => $this->input->post('threshold_critical_os_cpu'),
		'threshold_critical_os_network' => $this->input->post('threshold_critical_os_network'),
		'threshold_critical_os_disk' => $this->input->post('threshold_critical_os_disk'),
		'threshold_critical_os_memory' => $this->input->post('threshold_critical_os_memory'),
		'filter_os_disk' => $this->input->post('filter_os_disk'),
		'level_2_id' => $this->input->post('level_2_id'),
		'level_2_name' => $this->input->post('level_2_name'),
		'level_3_id' => $this->input->post('level_3_id'),
		'level_3_name' => $this->input->post('level_3_name'),
		'level_4_id' => $this->input->post('level_4_id'),
		'level_4_name' => $this->input->post('level_4_name'),
	    );
	    $insert_id = $this->servers_os_model->insert($data);
	    if ($insert_id == true) {
		$tree_data['name'] = $this->input->post('os_host');
		$tree_data['tree_level'] = 5;
		$tree_data['pId'] = $this->input->post('node_id');
		$tree_data['os_id'] = $insert_id;
		$res = $this->servers_os_model->tree_insert($tree_data);
	    } else {
		$res = FALSE;
	    }

	    if ($res) {
		$response['status'] = true;
		$response['msg'] = '添加成功';
	    } else {
		$response['status'] = FALSE;
		$response['msg'] = '添加失败';
	    }
	    echo json_encode($response);
	    exit;
	}
    }

    /**
     * 编辑
     */
    public function edit() {
	parent::check_privilege();
	$id = isset($_POST['os_id']) ? $_POST['os_id'] : '';

	if (isset($_POST['flag']) && $_POST['flag'] == 'edit') {


	    $data = array(
		'host' => $this->input->post('os_host'),
		'port' => ($this->input->post('port') == true ? $this->input->post('port') : 22),
		'user' => $this->input->post('user'),
		'password' => $this->input->post('password'),
		'rsa' => $this->input->post('rsa'),
		'community' => $this->input->post('community'),
		'tags' => $this->input->post('tags'),
		'monitor' => $this->input->post('monitor'),
		'send_mail' => $this->input->post('send_mail'),
		'send_sms' => $this->input->post('send_sms'),
		'send_mail_to_list' => $this->input->post('send_mail_to_list'),
		'send_sms_to_list' => $this->input->post('send_sms_to_list'),
		'alarm_os_process' => $this->input->post('alarm_os_process'),
		'alarm_os_load' => $this->input->post('alarm_os_load'),
		'alarm_os_cpu' => $this->input->post('alarm_os_cpu'),
		'alarm_os_network' => $this->input->post('alarm_os_network'),
		'alarm_os_disk' => $this->input->post('alarm_os_disk'),
		'alarm_os_memory' => $this->input->post('alarm_os_memory'),
		'threshold_warning_os_process' => $this->input->post('threshold_warning_os_process'),
		'threshold_warning_os_load' => $this->input->post('threshold_warning_os_load'),
		'threshold_warning_os_cpu' => $this->input->post('threshold_warning_os_cpu'),
		'threshold_warning_os_network' => $this->input->post('threshold_warning_os_network'),
		'threshold_warning_os_disk' => $this->input->post('threshold_warning_os_disk'),
		'threshold_warning_os_memory' => $this->input->post('threshold_warning_os_memory'),
		'threshold_critical_os_process' => $this->input->post('threshold_critical_os_process'),
		'threshold_critical_os_load' => $this->input->post('threshold_critical_os_load'),
		'threshold_critical_os_cpu' => $this->input->post('threshold_critical_os_cpu'),
		'threshold_critical_os_network' => $this->input->post('threshold_critical_os_network'),
		'threshold_critical_os_disk' => $this->input->post('threshold_critical_os_disk'),
		'threshold_critical_os_memory' => $this->input->post('threshold_critical_os_memory'),
		'filter_os_disk' => $this->input->post('filter_os_disk'),
	    );
	    $tree_data['name'] = $this->input->post('os_host');
	    $this->db->where('os_id', $id);
	    $this->db->update('servers_os_tree', $tree_data);
	    $this->servers_os_model->tree_update($tree_data, $id);
	    $res = $this->servers_os_model->update($data, $id);
	    if ($res) {
		$response['status'] = true;
		$response['msg'] = '修改成功';
	    } else {
		$response['status'] = FALSE;
		$response['msg'] = '修改失败';
	    }
	    echo json_encode($response);
	    exit;
	}
    }

    /**
     * 加入回收站
     */
    function delete() {
	parent::check_privilege();
	$id = isset($_POST['os_id']) ? $_POST['os_id'] : '';
	if ($id == true) {
	    $res = $this->servers_os_model->delete($id);
	    if ($res) {
		$response['status'] = true;
		$response['msg'] = '删除成功';
	    } else {
		$response['status'] = FALSE;
		$response['msg'] = '删除失败';
	    }
	    echo json_encode($response);
	    exit;
	}
	echo json_encode('');
	exit;
    }

    /**
     * 批量添加
     */
    function batch_add() {
	parent::check_privilege();

	/*
	 * 提交批量添加后处理
	 */
	$data['error_code'] = 0;
	if (isset($_POST['submit']) && $_POST['submit'] == 'batch_add') {
	    for ($n = 1; $n <= 10; $n++) {
		$host = $this->input->post('host_' . $n);
		$community = $this->input->post('community_' . $n);
		$tags = $this->input->post('tags_' . $n);

		if (!empty($host) && !empty($community) && !empty($tags)) {
		    $data['error_code'] = 0;
		    $data = array(
			'host' => $host,
			'user' => $this->input->post('user_' . $n),
			'port' => $this->input->post('port_' . $n),
			'rsa' => $this->input->post('rsa_' . $n),
			'community' => $community,
			'tags' => $tags,
			'monitor' => $this->input->post('monitor_' . $n),
			'send_mail' => $this->input->post('send_mail_' . $n),
			'send_sms' => $this->input->post('send_sms_' . $n),
			'send_mail_to_list' => $this->input->post('send_mail_to_list_' . $n),
			'send_sms_to_list' => $this->input->post('send_sms_to_list_' . $n),
			'alarm_os_process' => $this->input->post('alarm_os_process_' . $n),
			'alarm_os_load' => $this->input->post('alarm_os_load_' . $n),
			'alarm_os_cpu' => $this->input->post('alarm_os_cpu_' . $n),
			'alarm_os_network' => $this->input->post('alarm_os_network_' . $n),
			'alarm_os_disk' => $this->input->post('alarm_os_disk_' . $n),
			'alarm_os_memory' => $this->input->post('alarm_os_memory_' . $n),
		    );
		    $this->servers->insert($data);
		}
	    }
	    redirect(site_url('servers_os/index'));
	}

	$this->layout->view("servers_os/batch_add", $data);
    }

}

/* End of file servers_os.php */
/* Location: ./servers/controllers/servers_os.php */