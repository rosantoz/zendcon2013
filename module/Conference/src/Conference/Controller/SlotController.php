<?php

namespace Conference\Controller;

use Conference\Model\Slot;
use Zend\Mvc\Controller\AbstractActionController;

class SlotController extends AbstractActionController
{
    protected $slotTable;

    public function getSlotTable()
    {
        if (!$this->slotTable) {
            $sm              = $this->getServiceLocator();
            $this->slotTable = $sm->get('Conference\Model\SlotTable');
        }

        return $this->slotTable;
    }

    public function indexAction()
    {
        echo "slot";

        return $this->response;
    }

    public function updateAction()
    {
        $slotUrl = "https://zendcon.confex.com/zendcon/2013/sync.cgi/Slot.xml";
        $xml     = simplexml_load_file($slotUrl);

        $slots = $xml->data;

        foreach ($slots->row as $slot) {

            if (is_numeric(substr($slot->Room, 0, 1))) {
                $slot->Room = 'Room ' . $slot->Room;
            }

            $slotData = array(
                'slot_key'    => trim($slot->Key_SlotID),
                'room'        => trim($slot->Room),
                'property'    => trim($slot->Property),
                'date'        => trim($slot->Date),
                'start_time'  => trim($slot->StartTime),
                'end_time'    => trim($slot->EndTime),
                'session_key' => trim($slot->SessionID),
            );
            $slot     = new Slot();
            $slot->exchangeArray($slotData);

            $slotTable = $this->getSlotTable();
            $slotTable->saveSlot($slot);
        }

        echo "ok";

        return $this->response;
    }
}
