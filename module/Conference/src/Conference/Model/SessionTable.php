<?php

namespace Conference\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Expression;

class SessionTable
{
    protected $tableGateway;
    protected $sql;

    public function __construct(TableGateway $tableGateway, Sql $sql)
    {
        $this->tableGateway = $tableGateway;
        $this->sql          = $sql;
    }

    public function getSession($id)
    {
        $id     = (int)$id;
        $rowset = $this->tableGateway->select(array('session_key' => $id));
        $row    = $rowset->current();

        return $row;
    }

    public function saveSession(Session $session)
    {
        $data = array(
            'session_key' => $session->session_key,
            'program'     => $session->program,
            'title'       => $session->title,
            'type'        => $session->type,
            'level'       => $session->level,
            'track'       => $session->track,
        );

        $id = (int)$session->session_key;

        if ($this->getSession($id)) {
            $this->tableGateway->update($data, array('session_key' => $id));
        } else {
            $this->tableGateway->insert($data);
        }
    }

    public function listSessions()
    {
        $adapter      = $this->sql->getAdapter();
        $select       = $this->sql->select(array('s' => 'session'))
            ->columns(array('session_key', 'title', 'level', 'track'))
            ->join(
                array('a' => 'session_abstract'),
                's.session_key=a.session_key',
                array('abstract')
            )
            ->join(
                array('sl' => 'slot'),
                'sl.session_key=s.session_key',
                array(
                    'date'       => new Expression("DATE_FORMAT(date, '%d/%m')"),
                    'long_date'  => new Expression("DATE_FORMAT(date, '%W, %M %e')"),
                    'room',
                    'start_time' => new Expression("DATE_FORMAT(start_time, '%H:%i')"),
                    'end_time'   => new Expression("DATE_FORMAT(end_time, '%H:%i')"),
                )
            )
            ->join(
                array('r' => 'role'),
                'r.session_key=s.session_key',
                array('person_key')
            )
            ->join(
                array('p' => 'person'),
                'p.person_key=r.person_key',
                array('first_name', 'last_name')
            )
            ->order(array('date', 'start_time'));
        $selectString = $this->sql->getSqlStringForSqlObject($select);
        $results      = $adapter->query($selectString, $adapter::QUERY_MODE_EXECUTE);

        $arrayResults             = array();
        $arrayResults['sessions'] = $results->toArray();

        return json_encode($arrayResults);
    }

    public function getSessionDetails($sessionKey)
    {
        $adapter = $this->sql->getAdapter();
        $select  = $this->sql->select(array('s' => 'session'))
            ->columns(array('session_key', 'title', 'level', 'track'))
            ->join(
                array('a' => 'session_abstract'),
                's.session_key=a.session_key',
                array('abstract')
            )
            ->join(
                array('sl' => 'slot'),
                'sl.session_key=s.session_key',
                array(
                    'date'       => new Expression("DATE_FORMAT(date, '%W, %M %d')"),
                    'room',
                    'start_time' => new Expression("DATE_FORMAT(start_time, '%H:%i')"),
                    'end_time'   => new Expression("DATE_FORMAT(end_time, '%H:%i')"),
                )
            )
            ->join(
                array('r' => 'role'),
                'r.session_key=s.session_key',
                array('person_key')
            )
            ->join(
                array('p' => 'person'),
                'p.person_key=r.person_key'
            )
            ->where(array('s.session_key' => $sessionKey));

        $selectString = $this->sql->getSqlStringForSqlObject($select);
        $result       = $adapter->query($selectString, $adapter::QUERY_MODE_EXECUTE);
        $arrayResult  = $result->toArray();

        return json_encode($arrayResult);
    }
}