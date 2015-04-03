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
    use Symfony\Component\HttpKernel\HttpKernelInterface;
    Request::enableHttpMethodparameterOverride();

// Routes for Admin
    require_once __DIR__."/../app/admin.php";
////////////////////////////
// Routes for User

    $app->get("/", function() use($app){

        return $app['twig']->render('home.html.twig', array('adventures' => Adventure::getAll()));
    });

    $app->post("/profile", function() use($app){
        return $app['twig']->render('profile.html.twig');
    });

    $app->get("/adventure/{id}", function($id) use($app){
        $adventure = Adventure::find($id);

        $map = '/script/' . $id . '.html.twig';

        return $app['twig']->render('adventure.html.twig', array('adventure' => $adventure, 'map' => $map));
    });

//============= SIGNUP & LOGIN =================
    // $app->get("/signup", function() use($app){
    //     return $app['twig']->render('signup.html.twig', array('error' => ""));
    // });
    $app->post("/signup", function() use ($app) {
        $error = "";
        $username = $_POST['username'];
        if (str_word_count($username) == 1){
            if (Customer::checkName($username)){
                $password = $_POST['password'];
                $new_customer = new Customer($app->escape($username), $app->escape($password));
                $new_customer->save();
                //store user id into the session
                $_SESSION['user_id'] = $new_customer->getId();
                echo 'Welcome to the machine.';
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
            return $app['twig']->render('login.html.twig', array('error' => $error));
        }
        else {
            return $app->redirect('/');
        }
    });

///////////LOGIN
    $app->get("/login", function() use($app){
        //if login returns true, create cookie and procede to home
        return $app['twig']->render('login.html.twig');
    });

    $app->post("/login", function() use ($app) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        //check if login is valid, if so return a user, if not null
        $user = Customer::logInCheck($app->escape($username), $app->escape($password));
        if($user) {
            //if we have a user store it into the session by id
            $_SESSION['user_id'] = $user->getId();
            return $app->redirect('/');
        } else {
            //echo 'whoops!';
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


    return $app;

 ?>
