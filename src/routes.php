<?php

use Slim\Http\Request;
use Slim\Http\Response;

// Routes

$app->get('/[{name}]', function (Request $request, Response $response, array $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});

$app->get('/hello/{name}', function (Request $req, Response $res, array $args) {
    // echoResponse(200, $args['name']);
    // return $res->write("Hello " . $args['name']);
    return $res->withJson(array(
        'StatusCode' => 200,
        'Data' => "Hola ".$args['name'],
        'Message' => 'Sending Sucessfull',
        'Results' => 1
    ), 200);
});