/**
 * 
 */
var EchartsLines = function() {
	
	var _lineChartExamples = function() {
		if (typeof echarts == 'undefined') {
            console.warn('Warning - echarts.min.js is not loaded.');
            return;
        }
		
		 var line_stacked_element = document.getElementById('line_stacked');
		 
		 // Stacked lines chart
	        if (line_stacked_element) {

	            // Initialize chart
	            var line_stacked = echarts.init(line_stacked_element);


	            //
	            // Chart config
	            //

	            // Options
	            line_stacked.setOption({

	                // Global text styles
	                textStyle: {
	                    fontFamily: 'Roboto, Arial, Verdana, sans-serif',
	                    fontSize: 13
	                },

	                // Chart animation duration
	                animationDuration: 750,

	                // Setup grid
	                grid: {
	                    left: 0,
	                    right: 20,
	                    top: 35,
	                    bottom: 0,
	                    containLabel: true
	                },

	                // Add legend
	                legend: {
	                    data: ['Cash In', 'Cash Out', 'Fund Transfer', 'Bill Payment', 'Mobile Top Up'],
	                    itemHeight: 8,
	                    itemGap: 20
	                },

	                // Add tooltip
	                tooltip: {
	                    trigger: 'axis',
	                    backgroundColor: 'rgba(0,0,0,0.75)',
	                    padding: [10, 15],
	                    textStyle: {
	                        fontSize: 13,
	                        fontFamily: 'Roboto, sans-serif'
	                    }
	                },

	                // Horizontal axis
	                xAxis: [{
	                    type: 'category',
	                    boundaryGap: false,
	                    data: [
	                        'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
	                    ],
	                    axisLabel: {
	                        color: '#333'
	                    },
	                    axisLine: {
	                        lineStyle: {
	                            color: '#999'
	                        }
	                    },
	                    splitLine: {
	                        lineStyle: {
	                            color: ['#eee']
	                        }
	                    }
	                }],

	                // Vertical axis
	                yAxis: [{
	                    type: 'value',
	                    axisLabel: {
	                        color: '#333'
	                    },
	                    axisLine: {
	                        lineStyle: {
	                            color: '#999'
	                        }
	                    },
	                    splitLine: {
	                        lineStyle: {
	                            color: ['#eee']
	                        }
	                    },
	                    splitArea: {
	                        show: true,
	                        areaStyle: {
	                            color: ['rgba(250,250,250,0.1)', 'rgba(0,0,0,0.01)']
	                        }
	                    }
	                }],

	                // Add series
	                series: [
	                    {
	                        name: 'Cash In',
	                        type: 'line',
	                        stack: 'Total',
	                        smooth: true,
	                        symbolSize: 7,
	                        data: [120, 132, 101, 134, 90, 230, 210],
	                        itemStyle: {
	                            normal: {
	                                borderWidth: 2
	                            }
	                        }
	                    },
	                    {
	                        name: 'Cash Out',
	                        type: 'line',
	                        stack: 'Total',
	                        smooth: true,
	                        symbolSize: 7,
	                        data: [220, 182, 191, 234, 290, 330, 310],
	                        itemStyle: {
	                            normal: {
	                                borderWidth: 2
	                            }
	                        }
	                    },
	                    {
	                        name: 'Fund Transfer',
	                        type: 'line',
	                        stack: 'Total',
	                        smooth: true,
	                        symbolSize: 7,
	                        data: [150, 232, 201, 154, 190, 330, 410],
	                        itemStyle: {
	                            normal: {
	                                borderWidth: 2
	                            }
	                        }
	                    },
	                    {
	                        name: 'Bill Payment',
	                        type: 'line',
	                        stack: 'Total',
	                        smooth: true,
	                        symbolSize: 7,
	                        data: [320, 332, 301, 334, 390, 330, 320],
	                        itemStyle: {
	                            normal: {
	                                borderWidth: 2
	                            }
	                        }
	                    },
	                    {
	                        name: 'Mobile Top Up',
	                        type: 'line',
	                        stack: 'Total',
	                        smooth: true,
	                        symbolSize: 7,
	                        data: [820, 932, 901, 934, 1290, 1330, 1320],
	                        itemStyle: {
	                            normal: {
	                                borderWidth: 2
	                            }
	                        }
	                    }
	                ]
	            });
	        }
	}
}