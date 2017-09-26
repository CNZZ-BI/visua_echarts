<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
	    <base href="<%=basePath%>">
		<title>地区蒸发量和降水量走势</title>
	    <script src="<%=basePath%>/js/echarts.js"></script>
	    <script src="<%=basePath%>/js/jquery.min.js"></script>
	</head>
	<body>
		<div id="main" style="height:400px;width:600px;"></div>
	    <script type="text/javascript">
            // 基于准备好的dom，初始化echarts图表
            var myChart = echarts.init(document.getElementById('main')); 
			option = {
			    title : {
			        text: '地区蒸发量和降水量'
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['蒸发量','降水量']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			        	type : 'category',
                        data : (function(){
                                var arr=[];
                                    $.ajax({
                                    type : "post",
                                    async : false, //同步执行
                                    url : "portal/showbar_2.do",
                                    data : {},
                                    dataType : "json", //返回数据形式为json
                                    success : function(result) {
                                    if (result) {
                                           for(var i=0;i<result.length;i++){
                                              console.log(result[i].context);
                                              arr.push(result[i].user.name);
                                            }    
                                    }
                                    
                                },
                                error : function(errorMsg) {
                                    alert("图表请求数据失败,请重试!");
                                    myChart.hideLoading();
                                }
                               })
                               return arr;
                            })() 
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'蒸发量',
			            type:'bar',
			            data:(function(){
                            var arr=[];
                            $.ajax({
                            type : "post",
                            async : false, //同步执行
                            url : "portal/showbar_2.do",
                            data : {},
                            dataType : "json", //返回数据形式为json
                            success : function(result) {
                            if (result) {
                                   for(var i=0;i<result.length;i++){
                                      console.log(result[i].context);
                                      arr.push(result[i].user.num);
                                    }  
                            }
                        },
                        error : function(errorMsg) {
                        	alert("图表请求数据失败,请重试!");
                            myChart.hideLoading();
                        }
                       })
                      return arr;
                })(),
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'降水量',
			            type:'bar',
			            data:(function(){
                            var arr=[];
                            $.ajax({
                            type : "post",
                            async : false, //同步执行
                            url : "portal/showbar_2.do",
                            data : {},
                            dataType : "json", //返回数据形式为json
                            success : function(result) {
                            if (result) {
                                   for(var i=0;i<result.length;i++){
                                      console.log(result[i].context);
                                      arr.push(result[i].user.num2);
                                    }  
                            }
                        },
                        error : function(errorMsg) {
                        	alert("图表请求数据失败,请重试!");
                            myChart.hideLoading();
                        }
                       })
                      return arr;
                })(),
			            markPoint : {
			                data : [
			                    {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183, symbolSize:18},
			                    {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name : '平均值'}
			                ]
			            }
			        }
			    ]
			};
			myChart.setOption(option);
		</script>           
	</body>
</html>