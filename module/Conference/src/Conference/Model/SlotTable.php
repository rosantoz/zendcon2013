<?php

namespace Conference\Model;

use Zend\Db\TableGateway\TableGateway;

class SlotTable
{
    protected $tableGateway;

    public function __construct(TableGateway $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function getSlot($id)
    {
        $id     = (int)$id;
        $rowset = $this->tableGateway->select(array('slot_key' => $id));
        $row    = $rowset->current();

        return $row;
    }

    public function saveSlot(Slot $slot)
    {
        $data = array(
            'slot_key'    => $slot->slot_key,
            'room'        => $slot->room,
            'property'    => $slot->property,
            'date'        => $slot->date,
            'start_time'  => $slot->start_time,
            'end_time'    => $slot->end_time,
            'session_key' => $slot->session_key,
        );

        $id = (int)$slot->slot_key;

        if ($this->getSlot($id)) {
            $this->tableGateway->update($data, array('slot_key' => $id));
        } else {
            $this->tableGateway->insert($data);
        }
    }
}