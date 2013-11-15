<?php
return array(
    'view_manager' => array(
        'template_path_stack' => array(
            'Tickets\Controller\Index' => __DIR__ . '/../view',
        ),
    ),
    'controllers' => array(
        'invokables' => array(
            'Tickets\Controller\Index' => 'Tickets\Controller\IndexController',
        ),
    ),
    'router' => array(
        'routes' => array(
            'Tickets\Controller\Index' => array(
                'type' => 'Literal',
                'priority' => 1000,
                'options' => array(
                    'route' => '/tickets',
                    'defaults' => array(
                        'controller' => 'Tickets\Controller\Index',
                        'action'     => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(  
                    'addticket' => array(
                        'type' => 'Literal',
                        'options' => array(
                            'route' => '/add',
                            'defaults' => array(
                                'controller' => 'Tickets\Controller\Index',
                                'action'     => 'addticket',
                            ),
                        ),
                    ),                   
                ),
            ),
        ),
    ),
);