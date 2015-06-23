$(function(){
  $(document).foundation();

  var app = {
    access_token: 'pk.eyJ1IjoiY29uZ29taW5lcyIsImEiOiI4ZmRkOGJiNDk0MzNhNmU1NGE4N2MzODI5ZmFhNTcxNyJ9.wW5SYM4cPL7qOrz-443SGg',
    mapTable: null,
    initCommon: function(){
      mainbottom = $('.content').offset().top

      $("#hideshow").on('click', function(e) {
        e.preventDefault();
        e.stopPropagation();

        $("#browse-search").slideToggle(500);
      });

      $(".accordion").on("click", "li", function(e) {
        $(this).find(".content").slideToggle(300);
      });

      $(".select2-dropdown").select2({
        allowClear: true
      });

      $(".document-container article.hide-summary-true .show-summary").on('click', function(e) {
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
            center: [-2.877, 22.83],
            zoom: 5,
            scrollWheelZoom: false,
            zoomControl: false, // we'll rebuild it later
            minZoom: 4,
            maxZoom: 18
        });

        
        app.baselayer = {
          terrain: L.tileLayer('http://api.tiles.mapbox.com/v4/congominesmaps.bd24d4b8/{z}/{x}/{y}.png?access_token=' + app.access_token),
          satellite: L.tileLayer('http://api.tiles.mapbox.com/v4/congominesmaps.385280cd/{z}/{x}/{y}.png?access_token=' + app.access_token)
        };
        app.map.vectorLayers = [];
        app.map.tileLayers = [];

        // add additional objects to map object storing references to moabiLayers and moabiControls
        var latlngControl = L.control({position: 'topright'});
        latlngControl.onAdd = function(){
          var controlHTML = $('<table>', {
            class: 'latlng-control leaflet-control',
            html: ['<tbody>',
                    '<tr>',
                      '<td>Lat: </td>',
                      '<td class="lat-input text-center">00.000 &deg;</td>',
                      '<td class="leaflet-control-zoom-in"><a href="#">+</a></td>',
                    '</tr>',
                    '<tr>',
                      '<td>Lon: </td>',
                      '<td class="lng-input text-center">00.000 &deg;</td>',
                      '<td class="leaflet-control-zoom-out"><a href="#">-</a></td>',
                    '</tr>',
                  '</tbody>'].join('')
          });
          return controlHTML[0];
        };

        var shareControl = L.control({position: 'topright'});
        // https://developers.facebook.com/docs/sharing/reference/share-dialog
        shareControl.onAdd = function(){
          var controlHTML = $('<div>', {
            class: 'leaflet-bar social-media-control leaflet-control',
          });
          var fbButton = $('<a>',{
            class: 'fb-share fa fa-facebook',
            href: '#'
          })
          var twitterButton = $('<a>',{
            class: 'twitter-share fa fa-twitter',
            href: '#'
          })
          controlHTML.append(fbButton, twitterButton);
          return controlHTML[0];
        }

        app.map.attributionControl.setPrefix(false);
        app.map.attributionControl.addAttribution("<a href='https://www.mapbox.com/about/maps/' target='_blank'>&copy; Mapbox &copy; OpenStreetMap</a> <a class='mapbox-improve-map' href='https://www.mapbox.com/map-feedback/' target='_blank'>Improve this map</a>")
        // L.control.zoom({position: 'topright'}).addTo(this.map);
        latlngControl.addTo(this.map);
        L.control.scale({position: 'bottomleft'}).addTo(this.map);
        shareControl.addTo(this.map);

      // zoom control events
      $('.leaflet-control-zoom-in').on('click', function(e){
        e.preventDefault();
        e.stopPropagation();
        app.map.zoomIn();
      });

      $('.leaflet-control-zoom-out').on('click', function(e){
        e.preventDefault();
        e.stopPropagation();
        app.map.zoomOut();
      });

      // map dropdown click map events
      $('.map-dropdown.baselayers ul a').on('click', function(e){
        var $this = $(this),
            id = $this.data('id'),
            parentListItem = $this.parent('li');

        var oldBaselayer = _.filter(app.baselayer, function(layer){
          return app.map.hasLayer(layer);
        })[0];

        app.baselayer[id].addTo(app.map).once('load', function(e){
          if(oldBaselayer){
            app.map.removeLayer(oldBaselayer);
          }
        });
        
      });

      $('.map-dropdown.mining-data ul a').on('click', function(e){
        var $this = $(this),
            type = $this.data('type'),
            url = $this.data('url'),
            parentListItem = $this.parent('li');

        if(! parentListItem.hasClass('active')){
          app.clearVectorLayers();
          app.addVectorLayer(url, type);
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
        var $this = $(this),
            cellIcon = $this.find('i'),
            tr = $this.closest('tr'),
            row = app.mapTable.api().row( tr );
 
        if ( row.child.isShown() ) {
          row.child.hide();
          tr.removeClass('shown');
          cellIcon.removeClass('fa-caret-down').addClass('fa-caret-right');
        }
        else {
          row.child( app.childRowTemplate(row.data()) ).show();
          tr.addClass('shown');
          cellIcon.removeClass('fa-caret-right').addClass('fa-caret-down');
        }
      });

      // map social media tools
      $('.fb-share').on('click', this.fbShareDialogue);
      $('.twitter-share').on('click', this.twitterShareDialogue);

      // mouse move events
      this.map.on('mousemove', _.throttle(function(e){
        app.setLatLngWidget(e.latlng.lat, e.latlng.lng);
      }, 100));
      
    },

    addVectorLayer: function(url, type){
      $.getJSON(url, function(data){
        // remove features with no coordinates
        data.features = _.filter(data.features, function(feature){
          var lat = feature.geometry.coordinates[1],
              lon = feature.geometry.coordinates[0];

          return lat !== undefined && lon !== undefined &&
                 lat !== null && lon !== null &&
                 lat >= -90 && lat <= 90 &&
                 lon >= -180 && lon <= 180;
                 
                 
        });

        var minesLayer = L.geoJson(data, {
          onEachFeature: onEachFeature
        });

        minesLayer.addTo(app.map);
        app.map.vectorLayers.push(minesLayer);

        app.setUpTable(data, type);

        // fit map features to viewport unless no geojson features
        if(data.features.length > 0){
          app.map.fitBounds(minesLayer.getBounds(), { maxZoom: 15 });
        }
        

      });

      // For Each feature in the GeoJSON define popups, any action etc action
      // onEachFeature is a leaflet method that can pass to a layer
      function onEachFeature(feature, layer) {
        var properties = _.mapObject(feature.properties, function(property){
                          if(property === null || property === undefined){
                            return '';
                          }
                          return property;
                        });
        
        var popupContent = ["<h2 class='mine-marker text-center'>", properties.name, "</h2>",
            "<table>",
              '<tr>',
                '<td class="name">Company</td>', '<td class="value">', properties.drc_company, '</td>',
              '</tr>',
              '<tr>',
                '<td class="name">Mine Type</td>', '<td class="value">', properties.type, '</td>',
              '</tr>',
              '<tr>',
                '<td class="name">Minerals</td>', '<td class="value">', app.getMineralList(properties).join(', '), '</td>',
              '</tr>',
              '<tr>',
                '<td class="name">Permit Number</td>', '<td class="value">', properties.permit_number, '</td>',
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
      _.forEach(app.map.vectorLayers, function(layer){
        app.map.removeLayer(layer);
      });

    },

    clearTileLayers: function(){
      _.forEach(app.map.tileLayers, function(layer){
        app.map.removeLayer(layer);
      });
    },

    setUpTable: function(geoJSON, type){
      // destroy if exists
      if(app.mapTable){
        // app.mapTable.destroy();
        app.mapTable.fnClearTable();
        app.mapTable.fnDestroy();
        app.mapTable.empty();
      }

      var properties = _.map(geoJSON.features, function(feature){ 
        var property = feature.properties;
        property["minerals"] = app.getMineralList(feature.properties).join(', ') + '<i class="fa fa-caret-right"></i>';
        return property;
      });

      var columns = {
        deposit: [
          { "data": "name", "title": "Name" },
          // { "data": "drc_company", "title": "Company" },
          { "data": "mine_type", "title": "Mine Type" },
          { "data": "permit_type", "title": "Permit Type" },
          { "data": "permit_number", "title": "Permit Number" },
          { "data": "minerals", 
            "title": "Minerals",
            "className": "show-child-rows",
          },
          { "data": "source", "title": "Source" }
        ],
        processing_infrastructure: [
          { "data": "name", "title": "Name" }
        ],
        social_project: [
          { "data": "project_type", "title": "Type de Projet" },
          { "data": "amount_planned", "title": "Montant prévu" },
          { "data": "amount_spent", "title": "Montant dépensé" },
          { "data": "stage", "title": "Etat de réalisation" },
          { "data": "description", "title": "Description" }
        ],
      };

      app.mapTable = $('.mine-table').dataTable({
        "data" : properties,
        "destroy": true,
        "paging": false,
        "info": false,
        "searching": false,
        "autoWidth": false,
        "columns": columns[type]
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

      var resourceList = _.map(resourceMeasurementTypes, function(measurement){
        if(properties[measurement]){
          return _.map(properties[measurement], function(resource){
            return resource.mineral_resource.name;
          });
        }
      });

      return _.uniq(_.flatten(resourceList));
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
                                      '<th>Grade</th>',
                                      '<th>Metal Content</th>',
                                    '</tr>',
                                  '</thead>',
                                  '<tbody>',
                                  '</tbody>',
                                '</table>'];

      var childTableBody = _.map(resourceMeasurementTypes, function(measurementType){
        return renderResourceMeasurements(measurementType, row[measurementType]);
      });

      // insert childTableBody within childTableWrapper's <tbody> item
      return app.insertAfter(childTableWrapper, '<tbody>', childTableBody).join('');

      function renderResourceMeasurements(measurementType, measurements){
        var header = '<tr><td class="measurement-type">' + app.titleize(measurementType) +'</td></tr>';

        return header + 
              _.map(measurements, function(measurement){
                return ['<tr class="measurement">', 
                          '<td class="name">', measurement.mineral_resource.name, '</td>',
                          '<td>', app.numberize(measurement.tonnage), '</td>',
                          '<td>', measurement.grade, '</td>',
                          '<td>', app.numberize(measurement.metal_content, 'percent'), '</td>',
                        '</tr>'].join('');

              }).join('');
      };
    },

    setLatLngWidget: function(lat, lng){
      var latlngControl = $('#map .latlng-control');
      latlngControl.find('.lat-input').html(lat.toFixed(3) + ' &deg;');
      latlngControl.find('.lng-input').html(lng.toFixed(3) + ' &deg;');
    },

    fbShareDialogue: function(e){
      e.preventDefault();
      e.stopPropagation();

      var url = 'https://www.facebook.com/sharer/sharer.php?u=';
      url += encodeURIComponent(location.href);
      // url += '&p[title]=Moabi';
      window.open(url, 'fbshare', 'width=640,height=320');
    },

    twitterShareDialogue: function(e){
      e.preventDefault();
      e.stopPropagation();

      var url = 'http://twitter.com/share?'
      url += 'text=@CongoMines mapping the extractive industry in the DRC\n';
      url += '&url=' + encodeURIComponent(location.href);
      // url += '&hashtags=...';
      window.open(url, 'twittershare', 'width=640,height=320');
    },

    titleize: function(str){
      return str.replace('_', ' ').replace(/(?:^|\s)\S/g, function(a) { return a.toUpperCase(); });
    },

    numberize: function(num, format){
      if(num === null || num === undefined){
        return num;
      }else if(format === 'percent'){
        return num.toLocaleString() + ' (%)';
      }
      return num.toLocaleString();
    },

    insertAfter: function(array, insertAfter, insertArray){
      var front = array.slice(0, array.indexOf(insertAfter) + 1),
          back = array.slice(array.indexOf(insertAfter) + 1);
      return front.concat(insertArray, back);
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
