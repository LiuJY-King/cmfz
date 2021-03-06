<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/china.js"></script>

<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="statistics_china" style="width: 100%;height: 100%;margin-top: 30px;margin-left: 30px">

</div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('statistics_china'));

    function randomData() {
        return Math.round(Math.random() * 1000);
    }

    option = {
        title : {
            text: '持名法州用户分布图',
            subtext: '用户数量',
            left: 'center'
        },
        tooltip : {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data:['男','女']
        },
        visualMap: {
            min: 0,
            max: 2500,
            left: 'left',
            top: 'bottom',
            text:['高','低'],           // 文本，默认为数值文本
            calculable : true
        },
        toolbox: {
            show: true,
            orient : 'vertical',
            left: 'right',
            top: 'center',
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        series : [
            {
                name: '男',
                type: 'map',
                mapType: 'china',
                roam: false,
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: true
                    }
                },
                data:[]
            }, {
                name: '女',
                type: 'map',
                mapType: 'china',
                roam: false,
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: true
                    }
                },
                data:[]
            }
        ]
    };
    myChart.setOption(option);
    // 异步加载统计信息
    $.post("${pageContext.request.contextPath }/user/queryCountMan",function(data){
        console.log(data);
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption({
            series: [{
                // 根据名字对应到相应的系列
                name: '男',
                data: data
            }]
        });
    },"json");
    $.post("${pageContext.request.contextPath }/user/queryCountWomen",function(data){
        console.log(data);
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption({
            series: [{
                // 根据名字对应到相应的系列
                name: '女',
                data: data
            }]
        });
    },"json");
</script>








<%--mvn install:install-file -Dfile=F:\java\api_sdk\aliyun-java-sdk-core\aliyun-java-sdk-core-3.3.1.jar -DgroupId=com.baizhi -DartifactId=aaa -Dversion=1.0 -Dpackaging=jar--%>



<%--mvn install:install-file -Dfile=F:\java\api_sdk\aliyun-java-sdk-dysmsapi\aliyun-java-sdk-dysmsapi-1.0.0.jar -DgroupId=com.baizhi -DartifactId=bbb -Dversion=1.0 -Dpackaging=jar--%>
















