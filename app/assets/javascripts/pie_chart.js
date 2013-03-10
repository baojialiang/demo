var remain_hours = ["Remain hours", chart_data.remain_hours];
var request_hours = ["Request hours", 120 - chart_data.remain_hours]

$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: 'My vacation record in 2013'
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage}%</b>',
            	percentageDecimals: 1
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        formatter: function() {
                            return '<b>'+ this.point.name +'</b>: <br /> '
                            		+ this.percentage +' %';
                        }
                    }
                }
            },
            credits:{
				enabled: true,
				position: {
					align: 'right',
					x: -15,
					y: -30	
				},
				style: {
					color:'black'
				},
				text: "Careerbuilder China"
			},	
            series: [{
                type: 'pie',
                name: 'Vacation share',
                data: [
                    remain_hours,
                    request_hours
                ]
            }]
        });
    });
    
});