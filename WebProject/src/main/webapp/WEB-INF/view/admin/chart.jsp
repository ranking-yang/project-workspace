<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		.ajax({
			url:"/admin/chart",
			type:"GET",
			success : function(result) {
				console.log(result);
			}
		})
	});
</script>

 <!-- 본문 -->
 <div class="main">
 	 <div class="chart_main" style="border: solid 1px black;">
     
     <!-- 상단 매출부분 -->
	     <div style="border: solid 1px black; max-width:100%;">월매출
	     <canvas id="myChart" ></canvas>
	     </div>
	     <div style="border: solid 1px black; max-width:100%;">주간매출
	     <canvas id="myChart2"></canvas>
	     </div>
	     <div style="border: solid 1px black; max-width:100%;">일매출
	     <canvas id="myChart3"></canvas>
	     </div>
	     <div style="border: solid 1px black; max-width:100%;">총 회원수
	     <canvas id="myChart4"></canvas>
	     </div>
     <!-- 하단 탭 부분 -->
     </div>
     <div class="tab_main" style="border: solid 1px black;">
	     <div style="border: solid 1px black; max-width:100%;">
	     	<canvas id="myChart5"></canvas>
	     </div>
	     <div style="border: solid 1px black; max-width:100%;">
	     	<canvas id="myChart6"></canvas>
	     </div>
     </div>
 </div>
<script>
const xValues = [50,60,70,80,90,100,110,120,130,140,150];
const yValues = [7,8,8,9,9,9,10,11,14,14,15];

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
    scales: {
      yAxes: [{ticks: {min: 6, max:16}}],
    }
  }
});
var xValues2 = ["Italy", "France", "Spain", "USA", "Argentina"];
var yValues2 = [55, 49, 44, 24, 15];
var barColors = ["red", "green","blue","orange","brown"];

new Chart("myChart2", {
  type: "bar",
  data: {
    labels: xValues2,
    datasets: [{
      backgroundColor: barColors,
      data: yValues2
    }]
  },
  options: {
    legend: {display: false},
    title: {
      display: true,
      text: "World Wine Production 2018"
    }
  }
});
var xValues3 = ["Italy", "France", "Spain", "USA", "Argentina"];
var yValues3 = [55, 49, 44, 24, 15];
var barColors2 = [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145"
];

new Chart("myChart3", {
  type: "pie",
  data: {
    labels: xValues3,
    datasets: [{
      backgroundColor: barColors2,
      data: yValues3
    }]
  },
  options: {
    title: {
      display: true,
      text: "World Wide Wine Production 2018"
    }
  }
});



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


new Chart("myChart5", {
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

new Chart("myChart6", {
	  type: "pie",
	  data: {
	    labels: xValues3,
	    datasets: [{
	      backgroundColor: barColors2,
	      data: yValues3
	    }]
	  },
	  options: {
	    title: {
	      display: true,
	      text: "World Wide Wine Production 2018"
	    }
	  }
	});
</script>