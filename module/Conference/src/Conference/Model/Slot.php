<?php

namespace Conference\Model;

class Slot
{
    protected $tableName = "slot";
    public $slot_id;
    public $slot_key;
    public $room;
    public $property;
    public $date;
    public $start_time;
    public $end_time;
    public $session_key;

    public function exchangeArray($data)
    {
        $this->slot_id     = (isset($data['slot_id'])) ? $data['slot_id'] : null;
        $this->slot_key    = (isset($data['slot_key'])) ? $data['slot_key'] : null;
        $this->room        = (isset($data['room'])) ? $data['room'] : null;
        $this->property    = (isset($data['property'])) ? $data['property'] : null;
        $this->date        = (isset($data['date'])) ? $data['date'] : null;
        $this->start_time  = (isset($data['start_time'])) ? $data['start_time'] : null;
        $this->end_time    = (isset($data['end_time'])) ? $data['end_time'] : null;
        $this->session_key = (isset($data['session_key'])) ? $data['session_key'] : null;
    }
}