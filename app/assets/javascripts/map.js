$(function(){
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

        // anything with var 'map' needs to be app.map
        app.map = L.map('map', {
            layers: baseLayer,
            center: pageConfig.baseLayer.latlon,
            zoom: pageConfig.baseLayer.zoom,
            scrollWheelZoom: false,
            minZoom: 4,
            maxZoom: 18
        });

        app.map.zoomControl.setPosition('topleft');
        L.control.scale().addTo(app.map);


        // var mineIcon = L.icon({
        //     // asset path
        //     iconUrl: '/assets/mine.30.png',
        //     iconSize: [30, 30],
        //     popupAnchor: [0, -30]
        // });
        //
        //
        // var minesLayer;
        //
        // $.getJSON(/*ajax call url */, function(data) { // "/assets/data/mines.json"
        //
        //     minesLayer = L.geoJson(data, {
        //       onEachFeature: onEachFeature
        //     });
        //
        //     minesLayer.addTo(map);
        //     app.setUpTable(data);
        //   });


        //For Each feature in the GeoJSON define popups, any action etc action
        // function onEachFeature(feature, layer) {
        //   var props = feature.properties;
        //     var popupContent = "<h3 class='mine-marker'>"+ props.name + "</h3>"+
        //         "Company: "+props.company + "<br />"+
        //         "Type: " + props.type + "<br />"+
        //         "Proven Reserves: "+ props.reserves.proven+ "<br />"+
        //         "Source: " + props.source.author;
        //
        //     layer.bindPopup(popupContent);
        // }
    },

    getGeodata: function(url){

      // var mineIcon = L.icon({
      //     // asset path
      //     iconUrl: '/assets/mine.30.png',
      //     iconSize: [30, 30],
      //     popupAnchor: [0, -30]
      // });

      var minesLayer;

      $.getJSON(url, function(data){
        console.log('inside getJSON');

        // app.map.addjson(data)
        minesLayer = L.geoJson(data, {
          onEachFeature: onEachFeature
        });
        console.log(minesLayer);

        minesLayer.addTo(app.map);
        app.setUpTable(data);
      });

      // For Each feature in the GeoJSON define popups, any action etc action
      // onEachFeature is a leaflet method that can pass to a layer
      function onEachFeature(feature, layer) {
        var props = feature.properties;
          var popupContent = "<h3 class='mine-marker'>"+ props.name + "</h3>"+
              "Company: "+ props.drc_company_id + "<br />"+
              "Type: " + props.mine_type + "<br />"+
              "Proven Reserves: "+ props.proven_reserves+ "<br />"+
              "Source: " + props.source;

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
          "paging": false,
          "info": false,
          "searching": false,
          "columns": [
                { "data": "name" },
                { "data": "company" },
                { "data": "type" },
                { "data": "reserves.proven" },
                { "data": "resource.measured" }
            ],
          "data": table_data
          }
      )
    }

  });

});
