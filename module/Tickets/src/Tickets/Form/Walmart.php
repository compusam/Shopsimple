<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Tickets\Form;

use Zend\Form\Form; 

class Walmart extends Form{
   public function __construct($name = null){ 
        parent::__construct('Tienda'); 
        
        $this->setAttribute('method', 'post'); 
        $this->setAttribute('role', 'form'); 
        $this->setAttribute('class', 'col-md-6 col-md-offset-3');
        
        $this->add(array( 
            'name' => 'walmart_tc', 
            'type' => 'text', 
            'attributes' => array( 
                'class' => 'form-control', 
                'id' => 'walmart_tc', 
                'placeholder' => 'TC', 
                'required' => 'required', 
            ), 
            'options' => array( 
                'label' => 'TC', 
            ),             
        ));
        
        $this->add(array( 
            'name' => 'walmart_tr', 
            'type' => 'text', 
            'attributes' => array( 
                'class' => 'form-control', 
                'id' => 'walmart_tr', 
                'placeholder' => 'TR', 
                'required' => 'required', 
            ), 
            'options' => array( 
                'label' => 'TR', 
            ),             
        ));
        
         $this->add(array(
            'name' => 'submit',
            'attributes' => array(
                'type' => 'submit',
                'value' => 'Registrar',
                'id' => 'ticket_form_walmart_submit',
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