$(function(){
  $(document).foundation();

  var app = {
    initCommon: function(){
      mainbottom = $('.content').offset().top

      $("#hideshow").on('click', function(e){
        e.preventDefault();
        e.stopPropagation();

        $("#browse-search").slideToggle(500);
      });

      $(".accordion").on("click", "li", function (event) {
        $(this).find(".content").slideToggle(300);
      });

      $(".select2-dropdown").select2({
        allowClear: true
      });
    },

    initMap: function() {
        // anything with var 'map' needs to be app.map
        app.map = L.map('map', {
            layers: L.tileLayer('http://api.tiles.mapbox.com/v4/congomines.d6dbe128/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiY29uZ29taW5lcyIsImEiOiI4ZmRkOGJiNDk0MzNhNmU1NGE4N2MzODI5ZmFhNTcxNyJ9.wW5SYM4cPL7qOrz-443SGg'),
            center: [-2.877, 22.83],
            zoom: 5,
            scrollWheelZoom: false,
            minZoom: 4,
            maxZoom: 18
        });

        app.map.attributionControl.setPrefix(false);
        app.map.attributionControl.addAttribution("<a href='https://www.mapbox.com/about/maps/' target='_blank'>&copy; Mapbox &copy; OpenStreetMap</a> <a class='mapbox-improve-map' href='https://www.mapbox.com/map-feedback/' target='_blank'>Improve this map</a>")
        app.map.zoomControl.setPosition('topleft');
        L.control.scale().addTo(app.map);
    },

    getGeodata: function(url, setTable){
      $.getJSON(url, function(data){
        var minesLayer = L.geoJson(data, {
          onEachFeature: onEachFeature
        });

        minesLayer.addTo(app.map);
        app.map.addedLayer = minesLayer;

        if (setTable) {
          app.setUpTable(data);
        }

      });

      // For Each feature in the GeoJSON define popups, any action etc action
      // onEachFeature is a leaflet method that can pass to a layer
      function onEachFeature(feature, layer) {
        var props = feature.properties;

        // do if statements for a few different properties
        // testing with typeof props.(property) !== undefined
        // for the 3 different geodata types
        var popupContent = "<h3 class='mine-marker'>"+ props.name + "</h3>"+
            "Company: "+ props.drc_company + "<br />"+
            "Type: " + props.mine_type + "<br />"+
            "Proven Reserves: "+ props.proven_reserves+ "<br />"+
            "Source: " + props.source;

        layer.bindPopup(popupContent);
      }

    },

    setUpTable: function(geoJSON){
      var table_data = [];
      var feature_array = $.makeArray( geoJSON.features )
      if (feature_array.length == 0) {
        return;
      }

      table_data = $.map(feature_array, function(d){ return d.properties;});

      var titles = [];
      var tableDataArray = [];
      // for ( var prop in table_data[0]) {
      //   titles.push({"title" : prop});
      // }
      Object.keys(table_data[0]).forEach( function (val, index, arg) {
        titles.push({ "title": val });
      });

      table_data.forEach( function (val, index, arg) {
        var oneDataRow = [];
        for (var prop in val) {
          oneDataRow.push(val[prop]);
        }
        tableDataArray.push(oneDataRow);
      });

      // if (typeof app.mapTable !== 'undefined') {
      //   // console.log('are we doing something?')
      //   // app.mapTable.fnAddData(tableDataArray);
      //   app.mapTable = $('.mine-table').dataTable({
      //       "data" : tableDataArray,
      //       "paging": false,
      //       "info": false,
      //       "searching": false,
      //       "columns": titles
      //   });
      // } else {
      //   app.mapTable = $('.mine-table').dataTable({
      //       "data" : tableDataArray,
      //       "paging": false,
      //       "info": false,
      //       "searching": false,
      //       "columns": titles
      //   });
      // }

      app.mapTable = $('.mine-table').dataTable({
        "data" : tableDataArray,
        "paging": false,
        "info": false,
        "searching": false,
        "columns": titles
      });
    },

    clearMap: function() {
      app.map.addedLayer.clearLayers();

      if (typeof app.mapTable !== 'undefined') {
        // console.log($('.mine-table'));
        app.mapTable.fnClearTable();
        app.mapTable.fnDestroy();
        $('.mine-table').replaceWith( '<table class="mine-table"></table>' );
      } else {
        // console.log('no mine-table');
      }

    }

  };

  window.app = app;

});


/*

jQuery(document).on("focus", "input.date_picker", function(){
    var date_picker = jQuery(this);
    if (typeof(date_picker.datepicker) == 'function') {
      if (!date_picker.hasClass('hasDatepicker')) {
        date_picker.datepicker();
        date_picker.trigger('focus');
      }
    }
    return true;
});
*/
