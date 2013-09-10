<?php

namespace Conference\Model;

class Person
{
    protected $tableName = "person";
    public $person_id;
    public $person_key;
    public $first_name;
    public $last_name;
    public $company;
    public $title;
    public $bio;
    public $photo;

    public function exchangeArray($data)
    {
        $this->person_id  = (isset($data['person_id'])) ? $data['person_id'] : null;
        $this->person_key = (isset($data['person_key'])) ? $data['person_key'] : null;
        $this->first_name = (isset($data['first_name'])) ? $data['first_name'] : null;
        $this->last_name  = (isset($data['last_name'])) ? $data['last_name'] : null;
        $this->company    = (isset($data['company'])) ? $data['company'] : null;
        $this->title      = (isset($data['title'])) ? $data['title'] : null;
//        $this->bio        = (isset($data['bio'])) ? $data['bio'] : null;
//        $this->photo      = (isset($data['photo'])) ? $data['photo'] : null;
    }
}