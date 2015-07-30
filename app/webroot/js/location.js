if (typeof model_location == 'undefined') {
    var model_location = 'Victima';
}
var prov_id = null;
var reg_id = null;

function mostar_loading(sin_close, con_texto) {
    
    var options = {
        modal: true
    }
    
    if (sin_close) {
        options['closeOnEscape'] = false;
        options['open'] = function(event, ui) {
            $(".ui-dialog-titlebar-close").hide(); 
        };
    }
    if (con_texto) {
        texto = con_texto;
    } else {
        texto = 'Cargando...';
    }
    
    $('<div class="loading">' + texto  + 
            '<div class="progress progress-striped active">' +
            '<div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">' +
            '<span class="sr-only">90% Complete</span>' +
            '</div>' +
    '</div></div>').dialog(options);
    
    $('.progress-bar').attr('aria-valuenow',100);
    $('.progress-bar').css('width','100%');
}

$(document).on('change', "#" + model_location + "ProvinciaId", function(event){
    prov_id = $("#" + model_location + "ProvinciaId").find(":selected").val();
    
    mostar_loading();
    
    $("#" + model_location + "DepartamentoId").load(
            base_url + "admin/Ubicacion/update_select/"+prov_id,
            function() {
                $("#" + model_location + "DepartamentoId").focus();
                $('.loading').dialog('destroy');
            }
    );
    //borra localidad
    $("#" + model_location + "LocalidadId").html("<option value=''>Seleccione</option>");
});

$(document).on('change', "#" + model_location + "DepartamentoId", function(event){
    mostar_loading();
    prov_id = $("#" + model_location + "ProvinciaId").find(":selected").val();
    reg_id = $("#" + model_location + "DepartamentoId").find(":selected").val();
    
    $("#" + model_location + "LocalidadId").load(
        base_url + "admin/Ubicacion/update_select/" + prov_id + "/" +reg_id,
        function() {
            $("#" + model_location + "LocalidadId").focus();
            $('.loading').dialog('destroy');
        }
    );
});

$(document).on('change', '#' + model_location + 'PaisId', function(e) {
    ver_pais();
});

ver_pais();

/**
 * Se fija si el pais es argentina para las provincias.
 */
function ver_pais() {
    
    if ($('#' + model_location + 'PaisId').length > 0 && $('#' + model_location + 'PaisId').val() != "1") {
        
        $("#" + model_location + "ProvinciaId").attr('disabled','disabled');
        $("#" + model_location + "DepartamentoId").attr('disabled','disabled');
        $("#" + model_location + "LocalidadId").attr('disabled','disabled');
    } else {
        $("#" + model_location + "ProvinciaId").removeAttr('disabled','disabled');
        $("#" + model_location + "DepartamentoId").removeAttr('disabled','disabled');
        $("#" + model_location + "LocalidadId").removeAttr('disabled','disabled');
    }
}

/**
 * Carga la ubicacion para modelos particulares
 * 
 * @param model_location
 */
function cargar_ubicacion(model_location) {
    $(document).on('change', "#" + model_location + "ProvinciaId", function(event){
        prov_id = $("#" + model_location + "ProvinciaId").find(":selected").val();
        
        mostar_loading();
        
        $("#" + model_location + "DepartamentoId").load(
                base_url + "admin/Ubicacion/update_select/"+prov_id,
                function() {
                    $("#" + model_location + "DepartamentoId").focus();
                    $('.loading').dialog('destroy');
                }
        );
        //borra localidad
        $("#" + model_location + "LocalidadId").html("<option value=''>Seleccione</option>");
    });

    $(document).on('change', "#" + model_location + "DepartamentoId", function(event){
        mostar_loading();
        prov_id = $("#" + model_location + "ProvinciaId").find(":selected").val();
        reg_id = $("#" + model_location + "DepartamentoId").find(":selected").val();
        
        $("#" + model_location + "LocalidadId").load(
            base_url + "admin/Ubicacion/update_select/" + prov_id + "/" +reg_id,
            function() {
                $("#" + model_location + "LocalidadId").focus();
                $('.loading').dialog('destroy');
            }
        );
    });
    
    // PAIS ARGENTINA HABILITA A LAS PROVINCIA
    $(document).on('change', '#' + model_location + 'PaisId', function(e) {

        ver_pais();
    });
    
    ver_pais();
    
}
$('#' + model_location + 'LocalidadTexto').autocomplete(
        {
            source : function(request, response) {
                $.ajax({
                    url: base_url + 'admin/pe_legajos/auto_localidad',
                    dataType: "jsonp",
                    data: {
                        q: request.term,
                        model: model_location
                    },
                    success: function( data ) {
                        response( data );
                    },
                    complete: function( data ) {
                        response( jQuery.parseJSON(data.responseText));
                    }
                });
                
            }
        }
);

$('#' + model_location + 'ProvinciaTexto').autocomplete(
        {
            source : function(request, response) {
                $.ajax({
                    url: base_url + 'admin/pe_legajos/auto_provincia',
                    dataType: "json",
                    data: {
                        q: request.term,
                        model: model_location
                    },
                    complete: function( data ) {
                        response( jQuery.parseJSON(data.responseText));
                    }
                });
                
            }
        }
);