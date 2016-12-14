$('#donuts').html('<%= j(render :partial => 'chart', :locals => { data: @data, options: @options }) %>');
