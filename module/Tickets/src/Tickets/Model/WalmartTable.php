<?php
/**
 * CookieShop - Class for Mapper SQL.
 * @category   Model
 * @package    Tickets\Model
 * @link      https://github.com/CookieShop for the canonical source repository
 * @copyright Copyright (c) 2005-2013 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://www.gnu.org/licenses/gpl.html GNU GENERAL PUBLIC LICENSE
 * @author Ing. Eduardo Ortiz <eduardooa1980@gmail.com>
 */
namespace Tickets\Model;

use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\Select as Select;
use Tickets\Model\Entity\Walmart as Walmart;

class WalmartTable extends AbstractTableGateway{
    
    /**
     * name table 
     * @var type 
     */     
    protected $table  = 'walmart';
    
    /**
     * Constructor
     * 
     * @param \Zend\Db\Adapter\Adapter $adapter
     */
    public function __construct(Adapter $adapter) {
        $this->adapter = $adapter;
    } 
    
    /**
     * List All Items
     * 
     * @return type
     */
    public function fetchAll() {
        $resultSet = $this->select();
        $entities = array();
        foreach ($resultSet as $row) { 
            $entity = $this->setEntity($row);
            $entities[] = $this->getEntities($entity);
        }
        return $entities;
    }

    /**
     * List all Items by ID
     * Ex.	
     * $param = array(
     *       	     'where'=>array('id'=>$id),
     *               'order'=>'id ASC'
     *          );
     * @param type $id
     * @return type
     */
    public function findAllById($param) {
        $resultSet = $this->select(function (Select $select) use($param){
                    $select->where($param['where']);
                    $select->order($param['order']);
                });
        $entities = array();
        foreach ($resultSet as $row) { 
            $entity = $this->setEntity($row);
            $entities[] = $this->getEntities($entity);
        }
        return $entities;
    }  

    /**
     * List One a Item by ID
     * Ex.	
     * $param = array(
     *       	     'where'=>array('id'=>$id),
     *               'order'=>'id ASC'
     *          );
     * @param type $id
     * @return type
     */
    public function fetchOneById($param) {
        $resultSet = $this->select(function (Select $select) use($param){
                    $select->where($param['where']);
                    $select->order($param['order']);
                });
        $entities = array();
        if(count($resultSet)===1){
            $row = $resultSet->current();
            $entity = $this->setEntity($row);
            $entities = $this->getEntities($entity);             
        }
        return $entities;
    }

    /**
     * Setter Entities
     * 
     * @param type $row
     * @return \Tickets\Model\Entity\Walmart
     */
    public function setEntity($row){
	$entity = new Walmart();
        $entity->setId($row->id);
        $entity->setReceptorid($row->receptor_id);
        $entity->setTc($row->tc);
        $entity->setTr($row->tr);
        $entity->setFecha($row->fecha);
        $entity->setEstado($row->estado);
        return $entity;
    }

    /**
     * Getter type entity
     * 
     * @param \Tickets\Model\Entity\Walmart $entity
     * @return type
     */
    public function getEntities(Walmart $entity){
        $entities= array(
            'id' => $entity->getId(),
            'receptor_id' => $entity->getReceptorid(),
            'tc' => $entity->getTc(),
            'tr' => $entity->getTr(),
            'fecha' => $entity->getFecha(),
            'estado' => $entity->getEstado(),
        ); 
        return $entities;
    }

    /**
     * List Items Paginator
     * 
     * @return type
     */
    public function fetchAllPages(){
        $resultSet = $this->select();
        $resultSet->buffer();
        $resultSet->next();        
        return $resultSet;
    }

    /**
     * List all Items by ID
     * Ex.	
     * $param = array(
     *       	     'where'=>array('id'=>$id),
     *               'order'=>'id ASC'
     *          );
     * @param type $id
     * @return type
     */
    public function findAllByIdPages($param) {
        $resultSet = $this->select(function (Select $select) use($param){
                    $select->where($param['where']);
                    $select->order($param['order']);
                });
        $resultSet->buffer();
        $resultSet->next();
        return $resultSet;
    }

    /**
     * List All Items
     * 
     * @return type
     */
    public function fetchAllTickets() {
        $resultSet = $this->select();
        $entities = array();
        foreach ($resultSet as $row) { 
            $entity = $this->setEntityTickets($row);
            $entities[] = $this->getEntitiesTickets($entity);
        }
        return $entities;
    }  
    
    /**
     * Setter Entities
     * 
     * @param type $row
     * @return \Tickets\Model\Entity\Walmart
     */
    public function setEntityTickets($row){
	$entity = new Walmart();
        $entity->setId($row->id);
        $entity->setReceptorid($row->receptor_id);
        $entity->setTc($row->tc);
        $entity->setTr($row->tr);
        $entity->setFecha($row->fecha);
        $entity->setEstado($row->estado);
        return $entity;
    }

    /**
     * Getter type entity
     * 
     * @param \Tickets\Model\Entity\Walmart $entity
     * @return type
     */
    public function getEntitiesTickets(Walmart $entity){
        $fecha= $entity->getFecha();
        $date = new \DateTime('',
                new \DateTimeZone('America/Mexico_City'));   
        $date->setTimestamp($fecha);
        $entities= array(
            'fecha' => $date->format('Y-m-d'),
            'ticket' => $entity->getTc(),
            'tr' => $entity->getTr(),
            'tienda' => 'Walmart',
            'estado' => $this->getEstatus($entity->getEstado()),
        ); 
        return $entities;
    } 
    
    /**
     * 
     * @param type $id
     * @return string
     */
    public function getEstatus($id){
        $nombre = null;
        switch ($id){
            case 1: $nombre = 'nuevo'; break;
            case 2: $nombre = 'facturado'; break;
            case 3: $nombre = 'procesandose'; break;
            case 4: $nombre = 'error desconocido'; break;
            case 5: $nombre = 'error de datos'; break;
            case 6: $nombre = 'gano puntos'; break;
            case 7: $nombre = 'no gano puntos'; break;            
            default : $nombre = 'error desconocido'; break;            
        }
        return $nombre;  
    }    
}
