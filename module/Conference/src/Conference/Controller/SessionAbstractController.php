<?php

namespace Conference\Controller;

use Conference\Model\SessionAbstract;
use Zend\Mvc\Controller\AbstractActionController;

class SessionAbstractController extends AbstractActionController
{
    protected $sessionAbstractTable;

    public function getSessionTable()
    {
        if (!$this->sessionAbstractTable) {
            $sm                         = $this->getServiceLocator();
            $this->sessionAbstractTable = $sm->get('Conference\Model\SessionAbstractTable');
        }

        return $this->sessionAbstractTable;
    }

    public function indexAction()
    {
        echo "session abstract";

        return $this->response;
    }

    public function updateAction()
    {
        $sessionAbstractUrl = "https://zendcon.confex.com/zendcon/2013/sync.cgi/SessionAbstract.xml";
        $xml                = simplexml_load_file($sessionAbstractUrl);

        $sessions = $xml->data;

        foreach ($sessions->row as $session) {
            $sessionData = array(
                'session_key' => trim($session->Key_SessionID),
                'abstract'     => trim($session->SessionAbstract),
            );
            $session     = new SessionAbstract();
            $session->exchangeArray($sessionData);

            $sessionTable = $this->getSessionTable();
            $sessionTable->saveSession($session);
        }

        echo "ok";

        return $this->response;
    }
}
