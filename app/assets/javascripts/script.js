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

      $("#drc_company").add("#shareholder_company").select2({
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

    getGeodata: function(url){

      var minesLayer;

      $.getJSON(url, function(data){

        minesLayer = L.geoJson(data, {
          onEachFeature: onEachFeature
        });

        minesLayer.addTo(app.map);
        app.setUpTable(data);
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
      table_data = $.map(feature_array, function(d){ return d.properties;});

      var titles = [];
      var tableDataArray = [];
      // for ( var prop in table_data[0]) {
      //   titles.push({"title" : prop});
      // }
      Object.keys(table_data[0]).forEach( function (val, index, arg) {
        titles.push({ "title": val });
      });
      console.log(titles);

      table_data.forEach( function (val, index, arg) {
        var oneDataRow = [];
        for (var prop in val) {
          oneDataRow.push(val[prop]);
        }
        tableDataArray.push(oneDataRow);
      });

      console.log(tableDataArray);

      $('.mine-table').dataTable({
          "data" : tableDataArray,
          "paging": false,
          "info": false,
          "searching": false,
          "columns": titles
      });

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
