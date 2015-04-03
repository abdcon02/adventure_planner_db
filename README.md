##Developers
James Nielsen, Jonathan Lin, Connor Abdelnoor

##Date
April 2 2015



##Description
This app was created for the purpose of selling adventures to customers. A company can create an adventure, and display it through the app. Details of the adventure include: activities, activity coordinates, activity level, and cost.
<br />*At the moment activity coordinates need to be hard coded into the map scripts.*<br />
A user can access the app and view the created adventures. They can create and log into their accounts.

##Technologies Used
PHP
PHPUNIT
SILEX
TWIG
POSTGRES
PSQL
GOOGLE MAPS API


##Use and Editing
To use the app, download the source code and run it in on your php server. If you do not have php installed, installation instructions can be found on http://php.net/manual/en/install.general.php.
PostGres installations can be found at
https://www.learnhowtoprogram.com/lessons/postgres-with-php-weekend-homework
You will need to create a psql database to use the app. The tables and instructions are listed below<br />
```sql
CREATE DATABASE travel;
\c travel
CREATE TABLE activities (id serial PRIMARY KEY, name varchar, feedback_id int);
CREATE TABLE activities_adventure(id serial PRIMARY KEY, activity_id int, adventure_id int, required boolean);
CREATE TABLE activities_countries(id serial PRIMARY KEY, activity_id int, country_id int);
CREATE TABLE adventures(id serial PRIMARY KEY, name varchar, description varchar, feedback_id int, cost int);
CREATE TABLE adventures_countries(id serial PRIMARY KEY, adventure_id int, country_id int);
CREATE TABLE countries(id serial PRIMARY KEY, name varchar);
CREATE TABLE customers(id serial PRIMARY KEY, name varchar, password varchar);
CREATE TABLE feedback(id serial PRIMARY KEY, text varchar, user_id int, activity_feedback boolean, adventure_feedback boolean);
CREATE TABLE levels(id serial PRIMARY KEY, adventure_id int, activity_lvl int, activity_id int, activity_name varchar);
CREATE TABLE locations(id serial PRIMARY KEY, latitude numeric, longitude numeric, cost int, activity_id int, adventure_id int);
CREATE TABLE preferences(id serial PRIMARY KEY, customer_id int, activity_pref int, activity_id int, activity_name varchar);
```

You can also retrieve the database from the attached sql file using the \i command. First, go to the root folder of the project. Next open psql in that terminal window. Then create the database travel and connect to it. Next you will use the \i command to recreate the database. These are the commands.
CREATE DATABASE travel;
\c travel;
\i travel.sql;

To edit the app, download the source code and open it in your text editor. <br />
    *Note: If you are copying any of the code to your own directories, you may need to install Composer
    in your root directory.*

##Copyright (c) 2015 James Nielsen, Jonathan Lin, Connor Abdelnoor

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
