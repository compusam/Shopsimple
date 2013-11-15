/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    $('.treemap li').each(function(){
        if($(this).attr('class') !== 'active'){
            $(this).hide();
        }
    });
});