<script language="javascript" src="./lib/DatePicker/WdatePicker.js"></script>
<div class="header">
            
            <h1 class="page-title"> <?php echo $this->lang->line('_web Visit'); ?> <?php echo $this->lang->line('chart'); ?></h1>
</div>
        
<ul class="breadcrumb">
            <li><a href="<?php echo site_url(); ?>"><?php echo $this->lang->line('home'); ?></a> <span class="divider">/</span></li>
            <li><a href="<?php echo site_url('lp_web/index'); ?>"><?php echo $this->lang->line('_web Monitor'); ?></a></li><span class="divider">/</span></li>
            <li class="active"><?php echo $this->lang->line('chart'); ?></li>
</ul>

<div class="container-fluid">
<div class="row-fluid">

<div class="btn-toolbar">
	<div class="ui-state-default ui-corner-all" style="height: 45px;">
		<p><span style="float: left; margin-right: .3em;" class="ui-icon ui-icon-search"></span></p>
		<form name="form" class="form-inline" method="get" action="">
		  <label for="" class="" style="margin-top:6px;width: 45px;">网站：</label>
		  <select name="domain" id="domain" class="input-small" style="width: 150px;float:left">
		  <?php if(isset($domain) && !empty($domain)){?>
			  <?php foreach ($domain as $value) {?>
			  		<option <?php if($cur_domain == $value['domain']) {?>selected <?php }?> value="<?php echo $value['domain']?>"><?php echo $value['domain']?></option>
			  <?php }?>
		  <?php }?>
		  </select>
		  <label for="" class="" style="margin-top:6px;margin-left: 6px;width: 45px;">按日：</label>
		  <input class="Wdate" style="width:130px;float:left" type="text" name="daily_time" id="daily_time" value="<?php echo $cur_time?>" onClick="WdatePicker({doubleCalendar:false,isShowClear:false,readOnly:false,dateFmt:'yyyy-MM-dd',onpicked:fn_daily_time})">
		  <label for="" class="" style="margin-top:6px;margin-left:6px;width: 45px;">按月：</label>
		  <input class="Wdate" style="width:130px;float:left" type="text" name="month_time" id="month_time" value="" onClick="WdatePicker({doubleCalendar:false,isShowClear:false,readOnly:false,dateFmt:'yyyy-MM',onpicked:fn_month_time})">
		  <label for="" class="" style="margin-top:6px;margin-left: 6px;width: 45px;">按年：</label>
		  <input class="Wdate" style="width:130px;float:left" type="text" name="year_time" id="year_time" value="" onClick="WdatePicker({doubleCalendar:false,isShowClear:false,readOnly:false,dateFmt:'yyyy',onpicked:fn_year_time})">
		
<!--		  <button type="submit" class="btn btn-success"><i class="icon-search"></i> 搜索</button>-->
		</form>                
	</div>

</div> 
<hr/>
<div id="pv_visit" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="ip_uv_visit" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="tables" style="margin-top:10px; margin-left:0px; width:32%; height:240px;float: left;"></div>
<div id="files" style="margin-top:10px; margin-left:0px; width:32%; height:240px;float: left;"></div>
<div style="clear:both;"></div>
<div id="threads" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="qps_tps" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="dml" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="transaction" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="innodb_io" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="innodb_rows_read" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="innodb_rows_dml" style="margin-top:10px; margin-left:0px;width:96%; height:300px;"></div>
<div id="key_cache" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="bytes" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="aborted" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>



<script src="lib/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="./lib/echarts.common.min.js"></script>

<link href="./lib/jqplot/jquery.jqplot.min.css"  rel="stylesheet">
<script type="text/javascript">
//基于准备好的dom，初始化echarts实例
var pv_visit_chart = echarts.init(document.getElementById('pv_visit'));

var option = {
    	title: {
    	        text: 'PV访问量'
    	    },
        tooltip: {
        	trigger: 'axis'
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        legend: {
            data:['PV']
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },        
        xAxis : [
            {
                type : 'category',
                boundaryGap: false,
                data: <?php if(!empty($cur_date) && isset($cur_date)){ echo $cur_date;} else echo '[]'?>
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:"PV",
                type:"line",
                data:<?php if(isset($pv) && !empty($pv)){ echo $pv;} else echo '[]'?>,
                itemStyle:{ 
                            normal:{ 
                                  label:{ 
                                    show: true, 
                                    formatter: '{c}' 
                                  }, 
                                  labelLine :{show:true} 
                                } 
                           } 
            }
            
        ]
    };

// 为echarts对象加载数据 
pv_visit_chart.setOption(option); 

    
var ip_uv_visit = echarts.init(document.getElementById('ip_uv_visit'));

var option = {
    	title: {
    	        text: 'IP、UV访问量'
    	    },
        tooltip: {
        	trigger: 'axis'
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        legend: {
            data:['IP','UV']
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis : [
            {
                type : 'category',
                boundaryGap: false,
                data: <?php if(!empty($cur_date) && isset($cur_date)){ echo $cur_date;} else echo '[]'?>
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [            
            {
                name:"UV",
                type:"line",
                data:<?php if(isset($uv) && !empty($uv)){ echo $uv;}else echo '[]'?>,
                itemStyle:{ 
                            normal:{ 
                                  label:{ 
                                    show: true, 
                                    formatter: '{c}' 
                                  }, 
                                  labelLine :{show:true} 
                                } 
                           } 
            },
            {
                name:"IP",
                type:"line",
                data:<?php if(isset($ip) && !empty($ip)){ echo $ip;}else echo '[]'?>,
                itemStyle:{ 
                            normal:{ 
                                  label:{ 
                                    show: true, 
                                    formatter: '{c}' 
                                  }, 
                                  labelLine :{show:true} 
                                } 
                           } 
            }
        ]
    };

// 为echarts对象加载数据 
ip_uv_visit.setOption(option); 

function fn_daily_time()
{
	var time='',domain='';
	document.getElementById('month_time').value=''
	document.getElementById('year_time').value=''	
    
    time=($(this).val());
	domain=document.getElementById('domain').value
	pv_visit_chart.showLoading();
	ip_uv_visit.showLoading();
    if(domain !=''  &&  time !='')
    {
        url="<?php echo base_url()?>index.php/lp_web/ajax_charts";
        params={domain:domain, time:time };
    	ajax_charts(url,params);
    }
}
function fn_month_time()
{
	var time='',domain='';
	document.getElementById('daily_time').value=''
	document.getElementById('year_time').value=''	
    
    time=($(this).val());
	domain=document.getElementById('domain').value
	
    if(domain !=''  &&  time !='')
    {
        url="<?php echo base_url()?>index.php/lp_web/ajax_month_charts";
        params={domain:domain, time:time };
    	pv_visit_chart.showLoading();
    	ip_uv_visit.showLoading();
    	ajax_charts(url,params);
    }
}
function fn_year_time()
{
	var time='',domain='';
	document.getElementById('daily_time').value=''
	document.getElementById('month_time').value=''	
    
    time=($(this).val());
	domain=document.getElementById('domain').value
	
    if(domain !=''  &&  time !='')
    {
        url="<?php echo base_url()?>index.php/lp_web/ajax_year_charts";
        params={domain:domain, time:time };
    	pv_visit_chart.showLoading();
    	ip_uv_visit.showLoading();
    	ajax_charts(url,params);
    }
}
function ajax_charts(url,params)
{
	$.getJSON(url, params, function(json){
		pv_visit_chart.hideLoading();
		pv_visit_chart.setOption({    	            	
	                xAxis : [
	                    {
	                        
	                        data: json.cur_date
	                    }
	                ],    	               
	                series : [
	                    {
	                        name:"PV",
	                        type:"line",
	                        data:json.pv
	                    }
	                ]
	            }); 
		pv_visit_chart.setOption(pv_visit_chart.setOption);  

		ip_uv_visit.hideLoading();
		ip_uv_visit.setOption({    	            	
	                xAxis : [
	                    {
	                        
	                        data: json.cur_date
	                    }
	                ],    	               
	                series : [
	                    {
	                        name:"IP",
	                        type:"line",
	                        data:json.ip
	                    },
	                    {
	                        name:"UV",
	                        type:"line",
	                        data:json.uv
	                    }
	                ]
	            }); 
		ip_uv_visit.setOption(ip_uv_visit.setOption);  
		 
	})
}


$(document).ready(function(){  

	$("#domain").change(function(){
		var time='',domain='';
		document.getElementById('month_time').value=''
		document.getElementById('year_time').value=''	
	    
		 domain=($(this).val());
		 time=document.getElementById('daily_time').value
		
	    if(domain !=''  &&  time !='')
	    {
	        url="<?php echo base_url()?>index.php/lp_web/ajax_charts";
	        params={domain:domain, time:time };
	    	pv_visit_chart.showLoading();
	    	ajax_charts(url,params);
	    }
	});
});


</script>