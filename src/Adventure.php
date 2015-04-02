<?php

    class Adventure
    {
        private $name;
        private $id;
        private $description;
        private $feedback_id;
        private $cost;

        function __construct($name, $id = null, $description = "", $feedback_id = 1, $cost = 1)
        {
            $this->name = $name;
            $this->id = $id;
            $this->description = $description;
            $this->feedback_id = $feedback_id;
            $this->cost = $cost;
        }

        function getName()
        {
            return $this->name;
        }

        function setName($new_name)
        {
            $this->name = $new_name;
        }

        function getId()
        {
            return $this->id;
        }

        function setId($new_id)
        {
            $this->id = $new_id;
        }

        function getDescription()
        {
            return $this->description;
        }

        function setDescription($new_description)
        {
            $this->description = (string) $new_description;
        }

        function getFeedback_id()
        {
            return $this->feedback_id;
        }

        function setFeedback_id($new_id)
        {
            $this->feedback_id = (int) $new_id;
        }

        function getCost()
        {
            return $this->cost;
        }

        function setCost($new_cost)
        {
            $this->cost = (int) $new_cost;
        }

        function save()
        {
            $query = $GLOBALS['DB']->query("INSERT INTO adventures (name, description, feedback_id, cost) VALUES ('{$this->getName()}', '{$this->getDescription()}', {$this->getFeedback_id()}, {$this->getCost()}) RETURNING id;");
            $query_fetched = $query->fetch(PDO::FETCH_ASSOC);
            $this->setId($query_fetched['id']);

        }

        function update($new_name)
        {
            $GLOBALS['DB']->exec("UPDATE adventures SET name = '{$new_name}' WHERE id = {$this->getId()};");
            $this->setName($new_name);
        }

        function singleDelete()
        {
            $GLOBALS['DB']->exec("DELETE FROM adventures WHERE id = {$this->getId()};");
            $GLOBALS['DB']->exec("DELETE FROM activities_adventures WHERE id = {$this->getId()};");
            $GLOBALS['DB']->exec("DELETE FROM activities_countries WHERE id = {$this->getId()};");
        }


        function addActivity($new_activity)
        {
            $GLOBALS['DB']->exec("INSERT INTO activities_adventures (activity_id, adventure_id) VALUES ({$new_activity->getId()}, {$this->getId()});");
        }

        function dropActivity($drop_activity)
        {
            $GLOBALS['DB']->exec("DELETE FROM activities_adventures WHERE adventure_id = {$this->getId()} AND activity_id = {$drop_activity->getId()};");
        }

        function dropCountry($drop_country)
        {
            $GLOBALS['DB']->exec("DELETE FROM adventures_countries WHERE adventure_id = {$this->getId()} AND country_id = {$drop_country->getId()};");
        }

        function getActivities()
        {
            $query = $GLOBALS['DB']->query("SELECT activities.* FROM adventures JOIN activities_adventures ON (adventures.id = activities_adventures.adventure_id) JOIN activities ON (activities.id = activities_adventures.activity_id) WHERE adventures.id = {$this->getId()};");

            $query_fetched = $query->fetchAll(PDO::FETCH_ASSOC);
            $return_activities = array ();

            foreach ($query_fetched as $element)
            {
                $new_name = $element['name'];
                $new_id = $element['id'];
                $new_activity = new Activity($new_name, $new_id);
                array_push($return_activities, $new_activity);
            }
            return $return_activities;
        }

        function addCountry($new_country)
        {
            $GLOBALS['DB']->exec("INSERT INTO adventures_countries (adventure_id, country_id) VALUES ({$this->getId()}, {$new_country->getId()});");
        }


        function getCountries()
        {
            $query = $GLOBALS['DB']->query("SELECT countries.* FROM adventures JOIN adventures_countries ON (adventures.id = adventures_countries.adventure_id) JOIN countries ON (countries.id = adventures_countries.country_id) WHERE adventures.id = {$this->getId()};");
            $query_fetched = $query->fetchAll(PDO::FETCH_ASSOC);
            $return_countries = array();

            foreach ($query_fetched as $element)
            {
                $new_name = $element['name'];
                $new_id = $element['id'];
                $new_country = new Country($new_name, $new_id);
                array_push ($return_countries, $new_country);
            }
            return $return_countries;

        }

        static function getAll()
        {
            $query = $GLOBALS['DB']->query("SELECT * FROM adventures");
            $query_fetched = $query->fetchAll(PDO::FETCH_ASSOC);
            $return_adventures = array();

            foreach($query_fetched as $element)
            {
                $name = $element['name'];
                $id = $element['id'];
                $description = $element['description'];
                $feedback_id = $element['feedback_id'];
                $cost = $element['cost'];
                $new_adventure = new Adventure($name, $id, $description, $feedback_id, $cost);
                array_push($return_adventures, $new_adventure);
            }
            return $return_adventures;
        }

        static function deleteAll()
        {
            $GLOBALS['DB']->exec("DELETE FROM adventures *;");

        }

        static function find($search_id)
        {
            $query = $GLOBALS['DB']->query("SELECT * FROM adventures WHERE id = {$search_id};");
            $query_fetched = $query->fetchAll(PDO::FETCH_ASSOC);
            $found_adventure = null;

            foreach ($query_fetched as $element)
            {
                $new_name = $element['name'];
                $new_id = $element['id'];
                $description = $element['description'];
                $feedback_id = $element['feedback_id'];
                $cost = $element['cost'];
                $found_adventure = new Adventure($new_name, $new_id, $description, $feedback_id, $cost);
            }
            return $found_adventure;

        }

        function getLocations()
        {
            $query = $GLOBALS['DB']->query("SELECT * FROM locations WHERE adventure_id = {$this->getId()};");
            $result = $query->fetchAll(PDO::FETCH_ASSOC);

            $locations = array();
            foreach($result as $adventure){
                $latitude = floatval($adventure['latitude']);
                $longitude = floatval($adventure['longitude']);
                $activity_id = $adventure['activity_id'];
                $id = $adventure['id'];
                $adventure_id = $adventure['adventure_id'];
                $new_location = new location($latitude, $longitude, $activity_id, $id, $adventure_id);
                array_push($locations, $new_location);
            }
            return $locations;
        }

        function addLocation($location)
        {
            $GLOBALS['DB']->exec("UPDATE locations SET adventure_id = {$this->getId()} WHERE id = {$location->getId()};");
            $location->setAdventure_id($this->getId());
        }

        // This method takes an activity as an argument and returns the activity level for that activity associated with the adventure.
        function getActivityLevel($activity)
        {
            $query = $GLOBALS['DB']->query("SELECT activity_lvl FROM levels WHERE adventure_id = {$this->getId()} AND activity_id = {$activity->getId()};");

            $result = $query->fetch(PDO::FETCH_ASSOC);

            return $result['activity_lvl'];
        }




    }


 ?>
