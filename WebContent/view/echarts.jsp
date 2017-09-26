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
		<title>Insert title here</title>
	    <script src="../js/echarts.js"></script>
	    <script src="../js/jquery.min.js"></script>
	</head>
	<body>
		<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	    <div id="main" style="height:400px;width:600px;"></div>
	    <script type="text/javascript">
	    
	                // 基于准备好的dom，初始化echarts图表
	                var myChart = echarts.init(document.getElementById('main')); 
	                var option = {
	                    tooltip: {
	                        show: true
	                    },
	                    legend: {
	                        data:['销量']
	                    },
	                    xAxis : [
	                        {
	                            type : 'category',
	                            data : (function(){
	                                    var arr=[];
	                                        $.ajax({
	                                        type : "post",
	                                        async : false, //同步执行
	                                        url : "portal/showbar.do",
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
	                            name:"销量",
	                            type:"bar",
	                            data:(function(){
	                                        var arr=[];
	                                        $.ajax({
	                                        type : "post",
	                                        async : false, //同步执行
	                                        url : "portal/showbar.do",
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
	                            })()
	                            
	                        }
	                    ]
	                };               
	                // 为echarts对象加载数据 
	                myChart.setOption(option);        
	            
	    </script>
	</body>
</html>