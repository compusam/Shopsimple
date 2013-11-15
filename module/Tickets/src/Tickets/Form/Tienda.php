<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Tickets\Form;

use Zend\Form\Form; 

class Tienda extends Form{
   public function __construct($name = null){ 
        parent::__construct('Tienda'); 
        
        $this->setAttribute('method', 'post'); 
        $this->setAttribute('role', 'form'); 
        $this->setAttribute('class', 'col-md-6 col-md-offset-3');
        $this->add(array( 
            'name' => 'autoservicio', 
            'type' => 'Zend\Form\Element\Select', 
            'options' => array( 
                'label' => 'Tiendas De Autoservicio',
                'value_options'=>array(
                    '0'  => '--- Elige una Tienda ---',
                    '1'=>'Tienda Soriana',
                    '2'=>'Tienda Walmart',
                ),
             
            ),
            'attributes' => array( 
                'value' => '0',       
                'class'=>'form-control'
            ),             
        )); 
        
         $this->add(array(
            'name' => 'submit',
            'attributes' => array(
                'type' => 'submit',
                'value' => 'Elegir',
                'id' => 'ticket_form_tienda_submit',
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
