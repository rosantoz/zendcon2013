<?php

namespace Conference\Controller;

use Conference\Model\Role;
use Zend\Mvc\Controller\AbstractActionController;

class RoleController extends AbstractActionController
{
    protected $roleTable;

    public function getRoleTable()
    {
        if (!$this->roleTable) {
            $sm              = $this->getServiceLocator();
            $this->roleTable = $sm->get('Conference\Model\RoleTable');
        }

        return $this->roleTable;
    }

    public function indexAction()
    {
        echo "role";

        return $this->response;
    }

    public function updateAction()
    {
        $roleUrl = "https://zendcon.confex.com/zendcon/2013/sync.cgi/Role.xml";
        $xml     = simplexml_load_file($roleUrl);

        $roles = $xml->data;

        foreach ($roles->row as $role) {
            $roleData = array(
                'role_key'    => trim($role->Key_RoleID),
                'session_key' => trim($role->EntryID),
                'person_key'  => trim($role->PersonID),
                'role'        => trim($role->Role),
            );
            $role     = new Role();
            $role->exchangeArray($roleData);

            $roleTable = $this->getRoleTable();
            $roleTable->saveRole($role);
        }

        echo "ok";

        return $this->response;
    }
}
