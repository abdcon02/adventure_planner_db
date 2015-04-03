<?php

$app->get("/login", function() use($app){
    $message = "";
    return $app['twig']->render('login.html.twig', array('message' => $message));
});

$app->post("/new_profile", function() use($app){
        $name = $_POST['username'];
        $password = $_POST['password'];
        if(Customer::checkName($name) == false){
            $new_customer = new Customer($name, $password);
            $new_customer->save();
            $_SESSION['id'] = $new_customer->getId();
            return $app['twig']->render('profile.html.twig', array('name' => $name));
        } else {
            $message = "This Username alread exists, please choose another.";
            return $app['twig']->render('login.html.twig', array('message' => $message));
        }

});
$app->get("/profile", function() use($app){
    $name = Customer::findName($_SESSION['id']);

    return $app['twig']->render('profile.html.twig', array('name' => $name));
});
$app->post("/login", function() use ($app) {
    $name = $_POST['username'];
    $password = $_POST['password'];
    if(Customer::login($name, $password) == true){
        $_SESSION['id'] = Customer::findId($name);
        return $app['twig']->render('profile.html.twig', array('name' => $name));
    } else {
        $message = "Your Login Information was wrong.";
        return $app['twig']->render('login.html.twig', array('message' => $message));
    }

});

$app->post("/logout", function() use ($app) {
    session_unset();
    // session_destroy();
    // session_regenerate_id(TRUE);
    return $app->redirect('/');
});


 ?>
