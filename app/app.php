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

    session_start();
    if (empty($_SESSION['princess_adventure_login'])) {
        $_SESSION['princess_adventure_login'] = array();
    }

// Routes for Admin

    require_once __DIR__."/../app/admin.php";

////////////////////////////
// Routes for User

    $app->get("/", function() use($app){
        return $app['twig']->render('home.html.twig');
    });

    $app->get("/profile", function() use($app){
        return $app['twig']->render('profile.html.twig');
    });


/////////// SIGNUP
    $app->get("/signup", function() use($app){
        return $app['twig']->render('signup.html.twig'/, array('error' => ""));
    });

    $app->post("/signup", function() use ($app) {
        $error = "";
        $username = $_POST['username'];
        if (str_word_count($username) == 1){
            if (Customer::checkAvailable($username)){
                $password= $_POST['password'];
                $new_user = new Customer($app->escape($username), $app->escape($password));
                $new_user->save();
                //store user id into the session
                $_SESSION['user_id'] = $new_user->getId();
            }
            else{
                $error = "This username is taken.";
            }
        }
        else
        {
            $error = "Usernames must be ONE word.";
        }
        if($error) {
            return $app['twig']->render('signup.twig', array('error' => $error));
        }
        else {
            return $app->redirect('/messages');
        }
    });

///////////LOGOUT
    $app->post("/", function() use ($app) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        //check if login is valid, if so return a user, if not null
        $user = Customer::logInCheck($app->escape($username), $app->escape($password));
        if($user) {
            //if we have a user store it into the session by id
            $_SESSION['user_id'] = $user->getId();
            return $app->redirect('/messages');
        } else {
            $error = "true";
            $subRequest = Request::create('/', 'GET', array('error' => $error));
            return $app->handle($subRequest, HttpKernelInterface::SUB_REQUEST, true);
        }
    });
////////LOGOUT
    $app->get("/logout", function() use ($app) {
        session_unset();
        return $app->redirect('/');
    });






    $app->get("/login", function() use($app){
        //if login returns true, create cookie and procede to home
        return $app['twig']->render('login.html.twig');
    });

    return $app;

 ?>
