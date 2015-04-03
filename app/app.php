<?php
    require_once __DIR__."/../vendor/autoload.php";
    require_once __DIR__."/../src/Activity.php";
    require_once __DIR__."/../src/Location.php";
    require_once __DIR__."/../src/Country.php";
    require_once __DIR__."/../src/Adventure.php";
    require_once __DIR__."/../src/Customer.php";

    $app = new Silex\Application();
    $app['debug'] = true;

    if(!isset($_SESSION)){
        session_start();
    }

    $DB = new PDO('pgsql:host=localhost;dbname=travel');

    $app->register(new Silex\Provider\TwigServiceProvider(),
        array('twig.path'=>__DIR__.'/../views'));

    use Symfony\Component\HttpFoundation\Request;
    use Symfony\Component\HttpKernel\HttpKernelInterface;
    Request::enableHttpMethodparameterOverride();

// Routes for Admin
    require_once __DIR__."/../app/admin.php";
////////////////////////////
// Routes for User

    $app->get("/", function() use($app){
        if(isset($_SESSION['id'])){
            $route = "/profile";
            $text = "Profile";
            $name = "User: " . Customer::findName($_SESSION['id']);
        } else {
            $route = "/login";
            $text = "Login";
            $name = "";
        }

        return $app['twig']->render('home.html.twig', array('adventures' => Adventure::getAll(), 'route' => $route, 'text' => $text, 'name' => $name));
    });


    $app->get("/adventure/{id}", function($id) use($app){
        $adventure = Adventure::find($id);
        $map = '/script/' . $id . '.html.twig';

        if($_SESSION['id'] != 1){
            $route = "/profile";
            $text = "Profile";
            $name = "User: " . Customer::findName($_SESSION['id']);
        } else {
            $route = "/login";
            $text = "Login";
            $name = "";
        }

        return $app['twig']->render('adventure.html.twig', array('adventure' => $adventure, 'map' => $map, 'route' => $route, 'text' => $text, 'name' => $name));
    });
/////////////
// Routes for customer
    require_once __DIR__."/../app/user.php";

    return $app;

 ?>
