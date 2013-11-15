<?php
/**
 * CookieShop - Class for Entities.
 * @category   Model
 * @package    Tickets\Model\Entity
 * @link      https://github.com/CookieShop for the canonical source repository
 * @copyright Copyright (c) 2005-2013 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://www.gnu.org/licenses/gpl.html GNU GENERAL PUBLIC LICENSE
 * @author Ing. Eduardo Ortiz <eduardooa1980@gmail.com>
 */
namespace Tickets\Model\Entity;

class Walmart{
    /**
     *
     * @var int 
     */
    protected $_id;
    /**
     *
     * @var int 
     */
    protected $_receptorid;
    /**
     *
     * @var string 
     */
    protected $_tc;
    /**
     *
     * @var string 
     */
    protected $_tr;
    /**
     *
     * @var int 
     */
    protected $_fecha;
    /**
     *
     * @var int 
     */
    protected $_estado;

    /**
     * 
     * @return int
     */
    public function getId(){
        return $this->_id;
    }

    /**
     * 
     * @param int $id
     * @return \Tickets
     */
    public function setId($id){
        $this->_id=(int)$id;
        return $this;
    }

    /**
     * 
     * @return int
     */
    public function getReceptorid(){
        return $this->_receptorid;
    }

    /**
     * 
     * @param int $receptorid
     * @return \Tickets
     */
    public function setReceptorid($receptorid){
        $this->_receptorid=(int)$receptorid;
        return $this;
    }

    /**
     * 
     * @return string
     */
    public function getTc(){
        return $this->_tc;
    }

    /**
     * 
     * @param string $tc
     * @return \Tickets
     */
    public function setTc($tc){
        $this->_tc=(string)$tc;
        return $this;
    }

    /**
     * 
     * @return string
     */
    public function getTr(){
        return $this->_tr;
    }

    /**
     * 
     * @param string $tr
     * @return \Tickets
     */
    public function setTr($tr){
        $this->_tr=(string)$tr;
        return $this;
    }

    /**
     * 
     * @return int
     */
    public function getFecha(){
        return $this->_fecha;
    }

    /**
     * 
     * @param int $fecha
     * @return \Tickets
     */
    public function setFecha($fecha){
        $this->_fecha=(int)$fecha;
        return $this;
    }

    /**
     * 
     * @return int
     */
    public function getEstado(){
        return $this->_estado;
    }

    /**
     * 
     * @param int $estado
     * @return \Tickets
     */
    public function setEstado($estado){
        $this->_estado=(int)$estado;
        return $this;
    }

}
