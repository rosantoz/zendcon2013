<?php

namespace Conference\Controller;

use Conference\Model\Person;
use Conference\Model\Role;
use Zend\Mvc\Controller\AbstractActionController;

class PersonController extends AbstractActionController
{
    protected $personTable;

    public function getPersonTable()
    {
        if (!$this->personTable) {
            $sm                = $this->getServiceLocator();
            $this->personTable = $sm->get('Conference\Model\PersonTable');
        }

        return $this->personTable;
    }

    public function indexAction()
    {
        $table = $this->getPersonTable();
        echo $table->listSpeakers();
        return $this->response;
    }

    public function updateAction()
    {
        $roleUrl = "https://zendcon.confex.com/zendcon/2013/sync.cgi/Person.xml";
        $xml     = simplexml_load_file($roleUrl);

        $people = $xml->data;

        foreach ($people->row as $person) {
            $personData = array(
                'person_key' => trim($person->Key_PersonID),
                'first_name' => trim($person->FirstName),
                'last_name'  => trim($person->LastName),
                'company'    => trim($person->Company),
                'title'      => trim($person->JobTitle),
            );
            $person     = new Person();
            $person->exchangeArray($personData);

            $personTable = $this->getPersonTable();
            $personTable->savePerson($person);
        }

        echo "ok";

        return $this->response;
    }
}
