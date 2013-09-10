<?php

namespace Conference\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Conference\Model\Session;

class SessionController extends AbstractActionController
{
    protected $sessionTable;

    public function getSessionTable()
    {
        if (!$this->sessionTable) {
            $sm                 = $this->getServiceLocator();
            $this->sessionTable = $sm->get('Conference\Model\SessionTable');
        }

        return $this->sessionTable;
    }

    public function indexAction()
    {
        $table = $this->getSessionTable();
        echo $table->listSessions();

        return $this->response;
    }

    public function detailAction()
    {
        $sessionKey = $this->params()->fromQuery('session', 0);

        $table = $this->getSessionTable();
        echo $table->getSessionDetails($sessionKey);

        return $this->response;
    }

    public function updateAction()
    {
        $sessionUrl = "https://zendcon.confex.com/zendcon/2013/sync.cgi/Session.xml";
        $xml        = simplexml_load_file($sessionUrl);

        $sessions = $xml->data;

        foreach ($sessions->row as $session) {
            $sessionData = array(
                'session_key' => trim($session->Key_SessionID),
                'program'     => trim($session->SessionProgram),
                'title'       => trim($session->SessionTitle),
                'type'        => trim($session->SessionType),
                'level'       => trim($session->TechnologyLevel),
                'track'       => trim($session->Track),
            );
            $session     = new Session();
            $session->exchangeArray($sessionData);

            $sessionTable = $this->getSessionTable();
            $sessionTable->saveSession($session);
        }

        echo "ok";

        return $this->response;
    }

    public function tracksAction()
    {
        $table = $this->getSessionTable();
        echo $table->getTracks();

        return $this->response;
    }
}
