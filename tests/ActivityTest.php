<?php

    /**
    * @backupGlobals disabled
    * @backupStaticAttributes disabled
    */

    require_once "src/Activity.php";
    require_once "src/Country.php";
    require_once "src/Adventure.php";
    require_once "src/Customer.php";


    $DB = new PDO('pgsql:host=localhost;dbname=travel_test');

    class ActivityTest extends PHPUnit_Framework_TestCase
    {

        protected function tearDown()
        {
            Activity::deleteAll();
            Adventure::deleteAll();
            Country::deleteAll();
            Customer::deleteAll();
        }

        function test_setId()
        {
            //Arrange
            $name = "bike";
            $id = 1;
            $test_activity = new Activity($name, $id);
            //Act
            $test_activity->setId(3);
            $result = $test_activity->getId();

            //Assert
            $this->assertEquals(3, $result);
        }

        function test_setName()
        {
            //Arrange
            $name = "bike";
            $test_activity = new Activity($name);
            $new_name = "swimming";

            //Act
            $test_activity->setName($new_name);
            $result = $test_activity->getName();

            //Assert
            $this->assertEquals($new_name, $result);
        }

        function test_save()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();

            //Act
            $result = Activity::getAll();

            //Assert
            $this->assertEquals($test_activity, $result[0]);
        }

        function test_getAll()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();
            $name2 = "sightseeing";
            $test_activity2 = new Activity($name2);
            $test_activity2->save();

            //Act
            $result = Activity::getAll();

            //Assert
            $this->assertEquals([$test_activity, $test_activity2], $result);
        }

        function test_deleteAll()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();
            $name2 = "sightseeing";
            $test_activity2 = new Activity($name2);
            $test_activity2->save();

            //Act
            Activity::deleteAll();
            $result = Activity::getAll();

            //Assert
            $this->assertEquals([], $result);
        }

        function test_find()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();
            $name2 = "sightseeing";
            $test_activity2 = new Activity($name2);
            $test_activity2->save();

            //Act
            $result = Activity::find($test_activity2->getId());

            //Assert
            $this->assertEquals($test_activity2, $result);
        }

        function test_update()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();
            $new_name = "cycling";

            //Act
            $test_activity->update($new_name);
            $result = $test_activity->getName();

            //Assert
            $this->assertEquals($new_name, $result);
        }

        function test_delete()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();
            $name2 = "sightseeing";
            $test_activity2 = new Activity($name2);
            $test_activity2->save();

            //Act
            $test_activity2->delete();
            $result = Activity::getAll();

            //Assert
            $this->assertEquals([$test_activity], $result);
        }

        function testAddAdventure()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();

            $adventure = "kitesurfing in hawaii";
            $test_adventure = new Adventure($adventure);
            $test_adventure->save();

            //Act
            $test_activity->addAdventure($test_adventure);
            $result = $test_activity->getAdventures();

            //Assert
            $this->assertEquals([$test_adventure], $result);
        }

        function test_addCountry()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();

            $Country = "USA";
            $test_country = new Country($Country);
            $test_country->save();

            //Act
            $test_activity->addCountry($test_country);
            $result = $test_activity->getCountries();

            //Assert
            $this->assertEquals([$test_country], $result);
        }

        function test_getAdventures()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();

            $name2 = "snorkeling in hawaii";
            $test_adventure2 = new Adventure($name2);
            $test_adventure2->save();

            $adventure = "kitesurfing in hawaii";
            $test_adventure = new Adventure($adventure);
            $test_adventure->save();

            //Act
            $test_activity->addAdventure($test_adventure);
            $test_activity->addAdventure($test_adventure2);
            $result = $test_activity->getAdventures();

            //Assert
            $this->assertEquals([$test_adventure, $test_adventure2], $result);
        }

        function test_getCountries()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();

            $name2 = "Canada";
            $test_country2 = new Country($name2);
            $test_country2->save();

            $Country = "USA";
            $test_country = new Country($Country);
            $test_country->save();

            //Act
            $test_activity->addCountry($test_country);
            $test_activity->addCountry($test_country2);
            $result = $test_activity->getCountries();

            //Assert
            $this->assertEquals([$test_country, $test_country2], $result);
        }

        function test_deleteAdvAssoc()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();
            $name2 = "sightseeing";
            $test_activity2 = new Activity($name2);
            $test_activity2->save();

            $adventure = "kitesurfing in hawaii";
            $test_adventure = new Adventure($adventure);
            $test_adventure->save();

            //Act
            $test_activity->addAdventure($test_adventure);
            $test_activity2->addAdventure($test_adventure);
            $test_activity2->delete();
            $result = $test_activity->getAdventures();

            //Assert
            $this->assertEquals([$test_adventure], $result);
        }

        function test_deleteCouAssoc()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();
            $name2 = "sightseeing";
            $test_activity2 = new Activity($name2);
            $test_activity2->save();

            $Country = "USA";
            $test_country = new Country($Country);
            $test_country->save();

            //Act
            $test_activity->addCountry($test_country);
            $test_activity2->addCountry($test_country);
            $test_activity2->delete();
            $result = $test_activity->getCountries();

            //Assert
            $this->assertEquals([$test_country], $result);
        }

        function test_DropAdventure()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();

            $name2 = "sightseeing in the Congo";
            $test_adventure2 = new Adventure($name2);
            $test_adventure2->save();

            $adventure = "kitesurfing in hawaii";
            $test_adventure = new Adventure($adventure);
            $test_adventure->save();

            //Act
            $test_activity->addAdventure($test_adventure);
            $test_activity->addAdventure($test_adventure2);
            $test_activity->dropAdventure($test_adventure2);
            $result = $test_activity->getAdventures();

            //Assert
            $this->assertEquals([$test_adventure], $result);
        }

        function test_DropCountry()
        {
            //Arrange
            $name = "eating";
            $test_activity = new Activity($name);
            $test_activity->save();

            $name2 = "Canada";
            $test_country2 = new Country($name2);
            $test_country2->save();

            $Country = "USA";
            $test_country = new Country($Country);
            $test_country->save();

            //Act
            $test_activity->addCountry($test_country);
            $test_activity->addCountry($test_country2);
            $test_activity->dropCountry($test_country2);
            $result = $test_activity->getCountries();

            //Assert
            $this->assertEquals([$test_country], $result);
        }

        function test_saveLevel()
        {
            //Arrange
            $test_adventure = new Adventure("surfing in hawaii");
            $test_adventure->save();
            $test_activity = new Activity("Swim");
            $test_activity->save();
            $level = 9;

            //Act
            $test_activity->saveActivityLevel($test_adventure, $level);
            $result = $test_adventure->getActivityLevel($test_activity);
            //Assert
            $this->assertEquals(9, $result);
        }




    }
