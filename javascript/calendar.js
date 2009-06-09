var Calendar = {

		init: function() {
			if ($("td > ul > li.class").length > 0)
				$("#show-hide-links").html("<a href=\"javascript:Calendar.showAllClasses()\">Show All Classes</a> | <a href=\"javascript:Calendar.hideAllClasses()\">Hide All Classes</a>");
		},

		toggleClasses: function(day) {
			var li = $("li[rel="+day+"].class");
			if (li.hasClass("overflow")) {
				li.removeClass("overflow");
				$("li[rel="+day+"].more").html(this.link(day, 'less'));		
			}
			else {
				li.addClass("overflow");
				$("li[rel="+day+"].more").removeClass("overflow").html(this.link(day, 'more'));		
			}			
		},
		text: function(text) {
			return "&#8230; "+text;
		},
		
		link: function(day, text) { 
			return "<a href=\"javascript:Calendar.toggleClasses('"+day+"')\">"+this.text(text)+"</a>";
		},

		showAllClasses: function() {
			$("td > ul > li.class").removeClass("overflow");
			$("li.more").show();
			$("li.more a").html(this.text('less'));			
		},
		
		hideAllClasses: function() {
			$("td > ul > li.class").addClass("overflow");
			$("li.more").hide();			
			$("li.more a").html(this.text('more'));			
		}	
}

$(document).ready(function() {
	Calendar.init();
})