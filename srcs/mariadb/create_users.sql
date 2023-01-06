CREATE USER 'rcappend'@'%' IDENTIFIED BY 'rcappend-password';
GRANT ALL PRIVILEGES ON *.* TO 'rcappend'@'%';

CREATE USER 'not_rcappend'@'%' IDENTIFIED BY 'not-rcappend-password';
-- GRANT ALL PRIVILEGES ON *.* TO 'user2'@'%';
