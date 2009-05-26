//<![CDATA[


function tohere(i) { 
  gmarkers[i].openInfoWindowHtml(htmld[i]);
}

function fromhere(i) { 
  gmarkers[i].openInfoWindowHtml(htmlf[i]);
}
function toback(i) {
  gmarkers[i].openInfoWindowHtml(html[i]);
}
var map;
var point = [];
var address = [];
var gmarkers = [];
var html = [];
var htmld = [];
var htmlf = [];
var k = 0;
point[k] = new GLatLng(26.93455, -80.138011);
address[k++] = "6761 W Indiantown Road<br>Jupiter, FL 33458<br>(561) 745-2511";


function load() {
  if (GBrowserIsCompatible()) {

  map = new GMap2(document.getElementById("map"));
  map.addControl(new GLargeMapControl());
  map.addControl(new GMapTypeControl());
  map.setCenter(point[0], 15);

  function htmlhead(i) { /* head */
    return '<div class="title">Keep Flippin&#39; Gymnastics</div><div class="address">' + address[i] + '</div>';
  }
  function htmlform(i, k) { /* form */
    var one, two;
    if (k == 0) { one = "saddr"; two = "daddr" }
    else { one = "daddr"; two = "saddr"; }
    return '<form action="http://maps.google.com/maps" method="get" target="_blank">'
         + '<input class="'+one+'" type="text" name="'+one+'" id="'+one+'" value="" />' 
         + '<INPUT value="Go" TYPE="SUBMIT"><input type="hidden" name="'+two+'" value="' + point[i].lat() + ',' + point[i].lng() + ' (Keep Flippin)" /></form></div>'
         + '<div class="back"><a href="javascript:toback('+i+')">&laquo; back</a></div>';
  }


  function fhtml(i) { /* both links active */
    var html = htmlhead(i);
    return html + '<div class="direction">Get directions: <a class="tohere" href="javascript:tohere(' + i + ')">To here</a> - <a href="javascript:fromhere(' + i + ')" class="fromhere">From here</a>';
  }
  function fhtmlf(i){ /* from here */
    var html = htmlhead(i);
    return html + '<div class="directions">Get directions: <a class="tohere" href="javascript:tohere(' + i + ')">To here</a> - <span class="fromhere">From here</span></div><div class="start">End address:</div>' + htmlform(i, 1);

  }


  function fhtmld(i) { /* to here */
    var html = htmlhead(i);
    return html + '<div class="directions">Get directions: <span class="tohere">To here</span> - <a href="javascript:fromhere(' + i + ')" class="fromhere">From here</a></div><div class="start">Start address:</div>' + htmlform(i, 0);
  }

  function createMarker(i)
  {
    var marker = new GMarker(point[i]);
    gmarkers.push(marker);
    html[i] = fhtml(i);
    htmld[i] = fhtmld(i);
    htmlf[i] = fhtmlf(i);
    GEvent.addListener(marker, "click", function() {
      marker.openInfoWindowHtml(html[i]);
    });
    return marker;
  }

  function createMarkers(i) { 
    for (var i = 0; i < k; i++) {
      var marker = createMarker(i);
      map.addOverlay(marker);
      if (i == 0) marker.openInfoWindowHtml(html[i]);
    } 
  }



  createMarkers();


  }
}

//]]>