
create table client
(
    id INT NOT NULL,
    full_name VARCHAR(40),
    CONSTRAINT PK_client PRIMARY KEY  (id)
);

create table company_type
(
    id INT NOT NULL,
    name VARCHAR(40),
    percent double,
    CONSTRAINT PK_company_type PRIMARY KEY  (id)
);
create table company
  (
    id INT NOT NULL,
    name VARCHAR(40),
    company_type_id int,
    CONSTRAINT PK_company PRIMARY KEY  (id),
    CONSTRAINT FK_company_type foreign key (company_type_id) references company_type(id)
  );
CREATE TABLE transaction
(
    id INT NOT NULL,
    client_ID int NOT NULL,
    monetary DOUBLE,
    date DATE,
    company_ID int,
    CONSTRAINT PK_transaction PRIMARY KEY  (id),
    CONSTRAINT FK_company foreign key (company_ID) references company(id),
    CONSTRAINT FK_client foreign key (client_ID) references client(id)
);
insert into client Values(1, 'Alikhan_Mazhiken') ;
insert into company_type VALUES (1, 'food', 0.15);
insert into company values (1, 'cafe', 1);
insert into transaction values (1, 1, 150, '2019-12-12', 1);