<?php
    /**
    * @backupGlobals disabled
    * @backupStaticAttributes disabled
    */
    require_once "src/Customer.php";

    $DB = new PDO('pgsql:host=localhost;dbname=travel_test');
    class CustomerTest extends PHPUnit_Framework_TestCase
    {
        protected function tearDown()
        {
            Customer::deleteAll();
        }

        function test_SetName()
        {
            //Arrange
            $name = "Dandy";
            $test_customer = new Customer($name);
            $new_name = "Terry";
            //Act
            $test_customer->setName($new_name);
            $result = $test_customer->getName();
            //Assert
            $this->assertEquals($new_name, $result);
        }
        function test_SetId()
        {
            //Arrange
            $name = "Bill";
            $id = 1;
            $test_customer = new Customer($name, $id);
            $new_id = 2;
            //Act
            $test_customer->setId($new_id);
            $result = $test_customer->getId();
            //Assert
            $this->assertEquals($new_id, $result);
        }
        function test_SetPassword()
        {
            //Arrange
            $name = "Bill";
            $id = 1;
            $test_customer = new Customer($name, $id);
            $new_password = "hey there";
            //Act
            $test_customer->setPassword($new_password);
            $result = $test_customer->getPassword();
            //Assert
            $this->assertEquals($new_password, $result);
        }
        function test_save()
        {
            //Arrange
            $name = "Hemmingway";
            $test_customer = new Customer($name);
            //Act
            $test_customer->save();
            $result = Customer::getAll();
            //Assert
            $this->assertEquals($test_customer, $result[0]);
        }
        function test_getAll()
        {
            //Arrange
            $name = "Bogus";
            $test_customer = new Customer($name);
            $test_customer->save();
            $name2 = "Wendy";
            $test_customer2 = new Customer($name2);
            $test_customer2->save();
            //Act
            $result = Customer::getAll();
            //Assert
            $this->assertEquals([$test_customer, $test_customer2], $result);
        }
        function test_deleteAll()
        {
            //Arrange
            $name = "Freddy";
            $test_customer = new Customer($name);
            $test_customer->save();
            //Act
            Customer::deleteAll();
            $result = Customer::getAll();
            //Assert
            $this->assertEquals([], $result);
        }
        function test_updateName()
        {
            //Arrange
            $name = "asdfasdf";
            $test_customer = new Customer($name);
            $test_customer->save();
            $new_name = "Poppy";
            //Act
            $test_customer->updateName($new_name);
            //Assert
            $this->assertEquals($new_name, $test_customer->getName());
        }
        function test_updatePassword()
        {
            //Arrange
            $name = "Poppy";
            $id = null;
            $password = "hey";
            $test_customer = new Customer($name, $id, $password);
            $test_customer->save();
            $new_password = "how";
            //Act
            $test_customer->updatePassword($new_password);
            //Assert
            $this->assertEquals($new_password, $test_customer->getPassword());
        }
        function test_delete()
        {
            //Arrange
            $name = "Zed";
            $test_customer = new Customer($name);
            $test_customer->save();
            $name2 = "Fred";
            $test_customer2 = new Customer($name2);
            $test_customer2->save();
            //Act
            $test_customer2->delete();
            $result = Customer::getAll();
            //Assert
            $this->assertEquals([$test_customer], $result);
        }

        function test_checkName()
        {
            //Arrange
            $name = "Homie";
            $test_customer = new Customer($name);
            $test_customer->save();
            $name2 = "Ann";
            $test_customer2 = new Customer($name2);
            $test_customer2->save();
            //Act
            $result = Customer::checkName("zack");

            //Assert
            $this->assertEquals(false, $result);
        }

        function test_login()
        {
            //Arrange
            $name = "Hollly";
            $password = "admin";
            $test_customer = new Customer($name, $password);
            $test_customer->save();

            //Act
            $result = Customer::login($name, $password);

            //Assert
            $this->assertEquals(true, $result);
        }

        function test_findId()
        {
            //Arrange
            $name = "Hollly";
            $password = "admin";
            $test_customer = new Customer($name, $password);
            $test_customer->save();

            //Act
            $result = Customer::findId($name);

            //Assert
            $this->assertEquals($test_customer->getId(), $result);
        }

        function test_findName()
        {
            //Arrange
            $name = "Hollly";
            $password = "admin";
            $test_customer = new Customer($name, $password);
            $test_customer->save();

            //Act
            $result = Customer::findName($test_customer->getId());

            //Assert
            $this->assertEquals($name, $result);
        }

    }
?>
