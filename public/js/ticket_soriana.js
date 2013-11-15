$(document).ready(function(){
    $('#Soriana').submit(function(){
        var ticket = $('#soriana_ticket').val();
        alert(ticket);
        if(ticket === ''){
            $('#error_message').html('Por favor, ingrese el número de ticket');
            return false;
        }
        
        if(isNaN(ticket)){
            $('#error_message').html('El ticket no debe de contener letras');
            return false;
        }
        
        if(ticket.length < 25){
            $('#error_message').html('El ticket no puede tener menos de 25 dígitos');
            return false;
        }
        
        if(ticket.length > 30){
            $('#error_message').html('El ticket no puede tener más de 30 dígitos');
            return false;
        }
        
        $('#error_message').html('');
        return true;
    });
});
