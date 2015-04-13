---
---
(function(){
  var app = {
    initCommon: function(){
      mainbottom = $('.menu').offset().top;

      $(window).on('scroll', this.showStickyHeader);

      $("#hideshow").click(function(){
        $("#advanced").slideToggle(500);
      });
    },

    showStickyHeader: function(){
      stop = Math.round($(window).scrollTop());
      if (stop > mainbottom) {
          $('.menu').addClass('past-main');
      } else {
          $('.menu').removeClass('past-main');
      }
    }

  };

  $.extend(app,{
    initMap: function() {
        // short circuit if map div is not set up on page
        if(! $('#map').length ){
          return false;
        }

        var pageConfig = {
            baseLayer: {
                id: 'moabi_base',
                latlon: [-2.877, 22.83],
                zoom: 5
            }
        };

        var baseLayer = L.tileLayer('http://tiles.osm.moabi.org/' + pageConfig.baseLayer.id + '/{z}/{x}/{y}.png');

        var map = L.map('map', {
            layers: baseLayer,
            center: pageConfig.baseLayer.latlon,
            zoom: pageConfig.baseLayer.zoom,
            scrollWheelZoom: false,
            minZoom: 4,
            maxZoom: 18
        });

        map.zoomControl.setPosition('topleft');
        L.control.scale().addTo(map);


        var mineIcon = L.icon({
            iconUrl: '{{site.baseurl}}/img/mine.30.png',
            iconSize: [30, 30],
            popupAnchor: [0, -30]
        });


        var minesLayer;

        $.getJSON("{{site.baseurl}}/data/mines.json", function(data) {
            minesLayer = L.geoJson(data, {
              onEachFeature: onEachFeature
            });

            minesLayer.addTo(map);
            app.setUpTable(data);
          });


        //For Each feature in the GeoJSON define popups, any action etc action
        function onEachFeature(feature, layer) {
          var props = feature.properties;
            var popupContent = "<h3 class='mine-marker'>"+ props.name + "</h3>"+
                "Company: "+props.company + "<br />"+
                "Type: " + props.type + "<br />"+
                "Proven Reserves: "+ props.reserves.proven+ "<br />"+
                "Source: " + props.source.author;

            layer.bindPopup(popupContent);
        }
    },


    setUpTable: function(geoJSON){
      //lets use Jquery DataTables
      //in rails jquery-datatables-rails
      var table_data = [];
      var feature_array = $.makeArray( geoJSON.features )
      table_data = $.map(feature_array, function(d){ return d.properties;});

      $('.mine-table').DataTable({
          "paging":   false,
          "info": false,
          "searching":false,
          "columns": [
                { "data": "name" },
                { "data": "company" },
                { "data": "type" },
                { "data": "reserves.proven" },
                { "data": "resource.measured"}
            ],
          "data": table_data
          }
      )
    }

  });

  window.app = app;

})();
