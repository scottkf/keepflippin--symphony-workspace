$(document).ready(function() { 
	$('a.colorbox').colorbox({transition:"elastic", width:"55%"});
	$("a[rel='locations']").colorbox({transition:"elastic"});
	$("a[rel='gallery']").colorbox({transition:"elastic"});
	$("a.schedule-add").colorbox({transition:"elastic" });
	$().bind('cbox_complete', function(){
	        doit();
	});})