//= require ./jquery-1.12.1.min
//= require ./d3.min
//= require ./c3.min

var chart = c3.generate({
  bindto: '#chart',
  data: {
    columns: $('#chart').data('columns'),
    type: 'pie'
  },
});


