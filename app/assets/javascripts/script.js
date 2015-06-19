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

      // show datatable child rows
      $('table.mine-table').on('click', 'td.show-child-rows', function(e){
        var tr = $(this).closest('tr');
        var row = app.mapTable.row( tr );
 
        if ( row.child.isShown() ) {
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            row.child( app.childRowTemplate(row.data()) ).show();
            tr.addClass('shown');
        }
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
        minerals = app.getMineralList(props).join(', ');
        
        var popupContent = ["<h2 class='mine-marker text-center'>", props.name, "</h2>",
            "<table>",
              '<tr>',
                '<td class="name">Company</td>', '<td class="value">', company, '</td>',
              '</tr>',
              '<tr>',
                '<td class="name">Mine Type</td>', '<td class="value">', type, '</td>',
              '</tr>',
              '<tr>',
                '<td class="name">Minerals</td>', '<td class="value">', minerals, '</td>',
              '</tr>',
            "</table>"].join('');

        layer.bindPopup(popupContent);
      }

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
    },

    setUpTable: function(geoJSON){
      if (geoJSON.features.length == 0) {
        return;
      }

      var properties = $.map(geoJSON.features, function(feature){ 
        var property = feature.properties;
        property["minerals"] = app.getMineralList(feature.properties).join(', ');
        return property;
      });

      app.mapTable = $('.mine-table').DataTable({
        "data" : properties,
        "paging": false,
        "info": false,
        "searching": false,
        "columns": [
            { "data": "name", "title": "Name" },
            { "data": "drc_company", "title": "Company" },
            { "data": "mine_type", "title": "Mine Type" },
            { "data": "permit_type", "title": "Permit Type" },
            { "data": "permit_number", "title": "Permit Number" },
            { "data": "minerals", 
              "title": "Minerals",
              "className": "show-child-rows"
            },
            { "data": "source", "title": "Source" }
        ],
      });

    },

    getMineralList: function(properties){
      // look through all resource measurements, and return an array of all unique minerals that have a measurement
      // in essence, this will return all minerals at the deposit site
      var resourceMeasurementTypes = [
        'indicated_resources',
        'inferred_resources',
        'measured_resources',
        'total_resources',
        'probable_reserves',
        'proven_reserves',
        'total_reserves'
      ];

      var resourceList = resourceMeasurementTypes.map(function(measurement){
        if(properties[measurement]){
          return properties[measurement].map(function(resource){
            return resource.mineral_resource.name;
          });
        }
      });

      return uniq(flatten(resourceList));
    },

    childRowTemplate: function(row){
      // deposit :: resourceMeasurementType :: resourceMeasurement :: mineral
      // clusterfuck?
      // TODO: rewrite using a templating language

      var resourceMeasurementTypes = [
        'indicated_resources',
        'inferred_resources',
        'measured_resources',
        'total_resources',
        'probable_reserves',
        'proven_reserves',
        'total_reserves'
      ];

      var childTableWrapper = ['<table class="childTable" cellspacing="0">',
                                  '<thead>',
                                    '<tr>',
                                      '<th></th>',
                                      '<th>Tonnage</th>',
                                      '<th>Grade (%)</th>',
                                      '<th>Metal Content</th>',
                                    '</tr>',
                                  '</thead>',
                                  '<tbody>',
                                  '</tbody>',
                                '</table>'];

      var childTableBody = resourceMeasurementTypes.map(function(measurementType){
        return renderResourceMeasurements(measurementType, row[measurementType]);
      });

      // insert childTableBody within childTableWrapper's <tbody> item
      return app.insertAfter(childTableWrapper, '<tbody>', childTableBody).join('');

      function renderResourceMeasurements(measurementType, measurements){
        var header = '<tr><td class="measurement-type">' + app.titleize(measurementType) +'</td></tr>';

        return header + 
              measurements.map(function(measurement){
                var output = ['<tr class="measurement">', 
                          '<td class="name">', measurement.mineral_resource.name, '</td>',
                          '<td>', measurement.tonnage.toLocaleString(), '</td>',
                          '<td>', measurement.grade, '</td>',
                          '<td>', measurement.metal_content, ' (' + measurement.metal_content_unit + ')', '</td>',
                        '</tr>']

                // remove measurement.metal_content_unit if not present
                if(! measurement.metal_content_unit){
                  output.splice(12,1);
                }
                return output.join('')
              }).join('');
      };
    },

    titleize: function(str){
      return str.replace('_', ' ').replace(/(?:^|\s)\S/g, function(a) { return a.toUpperCase(); });
    },

    insertAfter: function(array, insertAfter, insertArray){
      var front = array.slice(0, array.indexOf(insertAfter) + 1),
          back = array.slice(array.indexOf(insertAfter) + 1);
      return front.concat(insertArray, back);
    }

  };

  function flatten(nestedArray) {
    return nestedArray.reduce(function(flattened, array){
      return flattened.concat(array);
    }, []);
  };

  function uniq (array) {
    var output = [];
    array.forEach(function(val){
      if(output.indexOf(val) === -1){
        output.push(val);
      }
    });
    return output;
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
