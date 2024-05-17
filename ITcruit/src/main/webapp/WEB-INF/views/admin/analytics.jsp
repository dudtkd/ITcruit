<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<main>
    <div class="page-content-wrapper border">
        <canvas id="line-chart" width="800"></canvas>
        <br/><br/><br/>
         <div style="display: flex; justify-content: space-between;">
        <div style="display: inline-block; width: 45%;">
            <canvas id="pie-chart" width="200" height="200"></canvas>
        </div>
        <div style="display: inline-block; width: 45%;">
            <canvas id="bar-chart-horizontal" width="200" height="200"></canvas>
        </div>
        </div>
    </div>
</main>


<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<script>
$(document).ready(function(){ 
    getGraph();
    getpieGraph();
    gethorizontal();
    
});

function getGraph(){
    
    var timeList = [];
    var posList = [];
    var processedData = {};
    
    var datasetData2024 = [282, 850, 411, 502]; 
    var datasetData2023 = [786, 514, 406, 306, 407, 711, 633, 621, 783, 978, 1000, 550]; 

    
    $.ajax({
        url: "/myPage/admin/lineChart",
        type: "GET",
        dataType: "json", 
        success: function(data) {
            data.forEach(function(item) {
                var date = item.recruitEnrollYmd.substring(0, 7); 
                var cost = item.stlmAmt;

                if (processedData.hasOwnProperty(date)) {
                    processedData[date] += cost;
                } else {
                    processedData[date] = cost;
                }
//                 console.log(cost);
            });
            
            var labels = [];
            var datasetData2024FromData = [];
            var datasetData2023FromData = [];
            for (var month in processedData) {
                labels.push(month);
                if (month.startsWith("2024")) {
                    datasetData2024FromData.push(processedData[month]);
                } else if (month.startsWith("2023")) {
                    datasetData2023FromData.push(processedData[month]);
                }
            }
        	
//             console.log(labels);
//             console.log(datasetData2024FromData);
//             console.log(datasetData2023FromData);
        	
            new Chart(document.getElementById("line-chart"), {
                type: 'line',
                data: {
                    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    datasets: [{ 
                        data: [5820000,8500000,4110000,5020000].concat(datasetData2024FromData),
                        label: "2024",
                        borderColor: "#00ABCB",
                        fill: false
                    }, { 
                        data: [7860000, 5140000, 4060000, 6060000, 4070000, 7110000, 6330000, 6210000, 7830000, 9780000, 6000000, 5500000],
                        label: "2023",
                        borderColor: "#F66C5E",
                        fill: false
                    }]
                },
                options: {
                    title: {
                        display: true,
                        text: '월별 매출',
                        fontSize: 20
                    },
                    scales: {
                        xAxes: [{
                            ticks: {
                                beginAtZero: true 
                            }
                        }],
                        yAxes: [{
                            ticks: {
                                beginAtZero: true,
                                callback: function(value, index, values) { 
                                    return value.toLocaleString() + '원'; 
                                }
                            }
                        }]
                    }
                }
            });
        },
        error: function() {
            console.log("실패");
        }
    });
}


function getpieGraph(){
    $.ajax({
        url: "/myPage/admin/pieChart",
        type: "GET",
        dataType: "json", 
        success: function(data) {
            var countY = 0;
            var countN = 0; 

            data.forEach(function(item) {
                var processYn = item.processYn; 
                
                if (processYn === "Y") {
                    countY++; 
                } else if (processYn === "N") {
                    countN++; 
                } 
            });
            
            var pieData = [countY, countN];

            new Chart(document.getElementById("pie-chart"), {
                type: 'pie',
                data: {
                    labels: ["가입", "미가입"],
                    datasets: [{
                        backgroundColor: ["#fcb0b3", "#87CEFA"],
                        data: pieData
                    }]
                },
                options: {
                    title: {
                        display: true,
                        text: '채용프로세스 가입 여부',
                        fontSize: 20
                    }
                }
            });
        },
        error: function() {
            console.log("실패");
        }
    });
}




function gethorizontal(){
    $.ajax({
        url: "/myPage/admin/horizontalChart",
        type: "GET",
        dataType: "json", 
        success: function(data) {
            var uniqueEntNm = []; 
            var entNmValues = {}; 
            
            data.forEach(function(item) {
                if (!uniqueEntNm.includes(item.entNm)) {
                    uniqueEntNm.push(item.entNm);
                }
            });
            
            uniqueEntNm.forEach(function(entNm) {
                var processAmtValues = []; 
                data.forEach(function(item) {
                    if (item.entNm === entNm) {
                        processAmtValues.push(item.processAmt);
                    }
                });
                entNmValues[entNm] = processAmtValues;
            });
            
            uniqueEntNm.sort(function(a, b) {
                var totalA = entNmValues[a].reduce(function(total, value) {
                    return total + value;
                }, 0);
                var totalB = entNmValues[b].reduce(function(total, value) {
                    return total + value;
                }, 0);
                return totalB - totalA;
            });
            
            uniqueEntNm = uniqueEntNm.slice(0, 5);
            
            uniqueEntNm.forEach(function(entNm) {
//                 console.log(entNm);
//                 console.log(entNmValues[entNm]);
            });
            
            new Chart(document.getElementById("bar-chart-horizontal"), {
                type: 'horizontalBar',
                data: {
                    labels: uniqueEntNm, 
                    datasets: [
                        {
                            backgroundColor: ["#87CEFA", "#FFB6C1","#F0E68C","#90EE90","#B0C4DE"],
                            data: uniqueEntNm.map(function(entNm) { 
                                return entNmValues[entNm].reduce(function(total, value) {
                                    return total + value;
                                }, 0);
                            })
                        }
                    ]
                },
                options: {
                    legend: { display: false },
                    title: {
                        display: true,
                        text: '프로세스 이용 순위',
                        fontSize: 20
                    },
                    scales: {
                        xAxes: [{
                            ticks: {
                                beginAtZero: true 
                            }
                        }]
                    }
                }
            });
        },
        error: function() {
            console.log("실패");
        }
    });
}

</script>
