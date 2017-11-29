# Banking-System-Using-C-and-Embedded-SQL

INSTRUCTIONS TO RUN

The create.clp script will drop all tables/views and recreate them
It assumes that the database cs157a exist
if it does not exist yet, please create it using CREATE DATABASE cs157a

On the mac, first start docker
then open terminal and type in
eval $(docker-machine env ibm-db2) && docker exec -it db2server bash -c "su - db2inst1"

type in vi create.clp and press A to insert the contents of the create.clp I have included
then press esc and press : and type in wq and enter to save

In the db.properties file please change the user, password to match yours or it will not work.
then on the db2 terminal, type in vi db.properties and paste in the contents of mine after you change the id/pass

type in vi p2.sqc in the db2 terminal and paste in the contents of my p2.sql

to run my program paste in the following commands:

db2 -tvf create.clp;
db2 connect to cs157a
db2 prep p2.sqc
cc -I./sqllib/include -c p2.c
cc -o p2 p2.o -L./sqllib/lib -ldb2
./p2 db.properties

It will run the batch stuff and them run the user prompt stuff for you to test
