<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); ?>
<div class="header">  
            <h1 class="page-title"><?php echo $this->lang->line('_web'); ?> <?php echo $this->lang->line('trash'); ?></h1>
</div>
     
<ul class="breadcrumb">
            <li><a href="<?php echo site_url(); ?>"><?php echo $this->lang->line('home'); ?></a> <span class="divider">/</span></li>
            <li class="active"><?php echo $this->lang->line('_Servers Configure'); ?></li><span class="divider">/</span></li>
            <li class="active"><?php echo $this->lang->line('_web'); ?></li>
</ul>

<div class="container-fluid">
<div class="row-fluid">
 
<div class="btn-toolbar">
    <a class="btn btn " href="<?php echo site_url('servers_web/index') ?>"><i class="icon-list"></i> <?php echo $this->lang->line('list'); ?></a>
  <div class="btn-group"></div>
</div>

<div class="well">


    <table class="table table-hover table-bordered">
      <thead>
        <tr>
		<th colspan="3"><center><?php echo $this->lang->line('servers'); ?></center></th>
		<th colspan="3"><center><?php echo $this->lang->line('items'); ?></center></th>
        <th colspan="4"><center><?php echo $this->lang->line('monitoring'); ?></center></th>
        <th colspan="1"></th>
	    </tr>
        <tr style="font-size: 12px;">
        <th><?php echo $this->lang->line('host'); ?></th>
        <th><?php echo $this->lang->line('port'); ?></th>              
        <th><?php echo $this->lang->line('tags'); ?></th>
         <th><?php echo $this->lang->line('web_name'); ?></th>
		<th><?php echo $this->lang->line('domain'); ?></th>
		<th><?php echo $this->lang->line('web_access_log'); ?></th>		
		<th><?php echo $this->lang->line('monitor'); ?></th>
		<th><?php echo $this->lang->line('frequency_monitor'); ?></th>
		<th><?php echo $this->lang->line('send_mail'); ?></th>
        <th><?php echo $this->lang->line('send_sms'); ?></th>
        <th></th>
	</tr>
      </thead>
      <tbody>
 <?php if(!empty($datalist)) {?>
 <?php foreach ($datalist  as $item):?>
    <tr style="font-size: 12px;">
    <td><?php echo $item['host'] ?></td>
		<td><?php echo $item['web_port'] ?></td>
        <td><?php echo $item['tags'] ?></td>
        <td><?php echo $item['web_server_name']?></td>
		<td><?php echo $item['domain'] ?></td>
		<td><?php echo $item['web_access_log'] ?></td>
        <td><?php echo check_on_off($item['monitor']) ?></td>
        <td><?php echo $item['frequency_monitor_time'] ?></td>        
        <td><?php echo check_on_off($item['send_mail']) ?></td>
        <td><?php echo check_on_off($item['send_sms']) ?></td>        
        <td><a href="<?php echo site_url('servers_web/recover/'.$item['id']) ?>" title="<?php echo $this->lang->line('recover'); ?>"><i class="icon-repeat"></i></a>&nbsp;&nbsp;&nbsp;<a href="<?php echo site_url('servers_web/forever_delete/'.$item['id']) ?>" class="confirm_delete" title="<?php echo $this->lang->line('forever_delete'); ?>" ><i class="icon-remove"></i></a></td>
    
	</tr>
 <?php endforeach;?>
<tr>
<td colspan="12">
<font color="#000000"><?php echo $this->lang->line('total_record'); ?> <?php echo $datacount; ?></font>
</td>
</tr>
 <?php }else{  ?>
<tr>
<td colspan="12">
<font color="red"><?php echo $this->lang->line('no_record'); ?></font>
</td>
</tr>
<?php } ?>      
      </tbody>
    </table>
</div>


<script type="text/javascript">
	$(' .confirm_delete').click(function(){
		return confirm("<?php echo $this->lang->line('forever_delete_confirm'); ?>");	
	});
</script>