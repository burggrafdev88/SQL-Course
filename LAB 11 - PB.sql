--3.
/*CREATE TABLE MEMBERS
(
member_id NUMBER, 
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
address VARCHAR(100) NOT NULL,
city VARCHAR(50) NOT NULL,
state VARCHAR(25) NOT NULL,
phone VARCHAR(15) NOT NULL,
CONSTRAINT members_pk PRIMARY KEY (member_id)
) 

CREATE TABLE GROUPS
(
group_id NUMBER,
group_name VARCHAR(50) NOT NULL,
CONSTRAINT groups_pk PRIMARY KEY (group_id)
) 

CREATE TABLE members_groups
(
member_id NUMBER,
group_id NUMBER,
CONSTRAINT members_groups_fk_members 
    FOREIGN KEY (member_id) REFERENCES members(member_id),
CONSTRAINT members_groups_fk_groups
    FOREIGN KEY (group_id) REFERENCES groups(group_id)
) */

--4. 
/*
INSERT INTO members
VALUES (1, 'John', 'Smith', '334 Valencia St.', 'San Francisco', 'CA', '415-942-1901');
INSERT INTO members
VALUES (2, 'Jane', 'Doe', '872 Chetwood St.', 'Oakland', 'CA', '510-123-4567');

INSERT INTO groups
VALUES (1, 'Book Club');
INSERT INTO groups
VALUES (2, 'Bicycle Coalition');

INSERT INTO members_groups
VALUES (1, 2);
INSERT INTO members_groups
VALUES (2, 1);
INSERT INTO members_groups
VALUES (2, 2);

SELECT group_name, last_name, first_name
FROM MEMBERS_GROUPS JOIN MEMBERS
    ON MEMBERS_GROUPS.MEMBER_ID = MEMBERS.MEMBER_ID JOIN GROUPS
    ON GROUPS.GROUP_ID = MEMBERS_GROUPS.GROUP_ID;
    
--5.
CREATE SEQUENCE member_id_seq
    START WITH 3;
    
CREATE SEQUENCE group_id_seq
    START WITH 3;
    
--6.
INSERT INTO GROUPS
VALUES (GROUP_ID_SEQ.NEXTVAL, 'JIU JITSU CLUB');

SELECT *
FROM GROUPS;  */

--7.
ALTER TABLE MEMBERS ADD
(
ANNUAL_DUES NUMERIC(5,2) DEFAULT 52.50,
PAYMENT_DATE DATE
);

--8.
ALTER TABLE GROUPS
MODIFY GROUP_NAME VARCHAR2(50) UNIQUE;

INSERT INTO groups
VALUES (1, 'Book Club');
INSERT INTO groups
VALUES (2, 'Bicycle Coalition');



