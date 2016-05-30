// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// $(document).bind("page:change", function(){
	// google.charts.load('current', {'packages':['corechart']});
	// google.charts.setOnLoadCallback(drawChart);
	// function drawChart() {
// 
        // // Create the data table.
        // var data = new google.visualization.DataTable();
        // data.addColumn('string', 'Topping');
        // var progress = parseInt($("#progress").val());
        // var pending = parseInt($("#pending").val());
        // var done = parseInt($("#done").val());
        // //alert(progress + "" + pending + "" + done);
        // data.addColumn('number', 'Slices');
        // data.addRows([
          // ['Progress', progress],
          // ['Pending', pending],
          // ['Done', done]
        // ]);
// 
        // // Set chart options
        // var options = {'title':"Project's Todo lists",
                       // 'width':700,
                       // 'height':400};
// 
        // // Instantiate and draw our chart, passing in some options.
        // var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        // chart.draw(data, options);
      // }
	// //alert("ksk");
// });


$(document).bind("page:change", function(){
	if ($("#chart_div").length > 0)
	{
		//alert("kijs");
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        var progress = parseInt($("#progress").val());
        var pending = parseInt($("#pending").val());
        var done = parseInt($("#done").val());
        //alert(progress + "" + pending + "" + done);
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Progress', progress],
          ['Pending', pending],
          ['Done', done]
        ]);

        // Set chart options
        var options = {'title':"Project's Todo lists",
                       'width':700,
                       'height':400};

        // Instantiate and draw our chart, passing in some options.
          
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
     }
	//alert("ksk");
});


