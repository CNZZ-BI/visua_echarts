<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	    <script src="../js/echarts.js"></script>
	     <script src="../js/esl.js"></script>
	    <script src="../js/jquery.min.js"></script>
	</head>
	<body>
		<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	    <div id="main" style="height:400px;width:600px;"></div>
	    <script type="text/javascript">
		    require.config({  
                paths: { 
                    echarts:'../js/'
                }  
            });
		    require(
		    	    [
		    	        'echarts',
		    	        'echarts/chart/bar'
		    	    ],
		    	    function (ec) {
		    	        var myChart = ec.init(document.getElementById('main'));
		    	        myChart.setOption({
		    	        	title : {
				        		text :'Echart 入门实例'
				        	},	
				            tooltip: {},
				            legend: {
				                data:['销量']
				            },
				            xAxis : {data : ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]},
				            yAxis : {},
				            series : [
				                {
				                    name :'销量',
				                    type :'bar',
				                    data :[5, 20, 40, 10, 10, 20]
				                }
				            ]
		    	        });
		    	    }
		    	);
	    </script>
	</body>
</html>