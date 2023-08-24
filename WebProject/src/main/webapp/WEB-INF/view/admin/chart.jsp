<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
function mainchart(optionval){
	$.ajax({
		url:"/admin/chart",
		type:"GET",
		success : function(result) {
			console.log(result);
			$(result).each(function(){
				var xValues = new Array();
				var yValues = new Array();
				var now = new Date();	// 현재 날짜 및 시간
				var month = now.getMonth();	// 월
				
				var currentMonth = now.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
				console.log("얼마로 넘어오니? >?>>>>>>"+ optionval);
			    //var optionMonth = parseInt(optionValue); // value 값을 정수로 변환합니다.
				var opmonth = result['월매출'][optionval+'월'];
			    var memMonth = result['회원추이'][optionval+'월'];
			    var formattedOpMonth = Number(opmonth).toLocaleString();
			    
		    	$("#month-sales").html("월 매출<br>"+formattedOpMonth+"￦");
		    	if(memMonth !== undefined){
		    		$("#join_member").html("회원 추이<br>+"+memMonth+"명");
		    	}else{
		    		$("#join_member").html("회원 추이<br> 0 명");
		    	}
		    	
		    	console.log(result["월매출"][opmonth]);
			    
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
				            backgroundColor: "rgba(57, 158, 76,1.0)",
				            borderColor: "rgba(57, 158, 76, 1.0)",
				            data: yValues
				           
				        }]
				    },
				    options: {
				        legend: { display: false },
				        scales: {
							xAxes: [{
								display: false,
								
							}],
					        yAxes: [{
					        	display: false,
								
							}]
						}
				    }
				    
				});
				
				var currentWeekNumber = getWeekNumber(now); // 이번 주의 주차 구하기
				var currentDay = now.getDate(); // 오늘 날짜 구하기
				
				// 이번 주의 주차를 가져오는 함수
				function getWeekNumber(date) {
				    var onejan = new Date(date.getFullYear(), 0, 1);
				    return Math.ceil((((date - onejan) / 86400000) + onejan.getDay() + 1) / 7);
				}

				// 이번 주의 주차에 해당하는 주간 매출 값을 가져와서 설정
				var weekSales = result["주간매출"][currentWeekNumber + "주"];
				if (weekSales !== undefined) {
				    var formattedWeekSales = Number(weekSales).toLocaleString();

				    $("#week-sales").html("주간 매출<br>" + formattedWeekSales + "￦");
				    console.log(result["주간매출"][currentWeekNumber + "주"]);
				}else{
					$("#week-sales").html("주간 매출<br> 0 ￦");
				}
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
				    	backgroundColor: "rgba(57, 158, 76,1.0)",
			            borderColor: "rgba(57, 158, 76, 1.0)",
				      	data: yValues2
				    }]
				  },
				  options: {
				    legend: {display: false},
				    scales: {
						xAxes: [{
							display: false,
							
						}],
				        yAxes: [{
				        	display: false,
							
						}]
					}
				  }
				});
				var xValues4 = new Array();
				var yValues4 = new Array();
				for(i=1; i<=12; ++i){
					yValues4.push(result['회원추이'][i+'월']);
					xValues4.push(i);
				}
				new Chart("myChart4", {
					 type: "bar",
					  data: {
					    labels: xValues4,
					    datasets: [{
					      fill: false,
					      lineTension: 0,
					      backgroundColor: "rgba(57, 158, 76,1.0)",
				            borderColor: "rgba(57, 158, 76, 1.0)",
					      data: yValues4
					    }]
					  },
					  options: {
					    legend: {display: false},
					    scales: {
							xAxes: [{
								display: false,
								
							}],
					        yAxes: [{
					        	display: false,
								
							}]
						}
					    
					  }
					  
				}); 
				// 오늘에 해당하는 일 매출 값을 가져와서 설정
				var todaySales = result["일매출"][currentDay + "일"];
				if (todaySales !== undefined) {
				    var formattedTodaySales = Number(todaySales).toLocaleString();

				    $("#day-sales").html("오늘 매출<br>" + formattedTodaySales + "￦");
				    console.log(result["일매출"][currentDay + "일"]);
				}else{
					$("#day-sales").html("오늘 매출<br> 0 ￦");
				}
				var xValues3 = new Array();
				var yValues3 = new Array();
				
				for(i=1; i<=31; ++i){
					yValues3.push(result['일매출'][i+'일']);
					xValues3.push(i);
				}
				new Chart("myChart3", {
				  type: "bar",
				  data: {
				    labels: xValues3,
				    datasets: [{
					      fill: false,
					      lineTension: 0,
					      backgroundColor: "rgba(57, 158, 76,1.0)",
				          borderColor: "rgba(57, 158, 76, 1.0)",
					      data: yValues3
					    }]
				  },
				  options: {
					legend: {display: false},
					scales: {
						xAxes: [{
							display: false,
							
						}],
				        yAxes: [{
				        	display: false,
							
						}]
					}
				  }
				});
			});
		}
	});
}
	$(document).ready(function() {
		var now = new Date();	// 현재 날짜 및 시간
		var month = now.getMonth();	// 월
		
		var currentMonth = now.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
		var selectElement = document.querySelector('.select_month'); // 해당하는 <select> 요소를 선택합니다.
		var optionElements = selectElement.getElementsByTagName('option'); // <option> 요소들을 가져옵니다.
		console.log("날짜 선택>>>>>>>>>" + optionElements);
		console.log("날짜>>>>>>>>>" + currentMonth);
		category= "show";
		rankajax(category ,"myChartShow1");
		chartall("myChartShow2");
		for (var i = 0; i < optionElements.length; i++) {
		    var optionValue = optionElements[i].value; // <option>의 value 값을 가져옵니다.
		    var monthValue = optionValue.replace("mon", ""); // "mon"을 제거하여 순수한 월 값만 추출
		    console.log(monthValue);
		    
		    if (parseInt(monthValue) === currentMonth) { // 숫자로 변환하여 현재 월과 비교
		        optionElements[i].selected = true;
		        mainchart(monthValue); // mainchart()에 월 값을 전달
		        break;
		    }
		}
		
		$('.select_month').on('change', function() {
			var selectedValue = selectElement.value;
			var monthValue = selectedValue.replace("mon", "");
	        mainchart(monthValue); // AJAX 재실행
	    });
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
			chartall("myChartArt2");
		});
		$("#btnMusic").click(function(event){
			console.log(event.target);
			category= "music";
			rankajax(category, "myChartMusic1");
			chartall("myChartMusic2");
		});
		$("#btnKid").click(function(event){
			console.log(event.target);
			category= "kid";
			rankajax(category, "myChartKid1");
			chartall("myChartKid2");
		});
		
		
	});
</script>

 <!-- 본문 -->
 <div class="main">
    <select class ="select_month">
	    <option value="1mon">1월</option>
	    <option value="2mon">2월</option>
	    <option value="3mon">3월</option>
	    <option value="4mon">4월</option>
	    <option value="5mon">5월</option>
	    <option value="6mon">6월</option>
	    <option value="7mon">7월</option>
	    <option value="8mon">8월</option>
	    <option value="9mon">9월</option>
	    <option value="10mon">10월</option>
	    <option value="11mon">11월</option>
	    <option value="12mon">12월</option>
	</select>
 	 <div class="chart_main">
     <!-- 상단 매출부분 -->
	     <div id="month-div" style="border: solid 1px black; max-width:100%; display: flex; flex-direction: column; align-items: center; position: relative;">
		    <label id="month-sales" style="text-align: center; hight: 50px;">월 매출</label>
		    <canvas id="myChart" style="width: 100%; height: auto;"></canvas>
		</div>
		<div id="week-div" style="border: solid 1px black; max-width:100%; display: flex; flex-direction: column; align-items: center; position: relative;">
		    <label id="week-sales" style="text-align: center; hight: 50px;">주간 매출</label>
			<canvas id="myChart2" style="width: 100%; height: auto;"></canvas>
		</div>
		<div id="day-div" style="border: solid 1px black; max-width:100%; display: flex; flex-direction: column; align-items: center;">
		    <label id="day-sales" style="text-align: center; hight: 50px;">일 매출</label>
		    <canvas id="myChart3" style="width: 100%; height: auto; top: 0; left: 0;"></canvas>
		</div>
		<div id="member-div" style="border: solid 1px black; max-width:100%; display: flex; flex-direction: column; align-items: center;">
		    <label id="join_member" style="text-align: center;hight: 50px;">회원 추이</label>
		    <canvas id="myChart4" style="width: 100%; height: auto; top: 0; left: 0;"></canvas>
		</div>
			
     </div>
	     
	     
     <!-- 하단 탭 부분 -->
	 <div class="chart_tab">
		<button class="tabbtn" id="btnShow" onclick="openshow(event, 'chart-show')">공연</button>
		<button class="tabbtn" id="btnArt" onclick="openshow(event, 'chart-art')">전시</button>
		<button class="tabbtn" id="btnMusic" onclick="openshow(event, 'chart-music')">음악</button>
		<button class="tabbtn" id="btnKid" onclick="openshow(event, 'chart-kid')">키즈</button>
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