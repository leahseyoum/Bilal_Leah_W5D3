PRAGMA foreign_keys = ON;

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL, 
    lname TEXT NOT NULL,
);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    FOREIGN KEY(author) REFERENCES users(id), 
);

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    FOREIGN KEY (questions_id) REFERENCES questions(author)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    FOREIGN KEY (parent_reply) REFERENCES replies(id),
    FOREIGN KEY (subject_question) REFERENCES questions(title),
    FOREIGN KEY (question_owner) REFERENCES users(id),
    FOREIGN KEY (reply_body) REFERENCES questions(body),
);



