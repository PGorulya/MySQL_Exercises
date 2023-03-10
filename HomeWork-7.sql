
create database if not exists onlinechat;
use onlinechat;

create table if not exists users(
    user_id integer PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(64) NOT NULL,
    is_blocked BOOLEAN DEFAULT false,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

create table if not exists  reaction_types(
    type_id integer PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50),
    type_memo VARCHAR(256),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

create table if not exists chats(
    chat_id int PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(256),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
	user1_id integer
	user2_id integer
	FOREIGN KEY(user1_id) REFERENCES users(user_id),
    FOREIGN KEY (user2_id) REFERENCES users(user_id)
);

create table if not exists messages(
    message_id int PRIMARY KEY AUTO_INCREMENT,
	chat_id int
    sender_id int,
    receiver_id int,
    text text not null,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	is_removed BOOL default false
	FOREIGN KEY(chat_id) REFERENCES chats(chat_id),
    FOREIGN KEY(sender_id) REFERENCES users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES users(user_id)
);

create table if not exists reactions(
    reaction_id integer PRIMARY KEY AUTO_INCREMENT,
    message_id integer,
	value integer not null check(value between 1 and 5)
    user_id integer,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (message_id) REFERENCES messages(message_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    UNIQUE (message_id, user_id)
);



INSERT INTO users (fullname, email)
VALUES ('Maik Arend', 'maik.arend@example.com');

INSERT INTO reaction_types (type, type_memo)
VALUES ('Like', 'Positive reaction');

INSERT INTO chats (chat_title)
VALUES ('General');

INSERT INTO messages (chat_id, user_id, message)
VALUES (1, LAST_INSERT_ID(), 'Hi everyone!');

INSERT INTO reactions (reaction_type, message_id, user_id)
VALUES (LAST_INSERT_ID(), LAST_INSERT_ID(), LAST_INSERT_ID());


