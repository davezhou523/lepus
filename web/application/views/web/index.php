<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); ?>
<div class="header">
            
            <h1 class="page-title"><?php echo $this->lang->line('web'); ?> <?php echo $this->lang->line('_Health Monitor'); ?></h1>
</div>
        
<ul class="breadcrumb">
            <li><a href="<?php echo site_url(); ?>"><?php echo $this->lang->line('home'); ?></a> <span class="divider">/</span></li>
            <li class="active"><?php echo $this->lang->line('_web Monitor'); ?></li><span class="divider">/</span></li>
            <li class="active"><?php echo $this->lang->line('_Health Monitor'); ?></li>
</ul>

<div class="container-fluid">
<div class="row-fluid">
 
<script src="lib/bootstrap/js/bootstrap-switch.js"></script>
<link href="lib/bootstrap/css/bootstrap-switch.css" rel="stylesheet"/>
                    
<div class="ui-state-default ui-corner-all" style="height: 45px;" >
<p><span style="float: left; margin-right: .3em;" class="ui-icon ui-icon-search"></span>                 
<form name="form" class="form-inline" method="get" action="<?php echo site_url('lp_web/index') ?>" >
   <input type="hidden" name="search" value="submit" />

 <input type="text" id="host"  name="host" value="<?php echo $setval['host']; ?>" placeholder="<?php echo $this->lang->line('please_input_host'); ?>" class="input-medium" >
 <input type="text" id="tags"  name="tags" value="<?php echo $setval['tags']; ?>" placeholder="<?php echo $this->lang->line('please_input_tags'); ?>" class="input-medium" >
  
  

  <button type="submit" class="btn btn-success"><i class="icon-search"></i> <?php echo $this->lang->line('search'); ?></button>
  <a href="<?php echo site_url('lp_web/index') ?>" class="btn btn-warning"><i class="icon-repeat"></i> <?php echo $this->lang->line('reset'); ?></a>
  <button id="refresh" class="btn btn-info"><i class="icon-refresh"></i> <?php echo $this->lang->line('refresh'); ?></button>
</form>                
</div>


<div class="well">
    <table class="table table-hover table-condensed ">
      <thead>
        <tr style="font-size: 12px;">
		<th colspan="2"><center><?php echo $this->lang->line('servers'); ?></center></th>
        <th colspan="4"><center><?php echo $this->lang->line('basic_info'); ?></center></th>
		<th colspan="3"><center><?php echo $this->lang->line('thread'); ?></center></th>
        <th ></th>
	   </tr>
        <tr style="font-size: 12px;">
        <th><?php echo $this->lang->line('host'); ?></th> 
        <th><?php echo $this->lang->line('tags'); ?></th> 
		<th><?php echo $this->lang->line('connect'); ?></th>
		<th><?php echo $this->lang->line('web_name'); ?></th>
		<th><?php echo $this->lang->line('process_num'); ?></th>
        <th><?php echo $this->lang->line('listen'); ?></th>
        <th><?php echo $this->lang->line('established'); ?></th>
        <th><?php echo $this->lang->line('time_wait'); ?></th>        
		 <th><?php echo $this->lang->line('chart'); ?></th>
	    </tr>
      </thead>
      <tbody>
 <?php if(!empty($datalist)) {?>
 <?php foreach ($datalist  as $item):?>
    <tr style="font-size: 12px;">
        <td><?php echo $item['host'] ?>:<?php echo $item['web_port'] ?></td>
		<td><?php echo $item['tags'] ?></td>
		<td><?php if($item['process_num']>='1'){ ?> <span class="label label-success"><?php echo $this->lang->line('success'); ?></span> <?php }else{  ?><span class="label label-important"><?php echo $this->lang->line('failure'); ?></span> <?php } ?></td>
        <td><?php echo check_web($item['web_name']) ?></td>
        <td><?php echo check_web_connections($item['process_num'],$item['alarm_process']) ?></td>
        <td><?php echo $item['listen'] ?></td>
        <td><?php echo $item['established'] ?></td>
        <td><?php echo $item['time_wait'] ?></td>
        <td><?php if($item['process_num']>='1'){ ?><a href="<?php echo site_url('lp_web/chart?web_id='.$item['web_id']) ?>"><img src="./images/chart.gif"/></a> <?php }else{  ?>--- <?php } ?></td>
	</tr>
 <?php endforeach;?>
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
    $('#refresh').click(function(){
        document.location.reload(); 
    })
 </script>

