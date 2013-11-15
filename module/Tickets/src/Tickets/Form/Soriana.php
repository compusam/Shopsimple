<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Tickets\Form;

use Zend\Form\Form; 

class Soriana extends Form{
   public function __construct($name = null){ 
        parent::__construct('Soriana'); 
        
        $this->setAttribute('method', 'post'); 
        $this->setAttribute('role', 'form'); 
        $this->setAttribute('class', 'col-md-6 col-md-offset-3');
        $this->add(array( 
            'name' => 'soriana_ticket', 
            'type' => 'text', 
            'attributes' => array( 
                'class' => 'form-control', 
                'id' => 'soriana_ticket', 
                'placeholder' => 'Ticket', 
                'required' => 'required', 
            ), 
            'options' => array( 
                'label' => 'Ticket de Compra', 
            ),             
        )); 
        
         $this->add(array(
            'name' => 'submit',
            'attributes' => array(
                'type' => 'submit',
                'value' => 'Registrar',
                'id' => 'ticket_form_soriana_submit',
                'class'=>'btn btn-default'
            ),
        ));
         
        $this->add(array(
            'type' => 'Zend\Form\Element\Csrf',
            'name' => 'csrf',
            'options' => array(
                    'csrf_options' => array(
                            'timeout' => 600
                    )
            )
        ));
    }     
}