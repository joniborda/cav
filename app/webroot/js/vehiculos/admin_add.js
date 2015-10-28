$(document).on('change',"#VehiculoTipoAutorizacion", function(event){

  var valor = $(this).val();

   if(valor == 'INVITADO' ||valor == 'PROVEEDOR' ) {
	   $("#repetir").show();
   } else {

	    $("#repetir").hide();	   
 
	}
});

