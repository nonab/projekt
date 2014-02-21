<?php

namespace Projekt\UserBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Projekt\UserBundle\Entity\Permission;
/**
 * User
 *
 * @ORM\Table(name="users")
 * @ORM\Entity
 */
class User
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
     * @ORM\Column(name="imie", type="string", length=255)
     */
    private $imie;

    /**
     * @var string
     *
     * @ORM\Column(name="nazwisko", type="string", length=255)
     */
    private $nazwisko;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dataurodzenia", type="date")
     */
    private $dataurodzenia;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=255)
     */
    private $email;


    /**
     * @ORM\ManyToMany(targetEntity="Permission", inversedBy="users")
     */
    private $perms;

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
     * Set imie
     *
     * @param string $imie
     * @return User
     */
    public function setImie($imie)
    {
        $this->imie = $imie;

        return $this;
    }

    /**
     * Get imie
     *
     * @return string 
     */
    public function getImie()
    {
        return $this->imie;
    }

    /**
     * Set nazwisko
     *
     * @param string $nazwisko
     * @return User
     */
    public function setNazwisko($nazwisko)
    {
        $this->nazwisko = $nazwisko;

        return $this;
    }

    /**
     * Get nazwisko
     *
     * @return string 
     */
    public function getNazwisko()
    {
        return $this->nazwisko;
    }

    /**
     * Set dataurodzenia
     *
     * @param \DateTime $dataurodzenia
     * @return User
     */
    public function setDataurodzenia($dataurodzenia)
    {
        $this->dataurodzenia = $dataurodzenia;

        return $this;
    }

    /**
     * Get dataurodzenia
     *
     * @return \DateTime 
     */
    public function getDataurodzenia()
    {
        return $this->dataurodzenia;
    }

    /**
     * Set email
     *
     * @param string $email
     * @return User
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string 
     */
    public function getEmail()
    {
        return $this->email;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->perms = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add perms
     *
     * @param \Projekt\UserBundle\Entity\Permission $perms
     * @return User
     */
    public function addPerm(\Projekt\UserBundle\Entity\Permission $perms)
    {
        $this->perms[] = $perms;

        return $this;
    }

    /**
     * Remove perms
     *
     * @param \Projekt\UserBundle\Entity\Permission $perms
     */
    public function removePerm(\Projekt\UserBundle\Entity\Permission $perms)
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
