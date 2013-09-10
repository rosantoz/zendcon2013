<?php

namespace Conference\Model;

class SessionAbstract
{
    protected $tableName = "session_abstract";
    public $session_key;
    public $abstract;

    public function exchangeArray($data)
    {
        $this->session_key = (isset($data['session_key'])) ? $data['session_key'] : null;
        $this->abstract    = (isset($data['abstract'])) ? $data['abstract'] : null;
    }
}