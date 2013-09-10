<?php

namespace Conference\Model;

use Zend\Db\TableGateway\TableGateway;

class SessionAbstractTable
{
    protected $tableGateway;

    public function __construct(TableGateway $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function getSession($id)
    {
        $id     = (int)$id;
        $rowset = $this->tableGateway->select(array('session_key' => $id));
        $row    = $rowset->current();

        return $row;
    }

    public function saveSession(SessionAbstract $session)
    {
        $data = array(
            'session_key' => $session->session_key,
            'abstract'    => $session->abstract,
        );

        $id = (int)$session->session_key;

        if ($this->getSession($id)) {
            $this->tableGateway->update($data, array('session_key' => $id));
        } else {
            $this->tableGateway->insert($data);
        }
    }
}