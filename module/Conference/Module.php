<?php

namespace Conference;

use Conference\Model\Person;
use Conference\Model\PersonTable;
use Conference\Model\Role;
use Conference\Model\RoleTable;
use Conference\Model\Slot;
use Conference\Model\SlotTable;
use Conference\Model\Session;
use Conference\Model\SessionTable;
use Conference\Model\SessionAbstract;
use Conference\Model\SessionAbstractTable;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;
use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;
use Zend\Db\Sql\Sql;

class Module
{
    public function onBootstrap(MvcEvent $e)
    {
        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
    }

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }

    public function getServiceConfig()
    {
        return array(
            'factories' => array(
                'Conference\Model\SessionTable'         => function ($sm) {
                    $tableGateway = $sm->get('SessionTableGateway');
                    $sql          = $sm->get('Model\Select\Sql');
                    $table        = new SessionTable($tableGateway, $sql);

                    return $table;
                },
                'SessionTableGateway'                   => function ($sm) {
                    $dbAdapter          = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Session());

                    return new TableGateway('session', $dbAdapter, null, $resultSetPrototype);
                },
                'Conference\Model\SlotTable'            => function ($sm) {
                    $tableGateway = $sm->get('SlotTableGateway');
                    $table        = new SlotTable($tableGateway);

                    return $table;
                },
                'SlotTableGateway'                      => function ($sm) {
                    $dbAdapter          = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Slot());

                    return new TableGateway('slot', $dbAdapter, null, $resultSetPrototype);
                },
                'Conference\Model\SessionAbstractTable' => function ($sm) {
                    $tableGateway = $sm->get('SessionAbstractTableGateway');
                    $table        = new SessionAbstractTable($tableGateway);

                    return $table;
                },
                'SessionAbstractTableGateway'           => function ($sm) {
                    $dbAdapter          = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new SessionAbstract());

                    return new TableGateway('session_abstract', $dbAdapter, null, $resultSetPrototype);
                },
                'Conference\Model\RoleTable'            => function ($sm) {
                    $tableGateway = $sm->get('RoleTableGateway');
                    $table        = new RoleTable($tableGateway);

                    return $table;
                },
                'RoleTableGateway'                      => function ($sm) {
                    $dbAdapter          = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Role());

                    return new TableGateway('role', $dbAdapter, null, $resultSetPrototype);
                },
                'Conference\Model\PersonTable'          => function ($sm) {
                    $tableGateway = $sm->get('PersonTableGateway');
                    $sql          = $sm->get('Model\Select\Sql');
                    $table        = new PersonTable($tableGateway, $sql);

                    return $table;
                },
                'PersonTableGateway'                    => function ($sm) {
                    $dbAdapter          = $sm->get('Zend\Db\Adapter\Adapter');
                    $resultSetPrototype = new ResultSet();
                    $resultSetPrototype->setArrayObjectPrototype(new Person());

                    return new TableGateway('person', $dbAdapter, null, $resultSetPrototype);
                },
                'Model\Select\Sql'                      => function ($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');

                    return new Sql($dbAdapter);
                },
            ),
        );
    }
}
