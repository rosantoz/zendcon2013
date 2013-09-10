<?php

namespace Conference\Model;

class Role
{
    protected $tableName = "role";
    public $role_id;
    public $role_key;
    public $session_key;
    public $person_key;
    public $role;

    public function exchangeArray($data)
    {
        $this->role_id     = (isset($data['role_id'])) ? $data['role_id'] : null;
        $this->role_key    = (isset($data['role_key'])) ? $data['role_key'] : null;
        $this->session_key = (isset($data['session_key'])) ? $data['session_key'] : null;
        $this->person_key  = (isset($data['person_key'])) ? $data['person_key'] : null;
        $this->role        = (isset($data['role'])) ? $data['role'] : null;
    }
}