<?php
/**
 * Configuration file generated by ApiTool
 *
 * @see https://github.com/CookieShop/apitools.git
 */


namespace Cscore\Model\Entity;

interface OrderstatusInterface{

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
     * Set namestatus
     *
     * @param varchar $namestatus
     * @return type                   
     */            
   public function setNamestatus($namestatus);

    /**
     * Get namestatus
     *
     * @return varchar
     */          
   public function getNamestatus();

    /**
     * Set description
     *
     * @param text $description
     * @return type                   
     */            
   public function setDescription($description);

    /**
     * Get description
     *
     * @return text
     */          
   public function getDescription();

}

?>