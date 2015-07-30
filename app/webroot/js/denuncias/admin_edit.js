$('#DenunciaOrganismoIntervinienteId').tagit({
    availableTags: organismos,
    allowSpaces: true
});

$('#DenunciaOrganismoDenunciadoId').tagit({
    availableTags: organismos,
    allowSpaces: true
});

$('#TematicaTematica').change(function (e) {
    e.preventDefault();
    var _this = $(this);
    var seleccionados = _this.val();
    
    $('.subtematicas').html('');
    
    for (var i in seleccionados) {        
        tematica_id = seleccionados[i];
        
        var tiene_subtematicas = false;
        var html = '<DIV><LABEL>' + tematicas[seleccionados[i]] + '</LABEL><SELECT NAME="data[Subtematica][Subtematica][]" multiple="multiple">';
        for (var j in subtematicas) {
            
            if (subtematicas[j]['tematica_id'] == seleccionados[i]) {
                tiene_subtematicas = true;
                html += '<OPTION VALUE="' + subtematicas[j]['id'] + '"';
                
                if ($.inArray(subtematicas[j]['id'], subtematicas_selected) != -1) {
                    html += ' SELECTED="SELECTED" ';
                }
                
                html += '>' +
                            subtematicas[j]['descripcion'] + 
                        '</OPTION>';
            }
        }
        html += '</SELECT></DIV>';
        
        if (tiene_subtematicas) {
            $('.subtematicas').append(html);            
        }
    }
    $('[multiple]').multiselect({
        enableFiltering : true,
        enableCaseInsensitiveFiltering : true
    });
    
});

$('.subtematicas [multiple]').each(function(element, index) {
    if ($(index).children().length == 0) {
        $(index).closest('div').remove();
    }
});