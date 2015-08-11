'use strict';
function cargar_tab() {
	$( "#tabs" ).tabs({
		disabled: [ 1, 2, 3, 4 ]
	});
	$( "#tabs" ).tabs( "enable", 0 );
}

cargar_tab();
$(function() {
	var vehiculo_form_add,
		persona_form_add;
	// el element de vehiculos lo guardo en una variable y lo borro del body asì no tengo ids repetidos
	vehiculo_form_add = $('.vehiculos').html();
	$('.vehiculos').remove();

	persona_form_add = $('.personas').html();
	$('.personas').remove();

	cargar_tab();

	$('#entrada').bind('click', function(event) {
		event.preventDefault();
		$('#MovimientoTipoMovimiento').val('ENTRADA');
		$( '#tabs' ).tabs( 'disable', 0 ).tabs( 'enable', 1 ).tabs( 'option', 'active', 1);

		input_ok('#preview_tipo_movmiento');

		$('#preview_tipo_movmiento').val('ENTRADA');
	});

	$('#salida').bind('click', function(event) {
		event.preventDefault();
		$('#MovimientoTipoMovimiento').val('SALIDA');
		$( '#tabs' ).tabs( 'disable', 0 ).tabs( 'enable', 1 ).tabs( 'option', 'active', 1);

		input_ok('#preview_tipo_movmiento');

		$('#preview_tipo_movmiento').val('SALIDA');

		toggle_salida(false);
	});

	$('#VehiculoAdminAddForm').bind('submit', function(event) {
		event.preventDefault();
		var patente,
			span,
			tipo_movimiento;

		mostar_loading();

		patente = $('#VehiculoPatente').val();
		tipo_movimiento = $('#preview_tipo_movmiento').val();
		$('#error_empty_patente').remove();
		$('#error_carga_patente').remove();

		if (patente === '') {
			span = $('<span>', {
				'id' : 'error_empty_patente',
				'text' : 'Ingrese una patente',
				'class' : 'label label-danger'
			});
			$('#error_empty_patente').remove();
			$('#VehiculoPatente').after(span);
			ocultar_loading();
			return;
		}

		$.get(base_url + 'admin/vehiculos/busqueda_patente/' + patente + '/' + tipo_movimiento, function(data) {
			ocultar_loading();
			if(data.response) {
				$('#MovimientoVehiculoId').val(data.data.id);

				if (
					$('#MovimientoTipoMovimiento').val() === 'SALIDA' ||
					data.data.tipo_autorizacion === 'AUTORIZADO'
				) {
					$('#MovimientoAdminAddForm').submit();
					return;
				}

				$( "#tabs" ).tabs( "disable", 1 ).tabs( "enable", 2 ).tabs( "option", "active", 2);

				input_ok('#preview_vehiculo');
				$('#preview_vehiculo').val(patente);

			} else {
				if (data.message) {
					span = $('<span>', {
						'id' : 'error_carga_patente',
						'text' : 'Esta vehiculo ya tiene una ' + data.message,
						'class' : 'label label-danger'
					});
					$('#error_carga_patente').remove();
					$('#VehiculoPatente').after(span);
					ocultar_loading();

				} else {

					$('<div>' , {
						'id' : 'vehiculo'
					}).html(vehiculo_form_add).dialog({
						modal: true
					});
					$('#vehiculo_addPatente').val(patente);
					$('#vehiculo_addPatenteMostrar').val(patente);
					$('#vehiculo_addColor').focus();

					bind_vehiculos_form();
				}

			}
		}, 'json').error(function() {
			ocultar_loading();
			alert('Asegurese de estar logueado');
		});
	});

	$('#PersonaAdminAddForm').bind('submit', function(event) {
		event.preventDefault();
		var numero_documento,
		 	span;

		mostar_loading();

		numero_documento = $('#PersonaNumeroDocumento').val();

		$('#error_empty_numero_documento').remove();
		if (numero_documento === '') {
			span = $('<span>', {
				'id' : 'error_empty_numero_documento',
				'text' : 'Ingrese un Número de Documento',
				'class' : 'label label-danger'
			});
			$('#error_empty_numero_documento').remove();
			$('#PersonaNumeroDocumento').after(span);
			ocultar_loading();
			return;
		}

		$.get(base_url + 'admin/personas/busqueda_dni/' + numero_documento, function(data) {
			ocultar_loading();
			if(data.response) {
				$('#MovimientoPersonaId').val(data.data.id);
				$( "#tabs" ).tabs( "disable", 2 ).tabs( "enable", 3 ).tabs( "option", "active", 3);

				input_ok('#preview_persona');
				$('#preview_persona').val(numero_documento);
			} else {
				$('<div>' , {
					'id' : 'persona'
				}).html(persona_form_add).dialog({
					modal: true
				});
				$('#persona_addNumeroDocumento').val(numero_documento);
				$('#persona_addNumeroDocumentoMostrar').val(numero_documento);
				$('#persona_addColor').focus();

				bind_personas_form();
			}
		}, 'json').error(function() {
			ocultar_loading();
			alert('Asegurese de estar logueado');
		});
	});

	$('#SectorAdminAddForm').bind('submit', function(event) {
		event.preventDefault();
		$('#MovimientoSector').val($('#SectorSector').val());
		$('#MovimientoInterno').val($('#SectorInterno').val());
		$('#MovimientoHorasPredio').val($('#SectorHorasPredio').val());
		$('#MovimientoMinutosPredio').val($('#SectorMinutosPredio').val());

		$( "#tabs" ).tabs( "disable", 3 ).tabs( "enable", 4 ).tabs( "option", "active", 4);

		$('#MovimientoAdminAddForm').submit();

		ocultar_loading();
	});

	$('#vehiculo_atras').bind('click', function(event) {
		event.preventDefault();
		$( "#tabs" ).tabs( "disable", 1 ).tabs( "enable", 0 ).tabs( "option", "active", 0);
		$('#MovimientoTipoMovimiento').val(null);
		$('#MovimientoVehiculoId').val(null);
		$('#MovimientoPersonaId').val(null);
		$('#MovimientoSector').val(null);
		$('#MovimientoInterno').val(null);

		input_error('#preview_tipo_movmiento');

		$('#error_empty_patente').remove();
		$('#error_carga_patente').remove();
		$('#VehiculoPatente').val(null);

		toggle_salida(true);
	});

	$('#persona_atras').bind('click', function(event) {
		event.preventDefault();
		$( "#tabs" ).tabs( "disable", 2 ).tabs( "enable", 1 ).tabs( "option", "active", 1);
		$('#MovimientoVehiculoId').val(null);
		$('#MovimientoPersonaId').val(null);
		$('#MovimientoSector').val(null);
		$('#MovimientoInterno').val(null);

		input_error('#preview_vehiculo');
	});

	$('#sector_atras').bind('click', function(event) {
		event.preventDefault();
		$( "#tabs" ).tabs( "disable", 3 ).tabs( "enable", 2 ).tabs( "option", "active", 2);
		$('#MovimientoPersonaId').val(null);
		$('#MovimientoSector').val(null);
		$('#MovimientoInterno').val(null);

		input_error('#preview_persona');
	});

	function bind_vehiculos_form() {
		$('#vehiculo_addAdminAddForm').bind('submit', function(event) {
			event.preventDefault();
			mostar_loading();

			$.post(base_url + 'admin/vehiculos/add_ajax',
				$(this).serialize(),
				function(data) {
					ocultar_loading();
					if(data.response) {
						$('<div>', {
								'class': 'alert alert-success navbar-fixed-top',
								'text': data.message
							}
						).appendTo('body')
						.fadeOut(10000);

						$('#MovimientoVehiculoId').val(data.id);
						$("#tabs").tabs( "disable", 1 ).tabs( "enable", 2 ).tabs( "option", "active", 2);
						$('#vehiculo').dialog('destroy');

						input_ok('#preview_vehiculo');
						$('#preview_vehiculo').val($('#VehiculoPatente').val());
					} else {
						$('<div>', {
								'class': 'alert alert-danger navbar-fixed-top',
								'text': data.message
							}
						).appendTo('body')
						.fadeOut(10000);
					}
				},
				'json'
			).error(function() {
				ocultar_loading();
				alert('Asegurese de estar logueado');
			});
		});
	}
	
	function bind_personas_form() {
		$('#persona_addAdminAddForm').bind('submit', function(event) {
			event.preventDefault();
			mostar_loading();

			$.post(base_url + 'admin/personas/add_ajax',
				$(this).serialize(),
				function(data) {
					ocultar_loading();
					if(data.response) {
						$('<div>', {
								'class': 'alert alert-success navbar-fixed-top',
								'text': data.message
							}
						).appendTo('body')
						.fadeOut(10000);

						$('#MovimientoPersonaId').val(data.id);
						$('#tabs').tabs( 'disable', 2 ).tabs( 'enable', 3 ).tabs( 'option', 'active', 3);
						$('#persona').dialog('destroy');

						input_ok('#preview_persona');
						$('#preview_persona').val($('#PersonaNumeroDocumento').val());
					} else {
						$('<div>', {
								'class': 'alert alert-danger navbar-fixed-top',
								'text': data.message
							}
						).appendTo('body')
						.fadeOut(10000);
					}
				},
				'json'
			).error(function() {
				ocultar_loading();
				alert('Asegurese de estar logueado');
			});
		});
	}
	
	function input_ok(input_selector) {
		var form_group;
		form_group = $(input_selector).closest('.form-group');
		form_group.find('.glyphicon').removeClass('glyphicon-remove').addClass('glyphicon-ok');
		form_group.removeClass('has-error').addClass('has-success');
	}

	function input_error(input_selector) {
		var form_group;
		form_group = $(input_selector).closest('.form-group');
		form_group.find('.glyphicon').removeClass('glyphicon-ok').addClass('glyphicon-remove');
		form_group.removeClass('has-success').addClass('has-error');
		$(input_selector).val('');
	}

	function toggle_salida(show) {
		var form_group = $('#preview_persona').closest('.form-group');
		if (show) {
			form_group.show();
			$($('#tabs').find('[href="#tab-persona"]')).show();
			$($('#tabs').find('[href="#tab-sector"]')).show();
		} else {
			form_group.hide();
			$($('#tabs').find('[href="#tab-persona"]')).hide();
			$($('#tabs').find('[href="#tab-sector"]')).hide();
		}
	}
});