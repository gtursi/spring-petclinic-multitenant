INSERT INTO company (name) VALUES ('COMPANY1');
INSERT INTO company (name) VALUES ('COMPANY2');

INSERT INTO users(username,company_id,email,password,enabled)
VALUES ('priya', (select id from company where name = 'COMPANY1'), 'abc@abc.com','$2a$04$CO93CT2ObgMiSnMAWwoBkeFObJlMYi/wzzOnPlsTP44r7qVq0Jln2', true);
INSERT INTO users(username,company_id,email,password,enabled)
VALUES ('naveen', (select id from company where name = 'COMPANY2'),'def@def.com','$2a$04$j3JpPUp6CTAe.kMWmdRNC.Wie58xDNPfcYz0DBJxWkucJ6ekJuiJm', true);
INSERT INTO user_roles (userid, role) VALUES ((select userid from users where username = 'priya'), 'ROLE_USER');
INSERT INTO user_roles (userid, role) VALUES ((select userid from users where username = 'naveen'), 'ROLE_ADMIN');
INSERT INTO user_roles (userid, role) VALUES ((select userid from users where username = 'naveen'), 'ROLE_USER');
