$(document).on('change',"#VehiculoTipoAutorizacion", function(event){

  var valor = $(this).val();

   if(valor == 'INVITADO' ||valor == 'PROVEEDOR' ) {
	   $("#repetir").show();
   } else {

	    $("#repetir").hide();	   
 
	}
});

$(document).on('blur', "#VehiculoPatente", function(event){
	checkPatente();
});

$(document).on('submit', "#VehiculoAdminAddForm", function(event){
	if (!checkPatente()) {
		event.preventDefault();
		ocultar_loading();

		$("#VehiculoPatente").focus();
	}
});

function checkPatente() {
	var _this = $("#VehiculoPatente"),
		valor = $(_this).val(),
		validacion = validarPatente(valor);

	if (validacion) {

		$(_this).attr('data-content', validacion);
		$('[data-toggle="popover"]').popover()
		$(_this).addClass('input_error');
		return false;
	} else {
		
		$(_this).removeClass('input_error');
		$(_this).attr('data-content', '');
		$('[data-toggle="popover"]').popover()
		return true;
	}
}

function validarPatente(valor) {
	var letras,
		numeros,
		message,
		tipo_vehiculo = $('#VehiculoTipoVehiculoId').val();

	if (valor.length < 6) {
		return 'Debe tener un mínimo de 6 caracteres';

	}

	switch(tipo_vehiculo) {
		case "1":
			letras = valor.substr(0,3);
			if (!letras.match(/^[a-zA-Z]+$/)) {
				return 'Los primeros tres caracteres deben ser letras';
			}
			numeros = valor.substr(3,3);

			if (!numeros.match(/^[0-9]+$/)) {
				return 'Los últimos tres caracteres deben ser números';
			}
			break;
		case "2":
			numeros = valor.substr(0,3);
			if (!numeros.match(/^[0-9]+$/)) {
				return 'Los primeros tres caracteres deben ser números';
			}

			letras = valor.substr(3,3);
			if (!letras.match(/^[a-zA-Z]+$/)) {
				return 'Los últimos tres caracteres deben ser letras';
			}
			break;
		case "3":
			break;
	}

}
