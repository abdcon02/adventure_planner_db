<?php


    $app->get("/admin", function() use($app){
        return $app['twig']->render('admin.html.twig', array('adventures' => Adventure::getAll(), 'countries' => Country::getAll(), 'activities' => Activity::getAll()));
    });

// Routes to add content
    $app->post("/add_country", function() use($app){
        $country = new Country($_POST['name']);
        $country->save();

        return $app['twig']->render('admin.html.twig', array('adventures' => Adventure::getAll(), 'countries' => Country::getAll(), 'activities' => Activity::getAll()));
    });

    $app->post("/add_adventure", function() use($app){
        $adventure = new Adventure($_POST['name'], $id = null, $_POST['description']);
        $adventure->save();

        return $app['twig']->render('admin.html.twig', array('adventures' => Adventure::getAll(), 'countries' => Country::getAll(), 'activities' => Activity::getAll()));
    });

    $app->post("/add_activity", function() use($app){
        $activity = new Activity($_POST['name']);
        $activity->save();

        return $app['twig']->render('admin.html.twig', array('adventures' => Adventure::getAll(), 'countries' => Country::getAll(), 'activities' => Activity::getAll()));
    });

// Route to delete everything
    $app->post("/delete", function() use($app){
        Country::deleteAll();
        Adventure::deleteAll();
        Activity::deleteAll();

        return $app['twig']->render('admin.html.twig', array('adventures' => Adventure::getAll(), 'countries' => Country::getAll(), 'activities' => Activity::getAll()));
    });

// Other CRUD routes

    $app->get("/edit_adventure/{id}", function($id) use($app){
        $adventure = Adventure::find($id);

        return $app['twig']->render('edit_adventure.html.twig', array('adventure' => $adventure, 'countries' => Country::getAll(), 'activities' => Activity::getAll()));
    });

    $app->post("/adventure_add_activity", function() use($app){
        $adventure = Adventure::find($_POST['adventure_id']);
        $activity = Activity::find($_POST['activity_id']);
        $adventure->addActivity($activity);

        return $app['twig']->render('edit_adventure.html.twig', array('adventure' => $adventure, 'countries' => Country::getAll(), 'activities' => Activity::getAll()));
    });


    $app->post("/adventure_drop_activity", function() use($app){
        $adventure = Adventure::find($_POST['adventure_id']);
        $activity = Activity::find($_POST['activity_id']);
        $adventure->dropActivity($activity);

        return $app['twig']->render('edit_adventure.html.twig', array('adventure' => $adventure, 'countries' => Country::getAll(), 'activities' => Activity::getAll()));
    });

    $app->post("/location", function() use($app){
        $adventure = Adventure::find($_POST['adventure_id']);
        $activity = Activity::find($_POST['activity_id']);
        $new_location = new Location($_POST['latitude'], $_POST['longitude'], $_POST['activity_id'], $id = null, $_POST['adventure_id']);
        $new_location->save();
        $new_location->addActivity($activity);
        $adventure->addLocation($new_location);

        $level = $_POST['level'];

        return $app['twig']->render('admin.html.twig', array('adventures' => Adventure::getAll(), 'countries' => Country::getAll(), 'activities' => Activity::getAll()));
    });

    $app->post("/level", function() use($app){
        $adventure = Adventure::find($_POST['adventure_id']);
        $activity = Activity::find($_POST['activity_id']);
        $level = $_POST['level'];
        $activity->saveActivityLevel($adventure, $level);

        return $app['twig']->render('admin.html.twig', array('adventures' => Adventure::getAll(), 'countries' => Country::getAll(), 'activities' => Activity::getAll()));
    });


 ?>
