# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills(
    skills_id int not null,
    skills_name varchar(255) not null,
    skills_description varchar(4096) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(4096),
    skills_time_commitment varchar(255),
    primary key (skills_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag, skills_url, skills_time_commitment) VALUES
    (1, 'Boxing', 'Mike Tyson class', 'Skill 1', 'https://example.com/skill1', '10 hours'),
    (2, 'Hockey', 'Hockey for those who like fighting', 'Skill 2', 'https://example.com/skill2', '15 hours'),
    (3, 'Programming', 'Java 101 for nerds', 'Skill 3', 'https://example.com/skill3', '12 hours'),
    (4, 'Nasa Intern', 'Learn to plan missions to Mars', 'Skill 4', 'https://example.com/skill4', '20 hours'),
    (5, 'Travel Agent skills', 'Learn to scam others with timeshares', 'Skill 5', 'https://example.com/skill5', '18 hours'),
    (6, 'Law Practices', 'Learn how to be worse than a policitian, a lawyer', 'Skill 6', 'https://example.com/skill6', '25 hours'),
    (7, 'Boys Scout', 'Learn how to tie a knot', 'Skill 7', 'https://example.com/skill7', '22 hours'),
    (8, 'Cooking', 'For those who wish they could be Ramsay', 'Skill 8', 'https://example.com/skill8', '30 hours');


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int not null,
    people_last_name varchar(255) NOT NULL,
    people_first_name varchar(255),
    people_email varchar(255),
    people_linkedin_url varchar(255),
    people_headshot_url varchar(255),
    people_discord_handle varchar(255),
    people_brief_bio varchar(4096),
    people_date_joined date not null,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_last_name, people_first_name, people_email, people_linkedin_url, people_headshot_url,
people_discord_handle, people_brief_bio, people_date_joined) VALUES
   (1, 'Person 1', 'Alice', 'alice@gmail.com', 'https://www.linkedin.com/alice', 'https://example.com/alice.jpg',
     'Alice#1234', 'Passionate about technology because her dad owns google', '2023-01-01'),
    (2, 'Person 2', 'Bob', 'bob@gmail.com', 'https://www.linkedin.com/bob', 'https://example.com/bob.jpg',
     'Bob#5678', 'Likes to ball', '2023-02-01'),
    (3, 'Person 3', 'Charlie', 'charlie@gmail.com', 'https://www.linkedin.com/charlie', 'https://example.com/charlie.jpg',
     'Charlie#9101', 'Honestly wants any new skill to get him out of the house and away from family', '2023-03-01'),
    (4, 'Person 4', 'David', 'david@yahoo.com', 'https://www.linkedin.com/david', 'https://example.com/david.jpg',
     'David#1122', 'Aspiring pro athlete with no skills whatsoever ', '2023-04-01'),
    (5, 'Person 5', 'Eva', 'eva@icloud.com', 'https://www.linkedin.com/eva', 'https://example.com/eva.jpg',
     'Eva#3344', 'Enthusiastic about finally getting a job after being let go 2 months ago', '2023-05-01'),
    (6, 'Person 6', 'Frank', 'frank@hotmail.com', 'https://www.linkedin.com/frank', 'https://example.com/frank.jpg',
     'Frank#5566', 'Wants to learn how to be more productive and not just game all day at home', '2023-06-01');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    peopleskills_skills_id INT NOT NULL,
    peopleskills_people_id INT NOT NULL,
    peopleskills_date_acquired DATE NOT NULL
    primary key (id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
INSERT INTO peopleskills (peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) VALUES
(1, 1, '2023-01-01'), (3, 1, '2023-02-01'), (6, 1, '2023-03-01'),
    (3, 2, '2023-04-01'), (4, 2, '2023-05-01'), (5, 2, '2023-06-01'),
    (1, 3, '2023-07-01'), (5, 3, '2023-08-01'),
    (3, 5, '2023-09-01'), (6, 5, '2023-10-01'),
    (2, 6, '2023-11-01'), (3, 6, '2023-12-01'), (4, 6, '2024-01-01'),
    (3, 7, '2024-02-01'), (5, 7, '2024-03-01'), (6, 7, '2024-04-01'),
    (1, 8, '2024-05-01'), (3, 8, '2024-06-01'), (5, 8, '2024-07-01'), (6, 8, '2024-08-01'),
    (2, 9, '2024-09-01'), (5, 9, '2024-10-01'), (6, 9, '2024-11-01'),
    (1, 10, '2024-12-01'), (4, 10, '2025-01-01'), (5, 10, '2025-02-01');


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id INT PRIMARY KEY,
    roles_name VARCHAR(255) NOT NULL,
    roles_sort_priority INT NOT NULL
);



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (roles_id, roles_name, roles_sort_priority) VALUES
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id INT AUTO_INCREMENT PRIMARY KEY,
    peopleroles_people_id INT NOT NULL,
    peopleroles_role_id INT NOT NULL,
    peopleroles_date_assigned DATE NOT NULL
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (peopleroles_people_id, peopleroles_role_id, peopleroles_date_assigned) VALUES
    (1, 2, '2023-01-01'),
    (2, 5, '2023-02-01'), (2, 6, '2023-02-01'),
    (3, 2, '2023-03-01'), (3, 4, '2023-03-01'),
    (4, 3, '2023-04-01'),
    (5, 3, '2023-05-01'),
    (6, 2, '2023-06-01'), (6, 1, '2023-06-01'),
    (7, 1, '2023-07-01'),
    (8, 1, '2023-08-01'), (8, 4, '2023-08-01'),
    (9, 2, '2023-09-01'),
    (10, 2, '2023-10-01'), (10, 1, '2023-10-01');








