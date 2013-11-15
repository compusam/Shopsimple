<?php
namespace Tickets;
use Tickets\Form\Soriana;
use Tickets\Form\Walmart;
use Tickets\Form\SorianaValidator;
use Tickets\Form\WalmartValidator;

class Module
{
    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }
    
    public function getServiceConfig(){
        return array(
            'factories' => array(
                'tickets_form_soriana'=>  function (){
                    $form = new Soriana();
                    $formvalidator = new SorianaValidator();
                    $form->setInputFilter($formvalidator->getInputFilter());
                    return $form;
                }, 
                'tickets_form_walmart'=>  function (){
                    $form = new Walmart();
                    $formvalidator = new WalmartValidator();
                    $form->setInputFilter($formvalidator->getInputFilter());
                    return $form;
                }, 
                'Tickets\Model\ReceptorTable'=>  function($sm){
                    $dbAdapter = $sm->get('db1');
                    $table = new Model\ReceptorTable($dbAdapter);
                    return $table;                    
                },
                'Tickets\Model\SorianaTable'=>  function($sm){
                    $dbAdapter = $sm->get('db1');
                    $table = new Model\SorianaTable($dbAdapter);
                    return $table;                    
                },
                'Tickets\Model\WalmartTable'=>  function($sm){
                    $dbAdapter = $sm->get('db1');
                    $table = new Model\WalmartTable($dbAdapter);
                    return $table;                    
                },                        
           )    
        );
    }    
}
