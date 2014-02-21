<?php

namespace Projekt\UserBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Projekt\UserBundle\Entity\User;
/**
 * Permission
 *
 * @ORM\Table(name="perms")
 * @ORM\Entity
 */
class Permission
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="kod", type="string", length=255)
     */
    private $kod;

    /**
    * @ORM\ManyToMany(targetEntity="User", mappedBy="perms")
    */
    protected $perms;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set kod
     *
     * @param string $kod
     * @return Permission
     */
    public function setKod($kod)
    {
        $this->kod = $kod;

        return $this;
    }

    /**
     * Get kod
     *
     * @return string 
     */
    public function getKod()
    {
        return $this->kod;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->perms = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function __toString()
    {
        return $this->kod;
    }

    /**
     * Add perms
     *
     * @param \Projekt\UserBundle\Entity\User $perms
     * @return Permission
     */
    public function addPerm(\Projekt\UserBundle\Entity\User $perms)
    {
        $this->perms[] = $perms;

        return $this;
    }

    /**
     * Remove perms
     *
     * @param \Projekt\UserBundle\Entity\User $perms
     */
    public function removePerm(\Projekt\UserBundle\Entity\User $perms)
    {
        $this->perms->removeElement($perms);
    }

    /**
     * Get perms
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getPerms()
    {
        return $this->perms;
    }
}
