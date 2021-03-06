<?php
/**
 * Configuration file generated by ApiTool
 *
 * @see https://github.com/CookieShop/apitools.git
 */


namespace Cscore\Model\Entity;

interface OrderitemInterface{

    /**
     * Set orderid
     *
     * @param int $orderid
     * @return type                   
     */            
   public function setOrderid($orderid);

    /**
     * Get orderid
     *
     * @return int
     */          
   public function getOrderid();

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
     * Set quantity
     *
     * @param int $quantity
     * @return type                   
     */            
   public function setQuantity($quantity);

    /**
     * Get quantity
     *
     * @return int
     */          
   public function getQuantity();

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
     * Set fees
     *
     * @param float $fees
     * @return type                   
     */            
   public function setFees($fees);

    /**
     * Get fees
     *
     * @return float
     */          
   public function getFees();

    /**
     * Set linetotal
     *
     * @param float $linetotal
     * @return type                   
     */            
   public function setLinetotal($linetotal);

    /**
     * Get linetotal
     *
     * @return float
     */          
   public function getLinetotal();

}

?>