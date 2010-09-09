var Monday =  new Array(new Array('3:00', '3:45-5:15pm'), 
                	new Array('4:00', '3:00-4:30pm'),
			new Array('5:00', '3:45-5:15pm'),
			new Array('6:00', '4:30-6:00pm')
                       );
var Tuesday = new Array(new Array('3:00', '3:15-4:45pm'),
			new Array('4:00', '3:30-5:00pm'),
			new Array('5:00', '3:15-4:45pm')
                       );
var Wednesday = new Array(new Array('3:00', '4:15-5:45pm'),
			new Array('4:00', '4:00-5:30pm'),
			new Array('5:00', '4:15-5:45pm'),
			new Array('7:00', '4:45-6:15pm (both days)')
                       );
var Thursday = new Array(new Array('3:00', '3:00-5:00pm April 24th'),
			new Array('4:00', '3:00-4:30pm April 24th'),
			new Array('5:00', '3:15-5:15pm April 24th'),
			new Array('6:00', '3:00-5:00pm April 24th')
                       );
var Friday = new Array(new Array('3:00', '4:00-6:00pm'),
			new Array('4:00', '4:00-6:00pm')
                       );

var Saturday = new Array(new Array('10:00', '3:30-5:30pm')
                       );


function getTimes(day)
{
  var a = eval(day);
  var list = $('times');
  list.empty();
  list.options.length = a.length;
  list.options[0] = new Option('- choose a time -');
  for (var i = 0; i < a.length; i++)
    list.options[i+1] = new Option(a[i][0]);


}
function getPracticeTime(time)
{
  var days = $('days');
  var daysOptions = days.getElementsByTagName('option');
  var options = $A(daysOptions);
  var opt = options[days.selectedIndex].value;
  var a = eval(opt);
  var theTime = a.find( function(selected){
	return (selected[0] == time);
  });
  var display = $('PracticeTime');
  display.innerHTML =  '<h4>Your practice is:</h4><br />' + theTime[1];
}