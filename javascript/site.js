jQuery(document).ready(function() {
  jQuery('a.colorbox').colorbox({transition:"elastic", width:"55%"});
  jQuery("a[rel='locations']").colorbox({transition:"elastic", width:"55%"});
  jQuery("a[rel='gallery']").colorbox({transition:"elastic"});
  jQuery("a.schedule-add").colorbox({transition:"elastic", width:"600px", height:"500px", iframe:"true" });
	var pageTracker = _gat._getTracker("UA-6824117-3");
	pageTracker._trackPageview();
	if (jQuery('#tabs').length > 0) jQuery("#tabs").tabs();
	if (jQuery("#contact > #middle > #content > #right > form").length > 0) {
		jQuery("#contact > #middle > #content > #right > form").submit(function() {
			pageTracker._trackPageview('/contact/submit');			
		});
	}
	jQuery('a').click(function() {
	  var $a = $(this);
	  var href = $a.attr('href');

	  // see if the link is external
	  if ( (href.match(/^http/)) && (! href.match(document.domain)) ) {
	    var category = 'outgoing';
	    var event = 'click'; 
	    var label = href;
	    pageTracker._trackEvent(category, event, href);
	  }
	});

})