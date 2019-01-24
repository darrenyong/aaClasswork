DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

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
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    body TEXT NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
    users(fname, lname)
VALUES
    ('Mariana', 'Shebanova'),
    ('Darren', 'Yong');

INSERT INTO
    questions(title, body, author_id)
VALUES
    ('How do you program in Ruby?', 'It''s easy!', (SELECT id FROM users WHERE fname = 'Mariana')),
    ('How is everyone doing today?', 'Just want to know how everyone is doing!', (SELECT id FROM users WHERE fname = 'Darren')),
    ('What is the weather like today?', 'Please tell me!', (SELECT id FROM users WHERE fname = 'Darren'));

INSERT INTO
    question_follows(question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'How do you program in Ruby?'), (SELECT id FROM users WHERE fname = 'Mariana')),
    ((SELECT id FROM questions WHERE title = 'How is everyone doing today?'), (SELECT id FROM users WHERE fname = 'Darren')),
    ((SELECT id FROM questions WHERE title = 'How is everyone doing today?'), (SELECT id FROM users WHERE fname = 'Mariana'));

INSERT INTO
    replies(question_id, user_id, parent_reply_id, body)
VALUES
    ((SELECT id FROM questions WHERE title = 'How do you program in Ruby?'), (SELECT id FROM users WHERE fname = 'Mariana'), NULL, 'It''s similar to other languages!'),
    ((SELECT id FROM questions WHERE title = 'How is everyone doing today?'), (SELECT id FROM users WHERE fname = 'Darren'), NULL, 'Anyone?'),
    ((SELECT id FROM questions WHERE title = 'How is everyone doing today?'), (SELECT id FROM users WHERE fname = 'Darren'), 1, 'Anyone?'),
    ((SELECT id FROM questions WHERE title = 'How is everyone doing today?'), (SELECT id FROM users WHERE fname = 'Darren'), NULL, 'No one wants to tell you!');

INSERT INTO
    question_likes(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Mariana'), (SELECT id FROM questions WHERE title = 'How do you program in Ruby?')),
    ((SELECT id FROM users WHERE fname = 'Darren'), (SELECT id FROM questions WHERE title = 'How do you program in Ruby?'));
