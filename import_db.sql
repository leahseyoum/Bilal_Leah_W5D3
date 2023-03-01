
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
    author INTEGER,

    FOREIGN KEY (author) REFERENCES users(id) 
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
    parent_reply INTEGER,
    subject_question TEXT,
    question_owner INTEGER,
    reply_body TEXT,

    FOREIGN KEY (parent_reply) REFERENCES replies(id),
    FOREIGN KEY (subject_question) REFERENCES questions(title),
    FOREIGN KEY (question_owner) REFERENCES users(id),
    FOREIGN KEY (reply_body) REFERENCES questions(body)
);

CREATE TABLE question_like (
    id INTEGER PRIMARY KEY,
    user_name INTEGER,
    question INTEGER,

    FOREIGN KEY (user_name) REFERENCES users(id),
    FOREIGN KEY (question) REFERENCES question(id)
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('John', 'Bob'),
    ('Tim', 'Smith'),
    ('Jake', 'Rob');

INSERT INTO
    questions(title, body)
VALUES
    ('Question?', 'zzzzzzxxxxxyyyyyy'),
    ('QQuestion?', 'aaaaaaaaabbbbbbb'),
    ('QQQuestion?', 'bbbbbbbbbwwwwww');

