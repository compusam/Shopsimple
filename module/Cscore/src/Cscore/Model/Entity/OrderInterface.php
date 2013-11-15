<?php
/**
 * Configuration file generated by ApiTool
 *
 * @see https://github.com/CookieShop/apitools.git
 */


namespace Cscore\Model\Entity;

interface OrderInterface{

    /**
     * Set id
     *
     * @param int $id
     * @return type                   
     */            
   public function setId($id);

    /**
     * Get id
     *
     * @return int
     */          
   public function getId();

    /**
     * Set idsecurity
     *
     * @param int $idsecurity
     * @return type                   
     */            
   public function setIdsecurity($idsecurity);

    /**
     * Get idsecurity
     *
     * @return int
     */          
   public function getIdsecurity();

    /**
     * Set userid
     *
     * @param int $userid
     * @return type                   
     */            
   public function setUserid($userid);

    /**
     * Get userid
     *
     * @return int
     */          
   public function getUserid();

    /**
     * Set total
     *
     * @param float $total
     * @return type                   
     */            
   public function setTotal($total);

    /**
     * Get total
     *
     * @return float
     */          
   public function getTotal();

    /**
     * Set orderdate
     *
     * @param int $orderdate
     * @return type                   
     */            
   public function setOrderdate($orderdate);

    /**
     * Get orderdate
     *
     * @return int
     */          
   public function getOrderdate();

    /**
     * Set ip
     *
     * @param int $ip
     * @return type                   
     */            
   public function setIp($ip);

    /**
     * Get ip
     *
     * @return int
     */          
   public function getIp();

    /**
     * Set orderstatus
     *
     * @param tinyint $orderstatus
     * @return type                   
     */            
   public function setOrderstatus($orderstatus);

    /**
     * Get orderstatus
     *
     * @return tinyint
     */          
   public function getOrderstatus();

}

?>