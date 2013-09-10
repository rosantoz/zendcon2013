<?php

namespace Conference\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Expression;

class PersonTable
{
    protected $tableGateway;
    protected $sql;

    public function __construct(TableGateway $tableGateway, Sql $sql)
    {
        $this->tableGateway = $tableGateway;
        $this->sql          = $sql;
    }

    public function getPerson($id)
    {
        $id     = (int)$id;
        $rowset = $this->tableGateway->select(array('person_key' => $id));
        $row    = $rowset->current();

        return $row;
    }

    public function savePerson(Person $person)
    {
        $data = array(
            'person_key' => $person->person_key,
            'first_name' => $person->first_name,
            'last_name'  => $person->last_name,
            'company'    => $person->company,
            'title'      => $person->title,
//            'bio'        => $person->bio,
//            'photo'      => $person->photo,
        );

        $id = (int)$person->person_key;

        if ($this->getPerson($id)) {
            $this->tableGateway->update($data, array('person_key' => $id));
        } else {
            $this->tableGateway->insert($data);
        }
    }

    public function listSpeakers()
    {
        $adapter      = $this->sql->getAdapter();
        $select       = $this->sql->select(array('p' => 'person'))
            ->order('first_name');
        $selectString = $this->sql->getSqlStringForSqlObject($select);
        $results      = $adapter->query($selectString, $adapter::QUERY_MODE_EXECUTE);

        $arrayResults             = array();
        $arrayResults['speakers'] = $results->toArray();

        return json_encode($arrayResults);
    }
}