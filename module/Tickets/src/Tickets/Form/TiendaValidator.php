<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Tickets\Form;

use Zend\InputFilter\Factory as InputFactory; 
use Zend\InputFilter\InputFilter; 
use Zend\InputFilter\InputFilterAwareInterface; 
use Zend\InputFilter\InputFilterInterface; 

class TiendaValidator implements InputFilterAwareInterface{
    protected $inputFilter; 
    
    public function setInputFilter(InputFilterInterface $inputFilter){ 
        throw new \Exception("Not used"); 
    }     

    public function getInputFilter() 
    {        
        if (!$this->inputFilter){ 
            $inputFilter = new InputFilter(); 
            $factory = new InputFactory(); 
            
        
        $inputFilter->add($factory->createInput(array( 
            'name' => 'autoservicio', 
            'validators' => array( 
                array ( 
                    'name' => 'InArray', 
                    'options' => array( 
                        'haystack' => array(1,2),
                        'messages' => array(
                            \Zend\Validator\InArray::NOT_IN_ARRAY => 'Elige una Opcion !' 
                        ),
                    ), 
                ), 
            ), 
        ))); 
 
          $this->inputFilter = $inputFilter;  
        } 
        return $this->inputFilter;
    }     
}
