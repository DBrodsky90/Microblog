DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS authors CASCADE;
DROP TABLE IF EXISTS tags CASCADE;
DROP TABLE IF EXISTS posts_tags CASCADE;


CREATE TABLE authors (
	id SERIAL PRIMARY KEY,
	name varchar(255),
	image_url varchar(255),
	description text
);

CREATE TABLE tags (
	id SERIAL PRIMARY KEY,
	name varchar(255)
);

CREATE TABLE posts (
	id SERIAL PRIMARY KEY,
	title varchar(255),
	content text,
	date_created varchar(255),
	author varchar(255),
	author_id INTEGER REFERENCES authors
);

CREATE TABLE posts_tags (
	post_id INTEGER REFERENCES posts,
	tag_id INTEGER REFERENCES tags
);

