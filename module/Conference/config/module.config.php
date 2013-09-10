<?php
return array(
    'controllers' => array(
        'invokables' => array(
            'Conference\Controller\Index'           => 'Conference\Controller\IndexController',
            'Conference\Controller\Session'         => 'Conference\Controller\SessionController',
            'Conference\Controller\Slot'            => 'Conference\Controller\SlotController',
            'Conference\Controller\SessionAbstract' => 'Conference\Controller\SessionAbstractController',
            'Conference\Controller\Role'            => 'Conference\Controller\RoleController',
            'Conference\Controller\Person'          => 'Conference\Controller\PersonController',
            'Conference\Controller\Twitter'         => 'Conference\Controller\TwitterController',
        ),
    ),

    'router'      => array(
        'routes' => array(
            'conference' => array(
                'type'          => 'Literal',
                'options'       => array(
                    'route'    => '/conference',
                    'defaults' => array(
                        '__NAMESPACE__' => 'Conference\Controller',
                        'controller'    => 'Index',
                        'action'        => 'index',
                        'module'        => 'conference'
                    ),
                ),
                'may_terminate' => true,
                'child_routes'  => array(
                    'default' => array(
                        'type'         => 'Segment',
                        'options'      => array(
                            'route'       => '/[:controller[/:action][/]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ),
                            'defaults'    => array(),
                        ),
                        'child_routes' => array( //permite mandar dados pela url
                            'wildcard' => array(
                                'type' => 'Wildcard'
                            ),
                        ),
                    ),

                ),
            ),
        ),
    ),
);