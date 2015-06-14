$(function(){
  $(document).foundation();

  var app = {
    access_token: 'pk.eyJ1IjoiY29uZ29taW5lcyIsImEiOiI4ZmRkOGJiNDk0MzNhNmU1NGE4N2MzODI5ZmFhNTcxNyJ9.wW5SYM4cPL7qOrz-443SGg',
    initCommon: function(){
      mainbottom = $('.content').offset().top

      $("#hideshow").on('click', function(e){
        e.preventDefault();
        e.stopPropagation();

        $("#browse-search").slideToggle(500);
      });

      $(".accordion").on("click", "li", function (e) {
        $(this).find(".content").slideToggle(300);
      });

      $(".select2-dropdown").select2({
        allowClear: true
      });

      $(".document-container article.hide-summary-true .show-summary").on('click', function (e) {
        e.stopPropagation();
        e.preventDefault();

        var $this = $(this),
            thisDocument = $this.parent('article');

        if(thisDocument.hasClass('hide-summary-true')){
          thisDocument.removeClass('hide-summary-true');
          $this.text('hide summary');
        }else{
          thisDocument.addClass('hide-summary-true');
          $this.text('show summary');
        }
        
      });
    },

    initMap: function() {
        // anything with var 'map' needs to be app.map
        app.map = L.map('map', {
            layers: L.tileLayer('http://api.tiles.mapbox.com/v4/congominesmaps.bd24d4b8/{z}/{x}/{y}.png?access_token=' + app.access_token),
            center: [-2.877, 22.83],
            zoom: 5,
            scrollWheelZoom: false,
            minZoom: 4,
            maxZoom: 18
        });

        // store vector layers in map array
        app.map.vectorLayers = [];
        app.map.tileLayers = [];

        app.map.attributionControl.setPrefix(false);
        app.map.attributionControl.addAttribution("<a href='https://www.mapbox.com/about/maps/' target='_blank'>&copy; Mapbox &copy; OpenStreetMap</a> <a class='mapbox-improve-map' href='https://www.mapbox.com/map-feedback/' target='_blank'>Improve this map</a>")
        app.map.zoomControl.setPosition('topright');
        L.control.scale().addTo(app.map);

      // map dropdown click map events
      $('.map-dropdown.mining-data ul a').on('click', function(e){
        var $this = $(this),
            url = $this.data('url'),
            parentListItem = $this.parent('li');

        if(! parentListItem.hasClass('active')){
          app.clearVectorLayers();
          app.addVectorLayer(url);
        }
        
      });

      $('.map-dropdown.maps ul a').on('click', function(e){
        var $this = $(this),
            mapId = $this.data('id'),
            parentListItem = $this.parent('li');

        if(! parentListItem.hasClass('active')){
          app.clearTileLayers();
          app.addTileLayer(mapId);
        }
      });

      // ux interaction for map dropdown clicks
      $('.map-dropdown ul a.add-layer').on('click', function(e){
        e.preventDefault();
        e.stopPropagation();
        
        var $this = $(this),
            layerName = $this.text(),
            parentListItem = $this.parent('li'),
            siblingListItems = parentListItem.siblings('li'),
            dropdownLayerTitle = $this.parents('.map-dropdown').find('a.title span.layer-title');

        siblingListItems.removeClass('active');
        parentListItem.addClass('active');
        dropdownLayerTitle.addClass('show').text(layerName);
      });
      
    },

    addVectorLayer: function(url){
      $.getJSON(url, function(data){
        var minesLayer = L.geoJson(data, {
          onEachFeature: onEachFeature
        });

        minesLayer.addTo(app.map);
        app.map.vectorLayers.push(minesLayer);

        app.setUpTable(data);

        app.map.fitBounds(minesLayer.getBounds());

      });

      // For Each feature in the GeoJSON define popups, any action etc action
      // onEachFeature is a leaflet method that can pass to a layer
      function onEachFeature(feature, layer) {
        var props = feature.properties;

        // do if statements for a few different properties
        // testing with typeof props.(property) !== undefined
        // for the 3 different geodata types
        var company = props.drc_company ? props.drc_company : '';
        var type = props.mine_type ? props.mine_type :  '';
        var proven = props.proven_reserves ? props.proven_reserves : '';
        var resourceList = '';
        if(proven && proven.length > 0) {
          resourceList = app.getResourceList(proven);
        }
        var source = props.source ? props.source : '';
        
        var popupContent = "<h3 class='mine-marker'>"+ props.name + "</h3>"+
            "Company: "+ company + "<br />"+
            "Type: " + type + "<br />"+
            "Proven Reserves: "+ resourceList + "<br />"+
            "Source: " + source;

        layer.bindPopup(popupContent);
      }

    },
    
    getResourceList: function(deposits){
      var resourceList = '';
      //loop through and get unique minerals
      var mineralArr = [];
      deposits.forEach( function (resource) {
        var mineral = resource.mineral_resource.name
        if( mineral && !$.inArray(mineral, mineralArr) >= 0){ 
          mineralArr.push(mineral)
        }
      });
      var first = true;
      mineralArr.forEach( function (mineral) {
        //add a comma
        if(first){
          first = false;
        } else {
          resourceList += ", "
        }
        resourceList += mineral;
      });
      return resourceList;
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

      var resourceReserveColumns = [ 'proven_reserves', 'proven_reserves',
        'probable_reserves', 'total_reserves', 'measured_resources',
      'indicated_resources','inferred_resources'];
      
      

      table_data.forEach( function (val, index, arg) {
        var oneDataRow = [];
        for (var prop in val) {
          //find special values that need to be subgrids
          if($.inArray(prop, resourceReserveColumns) >= 0){
            var colData = '';
            //get unique list of resources
            var resourceData = val[prop];
            if(resourceData && resourceData.length > 0){
              colData += app.getResourceList(resourceData);
              //add link to open details
              colData += '<br /><a href="#">Details</a>'
            } else {
              colData += 'None'; //TODO: translate
            }
            oneDataRow.push(colData);
            
          }else {
            oneDataRow.push(val[prop]);
          }
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
        "columns": [
            { "title": "Name" },
            { "title": "Company" },
            { "title": "Mine Type" },
            { "title": "Permit Type" },
            { "title": "Permit Number" },
            { "title": "Proven Reserves" },
            { "title": "Probable Reserves" },
            { "title": "Total Reserves" },
            { "title": "Measured Resources" },
            { "title": "Indicated Resources" },
            { "title": "Inferred Resources" },
            { "title": "Source" }
        ],
      });
    },

    addTileLayer: function(mapId){
      var tileLayer = L.tileLayer('http://api.tiles.mapbox.com/v4/' + mapId + '/{z}/{x}/{y}.png?access_token=' + app.access_token);
      app.map.tileLayers.push(tileLayer);
      app.map.addLayer(tileLayer);
    },

    clearVectorLayers: function() {
      app.map.vectorLayers.forEach(function(layer){
        app.map.removeLayer(layer);
      });

      if (typeof app.mapTable !== 'undefined') {
        // console.log($('.mine-table'));
        app.mapTable.fnClearTable();
        app.mapTable.fnDestroy();
        $('.mine-table').replaceWith( '<table class="mine-table" width="100%"></table>' );
      } else {
        // console.log('no mine-table');
      }

    },

    clearTileLayers: function(){
      app.map.tileLayers.forEach(function(layer){
        app.map.removeLayer(layer);
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
