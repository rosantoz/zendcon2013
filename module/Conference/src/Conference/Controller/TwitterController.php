<?php

namespace Conference\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use ZendService\Twitter\Twitter;

class TwitterController extends AbstractActionController
{
    public function indexAction()
    {
        $config = array(
            'access_token'        => array(
                'token'  => '***',
                'secret' => '***',
            ),
            'oauth_options'       => array(
                'consumerKey'    => '****',
                'consumerSecret' => '****',
            ),
            'http_client_options' => array(
                'adapter'     => 'Zend\Http\Client\Adapter\Curl',
                'curloptions' => array(
                    CURLOPT_SSL_VERIFYHOST => false,
                    CURLOPT_SSL_VERIFYPEER => false,
                ),
            ),
        );

        $twitter = new Twitter($config);

        $response = $twitter->account->verifyCredentials();
        if (!$response->isSuccess()) {
            die('Something is wrong with my credentials!');
        }

        // Search for something:
        $response = $twitter->search->tweets('#zendcon');

        $n = 0;

        $result = array();

        $tweets = $response->toValue()->statuses;
        foreach ($tweets as $tweet) {
            $result[$n]['text']              = $tweet->text;
            $result[$n]['name']              = $tweet->user->name;
            $result[$n]['screen_name']       = $tweet->user->screen_name;
            $result[$n]['created_at']        = $tweet->created_at;
            $result[$n]['profile_image_url'] = $tweet->user->profile_image_url;
            $n++;
        }

        echo json_encode(array('statuses' => $result));

        return $this->response;
    }
}
