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
        return $app['twig']->render('santiago.html.twig');
    });

    $app->get("/sanjuan", function() use($app) {
        return $app['twig']->render('sanjuan.html.twig');
    });

    $app->get("/denali", function() use($app) {
        return $app['twig']->render('denali.html.twig');
    });

    $app->get("/alps", function() use($app) {
        return $app['twig']->render('Alps.html.twig');
    });

    $app->get("australi", function() use($app) {
        return $app['twig']->render('australi.html.twig');
    });

    $app->get("thailand", function() use($app) {
        return $app['twig']->render('thailand.html.twig');
    });
    return $app;

 ?>
