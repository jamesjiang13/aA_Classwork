DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS questions_follows;
/* DROP TABLE IF EXISTS question_follows; */
DROP TABLE IF EXISTS questions_likes;
DROP TABLE IF EXISTS replies;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,    
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,  /* author of the questions*/

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE questions_follows (    /* join table*/
  questions_id INTEGER NOT NULL,
  users_id INTEGER NOT NULL,

  FOREIGN KEY (questions_id) REFERENCES questions(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY, 
  parent_reply_id INTEGER, /* self referential*/
  users_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE questions_likes (
  questions_id INTEGER NOT NULL,
  users_id INTEGER NOT NULL,

  FOREIGN KEY (questions_id) REFERENCES questions(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);

INSERT INTO  
  users (fname, lname)
VALUES
  ('james','jiang'),
  ('sam','walker'),
  ('jason','wintery');


INSERT INTO
  questions (title, body, author_id)
VALUES
  ('sports', 'why warriors suck this yr', (SELECT id FROM users WHERE fname = 'sam' AND lname ='walker') ),
  ('sports', 'why raiders suck this yr', (SELECT id FROM users WHERE fname = 'james' AND lname ='jiang') ),
  ('sports', 'why niners suck this yr', (SELECT id FROM users WHERE fname = 'jason' AND lname ='wintery') ),
  ('sports', 'why giants suck this yr', (SELECT id FROM users WHERE fname = 'jason' AND lname ='wintery') );

INSERT INTO  
  replies (parent_reply_id, users_id, body, questions_id)
VALUES
  (1, (SELECT id FROM users WHERE fname = 'sam' AND lname ='walker'), 'because splash bros R injured', (SELECT id from questions WHERE body = 'why warriors suck this yr')),
  (1, (SELECT id FROM users WHERE fname = 'james' AND lname ='jiang'), 'because raiders R injured', (SELECT id from questions WHERE body = 'why raiders suck this yr')), 
  (1, (SELECT id FROM users WHERE fname = 'jason' AND lname ='wintery'), 'because niners R injured', (SELECT id from questions WHERE body = 'why niners suck this yr')),
  (1, (SELECT id FROM users WHERE fname = 'jason' AND lname ='wintery'), 'because giants R injured', (SELECT id from questions WHERE body = 'why giants suck this yr'));
