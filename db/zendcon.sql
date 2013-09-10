-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 24, 2013 at 09:14 PM
-- Server version: 5.5.31-0ubuntu0.12.04.2
-- PHP Version: 5.5.0-6~precise+1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `zendcon`
--

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_key` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`person_id`,`person_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `person_key`, `first_name`, `last_name`, `company`, `title`) VALUES
(1, 23, 'Shawn', 'Stratton', 'Discovery Communications, LLC', 'Senior Systems Architect'),
(2, 24, 'Elliott', 'White', 'musketeers.me, LLC', 'Founding Partner'),
(3, 42, 'Michelangelo', 'van Dam', 'in2it Vof', 'Zend Certified Engineer'),
(4, 58, 'Michael', 'Stowe', 'CaringBridge', 'Software Engineer'),
(5, 79, 'Wim', 'Godden', 'Cu.be Solutions', 'Lead Architect'),
(6, 89, 'Jordan', 'Kasper', '[Independent]', 'Developer, Strategist, Evangelist'),
(7, 93, 'Gary', 'Hockin', 'Yamgo TV', 'CTO'),
(8, 94, 'Jeff', 'Carouth', 'Liftopia', 'Senior Software Engineer'),
(9, 100, 'John', 'Coggeshall', 'Internet Technology Solutions, LLC', 'Owner'),
(10, 102, 'Derick', 'Rethans', '10gen', 'PHP Engineer/Evangelist'),
(11, 123, 'Zurab', 'Davitiani', 'Splunk', 'Lead Web Architect'),
(12, 124, 'Ilia', 'Alshanetsky', 'Centah Inc.', 'CTO'),
(13, 133, 'Sebastian', 'Bergmann', 'thePHP.cc', 'Co-Founder and Principal Consultant'),
(14, 154, 'Stefan', 'Priebsch', 'thePHP.cc', 'Principal Consultant'),
(15, 142, 'Adam', 'Culp', 'Zend Technologies', 'Senior Professional Services Consultant'),
(16, 147, 'David', 'Shafik', 'Engine Yard, Inc', 'Engineer'),
(17, 169, 'Yonni', 'Mendes', 'Zend Technologies', 'Technological Lead'),
(18, 179, 'Enrico', 'Zimuel', 'Zend Technologies', 'Software Engineer'),
(19, 189, 'Grant', 'Shipley', 'Red Hat', 'Sr. Manager, Cloud'),
(20, 191, 'Sergei', 'Golubchik', 'Monty Program Ab', 'VP Architecture'),
(21, 206, 'Christian', 'Wenz', 'Arrabiata Solutions GmbH', 'Partner'),
(22, 211, 'Marco', 'Pivetta', 'Com2 GmbH', 'Software Developer'),
(23, 202, 'David', 'Stockton', 'i3logix', 'VP of Technology'),
(24, 238, 'Jan', 'Burkl', 'Zend', 'Senior Solution Consultant'),
(25, 242, 'Mike', 'Willbanks', 'NOOK Media', 'Sr. Web Architect Manager'),
(26, 243, 'Wojciech', 'Galanciak', 'Zend Technologies Ltd.', 'Senior Eclipse Developer'),
(27, 251, 'Clark', 'Everetts', 'Zend Technologies, Inc.', 'Senior Professional Services Consultant'),
(28, 254, 'Chris', 'Tankersley', 'The Brick Factory', 'Programmer'),
(29, 258, 'David', 'Ramsey', 'Moontoast', 'Senior Software Architect'),
(30, 262, 'Elizabeth', 'Smith', 'E. M. Smith Computer Consulting', 'Owner'),
(31, 263, 'Jeremy', 'Mikola', '10gen', 'Software Engineer'),
(32, 271, 'Alan', 'Seiden', 'Alan Seiden Consulting', 'Owner'),
(33, 260, 'Evan', 'Coury', 'MediaTech Designs, LLC', 'Owner'),
(34, 295, 'Matthew', 'Weier O''Phinney', 'Zend Technologies', 'Zend'),
(35, 4, 'Joe', 'Stagner', 'Zend', 'Geek');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_key` int(11) NOT NULL,
  `session_key` int(11) DEFAULT NULL,
  `person_key` int(11) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`,`role_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_key`, `session_key`, `person_key`, `role`) VALUES
(1, 27, 1104, 23, 'Speaker'),
(2, 34, 1136, 24, 'Speaker'),
(3, 48, 1263, 42, 'Speaker'),
(4, 50, 1267, 42, 'Speaker'),
(5, 62, 1339, 58, 'Speaker'),
(6, 83, 1439, 79, 'Speaker'),
(7, 85, 1441, 79, 'Speaker'),
(8, 93, 1472, 89, 'Speaker'),
(9, 97, 1482, 93, 'Speaker'),
(10, 98, 1488, 94, 'Speaker'),
(11, 104, 1507, 100, 'Speaker'),
(12, 113, 1522, 102, 'Speaker'),
(13, 115, 1524, 102, 'Speaker'),
(14, 127, 1607, 123, 'Speaker'),
(15, 128, 1612, 124, 'Speaker'),
(16, 129, 1613, 124, 'Speaker'),
(17, 137, 1673, 133, 'Speaker'),
(18, 138, 1673, 154, 'Speaker'),
(19, 139, 1674, 133, 'Speaker'),
(20, 147, 1681, 142, 'Speaker'),
(21, 152, 1708, 147, 'Speaker'),
(22, 166, 1737, 94, 'Speaker'),
(23, 175, 1750, 169, 'Speaker'),
(24, 182, 1767, 179, 'Speaker'),
(25, 183, 1770, 179, 'Speaker'),
(26, 193, 1790, 189, 'Speaker'),
(27, 195, 1807, 191, 'Speaker'),
(28, 210, 1830, 206, 'Speaker'),
(29, 213, 1838, 211, 'Speaker'),
(30, 227, 1861, 202, 'Speaker'),
(31, 243, 1886, 238, 'Speaker'),
(32, 246, 1889, 242, 'Speaker'),
(33, 250, 1894, 243, 'Speaker'),
(34, 251, 1895, 243, 'Speaker'),
(35, 252, 1896, 243, 'Speaker'),
(36, 255, 1897, 251, 'Speaker'),
(37, 256, 1901, 251, 'Speaker'),
(38, 258, 1904, 254, 'Speaker'),
(39, 260, 1907, 254, 'Speaker'),
(40, 263, 1910, 258, 'Speaker'),
(41, 265, 1913, 254, 'Speaker'),
(42, 269, 1916, 262, 'Speaker'),
(43, 272, 1922, 262, 'Speaker'),
(44, 273, 1924, 263, 'Speaker'),
(45, 275, 1902, 271, 'Speaker'),
(46, 276, 1927, 263, 'Speaker'),
(47, 277, 1928, 271, 'Speaker'),
(48, 278, 1929, 271, 'Speaker'),
(49, 279, 1930, 271, 'Speaker'),
(50, 280, 1932, 258, 'Speaker'),
(51, 281, 1933, 258, 'Speaker'),
(52, 282, 1934, 260, 'Speaker'),
(53, 283, 1935, 206, 'Speaker'),
(54, 298, 1941, 295, 'Speaker'),
(55, 299, 1944, 295, 'Speaker'),
(56, 287, 1942, 4, 'Speaker'),
(57, 289, 1945, 206, 'Speaker'),
(58, 290, 1946, 271, 'Speaker'),
(59, 291, 1947, 4, 'Speaker'),
(60, 292, 1948, 238, 'Speaker'),
(61, 294, 1952, 260, 'Speaker'),
(62, 296, 1938, 179, 'Speaker'),
(63, 297, 1939, 295, 'Speaker'),
(64, 300, 1967, 142, 'Speaker');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_key` int(11) NOT NULL,
  `program` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `track` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`session_id`,`session_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`session_id`, `session_key`, `program`, `title`, `type`, `level`, `track`) VALUES
(1, 1104, 'Sessions', 'Building flexible infrastructure on EC2', 'Session', 'Intermediate', 'Cloud, SOA and DevOps'),
(2, 1136, 'Sessions', 'Scaling in the Cloud with Amazon Web Services', 'Session', 'Beginner', 'Cloud, SOA and DevOps'),
(3, 1263, 'Sessions', 'UA testing with Selenium and PHPUnit', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(4, 1267, 'Sessions', 'Improving QA on PHP development projects', '1/2 Day Tutorial', 'Intermediate', 'Professional PHP & Best Practices'),
(5, 1339, 'Sessions', 'Zend Framework 2 for Newbies', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(6, 1439, 'Sessions', 'Caching and Tuning fun for high scalability', '1/2 Day Tutorial', 'Beginner', 'Cloud, SOA and DevOps'),
(7, 1441, 'Sessions', 'The why and the how of moving to 5.4', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(8, 1472, 'Sessions', 'Object-Oriented JavaScript (yes, it really ex', 'Session', 'Advanced', 'Mobile Application Development - Mobile Front'),
(9, 1482, 'Sessions', 'LEVEL UP!  Migrating your ZF1 app to ZF2', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(10, 1488, 'Sessions', 'Introducing Tests in Legacy PHP Applications', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(11, 1507, 'Sessions', 'Virtualization for Developers using Zend Serv', 'Session', 'Advanced', 'Cloud, SOA and DevOps'),
(12, 1522, 'Sessions', 'MongoDB introduction', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(13, 1524, 'Sessions', 'Xdebug', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(14, 1607, 'Sessions', 'Implementing Generic Multi-Protocol API at Sp', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(15, 1612, 'Sessions', 'Introduction to PostgreSQL', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(16, 1613, 'Sessions', 'Business Logic Security', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(17, 1673, 'Sessions', 'PHPUnit: Recipes for Success', '1/2 Day Tutorial', 'Beginner', 'Professional PHP & Best Practices'),
(18, 1674, 'Sessions', 'Test{able|ing} Zend Framework 2 Applications', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(19, 1681, 'Sessions', 'Clean Application Development', '1/2 Day Tutorial', 'Intermediate', 'Professional PHP & Best Practices'),
(20, 1708, 'Sessions', 'MySQL HA, Recovery and Load Balancing', 'Session', 'Advanced', 'Cloud, SOA and DevOps'),
(21, 1737, 'Sessions', 'Testing Essentials: Mock Objects Explained', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(22, 1750, 'Sessions', 'Extending the Zend Server UI & WebAPI', '1/2 Day Tutorial', 'Advanced', 'Professional PHP & Best Practices'),
(23, 1767, 'Sessions', 'Build secure applications with Zend Framework', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(24, 1770, 'Sessions', 'Use OpenStack with Zend Framework 2', 'Session', 'Beginner', 'Cloud, SOA and DevOps'),
(25, 1790, 'Sessions', 'Developing PHP cloud backends for your mobile', 'Session', 'Intermediate', 'Mobile Application Development - Mobile Front'),
(26, 1807, 'Sessions', 'MariaDB 10.0: What''s New', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(27, 1830, 'Sessions', 'Zend PHP Certification Boot Camp', 'Full Day Tutorial', 'Intermediate', 'Professional PHP & Best Practices'),
(28, 1838, 'Sessions', 'Doctrine ORM and Zend Framework 2', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(29, 1861, 'Sessions', 'Using Logs to Help You Stop Your App From Doi', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(30, 1886, 'Sessions', 'Building a mobile app in 30 minutes', 'Session', 'Intermediate', 'Mobile Application Development - Mobile Front'),
(31, 1889, 'Sessions', 'ZF2: Building a SOA Architecture', 'Session', 'Intermediate', 'Cloud, SOA and DevOps'),
(32, 1894, 'Sessions', 'PHP development in Zend Studio in cloud-orien', 'Session', 'Beginner', 'Cloud, SOA and DevOps'),
(33, 1895, 'Sessions', 'Zend Server + Zend Studio - how integration m', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(34, 1896, 'Sessions', 'PDT (PHP Development Tools) as a competitive ', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(35, 1897, 'Sessions', 'Practical ZF1 to ZF2 Migration: Lessons from ', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(36, 1901, 'Sessions', 'What I Learned about "Mobile-First" by Not Go', 'Session', 'Beginner', 'Mobile Application Development - Mobile Front'),
(37, 1902, 'Sessions', 'PHP on IBM i Performance Workshop', 'Full Day Tutorial', 'Intermediate', 'Professional PHP & Best Practices'),
(38, 1904, 'Sessions', 'A Tale of Two Apps', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(39, 1907, 'Sessions', 'Enterprise Development on a Shoestring Budget', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(40, 1910, 'Sessions', 'Contributing to Core: My Journey to Add array', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(41, 1913, 'Sessions', 'PaaSing Your Code Around', 'Session', 'Intermediate', 'Cloud, SOA and DevOps'),
(42, 1916, 'Sessions', 'Using Unicode with PHP', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(43, 1922, 'Sessions', 'Socket Programming with PHP', 'Session', 'Advanced', 'Professional PHP & Best Practices'),
(44, 1924, 'Sessions', 'DOs and DON''Ts of MongoDB', 'Session', 'Intermediate', 'Cloud, SOA and DevOps'),
(45, 1927, 'Sessions', 'Doctrine, Object Persistence and You', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(46, 1928, 'Sessions', 'PHP Batch Jobs for IBM i', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(47, 1929, 'Sessions', 'PHP Toolkit from Zend and IBM', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(48, 1930, 'Sessions', 'DB2 and PHP Best Practices on IBM i', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(49, 1932, 'Sessions', 'API First', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(50, 1933, 'Sessions', 'Grokking HTTP', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(51, 1934, 'Sessions', 'Introduction to Modules in Zend Framework 2', '1/2 Day Tutorial', 'Beginner', 'Professional PHP & Best Practices'),
(52, 1935, 'Sessions', 'JavaScript Communication APIs', 'Session', 'Intermediate', 'Mobile Application Development - Mobile Front'),
(53, 1938, 'Sessions', 'Do You Speak Design Patterns in PHP?', '1/2 Day Tutorial', 'Beginner', 'Professional PHP & Best Practices'),
(54, 1939, 'Sessions', 'Zend Framework 2 Jump Start', '1/2 Day Tutorial', 'Beginner', 'Professional PHP & Best Practices'),
(55, 1941, 'Sessions', 'Compose This', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(56, 1942, 'Sessions', 'Building Models in ZF2: A Crash Course', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(57, 1944, 'Sessions', 'Relax with ZF2: RESTful APIs', 'Session', 'Intermediate', 'Professional PHP & Best Practices'),
(58, 1945, 'Sessions', 'Zend PHP Certification Boot Camp Part 2', '1/2 Day Tutorial', '', ''),
(59, 1946, 'Sessions', 'PHP on IBM i Performance Workshop Part 2', '1/2 Day Tutorial', '', ''),
(60, 1947, 'Sessions', 'What''s New in PHP 5.5', 'Session', '', 'Professional PHP & Best Practices'),
(61, 1948, 'Sessions', 'Professional eCommerce with Magento & Zend', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(62, 1952, 'Sessions', 'Nginx: The Need for Speed', 'Session', 'Beginner', 'Professional PHP & Best Practices'),
(63, 1967, 'Sessions', 'Essential Git for Developers', 'Session', 'Beginner', ''),
(64, 1937, 'Events', 'Expo', '', '', ''),
(65, 1955, 'Events', 'Expo', '', '', ''),
(66, 1956, 'Events', 'Lunch in Expo', '', '', ''),
(67, 1957, 'Events', 'Lunch in Expo', '', '', ''),
(68, 1959, 'Events', 'Opening Keynote', '', '', ''),
(69, 1960, 'Events', 'Keynote', '', '', ''),
(70, 1961, 'Events', 'Opening Reception', '', '', ''),
(71, 1962, 'Events', 'Closing Keynote', '', '', ''),
(72, 1963, 'Events', 'Meet the Team', '', '', ''),
(73, 1964, 'Events', 'Keynote', '', '', ''),
(74, 1965, 'Events', 'Keynote', '', '', ''),
(75, 1966, 'Events', 'Tutorial Lunch', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `session_abstract`
--

CREATE TABLE IF NOT EXISTS `session_abstract` (
  `session_key` int(11) NOT NULL,
  `abstract` text,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session_abstract`
--

INSERT INTO `session_abstract` (`session_key`, `abstract`) VALUES
(1104, 'So you''ve heard about this cloud thing and have a server running on EC2, it''s time to scale up and you''re wondering how to account for multiple database, multiple application servers, search servers, and caching, oh my.  We''ll walk through a simplified overlay of a working infrastructure and discuss the tools that exist for keeping your sanity.'),
(1136, 'Making your web application scale is always tough. This talk is a discussion & overview of the typical ways to scale LAMP apps in the past, and how you can now do this more easily on the cloud, specifically using Amazon Web Services such as EC2, RDS, S3 and more. AWS has a rich feature set that makes having a scalable app easier than ever before.'),
(1263, 'Nothing is as frustrated as deploying a new release of your web application to find out functionality you had doesn''t work anymore. Of course you have all your unit tests in place and you run them through your CI environment, but nothing prepared you to a failing javascript error or a link that doesn''t work anymore.\n\n\nWelcome to User Acceptance testing or UAT. Before you start putting real people in front of your application, create macros and export them as PHPUnit test classes. Then run them in an automated way just like your unit tests and hook them into your CI.\n\n\nIn this talk I will show you how easy it is to create Selenium macros that can be converted into PHPUnit scripts and run automatically on different virtual machines (VM''s) so you can test all different browsers on a diversity of operating systems.'),
(1267, 'Everyone talks about raising the bar on quality of code, but it''s always hard to start implementing it when you have no clue where to start. With this talk I''m shooing that there are many levels developers can improve themselves by using the right tools. In this talk I''ll go over each tool with examples how to use them against your codebase. A must attend talk for every developer that wants to scale up their quality.\n\nMost PHP developers deploy code that does what the customer requested but they don''t have a clue about the quality of the product they deliver. Without this knowledge, maintenance can be a hell and very expensive.\n\nIn this workshop I cover unit testing, code measuring, performance testing, debugging and profiling and give tips and tricks how to continue after this workshop.'),
(1339, 'WordPress boasts a "5 minute install," wouldn''t it be nice if we could get a ZF2 site up and running in less than 5 minutes?  Wouldn''t it be nice to be able to start using ZF2 right away without a huge bell curve?  In this session we''re going to be utilizing the ZF2 Skeleton app to show you how to quickly install and get ZF2 up and running, as well as the basics of the framework so that at the end of the session you can walk out and have your own ZF2 site up and running within minutes.'),
(1439, 'Caching has been a ''hot'' topic for a few years. But caching takes more than merely taking data and putting it in a cache : the right caching techniques can improve performance and reduce load significantly. But we''ll also look at some major pitfalls, showing that caching the wrong way can bring down your site. If you''re looking for a clear explanation about various caching techniques and tools like Memcached, Nginx and Varnish, as well as ways to deploy them in an efficient way, this talk is for you.\nIn this tutorial, we''ll start from a Zend Framework based site. We''ll add caching, begin to add servers and replace the standard LAMP stack, all while performing live benchmarks.'),
(1441, 'With PHP 5.4 out and many production environments still running 5.2 (or older), it''s time to paint a clear picture on why everyone should move to 5.3 and 5.4 and how to get code ready for the latest version of PHP. In this talk, we''ll migrate an old piece of code using some standard and some very non-standard tools and techniques.'),
(1472, 'Mobile development has focused much of its energy on HTML5 and thick client applications. Many frameworks used for these applications employ an object-oriented model, but few developers truly understand how OOP - and prototypical inheritance in particular - works in JavaScript. This talk will give attendees a crash course in Object-Oriented JavaScript covering many of the concepts needed to compete in the mobile application development ecosystem. This includes:\n\n* core OOP principles\n* the prototype object and constructors\n* member access types (public, private, & privileged)\n* prototypical inheritance\n* interfaces (mixins)\n\nDevelopers will come out of this session ready to implement core OOP concepts in JavaScript and with knowledge of how inheritance in JavaScript differs from many of the other languages they know.'),
(1482, '<p>"How do I upgrade my application to Zend Framework 2?" is one of the most asked questions in the Zend Framework community. While there is no upgrade path (as such) from Zend Framework 1 to 2, migrating really involves some small changes to your model code, and rewriting and refactoring your framework specific classes.</p>\n\n<p>Luckily, refactoring your application to Zend Framework 2 is not as scary or complex as you''d imagine. Getting to know Zend Framework 2 can be fun, and you''ll love the new features and functions available in the newer framework. In this session, we will take a fully fledged Zend Framework 1 site, and transplant it so it runs perfectly in Zend Framework 2.</p>\n\n<p>We will cover:\n<ul>\n<li>Migration Strategy (“strangler” versus “big bang”) </li>\n<li>Modules </li>\n<li>Controllers</li>\n<li>Configuration</li>\n<li>View Scripts </li>\n<li>Helpers </li>\n<li>DbTable to TableGateway </li>\n<li>Forms </li>\n</ul>\n\n<p>At the end of this talk, you''ll understand exactly where the parts of your ZF1 application fit into ZF2, and be raring to get started on your new ZF2 project... you can do it!</p>'),
(1488, 'You know testing is beneficial to your project. You are familiar with merits and caveats of test-driven development. But the project you’re hacking on right now is what most would call a legacy application. How do you apply your test knowledge to an application that doesn’t lend itself to traditional unit testing? The answer most will give is, “you don’t,” but we’re going to look at ways to write tests now that will allow you to improve and refactor your application to evolve the code to a more manageable state. The traditional “easy” route to dealing with legacy code is to rewrite but a little patience and skill applied to writing tests will yeild better results.'),
(1507, 'Know it or not my fellow developers, the world has moved to virtualization, yet so many of us are still stuck in the stone age developing their applications locally on their machines and then struggling with the subtle differences between their environments and production. Not to mention the pain of deployment. It doesn''t have to be this way! Through open source tools such as VirtualBox and puppet, combined with a PHP distribution such as Zend Server, you can create highly effective consistent development environments for anything you need quickly. Even better, you can reuse almost all of your hard work when deploying to the cloud. This talk will show you how to take a ton of pain out of managing your servers, from the dev environment, to staging all the way to the production cloud complete with live demos of how it all fits together.'),
(1522, 'MongoDB is a scalable, high-performance, open source, document-oriented NoSQL\ndatabase. It features document-oriented, JSON-based document storage and\ndynamic schemas providing simplicity, power and flexibility, combined with\nfull indexes similar to what a traditional RDBMS user would expect. MongoDB\nalso provides solid replication & high availability features as well as an\nauto-sharding system for transparent horizontal scalability.\nThis talk introduces MongoDB for developers who aren''t familiar with it. I \nwill cover MongoDB''s CRUD features, aggregation, geospatial indexes, GridFS\nas well as the replication and sharding functionality.'),
(1524, 'This session teaches you how to detect and debug PHP scripts with the free\nopen source tool Xdebug, which is an extension to PHP. The first part will\nquickly show how to get started with Xdebug.  The second part of the session\nwill cover detecting problems in your scripts by showing how Xdebug provides\ndebugging aides in the form of stack/function traces, dumps of variables,\nmodified PHP functions. In the last part I will show the remote debugger \ncapabilities of Xdebug with different IDEs, where you can: set breakpoints on\nfunctions, methods and file/line combinations and evaluating error messages.\nOn top of this you will also see how you can use Xdebug''s profiler to find\nbottlenecks in your applications. I will be focussing on the least known\nfeatures of Xdebug.'),
(1607, 'Gotta write an API? It''s easy - you pick your protocol and set of principles (RESTful ROA, SOA) and away you go. But you''re picking your poison.\n\nEven though starting out may seem like a no-brainer, a relatively short investment into doing things right from the start will determine the technical fate of your system.\n\nThis talk will walk through the high level architecture of the API. Then we''ll take a deep dive into each individual component and discuss logical separation to keep those components flexible and easily extensible. We will learn how to avoid common pitfalls. And finally, watch as we demonstrate how to enhance any new or existing system with a general purpose multi-protocol API.'),
(1612, 'The following session will be an introduction to PostgreSQL and how to\nwork with it from PHP. The session will identify the key\nadvantages of Postgres as a database system, it''s specific\nfunctionality''s that can simplify work-loads for developers and DBAs\nalike. This portion of the presentation will be done through practical code\nexamples and demonstrate how to work with Postgres from PHP using\nboth PDO and Pgsql extension. There will be also something for people\nlooking to migrate from MySQL to PostgreSQL identifying some key\ndifferences between these two database system.'),
(1613, 'This session will outline security practices and solutions designed to address security issues within application''s business and processing logic, which are often overlooked in favour of basic security flaws such as SQL Injection, XSS, etc... The session will focus on how to implement mechanisms for improving data access, avoiding common ACL pitfalls, etc..'),
(1673, 'Software is never perfect. Failures of software make the news, damage the reputation of companies, and cost money in lost revenue. Testing software early and in a small scope is good, a high degree of test automation is even better.\n\nIf only it were that simple. In reality, not all code is easy (enough) to test.\n\nSebastian Bergmann, creator of PHPUnit, will open his bag of tricks and demonstrate how you can test code that is hard to test. Stefan Priebsch, a proven expert on software architecture and design, will show how you can avoid these tricks by making untestable code testable. Together they will show how to write clean and testable code, including unit tests, in a live pair programming session.'),
(1674, 'Zend Framework 2 is a popular framework for developing web applications and services in PHP. But just because you use an off-the-shelf framework as the foundation for your development effort does not mean that you do not need to think about the architecture, design, and testability of the software you''re building anymore. This session, presented by the creator of PHPUnit, teaches best practices you can use to ensure that your Zend Framework 2 application is easy to test and explains how to test it with PHPUnit.'),
(1681, 'No matter what level of development we are at in our careers we all face a daily battle to write good code for ourselves and others, deliver finished applications fast to satisfy business, and ensure everything is tested to prevent end-user fails. In this session we will discuss what “clean application development” is, and how it can help us win those battles. The talk will provide practical and usable examples to take with you, integrate into your workflow, and continue to grow into good habits. (Topics: Version control, refactoring, coding standards, frameworks, architecture, automation, time management, and more.)'),
(1708, 'Using MySQL Server and Percona XtraDB Cluster we will take a look at several possible replication configurations for MySQL high-availability, disaster recovery and load-balancing.\n\nAfter comparing them for administration ease, scalability of reads and writes, robustness of the system for errors and time for data recovery as well as looking at how they impact your code-layer we will discuss the ins-and-outs of each setup, looking at the pros and cons, and what trade-offs you will need to make depending on your needs.'),
(1737, 'One of the critical aspects of testing to understand is how to use test doubles. Mock objects is a subject that can be difficult to grasp and often developers find themselves feeling like they are mocking too much and testing too little. In this session we will cover test doubles with a focus on mock objects, explaining how they are used as well as why they are used. After this session you will have a renewed confidence in writing tests and be well on your way to writing effective unit tests or specs for your code.'),
(1750, 'The Zend Server 6 UI was built with extensibility in mind. Already, there are a few custom modules out there for extending the UI''s functionality and more to come.\n\nThis tutorial will take you through the basic steps of using Zend Server''s infrastructure and the basic facilities used throughout our UI''s code. Then we will create our own custom UI with action and generate a suitable new WebAPI action to accommodate our new desired functionality.\n\nFinally, we will take a brief tour of a few existing modules written for Zend Server and their usage.'),
(1767, 'Security is a very important aspect of web applications and is not only limited to "filter the input and escape the output". In this talk we will present the security features of Zend Framework 2 that can help PHP developers to build secure web applications. We will talk about the Authentication and Authorization component, the Escaper component and the Cryptographic component that can be used to safely store user''s password and protect sensitive data using strong cryptographic algorithms like AES, Bcrypt, Scrypt, RSA, etc.'),
(1770, 'OpenStack is becoming the open source standard for cloud computing. Most of the cloud vendors use OpenStack and the community of users is growing every day. In this talk we will give a brief introduction to OpenStack and we will present the new library service for Zend Framework 2 that supports the last version of the OpenStack API. You will see how is easy to use the OpenStack API with ZF2 thanks to a friendly object oriented interface.'),
(1790, 'Grant Shipley, lead Evangelist for OpenShift, will demonstrate how to develop iPhone and Android apps with MongoDB and Zend backends for the cloud. Let''s skip having to learn three different languages and jumpstart the development process using what you already know (Javascript and PHP).  We will start by using Zend Server and Zend Studio to develop our backend.  Next, we''ll deploy our app to the cloud and explore a few tips and tricks for managing the MongoDB backend. Finally we''ll pull out our smartphones and bask in the awesomeness of our apps! Nothing complicated, nothing convoluted. Just straight ahead mobile development goodness with Zend, MongoDB, javascript, and OpenShift.'),
(1807, 'If you''re maintaining and old application, you may want or not want to upgrade your database server. But if you start developing something new, you should know what the recent releases are capable of.\n\nMariaDB 10.0 is the latest stable branch of MariaDB, with many new features in replication, optimizer, administration, and other areas. This talk will go over everything new that MariaDB 10.0 has to offer. It will describe the new features, both MySQL 5.6 compatible, and MariaDB-only extensions, and show the usage examples and practical use cases.'),
(1830, 'The Zend PHP 5.3 Certification is the industry standard to test a candidate''s knowledge of PHP and to aid employers to select suitable developers. Learn what it takes to become a Zend Certified Engineer (ZCE) by one of the authors of the certification. We will have a look at all topic areas, discuss common traps and required knowledge for each of them, and will provide you with background information on the test. The full-day tutorial will be conducted by one of the authors of the certification and will feature a number of typical questions that resemble the layout of the actual test questions, giving you a realistic impression of the test itself and aiding you in self-assessing your current PHP knowledge. In addition, you will have the opportunity to take the test right at the conference (limited availability).'),
(1838, 'Why would you want to use an ORM in a software project based on top of Zend Framework 2?\nI will show you how to get started with the the well known Doctrine 2 ORM in a Zend\\Mvc application, \ndescribing how to avoid common mistakes and how to follow best practices when using these \nsophisticated tools. Installation of DoctrineModule, its usage and its numerous features will also\nbe covered, and you will even learn how to make your application portable across multiple RDBMS \nvendors and even other platforms such as MongoDB, PHPCR or OrientDB!'),
(1861, 'No one starts building software planning on doing dumb things. But software grows, evolves and changes over time. Sometimes dumb things just creep in. It could start with a new feature, a poorly executed refactor, bug fixes that introduce new bugs, etc. Your application log can help you gain insight into what your application is really doing.\n\nSince it''s often impossible if not ill-advised to debug running processes in production, well-placed log messages can provide insight into what your application is doing and allow you to determine places where your logic isn''t doing what it should, when your code is instantiating too many objects or perhaps it''s hitting that bit of code that is "impossible" to reach.\n\nI''ll show how to quickly implement an application log using Zend_Log which you can easily attach throughout various locations in your application. Logging and log analysis can help you find parts of your application that need some attention.'),
(1886, 'Mobile apps have rapidly changed how people interact with technology, and their importance continues to grow. Come learn how to build robust mobile apps with Zend Studio, how to get them to communicate with a PHP back-end and consume PHP services, and how to leverage the cloud in the process. In this session Jan will demonstrate how to control and monitor a Zend Server instance with a ZF2 application and a smartphone.'),
(1889, 'Building a SOA Architecture is a walk-through of service-oriented architecture and how it applies to Zend Framework 2.  In this session you will learn about the importance of service design from the service itself through the mapper into the data store while working with entities.  This session attempts to be progressive in nature to allow you to see how you can expand each layer of your SOA architecture to bring in advanced functionality.  For example attaching an event manager to automatically trigger default behavior, provide extensibility all while abstracting away details.  This session should prepare you to build out a more advanced SOA based architecture which will work well for future needs!'),
(1894, 'Zend Studio does provide set of useful features to work with a local Zend Server but does not forget about cloud services. There is not only a set of different services supported (Phpcloud, OpenShift, CloudOE/SmartCloud) by very smooth and ease to use workflows. This session will focus on the most important aspects, including transparent work with different local/remote/cloud targets. First part will be dedicated to presentation of different cloud services and how they are supported in Studio. The second part will focus on a workflow which will cover full application development, including switching between local Zend Server, Phpcloud and Openshift/CloudOE/SmartCloud in different development stages.'),
(1895, 'Zend Studio provides set of features which actually very closely integrate Zend Studio and Zend Server. This session will focus on existing (sometimes hidden or unknown) and new features related to Zend Studio - Zend Server integration, including improved debugging, Debug Mode, Application Monitoring, Auto Upload, tunneling and deployment. Each of them will be presented as a part of real life Zend Framework application development.'),
(1896, 'PDT (PHP Development Tools) is a free Open Source IDE for creating, developing and distributing all kinds of PHP applications (from student''s project to the enterprise platform). The set of its features is powerful enough to handle even the most demanding users but in a lot of cases they just do not know about them. This session will be divided into two parts. First one will be focused on a set of new features recently introduced in PDT (including some Zend Studio features). The second one will show some tricks and useful features which can make development faster and easier.'),
(1897, 'While there is a growing body of documentation, blog posts, and tutorials available about how to migrate an existing Zend Framework-based application from version 1 to 2, here is your opportunity to hear from Zend Consultants what we''ve learned from planning, guiding, and implementing migrations.  Planning strategies, practical lessons, pitfalls to avoid, ROI considerations, where you can expect to see the greatest benefits, and - surprise: when you probably don''t need to migrate at all!'),
(1901, 'I built my first mobile application from an existing desktop-oriented web site. Both mobile and desktop users, whether the public, subscribers, or site administrators, had to be accommodated indefinitely. Hear what went right, what gave me trouble, and walk away from the session with a list of practical do''s and don''ts, so you start out better prepared to plan and build your "mobile-first, with possible desktop-to-follow" web application that is easier to maintain and performs well under load.  Includes a brief history of this application''s ZF1 to ZF2 migration. Also learn how Zend Studio 10 and the Zend Server Gateway made the journey much easier.'),
(1902, 'Say you''re ready to deploy your new, functionality-rich application to users, but will it perform? A slow application will not be accepted by users, whereas a fast one will be enhanced by its speed. Learn how to ensure excellent performance for your PHP applications running on, or connecting to, IBM i. We will cover the entire ecosystem in depth: how to measure performance and identify bottlenecks, optimize your use of frameworks, learn Zend Server performance tools, DB2 best practices for performance with PHP (new material here), the fastest ways to call your RPG or COBOL programs, including stored  procedures and special tips for the toolkit, IBM i tools that make performance troubleshooting a pleasure but that you never heard of, tips on connecting to IBM i from a non-i PHP server, and how to optimize front end code (CSS, javascript, etc.). Bring your specific performance questions for us to answer. This workshop contains material not available anywhere else. You will return to your office brimming with ideas to make your application fly.'),
(1904, 'At one point in time, I was the technical lead on two different projects. One was an application we were purchasing from a vendor that was being written in Java (and had previously been written in .NET by another vendor, who then switched to Java, and then abandoned the project), and one was being built in-house with PHP on the IBM i. They were the same product for two different product lines that we offered, but time constraints forced us to build two products in tandem. In the end, the PHP application was completed and delivered to end-users in about 7 months from start to finish, while the former project languished. We''ll compare the two projects in the tools and technologies that were used to integrated with the IBM i backend as well as programming.'),
(1907, 'No matter what language you use, developing code is the same – spec, code, deploy, maintain. The “Big Boys” have teams to manage each task, but what happens when you don’t? I’ll go over some different methods for maintaining internal and external programs that are cheap, open source, and make your life easier. PHP has a plethora of tools for us to use to effectively code and maintain our projects; and the best part is that they are generally inexpensive or even free. The trick is finding and using these tools effectively in a workflow that the developer can use.'),
(1910, 'A few years ago, I had a simple idea to add a new function to the PHP core: array_column(). Starting out on this journey to contribute to the core can be daunting to user-land developers unfamiliar with the landscape of the PHP internals. It can be tough to navigate these seemingly uncharted waters, but the recent move of the PHP source to Git has removed many of the old barriers. Nevertheless, there is a protocol  involved, and I''d like to demystify the process in this talk, explaining how to go about setting up your environment, creating an RFC, communicating on the proper mailing lists, and sending your pull request. I hope this talk will encourage you to scratch your own itch and contribute to the PHP core.'),
(1913, 'PaaS (Platform as a Service) is hot topic in the PHP world, with many different providers vying to run your code. I''ll look at what it takes to get your code to run on the common PaaS services, and compare and contrast them on their offerings and performance.'),
(1916, 'Your application is great - and popular.  You have translation efforts underway, everything is going well - and wait a minute, what''s the report of strange question mark characters all over the page?\n\nUnicode is pain.  UTF-32, UTF-16, UTF-8 and then something else is thrown in the mix ... Multibyte and codepoints, it all sounds like greek.  But it doesn''t have to be so scary.\n\nPHP support for Unicode has been improving, even without native unicode string support.  Learn the basics of unicode is and how it works, why you would add support for it in your application, how to deal with issues, and the pain points of implementation.'),
(1922, 'Socket programming is the workhorse of the internet.  But there''s far more to sockets than just HTTP.  Although many of the design decisions for PHP have been optimized to solve web specific problems, that doesn’t mean that it doesn’t have very capable tools for other types of programming.\n\nPHP has not only one but two sets of comprehensive tools for working with sockets.\n\nThe socket apis in PHP can support everything you would need.  The streams api and can be used to rapidly build applications and the sockets extension gives low level control over every aspect of socket communication.\n\nLearn about socket and network socket programming basics, sockets with php streams, sockets with the php sockets extension, and finally using websockets (part of html5) with PHP'),
(1924, 'There are no "best practices" without "worst practices". When it comes to databases, this may include any number of things ranging between blindly trusting an ORM to never devising a backup/restore strategy; MongoDB is no exception. In this presentation, we''ll walk through various use cases for MongoDB and cover topics such as schema design, querying, operations and methods of data aggregation. Tips and caveats will be sprinkled throughout the session as we look at DOs and DON''Ts realized over three years of using MongoDB on several projects.'),
(1927, 'The Doctrine project has come a long way from its humble beginnings as a SQL-centric active record library. No longer just an ORM, the project now implements object document mappers (ODMs) for many alternative databases (e.g. MongoDB, CouchDB, PHPCR). Object persistence and plain old PHP objects have replaced the active record pattern and base classes of yore, which is great news for folks that like their models skinny.\n\nThis session will discuss the practical benefits (and caveats) of object persistence offered by Doctrine ORM/ODM. We will look at data modeling utilizing Doctrine''s common annotation library, and then explore the interfaces for getting our data in and out of the database by way of Doctrine''s repository classes and rich query builder API.\n\nFinally, we will wrap up with a survey of the Doctrine family of projects outside of object persistence, which include lower-level database abstractions and common libraries such as cache and annotations.'),
(1928, 'PHP is famous for its ability to build web-based front ends, but it''s also a flexible tool to use within batch processes. Alan will show how to accomplish marvelous tasks by calling PHP from ordinary CL programs and with Job Queue functionality in Zend Server.\nWe''ll start with a primer on PASE and PHP-CLI, then quickly move on to topics such as creating Excel spreadsheets, sending e-mail, and creating graphical PDF files, all in batch.\nProgrammers, analysts, and operations professionals will get many ideas for how to streamline applications and operations using PHP Batch techniques, using both PHP-CLI and Zend Job Queue, and how to combine them for even more power.'),
(1929, 'PHP applications on IBM i have a great way to access resources such as RPG and COBOL programs, system commands, data areas, and more, using a free, flexible, open source toolkit, supported by Zend. Using IBM''s XMLSERVICE toolkit on the back end, it''s all open source, enabling a high level of quality and functionality delivered by Zend, IBM, and IBM i community members who take the initiative.\n\nYou will learn how your older PHP applications can use the new toolkit with minimal changes, thanks to the Compatibility Wrapper (CW), and how to optimize performance, develop PHP on your laptop (Windows, Linux) or in the "cloud" and deploy to the IBM i, including suggestions for security, troubleshooting, and with tips and tricks to work with your IBM i in new ways.'),
(1930, 'DB2 can provide improved performance, data integrity, remote connectivity, and security. This talk will show many tips and techniques for developing and configuring DB2-based PHP applications on IBM i. You will learn how to get the best performance from DB2 with PHP on IBM i, know how to set a library list, and understand how to connect to IBM i DB2 from Windows and Linux.'),
(1932, 'A recent theme among web creators is the notion of mobile first. It''s the idea that we should design first for the mobile experience. Throw in the concepts of progressive enhancement and responsive design, and we have some excellent approaches to interface design and development. But where does that leave the overall software design? How do we get all the data to the interface and manipulate it without building a lot of back-end scripts to drive the various front-end incarnations? A centralized API will solve these problems, but we''re often scrambling to implement the "mobile first" strategy on top of existing code. For good web software design, it''s time to start thinking in terms of API first.\n\nIn this talk, Ben Ramsey pulls from his experience making APIs to discuss how you can begin projects with an API-centric mindset and use this to your advantage to deliver software quickly, more efficiently, and with higher quality. If you already have projects that began life without APIs, then have no fear. Ben will also share how to use the same principles to convert existing web applications to API-backed software…with some elbow grease, of course.'),
(1933, 'Hypertext Transfer Protocol is the protocol of the Web. From static HTML pages to massive web services, everything we do as web developers has some relationship to this protocol. To effectively create services that use the Web, we need a deep understanding of HTTP. This talk goes beyond a surface understanding of GET and 200 OK to explore how an intimate knowledge of HTTP can lead to more efficient applications utilizing the Web in a RESTful way. This deeper dive version of this talk covers topics such as content negotiation, hypermedia, caching, and conditional requests, as well as recent developments in efforts to update HTTP.'),
(1934, 'One of the highly anticipated new features of Zend Framework 2 is the introduction of an all new and powerful approach to modules. This new module system has been designed with flexibility, simplicity, performance, and re-usability in mind.\n\nIn this interactive workshop, Evan Coury, the author of the new ZF2 module system, will explain everything ZF2 modules have to offer, while covering the process and strategies for building effective, reusable ZF2 modules leveraging fundamental ZF2 concepts such as services and events. By the end of the workshop, you’ll have the basic knowledge and examples necessary to begin building great modular applications with Zend Framework 2.'),
(1935, 'One of the main weaknesses of the web model has always been the communication story: you either required plugins or JavaScript, and the latter is running with a lot of restrictions in place. Luckily, recent JavaScript developments, including HTML5 and related specifications, provide new approaches and standards for communication. This session will first introduce existing limitations and then demonstrate and discuss various workarounds and new APIs. We will also survey what to use when. And yes, we will also talk about web sockets, however spend a lot of time on alternatives, too.'),
(1938, 'In this tutorial we want to present some of the most used design patterns in PHP. We will introduce the patterns in a pratical way, that means coding!\nNo boring slides, only live coding. We will introduce the problems that we want to solve using the pattern and we will solve it together with a real live example in PHP. That means you need to bring your laptop, a cup of coffee, and you will be ready to participate to this tutorial. And don''t worry; you will not be graded for your efforts!'),
(1939, 'Curious about Zend Framework 2? Don''t know where to start? Or where to go once you''ve finished the tutorial? Grab some coffee and your laptop, and prepare to dive into the framework during this tutorial. Learn:\n\n- about Events, how to trigger them, how to listen for them, and why they''re so\n  useful!\n- about Services, all the different ways you can create them, and how the\n  ServiceManager gives you flexibility and extensibility!\n- how to create a module, composing services and wiring events to bend the MVC\n  to your will!\n\nThis will be a hands-on tutorial, with a variety of exercises. Come prepared to work and learn!'),
(1941, 'Dependency management is the norm for operating systems, but a relative late-comer to PHP. In the past couple years, however, we''ve seen a renaissance due to the rise of Composer, a PHP application dependency management tool.\n\nIn this session, you''ll learn what Composer is and how to get it; how to add dependencies to your project; how to keep your project current; and how to slipstream in your own projects or forks when needed. On top of that, you''ll learn how to use Composer to create a custom, project-specific autoloader, and how you can create your own Composer repository via the Satis project.'),
(1942, 'Out of the box, ZF2 does not give you a modeling framework with any strong opinions on how to best build application models.  Doctrine is a good solution for a full stack modeling framework, but what if you want less abstraction and infrastructure.  ZF2 gives you the tools to accomplish any style of M your MVC needs.\n\nThis talk will describe some of the patterns you might employ to achieve varying degrees of abstraction in your models: from direct Table Gateway consumption using Zend\\Db through to a complete DDD Domain Model with several stops along the way. In the end, you should have a good grasp on which patterns to employ for a given project, and know fully what the pros/cons are of such decisions.'),
(1944, 'Web services got you down? Stressed out over what protocol to choose for your new API, or unsure how you''re going to adapt your code to the Richardson Maturity Model? Never heard of the Richardson Maturity Model?\n\nIn this session, learn the fundamentals of REST, and apply them in ZF2. We''ll cover Hypermedia Application Language, and why it''s a great starting point for building RESTful APIs, particularly with JSON. You''ll also discover tools and modules you can use with ZF2 to make building RESTful JSON APIs a breeze, so you can get back to that relaxing weekend you had planned.'),
(1945, 'The Zend PHP 5.3 Certification is the industry standard to test a candidate''s knowledge of PHP and to aid employers to select suitable developers. Learn what it takes to become a Zend Certified Engineer (ZCE) by one of the authors of the certification. We will have a look at all topic areas, discuss common traps and required knowledge for each of them, and will provide you with background information on the test. The full-day tutorial will be conducted by one of the authors of the certification and will feature a number of typical questions that resemble the layout of the actual test questions, giving you a realistic impression of the test itself and aiding you in self-assessing your current PHP knowledge. In addition, you will have the opportunity to take the test right at the conference (limited availability).'),
(1946, 'Say you''re ready to deploy your new, functionality-rich application to users, but will it perform? A slow application will not be accepted by users, whereas a fast one will be enhanced by its speed. Learn how to ensure excellent performance for your PHP applications running on, or connecting to, IBM i. We will cover the entire ecosystem in depth: how to measure performance and identify bottlenecks, optimize your use of frameworks, learn Zend Server performance tools, DB2 best practices for performance with PHP (new material here), the fastest ways to call your RPG or COBOL programs, including stored procedures and special tips for the toolkit, IBM i tools that make performance troubleshooting a pleasure but that you never heard of, tips on connecting to IBM i from a non-i PHP server, and how to optimize front end code (CSS, javascript, etc.). Bring your specific performance questions for us to answer. This workshop contains material not available anywhere else. You will return to your office brimming with ideas to make your application fly.'),
(1947, 'Overview on new features in PHP 5.5'),
(1948, 'Ever installed Magento and not satisfied with the performance? Actually this is what most DevOps think after they''ve set up the shop system. But Magento is not so monolithic as it seems to be. See in this session how the shop system can be split up in order to make it fully scalable thanks to CDN''s, Data Cache and Full Page Cache. And the best of all: Deploy this system seamlessly in one step into a Cloud environment with Zend Server'),
(1952, 'Nginx is a lightweight, high-performance web server which has been steadily rising in popularity and is used by many of the top websites on the internet. In this session, Evan will cover everything you need to know to get the most out of running your PHP site on Nginx, including PHP-FPM tuning, configuration best practices, common mistakes, tips and tricks -- all backed by years of real-world experience running extremely high-traffic web services on Nginx.');

-- --------------------------------------------------------

--
-- Table structure for table `slot`
--

CREATE TABLE IF NOT EXISTS `slot` (
  `slot_id` int(11) NOT NULL AUTO_INCREMENT,
  `slot_key` varchar(45) NOT NULL,
  `room` varchar(45) DEFAULT NULL,
  `property` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `session_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`slot_id`,`slot_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `slot`
--

INSERT INTO `slot` (`slot_id`, `slot_key`, `room`, `property`, `date`, `start_time`, `end_time`, `session_key`) VALUES
(1, '35', '209', 'Santa Clara Convention Center', '2013-10-09', '11:00:00', '12:00:00', 1104),
(2, '26', '204', 'Santa Clara Convention Center', '2013-10-10', '08:00:00', '09:00:00', 1136),
(3, '6', 'Hall B', 'Santa Clara Convention Center', '2013-10-09', '14:45:00', '15:45:00', 1263),
(4, '53', '204', 'Santa Clara Convention Center', '2013-10-07', '09:00:00', '12:00:00', 1267),
(5, '29', '209', 'Santa Clara Convention Center', '2013-10-08', '10:00:00', '11:00:00', 1339),
(6, '56', '207', 'Santa Clara Convention Center', '2013-10-07', '09:00:00', '12:00:00', 1439),
(7, '4', 'Hall B', 'Santa Clara Convention Center', '2013-10-08', '17:15:00', '18:15:00', 1441),
(8, '12', '203', 'Santa Clara Convention Center', '2013-10-08', '16:00:00', '17:00:00', 1472),
(9, '30', '209', 'Santa Clara Convention Center', '2013-10-08', '11:15:00', '12:15:00', 1482),
(10, '40', '210', 'Santa Clara Convention Center', '2013-10-08', '11:15:00', '12:15:00', 1488),
(11, '20', '204', 'Santa Clara Convention Center', '2013-10-08', '14:45:00', '15:45:00', 1507),
(12, '24', '204', 'Santa Clara Convention Center', '2013-10-09', '16:00:00', '17:00:00', 1522),
(13, '3', 'Hall B', 'Santa Clara Convention Center', '2013-10-08', '16:00:00', '17:00:00', 1524),
(14, '17', '203', 'Santa Clara Convention Center', '2013-10-10', '09:15:00', '10:15:00', 1607),
(15, '45', '210', 'Santa Clara Convention Center', '2013-10-09', '11:00:00', '12:00:00', 1612),
(16, '46', '210', 'Santa Clara Convention Center', '2013-10-09', '14:45:00', '15:45:00', 1613),
(17, '54', '204', 'Santa Clara Convention Center', '2013-10-07', '13:30:00', '16:30:00', 1673),
(18, '34', '209', 'Santa Clara Convention Center', '2013-10-09', '09:45:00', '10:45:00', 1674),
(19, '60', '209', 'Santa Clara Convention Center', '2013-10-07', '13:30:00', '16:30:00', 1681),
(20, '48', '210', 'Santa Clara Convention Center', '2013-10-09', '17:15:00', '18:15:00', 1708),
(21, '15', '203', 'Santa Clara Convention Center', '2013-10-09', '16:00:00', '17:00:00', 1737),
(22, '58', '207', 'Santa Clara Convention Center', '2013-10-07', '13:30:00', '16:30:00', 1750),
(23, '33', '209', 'Santa Clara Convention Center', '2013-10-08', '17:15:00', '18:15:00', 1767),
(24, '23', '204', 'Santa Clara Convention Center', '2013-10-09', '14:45:00', '15:45:00', 1770),
(25, '19', '204', 'Santa Clara Convention Center', '2013-10-08', '10:00:00', '11:00:00', 1790),
(26, '27', '204', 'Santa Clara Convention Center', '2013-10-10', '09:15:00', '10:15:00', 1807),
(27, '51', '203', 'Santa Clara Convention Center', '2013-10-07', '09:00:00', '12:00:00', 1830),
(28, '32', '209', 'Santa Clara Convention Center', '2013-10-08', '16:00:00', '17:00:00', 1838),
(29, '28', '204', 'Santa Clara Convention Center', '2013-10-10', '10:30:00', '11:30:00', 1861),
(30, '2', 'Hall B', 'Santa Clara Convention Center', '2013-10-08', '10:00:00', '11:00:00', 1886),
(31, '31', '209', 'Santa Clara Convention Center', '2013-10-08', '14:45:00', '15:45:00', 1889),
(32, '9', 'Hall B', 'Santa Clara Convention Center', '2013-10-10', '09:15:00', '10:15:00', 1894),
(33, '44', '210', 'Santa Clara Convention Center', '2013-10-09', '09:45:00', '10:45:00', 1895),
(34, '47', '210', 'Santa Clara Convention Center', '2013-10-09', '16:00:00', '17:00:00', 1896),
(35, '36', '209', 'Santa Clara Convention Center', '2013-10-09', '14:45:00', '15:45:00', 1897),
(36, '14', '203', 'Santa Clara Convention Center', '2013-10-09', '11:00:00', '12:00:00', 1901),
(37, '61', '210', 'Santa Clara Convention Center', '2013-10-07', '09:00:00', '12:00:00', 1902),
(38, '43', '210', 'Santa Clara Convention Center', '2013-10-10', '09:15:00', '10:15:00', 1904),
(39, '25', '204', 'Santa Clara Convention Center', '2013-10-09', '17:15:00', '18:15:00', 1907),
(40, '5', 'Hall B', 'Santa Clara Convention Center', '2013-10-09', '17:15:00', '18:15:00', 1910),
(41, '21', '204', 'Santa Clara Convention Center', '2013-10-08', '17:15:00', '18:15:00', 1913),
(42, '50', '210', 'Santa Clara Convention Center', '2013-10-10', '10:30:00', '11:30:00', 1916),
(43, '22', '204', 'Santa Clara Convention Center', '2013-10-09', '11:00:00', '12:00:00', 1922),
(44, '38', '209', 'Santa Clara Convention Center', '2013-10-10', '09:15:00', '10:15:00', 1924),
(45, '7', 'Hall B', 'Santa Clara Convention Center', '2013-10-09', '16:00:00', '17:00:00', 1927),
(46, '41', '210', 'Santa Clara Convention Center', '2013-10-08', '14:45:00', '15:45:00', 1928),
(47, '39', '210', 'Santa Clara Convention Center', '2013-10-08', '10:00:00', '11:00:00', 1929),
(48, '42', '210', 'Santa Clara Convention Center', '2013-10-08', '16:00:00', '17:00:00', 1930),
(49, '8', 'Hall B', 'Santa Clara Convention Center', '2013-10-10', '08:00:00', '09:00:00', 1932),
(50, '13', '203', 'Santa Clara Convention Center', '2013-10-09', '09:45:00', '10:45:00', 1933),
(51, '57', '206', 'Santa Clara Convention Center', '2013-10-07', '13:30:00', '16:30:00', 1934),
(52, '10', '203', 'Santa Clara Convention Center', '2013-10-08', '11:15:00', '12:15:00', 1935),
(53, '59', '209', 'Santa Clara Convention Center', '2013-10-07', '09:00:00', '12:00:00', 1938),
(54, '55', '206', 'Santa Clara Convention Center', '2013-10-07', '09:00:00', '12:00:00', 1939),
(55, '16', '203', 'Santa Clara Convention Center', '2013-10-09', '17:15:00', '18:15:00', 1941),
(56, '37', '209', 'Santa Clara Convention Center', '2013-10-09', '17:15:00', '18:15:00', 1942),
(57, '49', '210', 'Santa Clara Convention Center', '2013-10-10', '08:00:00', '09:00:00', 1944),
(58, '52', '203', 'Santa Clara Convention Center', '2013-10-07', '13:30:00', '16:30:00', 1945),
(59, '62', '210', 'Santa Clara Convention Center', '2013-10-07', '13:30:00', '16:30:00', 1946),
(60, '63', 'Hall B', 'Santa Clara Convention Center', '2013-10-08', '11:15:00', '12:15:00', 1947),
(61, '64', '209', 'Santa Clara Convention Center', '2013-10-10', '08:00:00', '09:00:00', 1948),
(62, '66', '203', 'Santa Clara Convention Center', '2013-10-08', '17:15:00', '18:15:00', 1952),
(63, '80', '203 204', 'Santa Clara Convention Center', '2013-10-09', '14:45:00', '15:45:00', 1967),
(64, '1', 'Hall A', 'Santa Clara Convention Center', '2013-10-08', '11:30:00', '20:00:00', 1937),
(65, '69', 'Hall A', 'Santa Clara Convention Center', '2013-10-09', '11:30:00', '20:00:00', 1955),
(66, '70', 'Hall A', 'Santa Clara Convention Center', '2013-10-09', '12:00:00', '13:30:00', 1956),
(67, '73', 'Hall A', 'Santa Clara Convention Center', '2013-10-08', '12:15:00', '13:30:00', 1957),
(68, '71', '', '', '2013-10-08', '08:30:00', '09:45:00', 1959),
(69, '72', '', '', '2013-10-08', '13:30:00', '14:30:00', 1960),
(70, '74', '', '', '2013-10-08', '18:15:00', '20:00:00', 1961),
(71, '75', '', '', '2013-10-10', '11:45:00', '12:30:00', 1962),
(72, '76', '', '', '2013-10-09', '19:00:00', '20:00:00', 1963),
(73, '77', '', '', '2013-10-09', '13:30:00', '14:30:00', 1964),
(74, '78', '', '', '2013-10-09', '08:30:00', '09:30:00', 1965),
(75, '79', '', '', '2013-10-07', '12:00:00', '13:30:00', 1966);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
