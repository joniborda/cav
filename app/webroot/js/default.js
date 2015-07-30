function mostrar_loading(sin_close) {

	var options = {
		modal : true
	}

	if (sin_close) {
		options['closeOnEscape'] = false;
		options['open'] = function(event, ui) {
			$(".ui-dialog-titlebar-close").hide();
		};
	}

	$(
			'<div class="loading">Cargando...'
					+ '<div class="progress progress-striped active">'
					+ '<div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">'
					+ '<span class="sr-only">90% Complete</span>' + '</div>'
					+ '</div></div>').dialog(options);

	$('.progress-bar').attr('aria-valuenow', 100);
	$('.progress-bar').css('width', '100%');
}

function ocultar_loading() {
	$('.loading').dialog('destroy');
}

function mostrar_mensaje(html, type) {
	
	if (typeof type == 'undefined') {
		 type = 'success';
	}
	
	html = '<div class="' + type + '">' + html + '</div>';

	$(html).dialog({
		modal : true
	});
}
$(document).ready(function() {
    
    $('.datepicker').datepicker({
        dateFormat : "dd/mm/yy",
        showOptions : {
            direction : "down"
        },
        shortYearCutoff : 50,
        changeYear : true,
        yearRange : "1900:2015",
        changeMonth : true,
    });

    $('.datepicker').attr('autocomplete', 'off');

    $('[multiple]').multiselect({
        enableFiltering : true,
        enableCaseInsensitiveFiltering : true
    });
	
	$('form').submit(function() {
		mostrar_loading();
	});
	
	$('input[type="file"]').change(function (){
		var fileName = $(this).val();
		$(this).closest('.col-sm-6').find(".div_image").html(
				'<div class="img_foto">' +
				'<span class="glyphicon glyphicon-upload" style="font-size: 110px;display: block;"></span>' +
				'<span style="display: block;margin-top: 15px;">Subir Archivo</span>' +
				'</div>'
		);
		
		$(this).closest('.col-sm-6').find(".div_image").click(function(e) {
			e.preventDefault();
			mostrar_loading(true);
			$(this).closest('form').submit();
		});
	});
	
	   // Ocultar o mostrar button
    $('#boton_ocultar_menu_top').click(function() {
        if($('#top_menu_div').is(':visible')) {
            $('#boton_ocultar_menu_top').removeClass('glyphicon-chevron-up');
            $('#boton_ocultar_menu_top').addClass('glyphicon-chevron-down');
            window.localStorage.setItem('menu_top','hide');
        } else {
            $('#boton_ocultar_menu_top').removeClass('glyphicon-chevron-down');
            $('#boton_ocultar_menu_top').addClass('glyphicon-chevron-up');
            window.localStorage.setItem('menu_top', 'show');
        }
        $('#top_menu_div').toggle();
    });
    
    // Ocultar si tiene que estar ocultado
    if (window.localStorage.getItem('menu_top') == 'hide') {
        $('#boton_ocultar_menu_top').removeClass('glyphicon-chevron-down');
        $('#boton_ocultar_menu_top').addClass('glyphicon-chevron-up');
        $('#top_menu_div').toggle();
    }
});


function dni(input) {
    $(input).keyup(function(e) {
        
        switch (e.keyCode) {
            case 40:
            case 39:
            case 38:
            case 37:
            case 36:
            case 35:
            case 20:
            case 18:
            case 17:
            case 16:
            case 8:
            case 9:
                return;
        }
        
        var text = $(input).val();
        text = text.replace(/\./g,'');
        
        var i = 0;
        var alreves = ''; 
        for ( var int = text.length-1; int >= 0; int--) {
            i++;
            alreves += text[int];
            
            if (text[int] != parseInt(text[int], 10) || typeof text[int-1] == 'undefined' || text[int-1] != parseInt(text[int-1], 10)) {
                i=0;
            }
            
            if (i == 3) {
                i = 0;
                alreves += '.';
            }
        }
        
        var ret = '';
        for ( var int = alreves.length-1; int >= 0; int--) {
            ret += alreves[int];
        }
        $(input).val(ret);
    });
}