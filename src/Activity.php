<?php

    class Activity
    {
        private $id;
        private $name;

// Constructor for instances of the class
        function __construct($name, $id = null)
        {
            $this->name = $name;
            $this->id = $id;
        }
// Getters and Setters for private properties of class
        function getName()
        {
            return $this->name;
        }

        function getId()
        {
            return $this->id;
        }

        function setId($new_id)
        {
            $this->id = (int) $new_id;
        }

        function setName($new_name)
        {
            $this->name = (string) $new_name;
        }
// Methods to interact with the Database

    // General CRUD methods

        // Save methods for saving activity, saving activity with level
        function save()
        {
            $statement = $GLOBALS['DB']->query("INSERT INTO activities (name) VALUES ('{$this->getName()}') RETURNING id;");
            $result = $statement->fetch(PDO::FETCH_ASSOC);
            $this->setId($result['id']);
        }

        function saveActivityLevel($adventure, $level)
        {
            $GLOBALS['DB']->exec("INSERT INTO levels (activity_id, adventure_id, activity_lvl, activity_name) VALUES ({$this->getId()}, {$adventure->getId()}, {$level}, '{$this->getName()}');");
        }


        function update($new_name)
        {
            $GLOBALS['DB']->exec("UPDATE activities SET name = '{$new_name}' WHERE id = '{$this->getId()}';");
            $this->setName($new_name);
        }
        // Make sure to delete associations in join tables as well
        function delete()
        {
            $GLOBALS['DB']->exec("DELETE FROM activities WHERE id = '{$this->getId()}';");
            $GLOBALS['DB']->exec("DELETE FROM activities_countries WHERE id = '{$this->getId()}';");
            $GLOBALS['DB']->exec("DELETE FROM activities_adventures WHERE id = '{$this->getId()}';");
        }
    // Adding associations and droping them without deleting the whole activity
        function addCountry($country)
        {
            $GLOBALS['DB']->exec("INSERT INTO activities_countries (activity_id, country_id) VALUES ({$this->getId()}, {$country->getId()});");
        }

        function addAdventure($adventure)
        {
            $GLOBALS['DB']->exec("INSERT INTO activities_adventures (activity_id, adventure_id) VALUES ({$this->getId()}, {$adventure->getId()});");
        }

        function dropCountry($country)
        {
            $GLOBALS['DB']->exec("DELETE FROM activities_countries WHERE activity_id = {$this->getId()} AND country_id = {$country->getId()};");
        }

        function dropAdventure($adventure)
        {
            $GLOBALS['DB']->exec("DELETE FROM activities_adventures WHERE activity_id = {$this->getId()} AND adventure_id = {$adventure->getId()};");
        }
    // General delete all and get all methods
        static function deleteAll()
        {
            $GLOBALS['DB']->exec("DELETE FROM activities *;");
        }

        static function getAll()
        {
            $statement = $GLOBALS['DB']->query("SELECT * FROM activities;");
            $activities = $statement->fetchAll(PDO::FETCH_ASSOC);

            $returned_activities = array();
            foreach($activities as $thing){
                $name = $thing['name'];
                $id = $thing['id'];
                $new_activity = new Activity($name, $id);
                array_push($returned_activities, $new_activity);
            }
            return $returned_activities;
        }
    // Find method to get Activity Id
        static function find($search_id)
        {
            $found_activity = null;
            $all_activities = Activity::getAll();
            foreach($all_activities as $thing){
                if($thing->getId() == $search_id){
                    $found_activity = $thing;
                }
            }
            return $found_activity;
        }

    // Methods for getting all countries and adventures which include this activity
        function getCountries()
        {
            $query = $GLOBALS['DB']->query("SELECT countries.* FROM activities JOIN
            activities_countries ON (activities.id = activities_countries.activity_id)
            JOIN countries ON (countries.id = activities_countries.country_id)
            WHERE activities.id = {$this->getId()};");

            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            $matching_countries = array();
            foreach($result as $country){
                $name = $country['name'];
                $id = $country['id'];
                $new_country = new Country($name, $id);
                array_push($matching_countries, $new_country);
            }
            return $matching_countries;

        }

        function getAdventures()
        {
            $query = $GLOBALS['DB']->query("SELECT adventures.* FROM activities JOIN
            activities_adventures ON (activities.id = activities_adventures.activity_id)
            JOIN adventures ON (adventures.id = activities_adventures.adventure_id)
            WHERE activities.id = {$this->getId()};");

            $result = $query->fetchAll(PDO::FETCH_ASSOC);
            $matching_adventures = array();
            foreach($result as $exploit){
                $name = $exploit['name'];
                $id = $exploit['id'];
                $new_adventure = new Adventure($name, $id);
                array_push($matching_adventures, $new_adventure);
            }
            return $matching_adventures;
        }





    }

 ?>
