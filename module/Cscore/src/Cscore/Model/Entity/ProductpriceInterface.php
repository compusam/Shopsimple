<?php
/**
 * Configuration file generated by ApiTool
 *
 * @see https://github.com/CookieShop/apitools.git
 */


namespace Cscore\Model\Entity;

interface ProductpriceInterface{

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
     * Set productid
     *
     * @param int $productid
     * @return type                   
     */            
   public function setProductid($productid);

    /**
     * Get productid
     *
     * @return int
     */          
   public function getProductid();

    /**
     * Set price
     *
     * @param float $price
     * @return type                   
     */            
   public function setPrice($price);

    /**
     * Get price
     *
     * @return float
     */          
   public function getPrice();

    /**
     * Set currency
     *
     * @param varchar $currency
     * @return type                   
     */            
   public function setCurrency($currency);

    /**
     * Get currency
     *
     * @return varchar
     */          
   public function getCurrency();

    /**
     * Set lastupdate
     *
     * @param int $lastupdate
     * @return type                   
     */            
   public function setLastupdate($lastupdate);

    /**
     * Get lastupdate
     *
     * @return int
     */          
   public function getLastupdate();

}

?>