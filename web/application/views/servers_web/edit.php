<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); ?>
<div class="header">  
            <h1 class="page-title"><?php echo $this->lang->line('_web'); ?> <?php echo $this->lang->line('edit'); ?></h1>
</div>
     
<ul class="breadcrumb">
            <li><a href="<?php echo site_url(); ?>"><?php echo $this->lang->line('home'); ?></a> <span class="divider">/</span></li>
            <li class="active"><?php echo $this->lang->line('_Servers Configure'); ?></li><span class="divider">/</span></li>
            <li class="active"><?php echo $this->lang->line('_web'); ?></li>
</ul>

<div class="container-fluid">
<div class="row-fluid">

<form name="form" class="form-horizontal" method="post" action="<?php echo site_url('servers_web/edit') ?>" >
<input type="hidden" name="submit" value="edit"/> 
<input type='hidden'  name='id' value=<?php echo $record['id'] ?> />
<input type='hidden'  name='host_old' value=<?php echo $record['host'] ?> />
<div class="btn-toolbar">
    <button type="submit" class="btn btn-primary"><i class="icon-save"></i> <?php echo $this->lang->line('save'); ?></button>
    <a class="btn btn " href="<?php echo site_url('servers_web/index') ?>"><i class="icon-list"></i> <?php echo $this->lang->line('list'); ?></a>
  <div class="btn-group"></div>
</div>

<?php if ($error_code!==0) { ?>
<div class="alert alert-error">
<button type="button" class="close" data-dismiss="alert">×</button>
<?php echo validation_errors(); ?>
</div>
<?php } ?>

<div class="well">
   
   <div class="control-group">
    <label class="control-label" for="">*<?php echo $this->lang->line('host'); ?></label>
   <div class="controls">
        <select name="os_id" id="os_id" class="input-small" style=" width: 215px;">
        	<?php foreach ($hosts as $key=>$value){?>
         		<option  <?php echo set_selected($value['os_id'],$record['os_id']) ?> value="<?php echo $value['os_id']?>"><?php echo $value['host']; ?></option>
       		<?php }?>
        </select>
    </div>
   </div>
   <div class="control-group">
    <label class="control-label" for="">*<?php echo $this->lang->line('port'); ?></label>
    <div class="controls">
      <input type="text" id="" name="port" value="<?php echo $record['web_port']; ?>">
      <span class="help-inline"></span>
    </div>
   </div>

  
   <div class="control-group">
    <label class="control-label" for="">*<?php echo $this->lang->line('tags'); ?></label>
    <div class="controls">
      <input type="text" id=""  name="tags" value="<?php echo $record['tags']; ?>" >
      <span class="help-inline"></span>
    </div>
   </div>

    <hr />
   
    <div class="control-group">
    <label class="control-label" for=""><?php echo $this->lang->line('monitor'); ?></label>
    <div class="controls">
        <select name="monitor" id="monitor" class="input-small">
         <option value="1"  <?php echo set_selected(1,$record['monitor']) ?>><?php echo $this->lang->line('on'); ?></option>
         <option value="0"  <?php echo set_selected(0,$record['monitor']) ?>><?php echo $this->lang->line('off'); ?></option>
        </select>
    </div>
   </div>
    <div class="control-group">
    <label class="control-label" for="">*<?php echo $this->lang->line('log_frequency_monitor'); ?></label>
    <div class="controls">
       <select name="frequency_monitor" id="frequency_monitor" class="input-small" style=" width: 215px;">
        	<?php foreach ($frequency_monitor as $key=>$value){?>
         		<option  <?php echo set_selected($key,$record['frequency_monitor']) ?> value="<?php echo $key?>"><?php echo $value; ?></option>
       		<?php }?>
        </select>
    </div>
   </div>
    <div class="control-group">
    <label class="control-label" for=""><?php echo $this->lang->line('send_mail'); ?></label>
    <div class="controls">
        <select name="send_mail" id="send_mail" class="input-small">
         <option value="1"  <?php echo set_selected(1,$record['send_mail']) ?>><?php echo $this->lang->line('on'); ?></option>
         <option value="0"  <?php echo set_selected(0,$record['send_mail']) ?>><?php echo $this->lang->line('off'); ?></option>
        </select>
         &nbsp;&nbsp;<?php echo $this->lang->line('alarm_mail_to_list'); ?>
        <div class="input-prepend">
            <span class="add-on">@</span>
            <input type="text" id="send_mail_to_list"  class="input-xlarge" placeholder="<?php echo $this->lang->line('many_people_separation'); ?>" name="send_mail_to_list" value="<?php echo $record['send_mail_to_list']; ?>" >
        </div>
    </div>
   </div>
   <div class="control-group">
    <label class="control-label" for=""><?php echo $this->lang->line('send_sms'); ?></label>
    <div class="controls">
        <select name="send_sms" id="send_sms" class="input-small">
         <option value="1"  <?php echo set_selected(1,$record['send_sms']) ?>><?php echo $this->lang->line('on'); ?></option>
         <option value="0"  <?php echo set_selected(0,$record['send_sms']) ?>><?php echo $this->lang->line('off'); ?></option>
        </select>
         &nbsp;&nbsp;<?php echo $this->lang->line('alarm_sms_to_list'); ?>
        <div class="input-prepend">
            <span class="add-on">@</span>
            <input type="text" id="send_sms_to_list"  class="input-xlarge" placeholder="<?php echo $this->lang->line('many_people_separation'); ?>" name="send_sms_to_list" value="<?php echo $record['send_sms_to_list']; ?>" >
        </div>
    </div>
   </div> 
   <div class="control-group">
    <label class="control-label" for="">*<?php echo $this->lang->line('web_name'); ?></label>
    <div class="controls">
       <select name="web_name" id="web_name" class="input-small" style=" width: 215px;">
        	<?php foreach ($web_name as $key=>$value){?>
         		<option <?php echo set_selected($key,$record['web_name']) ?> value="<?php echo $key?>"><?php echo $value; ?></option>
       		<?php }?>
        </select>
    </div>
   </div>
   <div class="control-group">
    <label class="control-label" for="">*<?php echo $this->lang->line('alarm_process'); ?></label>
    <div class="controls">
      <input type="text" id=""  name=alarm_process placeholder="" value="<?php if (isset($record['alarm_process'])) echo $record['alarm_process']; ?>" >
      <span class="help-inline"></span>
    </div>
   </div>
   <div class="control-group">
    <label class="control-label" for="">*<?php echo $this->lang->line('alarm_process_mem'); ?></label>
    <div class="controls">
      <input type="text" id=""  name="alarm_process_mem" placeholder="" value="<?php if (isset($record['alarm_process_mem']))echo $record['alarm_process_mem']?>" >
      <span class="help-inline"></span>
    </div>
   </div>
   <div class="control-group">
    <label class="control-label" for="">*<?php echo $this->lang->line('domain'); ?></label>
    <div class="controls">
      <input type="text" id=""  name="domain" placeholder="" value="<?php echo $record['domain']?>" >
      <span class="help-inline"></span>
    </div>
   </div>
  
   <div class="control-group">
    <label class="control-label" for="">*<?php echo $this->lang->line('web_access_path'); ?> </label>
    <div class="controls">
       <input type="text" id=""  name="web_access_path" value="<?php echo $record['web_access_path'] ?>" >
        &nbsp;&nbsp;<?php echo $this->lang->line('web_access_name'); ?>&nbsp;<input type="text" id="web_access_name" class="input-small" placeholder="" name="web_access_name" value="<?php echo $record['web_access_name'] ?>" style="
    width: 170px;">
        &nbsp;&nbsp;<?php echo $this->lang->line('web_log_rules'); ?>&nbsp;<input type="text" id="web_log_rules" class="input-small" placeholder="" name="web_log_rules" value="<?php echo $record['web_log_rules']; ?> ">
        &nbsp;&nbsp;<?php echo $this->lang->line('log_extend_name'); ?>&nbsp;<input type="text" id="log_extend_name" class="input-small" placeholder="" name="log_extend_name" value="<?php echo $record['log_extend_name'];?>" >
    </div>
   </div>
   <div class="control-group">
    <label class="control-label" for="">*<?php echo $this->lang->line('web_error_path'); ?> </label>
    <div class="controls">
       <input type="text" id=""  name="web_error_path" value="<?php echo $record['web_error_path'] ?>""" >
        &nbsp;&nbsp;<?php echo $this->lang->line('web_error_name'); ?>&nbsp;<input type="text" id="web_error_name" class="input-small" placeholder="" name="web_error_name" value="<?php echo $record['web_error_name'] ?>" style="
    width: 170px;">
        &nbsp;&nbsp;<?php echo $this->lang->line('web_error_log_rules'); ?>&nbsp;<input type="text" id="web_log_rules" class="input-small" placeholder="" name="web_error_log_rules" value="<?php echo $record['web_error_log_rules'] ?>" >
        &nbsp;&nbsp;<?php echo $this->lang->line('log_error_extend_name'); ?>&nbsp;<input type="text" id="log_error_extend_name" class="input-small" placeholder="" name="log_error_extend_name" value="<?php echo $record['log_error_extend_name'] ?>" >
    </div>
   </div>
    
   
</div>

</form>

