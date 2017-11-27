-- Project 2 DDLs: create.clp
--
connect to cs157a;
--
-- drop previous definition first
drop view p2.total_balance;
drop table p2.account;
drop table p2.customer;
--
-- Without column constraint on Age & Pin, need logic in application to handle
--
create table p2.customer
(
  ID            integer generated always as identity (start with 100, increment by 1, NO CACHE),
  Name          varchar(15) not null,
  Gender        char check (Gender in ('M','F')),
  Age           integer not null CHECK(Age >= 0),
  Pin           integer not null CHECK(Pin >=0),
  primary key (ID)
);
--
-- Without column constraint on Balance, Type, Status, need logic in application to handle
--
create table p2.account
(
  Number        integer generated always as identity (start with 1000, increment by 1, NO CACHE),
  ID            integer not null references p2.customer (ID),
  Balance       integer not null CHECK(BALANCE >= 0),
  Type          char not null CHECK(Type IN ('C','S')),
  Status        char not null CHECK(Status IN ('A', 'I')),
  primary key (Number)
);
--
-- Views can reduce application logic. For example, you can join this view with p2.customer
-- to search total balance based on Age and/or Gender.
--
create view p2.total_balance as
  select a.ID, SUM(a.Balance) Total
  from p2.account a WHERE a.Status = 'A'
group by a.ID;
--

commit;
terminate;
