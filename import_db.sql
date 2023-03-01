PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_like;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL, 
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id) 
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    questions_id INTEGER,
    users_id INTEGER,
    
    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    parent_reply_id INTEGER,
    subject_question TEXT,
    reply_owner_id INTEGER,
    reply_body TEXT,

    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (reply_owner_id) REFERENCES users(id)
);

CREATE TABLE question_like (
    id INTEGER PRIMARY KEY,
    username_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY (username_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('John', 'Bob'),
    ('Tim', 'Smith'),
    ('Jake', 'Rob');

INSERT INTO
    questions(title, body,author_id)
VALUES
    ('Question?', 'zzzzzzxxxxxyyyyyy', (SELECT users_id FROM question_follows WHERE questions_id = questions(id))),
    ('QQuestion?', 'aaaaaaaaabbbbbbb', (SELECT users_id FROM question_follows WHERE questions_id = questions(id))),
    ('QQQuestion?', 'bbbbbbbbbwwwwww',(SELECT users_id FROM question_follows WHERE questions_id = questions(id)));

INSERT INTO
    replies(parent_reply_id, subject_question, reply_owner_id, reply_body)
VALUES
    ( (SELECT id FROM replies WHERE id = replies(id)), 'theuqisksksskskksksksks', ( ), 'iiwiwtrtrtrtrtrkrk'),
    ( ( ), 'theweweweweweweweksks', ( ), 'zxzxiwiwiwzxxzxzxzxzxzxk'),
    ( ( ), 'theuqiskseerererereksks', ( ), 'olplplplpliwiwiiwikkrk');





