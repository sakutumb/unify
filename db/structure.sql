-- MySQL dump 10.13  Distrib 5.6.25, for osx10.10 (x86_64)
--
-- Host: 192.168.10.99    Database: unify_sql
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_unused_fact_linkedin`
--

DROP TABLE IF EXISTS `_unused_fact_linkedin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_unused_fact_linkedin` (
  `seq_num` int(11) NOT NULL,
  `id` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maiden_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formatted_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonetic_first_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonetic_last_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fomatted_phonetic_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `headline` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_country_code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `industry` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distance` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation_to_viewer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_share` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_of_connections` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `specialities` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture_url` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_profile_url` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_modified_timestamo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proposal_comments` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `associations` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interests` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fact_linkedincol` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`seq_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='linkedln realted table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_unused_fact_linkedin_education`
--

DROP TABLE IF EXISTS `_unused_fact_linkedin_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_unused_fact_linkedin_education` (
  `seq_num` int(11) NOT NULL,
  `id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_of_study` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `degree` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activities` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`seq_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_birth_stars`
--

DROP TABLE IF EXISTS `dim_birth_stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_birth_stars` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_birth_star_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_birth_star_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the birthstar information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_castes`
--

DROP TABLE IF EXISTS `dim_castes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_castes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_caste_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_caste_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COMMENT='Contains the caste details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_cities`
--

DROP TABLE IF EXISTS `dim_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_cities` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_city_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_city_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the city data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_communities`
--

DROP TABLE IF EXISTS `dim_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_communities` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the community data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_countries`
--

DROP TABLE IF EXISTS `dim_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_countries` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `locale_id` int(11) NOT NULL,
  `country_new_code` int(3) DEFAULT NULL,
  `country_old_code` int(3) DEFAULT NULL,
  `country_abbrevation` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_country_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_country_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the country data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_education_level`
--

DROP TABLE IF EXISTS `dim_education_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_education_level` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_education_level_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_education_level_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the education level';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_genders`
--

DROP TABLE IF EXISTS `dim_genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_genders` (
  `id` int(11) NOT NULL,
  `name` varchar(28) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the gender data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_languages`
--

DROP TABLE IF EXISTS `dim_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_language_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_language_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Contains the language data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_locales`
--

DROP TABLE IF EXISTS `dim_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_locales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_religions`
--

DROP TABLE IF EXISTS `dim_religions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_religions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_religion_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_religion_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Contains the religion data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_states`
--

DROP TABLE IF EXISTS `dim_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_states` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_zodiac_signs`
--

DROP TABLE IF EXISTS `dim_zodiac_signs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_zodiac_signs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `language_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_zodiac_sign_dim_language` (`language_id`),
  KEY `FK_dim_zodiac_sign_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_zodiac_sign_dim_language` FOREIGN KEY (`language_id`) REFERENCES `dim_languages` (`id`),
  CONSTRAINT `FK_dim_zodiac_sign_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Contains the zodiac information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_facebook`
--

DROP TABLE IF EXISTS `fact_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_facebook` (
  `id` varchar(64) DEFAULT NULL,
  `about` varchar(64) DEFAULT NULL,
  `age_range_min` varchar(4) DEFAULT NULL,
  `age_range_max` varchar(4) DEFAULT NULL,
  `bio` varchar(64) DEFAULT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  `context_mutual_friends` varchar(128) DEFAULT NULL,
  `context_mutual_likes` varchar(128) DEFAULT NULL,
  `user_currency` varchar(8) DEFAULT NULL,
  `device_hardware` varchar(50) DEFAULT NULL,
  `device_os` varchar(50) DEFAULT NULL,
  `education_school` varchar(50) DEFAULT NULL,
  `education_year` varchar(50) DEFAULT NULL,
  `education_concentration` varchar(50) DEFAULT NULL,
  `education_type` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `favorite_athletes` varchar(50) DEFAULT NULL,
  `favorite_teams` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `hometown` varchar(50) DEFAULT NULL,
  `languages` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `locale` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `name_format` varchar(50) DEFAULT NULL,
  `political` varchar(50) DEFAULT NULL,
  `quotes` varchar(50) DEFAULT NULL,
  `relationship_status` varchar(50) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `significant_other` varchar(50) DEFAULT NULL,
  `timezone` int(16) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `work_employer` varchar(50) DEFAULT NULL,
  `work_location` varchar(50) DEFAULT NULL,
  `work_position` varchar(50) DEFAULT NULL,
  `work_start_date` varchar(50) DEFAULT NULL,
  `work_end_date` varchar(50) DEFAULT NULL,
  `project_with` varchar(50) DEFAULT NULL,
  `project_description` varchar(50) DEFAULT NULL,
  `project_start_date` varchar(50) DEFAULT NULL,
  `project_end_date` varchar(50) DEFAULT NULL,
  `family_relationship` varchar(50) DEFAULT NULL,
  `friendlists` varchar(50) DEFAULT NULL,
  `friends` varchar(50) DEFAULT NULL,
  `interests` varchar(50) DEFAULT NULL,
  `likes` varchar(50) DEFAULT NULL,
  `Column 50` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_linkedin_profile_positions`
--

DROP TABLE IF EXISTS `fact_linkedin_profile_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_linkedin_profile_positions` (
  `seq_num` int(11) NOT NULL AUTO_INCREMENT,
  `linkedin_user_id` varchar(200) NOT NULL,
  `linkedin_position_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_current` varchar(10) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`seq_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fact_linkedin_profiles`
--

DROP TABLE IF EXISTS `fact_linkedin_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_linkedin_profiles` (
  `seq_num` int(11) NOT NULL AUTO_INCREMENT,
  `unify_user_id` varchar(200) NOT NULL,
  `linkedin_user_id` varchar(200) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `headline` varchar(2000) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `location_country_code` varchar(3) DEFAULT NULL,
  `industry` varchar(200) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `picture_url` varchar(2000) DEFAULT NULL,
  `public_profile_url` varchar(2000) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`seq_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='linkedln related table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unify_matchmakers`
--

DROP TABLE IF EXISTS `unify_matchmakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unify_matchmakers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(128) NOT NULL DEFAULT '0',
  `password` varchar(128) NOT NULL DEFAULT '0',
  `company_name` varchar(128) NOT NULL DEFAULT '0',
  `first_name` varchar(56) NOT NULL DEFAULT '0',
  `last_name` varchar(56) NOT NULL DEFAULT '0',
  `email_address` varchar(56) NOT NULL DEFAULT '0',
  `phone` varchar(255) NOT NULL DEFAULT '0',
  `address_1` varchar(128) NOT NULL DEFAULT '0',
  `address_2` varchar(128) NOT NULL DEFAULT '0',
  `state` varchar(25) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `locale_id` int(11) NOT NULL DEFAULT '0',
  `last_updated` datetime NOT NULL,
  `biz_location` varchar(255) DEFAULT NULL,
  `unify_user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unify_matchmakers_mappings`
--

DROP TABLE IF EXISTS `unify_matchmakers_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unify_matchmakers_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matchmakers_id` int(11) DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `caste_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unify_matchmakers_mappings_1`
--

DROP TABLE IF EXISTS `unify_matchmakers_mappings_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unify_matchmakers_mappings_1` (
  `id` int(11) DEFAULT NULL,
  `matchmakers_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  KEY `matchmakers_id` (`matchmakers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unify_matchmakers_mappings_old`
--

DROP TABLE IF EXISTS `unify_matchmakers_mappings_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unify_matchmakers_mappings_old` (
  `id` int(11) NOT NULL DEFAULT '0',
  `matchmakers_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `caste_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_country_MM` (`country_id`),
  KEY `FK_dim_religion_MM` (`religion_id`),
  KEY `FK_dim_language_MM` (`language_id`),
  KEY `FK_dim_community_MM` (`caste_id`),
  KEY `FK_unify_matchmakers_id` (`id`),
  CONSTRAINT `FK_dim_caste_MM` FOREIGN KEY (`caste_id`) REFERENCES `dim_castes` (`id`),
  CONSTRAINT `FK_dim_country_MM` FOREIGN KEY (`country_id`) REFERENCES `dim_countries` (`id`),
  CONSTRAINT `FK_dim_language_MM` FOREIGN KEY (`language_id`) REFERENCES `dim_languages` (`id`),
  CONSTRAINT `FK_dim_religion_MM` FOREIGN KEY (`religion_id`) REFERENCES `dim_religions` (`id`),
  CONSTRAINT `FK_unify_matchmaker_id` FOREIGN KEY (`id`) REFERENCES `unify_matchmakers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unify_partner_preferences`
--

DROP TABLE IF EXISTS `unify_partner_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unify_partner_preferences` (
  `id` int(11) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `gender` int(11) NOT NULL,
  `date_of_birth` int(11) NOT NULL,
  `place_of_birth` int(11) NOT NULL,
  `time_of_birth` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `language` int(11) NOT NULL,
  `caste` int(11) NOT NULL,
  `gothram` int(11) NOT NULL,
  `birth_star` int(11) NOT NULL,
  `zodiac_sign` int(11) NOT NULL,
  `horoscope_match` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `food_habits` int(11) NOT NULL,
  `last_updated` datetime NOT NULL,
  `drinking_habits` int(11) NOT NULL,
  `smoking_habits` int(11) NOT NULL,
  `body_type` int(11) NOT NULL,
  `complexion` int(11) NOT NULL,
  `physical_status` int(11) NOT NULL,
  `school` int(11) DEFAULT NULL,
  `college` int(11) DEFAULT NULL,
  `education_level` int(11) DEFAULT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_unify_partner_preferences_dim_locale` (`locale_id`),
  CONSTRAINT `FK_unify_partner_preferences_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the partner preference';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unify_prospects`
--

DROP TABLE IF EXISTS `unify_prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unify_prospects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(128) NOT NULL DEFAULT '0',
  `secret_questions` varchar(128) NOT NULL DEFAULT '0',
  `answer` varchar(128) NOT NULL DEFAULT '0',
  `match_maker_id` int(11) NOT NULL DEFAULT '0',
  `match_maker_name` varchar(50) NOT NULL DEFAULT '0',
  `first_name` varchar(50) NOT NULL DEFAULT '0',
  `last_name` varchar(50) NOT NULL DEFAULT '0',
  `gender_id` int(11) NOT NULL,
  `dob` datetime NOT NULL,
  `dob_time` time NOT NULL DEFAULT '00:00:00',
  `place_of_birth` varchar(50) NOT NULL DEFAULT '0',
  `age` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `caste_id` int(11) NOT NULL DEFAULT '0',
  `gotram` varchar(50) NOT NULL DEFAULT '0',
  `birth_star_id` int(11) NOT NULL DEFAULT '0',
  `zodiac_id` int(11) NOT NULL DEFAULT '0',
  `horoscope_match` varchar(50) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `food_habits` varchar(50) NOT NULL DEFAULT '0',
  `drinking_habits` varchar(50) NOT NULL DEFAULT '0',
  `smoking_habits` varchar(50) NOT NULL DEFAULT '0',
  `body_type` varchar(50) NOT NULL DEFAULT '0',
  `complexion` varchar(50) NOT NULL DEFAULT '0',
  `physical_status` varchar(50) NOT NULL DEFAULT '0',
  `school` varchar(50) NOT NULL DEFAULT '0',
  `college` varchar(50) NOT NULL DEFAULT '0',
  `education_level_id` int(11) NOT NULL DEFAULT '0',
  `locale_id` int(8) NOT NULL DEFAULT '0',
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_unify_user_unify_bureau` (`match_maker_id`),
  KEY `FK_unify_user_dim_gender` (`gender_id`),
  KEY `FK_unify_user_dim_language` (`language_id`),
  KEY `FK_unify_user_dim_caste` (`caste_id`),
  KEY `FK_unify_user_dim_birth_star` (`birth_star_id`),
  KEY `FK_unify_user_dim_zodiac_sign` (`zodiac_id`),
  KEY `FK_unify_user_dim_locale` (`locale_id`),
  CONSTRAINT `FK_unify_user_dim_birth_star` FOREIGN KEY (`birth_star_id`) REFERENCES `dim_birth_stars` (`id`),
  CONSTRAINT `FK_unify_user_dim_caste` FOREIGN KEY (`caste_id`) REFERENCES `dim_castes` (`id`),
  CONSTRAINT `FK_unify_user_dim_gender` FOREIGN KEY (`gender_id`) REFERENCES `dim_genders` (`id`),
  CONSTRAINT `FK_unify_user_dim_language` FOREIGN KEY (`language_id`) REFERENCES `dim_languages` (`id`),
  CONSTRAINT `FK_unify_user_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`),
  CONSTRAINT `FK_unify_user_dim_zodiac_sign` FOREIGN KEY (`zodiac_id`) REFERENCES `dim_zodiac_signs` (`id`),
  CONSTRAINT `FK_unify_user_unify_bureau` FOREIGN KEY (`match_maker_id`) REFERENCES `unify_matchmakers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Contains the user details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unify_religion_lang_caste_mappings`
--

DROP TABLE IF EXISTS `unify_religion_lang_caste_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unify_religion_lang_caste_mappings` (
  `matchmakers_id` int(11) NOT NULL AUTO_INCREMENT,
  `religion_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `caste_id` int(11) NOT NULL,
  PRIMARY KEY (`religion_id`,`language_id`,`caste_id`),
  KEY `matchmakers_id` (`matchmakers_id`),
  KEY `matchmakers_id_2` (`matchmakers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unify_users`
--

DROP TABLE IF EXISTS `unify_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unify_users` (
  `user_id` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `password_digest` varchar(300) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `user_type` varchar(2) NOT NULL,
  `locale_id` int(11) NOT NULL,
  `organization_name` varchar(100) DEFAULT NULL,
  `logo_image_name` varchar(100) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_unify_login_dim_locale` (`locale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `unify_vw_religion_lang_caste_mappings`
--

DROP TABLE IF EXISTS `unify_vw_religion_lang_caste_mappings`;
/*!50001 DROP VIEW IF EXISTS `unify_vw_religion_lang_caste_mappings`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `unify_vw_religion_lang_caste_mappings` AS SELECT 
 1 AS `religion_id`,
 1 AS `religion_name`,
 1 AS `language_id`,
 1 AS `language_name`,
 1 AS `caste_id`,
 1 AS `caste_name`,
 1 AS `locale_id`,
 1 AS `locale_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `unify_vw_religion_lang_caste_mappings`
--

/*!50001 DROP VIEW IF EXISTS `unify_vw_religion_lang_caste_mappings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`192.168.10.99` SQL SECURITY DEFINER */
/*!50001 VIEW `unify_vw_religion_lang_caste_mappings` AS select `dim_religions`.`id` AS `religion_id`,`dim_religions`.`name` AS `religion_name`,`dim_languages`.`id` AS `language_id`,`dim_languages`.`name` AS `language_name`,`dim_castes`.`id` AS `caste_id`,`dim_castes`.`name` AS `caste_name`,`dim_locales`.`id` AS `locale_id`,`dim_locales`.`name` AS `locale_name` from ((((`unify_religion_lang_caste_mappings` `mapping` join `dim_religions` on((`dim_religions`.`id` = `mapping`.`religion_id`))) join `dim_languages` on((`dim_languages`.`id` = `mapping`.`language_id`))) join `dim_castes` on((`dim_castes`.`id` = `mapping`.`caste_id`))) join `dim_locales` on((`dim_locales`.`id` = `dim_castes`.`locale_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-12 15:04:06
INSERT INTO schema_migrations (version) VALUES ('20150914073249');

INSERT INTO schema_migrations (version) VALUES ('20150914205332');

INSERT INTO schema_migrations (version) VALUES ('20150914211938');

INSERT INTO schema_migrations (version) VALUES ('20150914212701');

INSERT INTO schema_migrations (version) VALUES ('20150914212711');

INSERT INTO schema_migrations (version) VALUES ('20151112193332');

