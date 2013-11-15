$(document).ready(function(){
    $('#Tienda').submit(function(){
        var walmart_tc = $('#walmart_tc').val();
        var walmart_tr = $('#walmart_tr').val();
        
        if(walmart_tc === ''){
            $('#error_message').html('Por favor, ingrese el TC');
            $('#walmart_tc').focus();
            return false;
        }else{
            if(isNaN(walmart_tc)){
                $('#error_message').html('El TC no puede contener letras');
                $('#walmart_tc').focus();
                return false;
            }
            if(walmart_tc.length < 25){
                $('#error_message').html('El TC no puede tener menos de 25 dígitos');
                $('#walmart_tc').focus();
                return false;
            }else if(walmart_tc.length > 30){
                $('#error_message').html('El TC no puede tener más de 30 dígitos');
                $('#walmart_tc').focus();
                return false;
            }
        }
        
        if(walmart_tr === ''){
            $('#error_message').html('Por favor, ingrese el TR');
            $('#walmart_tr').focus();
            return false;
        }else{
            if(isNaN(walmart_tr)){
                $('#error_message').html('El TR no puede contener letras');
                $('#walmart_tr').focus();
                return false;
            }
            if(walmart_tr.length < 25){
                $('#error_message').html('El TR no puede tener menos de 25 dígitos');
                $('#walmart_tr').focus();
                return false;
            }else if(walmart_tr.length > 30){
                $('#error_message').html('El TR no puede tener más de 30 dígitos');
                $('#walmart_tr').focus();
                return false;
            }
        }
        
        $('#error_message').html('');
         
        return true;
    });
});