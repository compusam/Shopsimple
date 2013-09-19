<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Csproductcmf\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController{
    
    public function indexAction(){       
        $matches = $this->getEvent()->getRouteMatch();
        $page      = $matches->getParam('page', 1);
        $cat       = (int)$matches->getParam('cat', 1);
        $csproductcmf_product = $this->getServiceLocator()
                ->get('core_service_cmf_product'); 
        $allProducts = $csproductcmf_product->getProduct()->getAllProducts($page,$cat);
        return new ViewModel(array('sample'=>$allProducts));
    }    
    
    public function productoAction(){
        $matches = $this->getEvent()->getRouteMatch();
        $id      = (int)$matches->getParam('id', 1);
        $csproductcmf_product = $this->getServiceLocator()
                ->get('core_service_cmf_product'); 
        $Products = $csproductcmf_product->getProduct()->getProductoById($id);

        return new ViewModel(array('producto'=>$Products));
    }    
}
