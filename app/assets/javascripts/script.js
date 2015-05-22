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
    },

    getGeodata: function(url, setTable){
      setTable = typeof setTable !== undefined ? setTable : false;

      var minesLayer;

      $.getJSON(url, function(data){
        minesLayer = L.geoJson(data, {
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
      // console.log(titles);

      table_data.forEach( function (val, index, arg) {
        var oneDataRow = [];
        for (var prop in val) {
          oneDataRow.push(val[prop]);
        }
        tableDataArray.push(oneDataRow);
      });

      // console.log(tableDataArray);
      console.log(app.mapTable);
      console.log(typeof app.mapTable !== 'undefined');
      if (typeof app.mapTable !== 'undefined') {
        console.log('are we doing something?')
        app.mapTable.fnAddData(tableDataArray);
      } else {
        app.mapTable = $('.mine-table').dataTable({
            "data" : tableDataArray,
            "paging": false,
            "info": false,
            "searching": false,
            "columns": titles
        });
      }


      // app.mapTable = $('.mine-table').dataTable({
      //     "data" : tableDataArray,
      //     "paging": false,
      //     "info": false,
      //     "searching": false,
      //     "columns": titles
    },

  clearMap: function() {
    app.map.addedLayer.clearLayers();

    if ($('.mine-table')) {
      app.mapTable.fnClearTable();
      app.mapTable.fnDestroy();
    }

    // if ($('.mine-table')) {
    //   // console.log('yes has table');
    //   app.mapTable table = $('.mine-table').dataTable();
    //   // console.log(table);
    //   table.fnClearTable();
    //   // table.fnDestroy();
    // }

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
