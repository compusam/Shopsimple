<?php
/**
 * CookieShop
 *
 * @link      https://github.com/CookieShop for the canonical source repository
 * @copyright Copyright (c) 2005-2013 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://www.gnu.org/licenses/gpl.html GNU GENERAL PUBLIC LICENSE
 * @author Ing. Eduardo Ortiz <eduardooa1980@gmail.com>
 */
namespace Cscore\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\Select as Select;
use Cscore\Model\Entity\Creditshistory as Creditshistory;

class CreditshistoryTable extends AbstractTableGateway{
    
    /**
     * nombre de tabla
     * @var type 
     */    
    protected $table  = 'credits_history';
    
    /**
     * Constructor
     * 
     * @param \Zend\Db\Adapter\Adapter $adapter
     */
    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
    }
    
    /**
     * Lista Todos los Items
     * 
     * @return type
     */
    public function fetchAll() {
        $resultSet = $this->select(function (Select $select) {
                    $select->order('id ASC');
                });

        $entities = array();
        foreach ($resultSet as $row) { 
            $entity = $this->setEntity($row);           
            $entities[] =  $this->getEntities($entity);
        }
        return $entities;
    }
    
    /**
     * Busca un Especifico ID
     * 
     * @param type $id
     * @return type
     */
    public function findId($id){
        $entities = array();
        $resultSet = $this->select(function (Select $select) use ($id){
                    $select->where(array('id_username' => $id));
                });
       if($resultSet->count()>0){
        foreach ($resultSet as $row) { 
            $entity = $this->setEntity($row);           
            $entities[] =  $this->getEntities($entity);
        }          
       }
       return $entities;    
    }
    
    /**
     * Busca Por ID de Username
     * 
     * @param type $id
     * @return type
     */
    public function findByIdCredits($id){
        $entities = array();
        $resultSet = $this->select(function (Select $select) use ($id){
                    $select->where(array('id_username' => $id));
                });
       if($resultSet->count()>0){
        foreach ($resultSet as $row) { 
            if(((int)$row->payments)===0){
                $entity = $this->setEntity($row);           
                $entities[] =  $this->getEntities($entity);                
            }
        }          
       }
       return $entities;            
    }
    
    /**
     * Inserta Pago en historial
     * 
     * @param type $params
     */
    public function setPaymentHistory($params){
        $entity = new Creditshistory();            
        $entity->setIdperiod($params['id_period']);
        $entity->setIdusername($params['id_username']);
        $entity->setCredits($params['credits']);
        $entity->setPayments($params['payments']);
        $data = $this->getEntities($entity);
        unset($data['id']);
        $this->insert($data);
    }
    
    /**
     * Setea Entidades
     * 
     * @param type $row
     * @return \Cscore\Model\Entity\Creditshistory
     */
    public function setEntity($row){
            $entity = new Creditshistory();            
            $entity->setId($row->id);
            $entity->setIdperiod($row->id_period);
            $entity->setIdusername($row->id_username);
            $entity->setCredits($row->credits);
            $entity->setPayments($row->payments);        
        return $entity;
    }
    
    /**
     * Obtiene tipos de datos para entidades
     * 
     * @param \Cscore\Model\Entity\Creditshistory $entity
     * @return type
     */
    public function getEntities(Creditshistory $entity){
        $entities= array(
            'id'=>$entity->getId(),
            'id_period'=>$entity->getIdperiod(),
            'id_username'=>$entity->getIdusername(),
            'credits'=>$entity->getCredits(),
            'payments'=>$entity->getPayments()
        ); 
        return $entities;
    } 

}
