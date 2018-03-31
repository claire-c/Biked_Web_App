DROP TABLE rides;
DROP TABLE routes;
DROP TABLE cyclists;


CREATE TABLE cyclists(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255) NOT NULL
);

CREATE TABLE routes(
id SERIAL4 PRIMARY KEY,
title VARCHAR(255) NOT NULL,
distance INT,
elevation INT
);

CREATE TABLE rides(
id SERIAL4 PRIMARY KEY,
cyclist_id INT4 REFERENCES cyclists(id),
route_id INT4 REFERENCES routes(id)
);
