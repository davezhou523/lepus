
<div class="header">
            
            <h1 class="page-title"><?php echo $this->lang->line('_web'); ?> <?php echo $this->lang->line('_web Monitor'); ?> <?php echo $this->lang->line('chart'); ?></h1>
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
		  <label for="" class="">按日：</label>
		  <input class="Wdate" style="width:130px;" type="text" name="daily_time" id="daily_time" value="<?php echo $cur_time?>" onClick="WdatePicker({doubleCalendar:false,isShowClear:false,readOnly:false,dateFmt:'yyyy-MM-dd H:m',onpicked:fn_daily_time})">
<!--		  <label for="" class="">按月：</label>-->
<!--		  <input class="Wdate" style="width:130px;" type="text" name="month_time" id="month_time" value="" onClick="WdatePicker({doubleCalendar:false,isShowClear:false,readOnly:false,dateFmt:'yyyy-MM',onpicked:fn_month_time})">-->
<!--		  <label for="" class="">按年：</label>-->
<!--		  <input class="Wdate" style="width:130px;" type="text" name="year_time" id="year_time" value="" onClick="WdatePicker({doubleCalendar:false,isShowClear:false,readOnly:false,dateFmt:'yyyy',onpicked:fn_year_time})">-->
		
<!--		  <button type="submit" class="btn btn-success"><i class="icon-search"></i> 搜索</button>-->
		</form>                
	</div>

</div> 
<hr/>
<div id="process_num" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="established" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="listen" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
<div id="time_wait" style="margin-top:10px; margin-left:0px; width:96%; height:300px;"></div>
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
<script language="javascript" src="lib/DatePicker/WdatePicker.js"></script>
<script src="lib/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="./lib/echarts.common.min.js"></script>
<script type="text/javascript">
//基于准备好的dom，初始化echarts实例
var process_num_myChart = echarts.init(document.getElementById('process_num'));
var option = {
    	title: {
    	        text: '连接进程数'
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
            data:['process_num']
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
                name:"process_num",
                type:"line",
                data:<?php if(isset($process_num) && !empty($process_num)){ echo $process_num;} else echo '[]'?>
            }
        ]
    };

    // 为echarts对象加载数据 
	process_num_myChart.setOption(option);
	 
	//基于准备好的dom，初始化echarts实例
    var established_myChart = echarts.init(document.getElementById('established'));
    var option = {
        	title: {
        	        text: '建立连接数'
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
                data:['established']
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
                    name:"established",
                    type:"line",
                    data:<?php if(isset($established) && !empty($established)){ echo $established;}else echo '[]'?>
                }
            ]
        };

        // 为echarts对象加载数据 
    established_myChart.setOption(option);  
    //基于准备好的dom，初始化echarts实例
    var listen_myChart = echarts.init(document.getElementById('listen'));
    var option = {
        	title: {
        	        text: '连接监听数'
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
                data:['listen']
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
                    name:"listen",
                    type:"line",
                    data:<?php if(isset($listen) && !empty($listen)){ echo $listen;}else echo '[]'?>
                }
            ]
        };

        // 为echarts对象加载数据 
    listen_myChart.setOption(option); 


    
    //基于准备好的dom，初始化echarts实例
    var time_wait_myChart = echarts.init(document.getElementById('time_wait'));
    var option = {
        	title: {
        	        text: '完成等待连接数'
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
                data:['time_wait']
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
                    name:"time_wait",
                    type:"line",
                    data:<?php if(isset($time_wait) && !empty($time_wait)){ echo $time_wait;}else echo '[]'?>
                }
            ]
        };

        // 为echarts对象加载数据 
    time_wait_myChart.setOption(option); 
    
function fn_daily_time()
{
	var time='',web_id='';
    web_id=<?php if(isset($web_id) && !empty($web_id)){ echo $web_id;}else echo ''?>;
    time=($(this).val());
	 if(time !='')
	 {
	        var url="<?php echo site_url('lp_web/chart?ajax=1')?>";
	        var params={web_id:web_id,time:time};
	        process_num_myChart.showLoading();
	    	ajax_charts(url,params);
	}
}


function ajax_charts(url,params)
{
	$.getJSON(url, params, function(json){
		process_num_myChart.hideLoading();
		process_num_myChart.setOption({    	            	
	                xAxis : [
	                    {
	                        
	                        data: json.cur_date
	                    }
	                ],    	               
	                series : [
	                    {
	                        name:"process_num",
	                        type:"line",
	                        data:json.process_num
	                    }
	                   
	                ]
	            }); 
		process_num_myChart.setOption(process_num_myChart.setOption);    

		listen_myChart.hideLoading();
		listen_myChart.setOption({    	            	
	                xAxis : [
	                    {
	                        
	                        data: json.cur_date
	                    }
	                ],    	               
	                series : [
	                    {
	                        name:"listen",
	                        type:"line",
	                        data:json.listen
	                    }
	                   
	                ]
	            }); 
		listen_myChart.setOption(listen_myChart.setOption); 

		established_myChart.hideLoading();
		established_myChart.setOption({    	            	
	                xAxis : [
	                    {
	                        
	                        data: json.cur_date
	                    }
	                ],    	               
	                series : [
	                    {
	                        name:"established",
	                        type:"line",
	                        data:json.established
	                    }
	                   
	                ]
	            }); 
		established_myChart.setOption(established_myChart.setOption); 

		time_wait_myChart.hideLoading();
		time_wait_myChart.setOption({    	            	
	                xAxis : [
	                    {
	                        
	                        data: json.cur_date
	                    }
	                ],    	               
	                series : [
	                    {
	                        name:"time_wait",
	                        type:"line",
	                        data:json.time_wait
	                    }
	                   
	                ]
	            }); 
		time_wait_myChart.setOption(time_wait_myChart.setOption); 
		    
	})
}

</script>