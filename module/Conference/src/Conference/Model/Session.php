<?php

namespace Conference\Model;

class Session
{
    protected $tableName = "session";
    public $session_id;
    public $session_key;
    public $program;
    public $title;
    public $type;
    public $level;
    public $track;

    public function exchangeArray($data)
    {
        $this->session_id  = (isset($data['session_id'])) ? $data['session_id'] : null;
        $this->session_key = (isset($data['session_key'])) ? $data['session_key'] : null;
        $this->program     = (isset($data['program'])) ? $data['program'] : null;
        $this->title       = (isset($data['title'])) ? $data['title'] : null;
        $this->type        = (isset($data['type'])) ? $data['type'] : null;
        $this->level       = (isset($data['level'])) ? $data['level'] : null;
        $this->track       = (isset($data['track'])) ? $data['track'] : null;
    }
}