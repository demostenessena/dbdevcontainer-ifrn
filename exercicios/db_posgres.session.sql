create schema dbex;

create table dbex.cliente (
    id int generated always as identity,
    nome varchar(100) not null,
    constraint client_id_pk primary key(id)
);

drop table dbex.cliente;

create table dbex.endereco (
    client_id int primary key,
    rua varchar(100) not null,
    constraint client_id_fk foreign key(client_id) references dbex.cliente(id)
);


create table dbex.teste (
    client_id int primary key
);

drop table dbex.teste;