<?php
/**
 * Configuration file generated by ApiTool
 *
 * @see https://github.com/CookieShop/apitools.git
 */


namespace Cscore\Model\Entity;

class Order implements OrderInterface{

    /**
     * @var int              
     */
      protected $id;  

    /**
     * @var int              
     */
      protected $idsecurity;  

    /**
     * @var int              
     */
      protected $userid;  

    /**
     * @var float              
     */
      protected $total;  

    /**
     * @var int              
     */
      protected $orderdate;  

    /**
     * @var int              
     */
      protected $ip;  

    /**
     * @var tinyint              
     */
      protected $orderstatus;  

    /**
     * Set id
     *
     * @param int $id
     * @return type                   
     */            
	public function setId($id){
		$this->id = (int) $id;
	}
    /**
     * Get id
     *
     * @return int
     */          
	public function getId(){
		return $this->id;
	}
    /**
     * Set idsecurity
     *
     * @param int $idsecurity
     * @return type                   
     */            
	public function setIdsecurity($idsecurity){
		$this->idsecurity = (int) $idsecurity;
	}
    /**
     * Get idsecurity
     *
     * @return int
     */          
	public function getIdsecurity(){
		return $this->idsecurity;
	}
    /**
     * Set userid
     *
     * @param int $userid
     * @return type                   
     */            
	public function setUserid($userid){
		$this->userid = (int) $userid;
	}
    /**
     * Get userid
     *
     * @return int
     */          
	public function getUserid(){
		return $this->userid;
	}
    /**
     * Set total
     *
     * @param float $total
     * @return type                   
     */            
	public function setTotal($total){
		$this->total = (float) $total;
	}
    /**
     * Get total
     *
     * @return float
     */          
	public function getTotal(){
		return $this->total;
	}
    /**
     * Set orderdate
     *
     * @param int $orderdate
     * @return type                   
     */            
	public function setOrderdate($orderdate){
		$this->orderdate = (int) $orderdate;
	}
    /**
     * Get orderdate
     *
     * @return int
     */          
	public function getOrderdate(){
		return $this->orderdate;
	}
    /**
     * Set ip
     *
     * @param int $ip
     * @return type                   
     */            
	public function setIp($ip){
		$this->ip = (int) $ip;
	}
    /**
     * Get ip
     *
     * @return int
     */          
	public function getIp(){
		return $this->ip;
	}
    /**
     * Set orderstatus
     *
     * @param tinyint $orderstatus
     * @return type                   
     */            
	public function setOrderstatus($orderstatus){
		$this->orderstatus = (int) $orderstatus;
	}
    /**
     * Get orderstatus
     *
     * @return tinyint
     */          
	public function getOrderstatus(){
		return $this->orderstatus;
	}
}

?>