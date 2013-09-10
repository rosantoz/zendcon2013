<?php

namespace Conference\Model;

use Zend\Db\TableGateway\TableGateway;

class RoleTable
{
    protected $tableGateway;

    public function __construct(TableGateway $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function getRole($id)
    {
        $id     = (int)$id;
        $rowset = $this->tableGateway->select(array('role_key' => $id));
        $row    = $rowset->current();

        return $row;
    }

    public function saveRole(Role $role)
    {
        $data = array(
            'role_key'    => $role->role_key,
            'session_key' => $role->session_key,
            'person_key'  => $role->person_key,
            'role'        => $role->role,
        );

        $id = (int)$role->role_key;

        if ($this->getRole($id)) {
            $this->tableGateway->update($data, array('role_key' => $id));
        } else {
            $this->tableGateway->insert($data);
        }
    }
}