<?php

    require_once __DIR__."/../vendor/autoload.php";
    require_once __DIR__."/../src/Activity.php";
    require_once __DIR__."/../src/Location.php";
    require_once __DIR__."/../src/Country.php";
    require_once __DIR__."/../src/Adventure.php";
    require_once __DIR__."/../src/Customer.php";



    $app = new Silex\Application();
    $app['debug'] = true;

    $DB = new PDO('pgsql:host=localhost;dbname=travel');

    $app->register(new Silex\Provider\TwigServiceProvider(),
        array('twig.path'=>__DIR__.'/../views'));

    use Symfony\Component\HttpFoundation\Request;
    Request::enableHttpMethodparameterOverride();

// Routes for Admin

    require_once __DIR__."/../app/admin.php";

////////////////////////////
// Routes for User

    $app->get("/", function() use($app){

        return $app['twig']->render('home.html.twig', array('adventures' => Adventure::getAll()));
    });

    $app->get("/profile", function() use($app){
        return $app['twig']->render('profile.html.twig');
    });

    $app->get("/santiago", function() use($app) {
        return $app['twig']->Render('santiago.html.twig');
    });

    return $app;

 ?>
