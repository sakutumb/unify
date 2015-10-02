# MySQL Navigator Xport
# Database: unify_db
# unify@68.169.59.86

# CREATE DATABASE unify_db;
# USE unify_db;

#
# Table structure for table '_unused_fact_linkedin'
#

# DROP TABLE IF EXISTS _unused_fact_linkedin;
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

#
# Dumping data for table '_unused_fact_linkedin'
#


#
# Table structure for table '_unused_fact_linkedin_education'
#

# DROP TABLE IF EXISTS _unused_fact_linkedin_education;
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

#
# Dumping data for table '_unused_fact_linkedin_education'
#


#
# Table structure for table 'dim_birth_stars'
#

# DROP TABLE IF EXISTS dim_birth_stars;
CREATE TABLE `dim_birth_stars` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_birth_star_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_birth_star_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the birthstar information';

#
# Dumping data for table 'dim_birth_stars'
#

INSERT INTO dim_birth_stars VALUES (1,'Leo',1);

#
# Table structure for table 'dim_castes'
#

# DROP TABLE IF EXISTS dim_castes;
CREATE TABLE `dim_castes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_caste_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_caste_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COMMENT='Contains the caste details';

#
# Dumping data for table 'dim_castes'
#

INSERT INTO dim_castes VALUES (1,'Ahom',1);
INSERT INTO dim_castes VALUES (2,'Arya Vysya',1);
INSERT INTO dim_castes VALUES (3,'Baishnab',1);
INSERT INTO dim_castes VALUES (4,'Baishya',1);
INSERT INTO dim_castes VALUES (5,'Bengali',1);
INSERT INTO dim_castes VALUES (6,'Brahmin – All',1);
INSERT INTO dim_castes VALUES (7,'Brahmin',1);
INSERT INTO dim_castes VALUES (8,'Brahmin – Davadnya',1);
INSERT INTO dim_castes VALUES (9,'Brahmin – Goswami',1);
INSERT INTO dim_castes VALUES (10,'Baidya',1);
INSERT INTO dim_castes VALUES (11,'Banik',1);
INSERT INTO dim_castes VALUES (12,'Barujibi',1);
INSERT INTO dim_castes VALUES (13,'Brahmin – Bengali',1);
INSERT INTO dim_castes VALUES (14,'Ambalavasi',1);
INSERT INTO dim_castes VALUES (15,'Chettiar',1);
INSERT INTO dim_castes VALUES (16,'Dheevara',1);
INSERT INTO dim_castes VALUES (17,'Ezhava',1);
INSERT INTO dim_castes VALUES (18,'Ezhuthachan',1);
INSERT INTO dim_castes VALUES (19,'Menon',1);
INSERT INTO dim_castes VALUES (20,'Nair – All',1);
INSERT INTO dim_castes VALUES (21,'Nair',1);
INSERT INTO dim_castes VALUES (22,'Balija',1);
INSERT INTO dim_castes VALUES (23,'Naidu – All',1);
INSERT INTO dim_castes VALUES (24,'Balija – Naidu',1);
INSERT INTO dim_castes VALUES (25,'Brahmin – Niyogi',1);
INSERT INTO dim_castes VALUES (26,'Brahmin – others',1);
INSERT INTO dim_castes VALUES (27,'Brahmin – Vaidiki',1);

#
# Table structure for table 'dim_cities'
#

# DROP TABLE IF EXISTS dim_cities;
CREATE TABLE `dim_cities` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_city_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_city_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the city data';

#
# Dumping data for table 'dim_cities'
#


#
# Table structure for table 'dim_communities'
#

# DROP TABLE IF EXISTS dim_communities;
CREATE TABLE `dim_communities` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the community data';

#
# Dumping data for table 'dim_communities'
#


#
# Table structure for table 'dim_countries'
#

# DROP TABLE IF EXISTS dim_countries;
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

#
# Dumping data for table 'dim_countries'
#

INSERT INTO dim_countries VALUES (1,'India',1,1,1,'IN');

#
# Table structure for table 'dim_education_level'
#

# DROP TABLE IF EXISTS dim_education_level;
CREATE TABLE `dim_education_level` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_education_level_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_education_level_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the education level';

#
# Dumping data for table 'dim_education_level'
#


#
# Table structure for table 'dim_genders'
#

# DROP TABLE IF EXISTS dim_genders;
CREATE TABLE `dim_genders` (
  `id` int(11) NOT NULL,
  `name` varchar(28) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains the gender data';

#
# Dumping data for table 'dim_genders'
#

INSERT INTO dim_genders VALUES (1,'MALE');

#
# Table structure for table 'dim_languages'
#

# DROP TABLE IF EXISTS dim_languages;
CREATE TABLE `dim_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_language_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_language_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Contains the language data';

#
# Dumping data for table 'dim_languages'
#

INSERT INTO dim_languages VALUES (1,'Assamese',1);
INSERT INTO dim_languages VALUES (2,'Bengali',1);
INSERT INTO dim_languages VALUES (3,'Malayalam',1);
INSERT INTO dim_languages VALUES (4,'Telugu',1);

#
# Table structure for table 'dim_locales'
#

# DROP TABLE IF EXISTS dim_locales;
CREATE TABLE `dim_locales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Dumping data for table 'dim_locales'
#

INSERT INTO dim_locales VALUES (1,'en-US');

#
# Table structure for table 'dim_religions'
#

# DROP TABLE IF EXISTS dim_religions;
CREATE TABLE `dim_religions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dim_religion_dim_locale` (`locale_id`),
  CONSTRAINT `FK_dim_religion_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Contains the religion data';

#
# Dumping data for table 'dim_religions'
#

INSERT INTO dim_religions VALUES (1,'Hindu',1);
INSERT INTO dim_religions VALUES (2,'Muslim',1);

#
# Table structure for table 'dim_states'
#

# DROP TABLE IF EXISTS dim_states;
CREATE TABLE `dim_states` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table 'dim_states'
#


#
# Table structure for table 'dim_zodiac_signs'
#

# DROP TABLE IF EXISTS dim_zodiac_signs;
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

#
# Dumping data for table 'dim_zodiac_signs'
#

INSERT INTO dim_zodiac_signs VALUES (1,'Leo','1973-01-08','1973-01-08',4,1);

#
# Table structure for table 'fact_facebook'
#

# DROP TABLE IF EXISTS fact_facebook;
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

#
# Dumping data for table 'fact_facebook'
#


#
# Table structure for table 'fact_linkedin_profile_positions'
#

# DROP TABLE IF EXISTS fact_linkedin_profile_positions;
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

#
# Dumping data for table 'fact_linkedin_profile_positions'
#


#
# Table structure for table 'fact_linkedin_profiles'
#

# DROP TABLE IF EXISTS fact_linkedin_profiles;
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

#
# Dumping data for table 'fact_linkedin_profiles'
#


#
# Table structure for table 'schema_migrations'
#

# DROP TABLE IF EXISTS schema_migrations;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table 'schema_migrations'
#


#
# Table structure for table 'unify_matchmakers'
#

# DROP TABLE IF EXISTS unify_matchmakers;
CREATE TABLE `unify_matchmakers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(128) NOT NULL DEFAULT '0',
  `password` varchar(128) NOT NULL DEFAULT '0',
  `company_name` varchar(128) NOT NULL DEFAULT '0',
  `first_name` varchar(56) NOT NULL DEFAULT '0',
  `last_name` varchar(56) NOT NULL DEFAULT '0',
  `email_address` varchar(56) NOT NULL DEFAULT '0',
  `phone` int(11) NOT NULL DEFAULT '0',
  `address_1` varchar(128) NOT NULL DEFAULT '0',
  `address_2` varchar(128) NOT NULL DEFAULT '0',
  `state` varchar(25) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `religion_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `caste_id` int(11) NOT NULL DEFAULT '0',
  `locale_id` int(11) NOT NULL DEFAULT '0',
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__dim_country` (`country_id`),
  KEY `FK__dim_religion` (`religion_id`),
  KEY `FK__dim_language` (`language_id`),
  KEY `FK__dim_community` (`caste_id`),
  KEY `FK_unify_matchmaker_dim_locale` (`locale_id`),
  CONSTRAINT `FK__dim_caste` FOREIGN KEY (`caste_id`) REFERENCES `dim_castes` (`id`),
  CONSTRAINT `FK__dim_country` FOREIGN KEY (`country_id`) REFERENCES `dim_countries` (`id`),
  CONSTRAINT `FK__dim_language` FOREIGN KEY (`language_id`) REFERENCES `dim_languages` (`id`),
  CONSTRAINT `FK__dim_religion` FOREIGN KEY (`religion_id`) REFERENCES `dim_religions` (`id`),
  CONSTRAINT `FK_unify_matchmaker_dim_locale` FOREIGN KEY (`locale_id`) REFERENCES `dim_locales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Contains the information related to bureau';

#
# Dumping data for table 'unify_matchmakers'
#

INSERT INTO unify_matchmakers VALUES (1,'unify','','Unify','Unify','One','unify@unify.com',0,'','',NULL,NULL,1,1,4,6,1,'1000-01-01 00:00:00');

#
# Table structure for table 'unify_matchmakers_mappings'
#

# DROP TABLE IF EXISTS unify_matchmakers_mappings;
CREATE TABLE `unify_matchmakers_mappings` (
  `id` int(11) NOT NULL DEFAULT '0',
  `matchmakers_id` int(11) DEFAULT NULL,
  `matchmakers_id_URLC` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table 'unify_matchmakers_mappings'
#


#
# Table structure for table 'unify_matchmakers_mappings_1'
#

# DROP TABLE IF EXISTS unify_matchmakers_mappings_1;
CREATE TABLE `unify_matchmakers_mappings_1` (
  `id` int(11) DEFAULT NULL,
  `matchmakers_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  KEY `matchmakers_id` (`matchmakers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table 'unify_matchmakers_mappings_1'
#


#
# Table structure for table 'unify_matchmakers_mappings_old'
#

# DROP TABLE IF EXISTS unify_matchmakers_mappings_old;
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

#
# Dumping data for table 'unify_matchmakers_mappings_old'
#


#
# Table structure for table 'unify_partner_preferences'
#

# DROP TABLE IF EXISTS unify_partner_preferences;
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

#
# Dumping data for table 'unify_partner_preferences'
#


#
# Table structure for table 'unify_prospects'
#

# DROP TABLE IF EXISTS unify_prospects;
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

#
# Dumping data for table 'unify_prospects'
#

INSERT INTO unify_prospects VALUES (1,'Prospect1','','','',1,'Unify','One','Prospect',1,'1973-01-31 00:00:00','11:00:00','Hyderabad',35,4,6,'',1,1,'',0,'','','','','','','','',0,1,'1000-01-01 00:00:00');
INSERT INTO unify_prospects VALUES (2,'Prospect2','','','',1,'Unify','One','Prospect',1,'1973-01-31 00:00:00','11:00:00','Kerala',37,3,6,'',1,1,'',0,'','','','','','','','',0,1,'1000-01-01 00:00:00');
INSERT INTO unify_prospects VALUES (3,'Prospect2','','','',1,'Unify','One','Prospect',1,'1973-01-31 00:00:00','11:00:00','Kerala',37,3,21,'',1,1,'',0,'','','','','','','','',0,1,'1000-01-01 00:00:00');
INSERT INTO unify_prospects VALUES (4,'Prospect4','','','',1,'Unify','One','Prospect',1,'1973-01-31 00:00:00','11:00:00','Kerala',37,4,22,'',1,1,'',0,'','','','','','','','',0,1,'1000-01-01 00:00:00');

#
# Table structure for table 'unify_religion_lang_caste_mappings'
#

# DROP TABLE IF EXISTS unify_religion_lang_caste_mappings;
CREATE TABLE `unify_religion_lang_caste_mappings` (
  `matchmakers_id` int(11) NOT NULL AUTO_INCREMENT,
  `religion_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `caste_id` int(11) NOT NULL,
  PRIMARY KEY (`religion_id`,`language_id`,`caste_id`),
  KEY `matchmakers_id` (`matchmakers_id`),
  KEY `matchmakers_id_2` (`matchmakers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Dumping data for table 'unify_religion_lang_caste_mappings'
#

INSERT INTO unify_religion_lang_caste_mappings VALUES (1,1,1,1);
INSERT INTO unify_religion_lang_caste_mappings VALUES (2,1,1,2);
INSERT INTO unify_religion_lang_caste_mappings VALUES (3,1,1,3);
INSERT INTO unify_religion_lang_caste_mappings VALUES (4,1,1,4);
INSERT INTO unify_religion_lang_caste_mappings VALUES (5,1,1,5);
INSERT INTO unify_religion_lang_caste_mappings VALUES (6,1,1,6);
INSERT INTO unify_religion_lang_caste_mappings VALUES (7,1,1,7);
INSERT INTO unify_religion_lang_caste_mappings VALUES (8,1,1,8);
INSERT INTO unify_religion_lang_caste_mappings VALUES (9,1,1,9);
INSERT INTO unify_religion_lang_caste_mappings VALUES (10,1,2,4);
INSERT INTO unify_religion_lang_caste_mappings VALUES (11,1,2,5);
INSERT INTO unify_religion_lang_caste_mappings VALUES (12,1,2,6);
INSERT INTO unify_religion_lang_caste_mappings VALUES (13,1,2,7);
INSERT INTO unify_religion_lang_caste_mappings VALUES (14,1,2,10);
INSERT INTO unify_religion_lang_caste_mappings VALUES (15,1,2,11);
INSERT INTO unify_religion_lang_caste_mappings VALUES (16,1,2,12);
INSERT INTO unify_religion_lang_caste_mappings VALUES (17,1,2,13);
INSERT INTO unify_religion_lang_caste_mappings VALUES (18,1,3,6);
INSERT INTO unify_religion_lang_caste_mappings VALUES (19,1,3,7);
INSERT INTO unify_religion_lang_caste_mappings VALUES (20,1,3,14);
INSERT INTO unify_religion_lang_caste_mappings VALUES (21,1,3,15);
INSERT INTO unify_religion_lang_caste_mappings VALUES (22,1,3,16);
INSERT INTO unify_religion_lang_caste_mappings VALUES (23,1,3,17);
INSERT INTO unify_religion_lang_caste_mappings VALUES (24,1,3,18);
INSERT INTO unify_religion_lang_caste_mappings VALUES (25,1,3,19);
INSERT INTO unify_religion_lang_caste_mappings VALUES (26,1,3,20);
INSERT INTO unify_religion_lang_caste_mappings VALUES (27,1,3,21);
INSERT INTO unify_religion_lang_caste_mappings VALUES (28,1,4,2);
INSERT INTO unify_religion_lang_caste_mappings VALUES (29,1,4,6);
INSERT INTO unify_religion_lang_caste_mappings VALUES (30,1,4,22);
INSERT INTO unify_religion_lang_caste_mappings VALUES (31,1,4,23);
INSERT INTO unify_religion_lang_caste_mappings VALUES (32,1,4,24);
INSERT INTO unify_religion_lang_caste_mappings VALUES (33,1,4,25);
INSERT INTO unify_religion_lang_caste_mappings VALUES (34,1,4,26);
INSERT INTO unify_religion_lang_caste_mappings VALUES (35,1,4,27);

#
# Table structure for table 'unify_users'
#

# DROP TABLE IF EXISTS unify_users;
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

#
# Dumping data for table 'unify_users'
#

INSERT INTO unify_users VALUES ('phani.peri@gmail.com','phani.peri@gmail.com',NULL,'$2a$10$7gvO5Kw7oFrOBbaJXQCApuSNbr49Qk5pnI6uIX7wSibDiV7KEmK.e','Phani','Peri','MM',1,'Naanya',NULL,'2015-04-13 01:10:40');
INSERT INTO unify_users VALUES ('syam@mail.com','syam@mail.com',NULL,'$2a$10$h/T4KwUAPt484TBd3sZUKePE82whKX7X7hKNIrPd9Jqte7Lv6og3.','Syam','Prasad','MM',1,'Unify',NULL,'2015-03-23 06:29:07');

#
# Table structure for table 'unify_vw_religion_lang_caste_mappings'
#

# DROP TABLE IF EXISTS unify_vw_religion_lang_caste_mappings;
CREATE ALGORITHM=UNDEFINED DEFINER=`unify`@`localhost` SQL SECURITY DEFINER VIEW `unify_vw_religion_lang_caste_mappings` AS select `dim_religions`.`id` AS `religion_id`,`dim_religions`.`name` AS `religion_name`,`dim_languages`.`id` AS `language_id`,`dim_languages`.`name` AS `language_name`,`dim_castes`.`id` AS `caste_id`,`dim_castes`.`name` AS `caste_name`,`dim_locales`.`id` AS `locale_id`,`dim_locales`.`name` AS `locale_name` from ((((`unify_religion_lang_caste_mappings` `mapping` join `dim_religions` on((`dim_religions`.`id` = `mapping`.`religion_id`))) join `dim_languages` on((`dim_languages`.`id` = `mapping`.`language_id`))) join `dim_castes` on((`dim_castes`.`id` = `mapping`.`caste_id`))) join `dim_locales` on((`dim_locales`.`id` = `dim_castes`.`locale_id`)));

#
# Dumping data for table 'unify_vw_religion_lang_caste_mappings'
#

INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',1,'Assamese',1,'Ahom',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',1,'Assamese',2,'Arya Vysya',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',1,'Assamese',3,'Baishnab',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',1,'Assamese',4,'Baishya',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',1,'Assamese',5,'Bengali',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',1,'Assamese',6,'Brahmin – All',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',1,'Assamese',7,'Brahmin',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',1,'Assamese',8,'Brahmin – Davadnya',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',1,'Assamese',9,'Brahmin – Goswami',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',2,'Bengali',4,'Baishya',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',2,'Bengali',5,'Bengali',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',2,'Bengali',6,'Brahmin – All',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',2,'Bengali',7,'Brahmin',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',2,'Bengali',10,'Baidya',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',2,'Bengali',11,'Banik',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',2,'Bengali',12,'Barujibi',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',2,'Bengali',13,'Brahmin – Bengali',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',3,'Malayalam',6,'Brahmin – All',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',3,'Malayalam',7,'Brahmin',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',3,'Malayalam',14,'Ambalavasi',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',3,'Malayalam',15,'Chettiar',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',3,'Malayalam',16,'Dheevara',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',3,'Malayalam',17,'Ezhava',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',3,'Malayalam',18,'Ezhuthachan',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',3,'Malayalam',19,'Menon',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',3,'Malayalam',20,'Nair – All',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',3,'Malayalam',21,'Nair',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',4,'Telugu',2,'Arya Vysya',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',4,'Telugu',6,'Brahmin – All',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',4,'Telugu',22,'Balija',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',4,'Telugu',23,'Naidu – All',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',4,'Telugu',24,'Balija – Naidu',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',4,'Telugu',25,'Brahmin – Niyogi',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',4,'Telugu',26,'Brahmin – others',1,'en-US');
INSERT INTO unify_vw_religion_lang_caste_mappings VALUES (1,'Hindu',4,'Telugu',27,'Brahmin – Vaidiki',1,'en-US');

