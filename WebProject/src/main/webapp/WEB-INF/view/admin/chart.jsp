<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$.ajax({
			url:"/admin/chart",
			type:"GET",
			success : function(result) {
				console.log(result);
				$(result).each(function(){
					var xValues = new Array();
					var yValues = new Array();
					for(i=1; i<=12; ++i){
						yValues.push(result['월매출'][i+'월']);
						xValues.push(i);
					}
					new Chart("myChart", {
					  type: "line",
					  data: {
					    labels: xValues,
					    datasets: [{
					      fill: false,
					      lineTension: 0,
					      backgroundColor: "rgba(0,0,255,1.0)",
					      borderColor: "rgba(0,0,255,0.1)",
					      data: yValues
					    }]
					  },
					  options: {
					    legend: {display: false},
					    title: {
						      display: true,
						      text: "월 매출"
						    }
					    /* scales: {
					      yAxes: [{ticks: {min: 0, max:1000000}}],
					    } */
					  }
					});
					var xValues2 = new Array();
					var yValues2 = new Array();
					var barColors = ["red", "green","blue","orange","brown"];
					for(i=1; i<=52; ++i){
						yValues2.push(result['주간매출'][i+'주']);
						xValues2.push(i);
					}
					new Chart("myChart2", {
					  type: "bar",
					  data: {
					    labels: xValues2,
					    datasets: [{
					      backgroundColor: "red",
					      data: yValues2
					    }]
					  },
					  options: {
					    legend: {display: false},
					    title: {
					      display: true,
					      text: "주간 매출"
					    }
					  }
					});
					
					var xValues3 = new Array();
					var yValues3 = new Array();
					var barColors2 = [
					  "#b91d47",
					  "#00aba9",
					  "#2b5797",
					  "#e8c3b9",
					  "#1e7145"
					];
					for(i=1; i<=31; ++i){
						yValues3.push(result['일매출'][i+'일']);
						xValues3.push(i);
					}
					new Chart("myChart3", {
					  type: "line",
					  data: {
					    labels: xValues3,
					    datasets: [{
						      fill: false,
						      lineTension: 0,
						      backgroundColor: "rgba(100,0,255,1.0)",
						      borderColor: "rgba(0,0,255,0.1)",
						      data: yValues3
						    }]
					  },
					  options: {
						legend: {display: false},
					    title: {
					      display: true,
					      text: "일 매출"
					    }
					  }
					});
				});
				
			}
		})
	});
	
	//탭 메뉴 이벤트 설정
	function openshow(evt, show) {
		console.log("test");
	    var i, tabcontent, tablinks;
	
	    tabcontent = document.getElementsByClassName("tabs");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	
	    tablinks = document.getElementsByClassName("tabbtn");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }
	
	    document.getElementById(show).style.display = "block";
	    evt.currentTarget.className += " active";
	}
	
	function rankajax(category, chart1){
		$.ajax({
			url:"/admin/showsale",
			type:"GET",
			data:{
				option:category
			},
			success : function(result) {
				var dataPoints = [];

		        for (var key in result) {
		            if (result.hasOwnProperty(key)) {
		                dataPoints.push({ x: key, y: result[key] });
		            }
		        }
		        
		        // yValue 크기 순으로 정렬
		        dataPoints.sort(function(a, b) {
		            return b.y - a.y;
		        });
		        
		        // 상위 10개의 데이터 포인트 선택
		        var topDataPoints = dataPoints.slice(0, 10);
		        var xValues = topDataPoints.map(function(point) {
		            return point.x;
		        });
		        
		        var yValues = topDataPoints.map(function(point) {
		            return point.y;
		        });

		        chartajax(xValues, yValues, chart1);
			}
		});
	}
	
	function chartajax(xValues, yValues, chart1){
		var barColors = ["red", "green","blue","orange","brown","yellow"];
		// yValues의 총합 계산
	    var total = yValues.reduce(function (sum, value) {
	        return sum + value;
	    }, 0);
	    
	    // 상대적 백분율 계산 및 데이터 준비
	    var relativePercentages = yValues.map(function (value) {
	        return Math.round((value / total) * 100);
	    });

	    new Chart(chart1, {
	        type: "bar",
	        data: {
	            labels: xValues,
	            datasets: [{
	                backgroundColor: barColors,
	                data: relativePercentages
	            }]
	        },
	        options: {
	            legend: { display: false },
	            title: {
	                display: true,
	                text: "예매율"
	            },
	            
	            scales: {
	                yAxes: [{
	                    ticks: {
	                        callback: function (value) {
	                            return value + "%";
	                        }
	                    }
	                }]
	            }
	        }
	    });
	}
	
	function chartall(chart2){
		$.ajax({
			url:"/admin/saleall",
			type:"GET",
			success : function(result) {
				var dataPoints = [];

		        for (var key in result) {
		            if (result.hasOwnProperty(key)) {
		                dataPoints.push({ x: key, y: result[key] });
		            }
		        }
		        
		        // yValue 크기 순으로 정렬
		        dataPoints.sort(function(a, b) {
		            return b.y - a.y;
		        });
		        
		        // 상위 10개의 데이터 포인트 선택
		        var topDataPoints = dataPoints.slice(0, 10);
		        var xValues = topDataPoints.map(function(point) {
		            return point.x;
		        });
		        
		        var yValues = topDataPoints.map(function(point) {
		            return point.y;
		        });
				
		        chartpie(xValues, yValues, chart2);
			}
		});
	}
	function chartpie(xValue, yValue, chart2){
		
	    var barColors2 = [
	      "#b91d47",
	      "#00aba9",
	      "#2b5797",
	      "#e8c3b9",
	      "#1e7145"
	    ];
	    new Chart(chart2, {
	    	  type: "pie",
	    	  data: {
	    	    labels: xValue,
	    	    datasets: [{
	    	      backgroundColor: barColors2,
	    	      data: yValue
	    	    }]
	    	  },
	    	  options: {
	    	    title: {
	    	      display: true,
	    	      text: "전체 예매율"
	    	    },
	    	  
	    	  }
	    	});
	    
	}
	$(document).ready(function(){
		category = "";
		$("#btnShow").click(function(event){
			console.log(event.target);
			category= "show";
			rankajax(category ,"myChartShow1");
			chartall("myChartShow2");
		});
		$("#btnArt").click(function(event){
			console.log(event.target);
			category= "art";
			rankajax(category, "myChartArt1");
			chartall("MyChartArt2");
		});
		$("#btnMusic").click(function(event){
			console.log(event.target);
			category= "music";
			rankajax(category, "myChartMusic1");
			chartall("MyChartMusic2");
		});
		$("#btnKid").click(function(event){
			console.log(event.target);
			category= "kid";
			rankajax(category, "myChartKid1");
			chartall("MyChartKid2");
		});
		
		
	});
</script>

 <!-- 본문 -->
 <div class="main">
 	 <div class="chart_main" style="border: solid 1px black;">
     
     <!-- 상단 매출부분 -->
	     <div style="border: solid 1px black; max-width:100%;">
	     <canvas id="myChart" ></canvas>
	     </div>
	     <div style="border: solid 1px black; max-width:100%;">
	     <canvas id="myChart2"></canvas>
	     </div>
	     <div style="border: solid 1px black; max-width:100%;">
	     <canvas id="myChart3"></canvas>
	     </div>
	     <div style="border: solid 1px black; max-width:100%;">총 회원수
	     <canvas id="myChart4"></canvas>
	     </div>
	     
     <!-- 하단 탭 부분 -->
	 <div class="chart_tab">
		<button class="tabbtn" id="btnShow" onclick="openshow(event, 'chart-show')">공연</button>
		<button class="tabbtn" id="btnArt" onclick="openshow(event, 'chart-art')">전시</button>
		<button class="tabbtn" id="btnMusic" onclick="openshow(event, 'chart-music')">음악</button>
		<button class="tabbtn" id="btnKid" onclick="openshow(event, 'chart-kid')">키즈</button>
	 </div>
     </div>
     
     <div class="tabs"  id="chart-show" style="display: nones;">
     	<div class="tab_main" >
	     <div style="border: solid 4px black; max-width:100%;">
	     	<canvas id="myChartShow1"></canvas>
	     </div>
	     <div id="chart-1" style="border: solid 1px black; max-width:100%;">
	     	<canvas id="myChartShow2"></canvas>
	     </div>
	     </div>
     </div>
     <div class="tabs" id="chart-music" style="display: none; border: solid 1px black;">
     	<div class="tab_main">
	     <div style="border: solid 1px black; max-width:100%; ">
	     	<canvas id="myChartMusic1"></canvas>
	     </div>
	     <div id="chart-1" style="border: solid 1px black; max-width:100%;">
	     	<canvas id="myChartMusic2"></canvas>
	     </div>
	     </div>
     </div>
     <div class="tabs"  id="chart-art" style="display: none; border: solid 1px black;">
     	<div class="tab_main">
	     <div style="border: solid 1px black; max-width:100%;">
	     	<canvas id="myChartArt1"></canvas>
	     </div>
	     <div id="chart-1" style="border: solid 1px black; max-width:100%;">
	     	<canvas id="myChartArt2"></canvas>
	     </div>
	     </div>
     </div>
     <div class="tabs"  id="chart-kid" style="display: none; border: solid 1px black;">
     	<div class="tab_main">
	     <div style="border: solid 1px black; max-width:100%;">
	     	<canvas id="myChartKid1"></canvas>
	     </div>
	     <div id="chart-1" style="border: solid 1px black; max-width:100%;">
	     	<canvas id="myChartKid2"></canvas>
	     </div>
    	</div>
     </div>
    
 </div>
<script>


const xValues4 = [50,60,70,80,90,100,110,120,130,140,150];
const yValues4 = [7,8,8,9,9,9,10,11,14,14,15];

new Chart("myChart4", {
	type: 'bar',
	   data: {
	       datasets: [{
	           label: 'Bar Dataset',
	           data: [10, 20, 30, 40],
	           // this dataset is drawn below
	           order: 2
	       }, {
	           label: 'Line Dataset',
	           data: [10, 30, 10, 20],
	           type: 'line',
	           // this dataset is drawn on top
	           order: 1
	       }],
	       labels: ['January', 'February', 'March', 'April']
	   },
  options: {
    legend: {display: false},
    scales: {
      yAxes: [{ticks: {min: 0, max:60}}],
    }
  }
});


/* new Chart("myChart5", {
	type: 'bar',
	   data: {
	       datasets: [{
	           label: 'Bar Dataset',
	           data: [10, 20, 30, 40],
	           // this dataset is drawn below
	           order: 2
	       }, {
	           label: 'Line Dataset',
	           data: [10, 30, 10, 20],
	           type: 'line',
	           // this dataset is drawn on top
	           order: 1
	       }],
	       labels: ['January', 'February', 'March', 'April']
	   },
  options: {
    legend: {display: false},
    scales: {
      yAxes: [{ticks: {min: 0, max:60}}],
    }
  }
}); */

</script>