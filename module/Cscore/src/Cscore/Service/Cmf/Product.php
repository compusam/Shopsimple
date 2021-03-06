<?php
/**
 * CookieShop
 *
 * @link      https://github.com/CookieShop for the canonical source repository
 * @copyright Copyright (c) 2005-2013 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://www.gnu.org/licenses/gpl.html GNU GENERAL PUBLIC LICENSE
 * @author Ing. Eduardo Ortiz <eduardooa1980@gmail.com>
 */
namespace Cscore\Service\Cmf;

use Zend\ServiceManager\ServiceManagerAwareInterface;
use Zend\ServiceManager\ServiceManager;

class Product implements ServiceManagerAwareInterface{ 
    
    /**
     * Contruct 
     * 
     * @param \Zend\ServiceManager\ServiceManager $serviceManager
     */
    public function __construct(ServiceManager $serviceManager) {
        $this->setServiceManager($serviceManager);
    }
    
    /**
     * Gets All Products
     * 
     * @return array
     */
    public function getAllProducts($pages,$cat=1){
        $ProductTable = $this->getServiceManager()
                ->get('Cscore\Model\ProductTable');
        $allProducts = $ProductTable->fetchAllPages($cat)->toArray();
        $i=0;
        foreach ($allProducts as $item){
            $ProductPrice = $this->getPriceByProductId($item['product_id']);
            $allProducts[$i]['price'] = $ProductPrice['price'];
            $allProducts[$i]['currency'] = $ProductPrice['currency'];
            ++$i;
        }
        $arrayAdapter = new \Zend\Paginator\Adapter\ArrayAdapter($allProducts);
        $paginator = new \Zend\Paginator\Paginator($arrayAdapter);
        $paginator->setCurrentPageNumber($pages);
        $paginator->setItemCountPerPage(4);
        return $paginator;
    }
    
    /**
     * Obtiene precio por relacion de ID de producto
     * 
     * @param type $productId
     * @return type
     */
    public function getPriceByProductId($productId){
        $ProductpriceTable = $this->getServiceManager()
                ->get('Cscore\Model\ProductpriceTable');
        return $ProductpriceTable->findByProductId($productId);
    }
    /**
     * Obtiene producto por ID
     * 
     * @param type $id
     * @return type
     * @throws \Exception
     */
    public function getProductoById($id){
        $ProductTable = $this->getServiceManager()
                ->get('Cscore\Model\ProductTable');
        $Product = $ProductTable->findId($id);  
        if(count($Product)===0){
            throw new \Exception('What ID, Search?');    
        }
        $ProductPrice = $this->getPriceByProductId($Product['id']);
        $Product['price'] = $ProductPrice['price'];
        $Product['currency'] = $ProductPrice['currency'];
        return $Product;
    }

    /**
     * Retrieve service manager instance
     *
     * @return ServiceManager
     */
    public function getServiceManager(){
        return $this->serviceManager;
    }

    /**
     * Set service manager instance
     *
     * @param ServiceManager $serviceManager
     * @return User
     */
    public function setServiceManager(ServiceManager $serviceManager){
        $this->serviceManager = $serviceManager;
        return $this;
    }      
}
