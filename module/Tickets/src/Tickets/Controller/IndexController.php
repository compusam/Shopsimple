<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Tickets\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Tickets\Form\Tienda;
use Tickets\Form\TiendaValidator;

class IndexController extends AbstractActionController
{    
    /**
     * 
     * @return \Zend\View\Model\ViewModel
     */
    public function indexAction(){
        $request = $this->getRequest();
        $basePath = $request->getBasePath();
        $template = 'index';
        $form = new Tienda();
        if($request->isPost()){ 
            $formvalidator = new TiendaValidator();
            $form->setInputFilter($formvalidator->getInputFilter()); 
            $form->setData($request->getPost());
            if($form->isValid()){
                $nameform = null;
                
                switch ($request->getPost('autoservicio')){
                    case '1': 
                        $nameform = 'tickets_form_soriana'; 
                        $template = 'soriana';
                        break;
                    case '2': 
                        $nameform = 'tickets_form_walmart'; 
                        $template = 'walmart';
                        break;
                }
                
                if(!is_null($nameform)){
                    $form = $this->getServiceLocator()->get($nameform);
                    $form->setAttribute('action', $basePath.'/tickets/add'); 
                }
            }
        }
        $entities = $this->getTickets();
        $viewModel = new ViewModel(array('form'=>$form,'items'=>$entities));
        $viewModel->setTemplate('tickets/index/'.$template.'.phtml');
        return $viewModel;
    }
    
    /**
     * 
     * @return \Zend\View\Model\ViewModel
     */
    public function addticketAction(){
        $request = $this->getRequest();
        if($request->isPost()){
            $soriana_ticket = $request->getPost('soriana_ticket');
            $tc = $request->getPost('walmart_tc');
            $tr = $request->getPost('walmart_tr');
            $this->insertTicket($soriana_ticket, $tc, $tr);
            
        }
        return $this->redirect()->toRoute('Tickets\Controller\Index');
    }
    
    /**
     * 
     * @param type $soriana_ticket
     * @param type $tc
     * @param type $tr
     */
    public function insertTicket($soriana_ticket,$tc,$tr){
        $this->getIdSession();
        $date = new \DateTime('now',
                new \DateTimeZone('America/Mexico_City'));         
        if(!is_null($soriana_ticket)){
            $SorianaTable = $this->getServiceLocator()
                    ->get('Tickets\Model\SorianaTable');
            $data = array(
                'receptor_id'=>  $this->getReceptorId(),
                'ticket'=>$soriana_ticket,
                'fecha'=>$date->getTimestamp(),
                'estado'=>1
            );
            $SorianaTable->insert($data);
        }else{
            $WalmartTable = $this->getServiceLocator()
                    ->get('Tickets\Model\WalmartTable');
            $data = array(
                'receptor_id'=>$this->getReceptorId(),
                'tc'=>$tc,
                'tr'=>$tr,
                'fecha'=>$date->getTimestamp(),
                'estado'=>1
            );
            $WalmartTable->insert($data);
        }
    }
    
    /**
     * 
     * @return type
     */
    public function getTickets(){
        $user = $this->getServiceLocator()->get('core_service_cmf_user')->getUser()->getBasicInfo();
        // obtener el receptor
        $param = array(
            'where'=>array('cscore_user_id'=>$user['id']),
            'order'=>'id ASC'
        );
        $receptor = $this->getServiceLocator()->get('Tickets\Model\ReceptorTable')->fetchOneById($param);
        
        // obtener los tickes del receptor
        $param = array(
            'where'=>array('receptor_id'=>$receptor['id']),
            'order'=>'fecha ASC'
        );
        $tickes_soriana = $this->getServiceLocator()->get('Tickets\Model\SorianaTable')->findAllById($param);
        $tickes_walmart = $this->getServiceLocator()->get('Tickets\Model\WalmartTable')->findAllById($param);
        
        $tickets = array();
        
        foreach($tickes_soriana as $ticket){
            $ticket['tienda'] = 'Soriana';
            $ticket['tr'] = '';
            $tickets[] = $ticket;
        }
        
        foreach($tickes_walmart as $ticket){
            $ticket['tienda'] = 'Walmart';
            $ticket['ticket'] = $ticket['tc'];
            $tickets[] = $ticket;
        }
        
        $tickets_for_display = array();
        $i = 1;
        foreach($tickets as $item){
            if($i <= 5){
                $tickets_for_display[$i] = $item;
                $i++;
            }            
        }
        
        return $tickets_for_display; 
    }
    
    /**
     * 
     * @return type
     */
    public function getIdSession(){
        $core_service_cmf_user = $this->getServiceLocator()
                ->get('core_service_cmf_user');
        $session = $core_service_cmf_user->getUser()->getBasicInfo();
        return $session['id'];
    }
    
    /**
     * 
     * @return type
     */
    public function getReceptorId(){
        $id = $this->getIdSession();
        $ReceptorTable =  $this->getServiceLocator()
                ->get('Tickets\Model\ReceptorTable');
        $param=array(
            'where'=>array('cscore_user_id'=>$id),
            'order'=>'id ASC'
        );
        $items=  $ReceptorTable->fetchOneById($param);
        return $items['id'];
    }
}

