create table Usuario(
    id integer primary key,
    nome varchar(15) not null,
    nasc date,
    tipo varchar(8)
);

create table Jogo(
	id integer  not null,
    foreign key (id) references Usuario(id),
    estilo varchar(15),
    preco float,
	nome varchar(25) primary key,
    classificacao varchar(5) default "Livre",
    baixados integer,
    adminjg integer not null,
    foreign key (adminjg) references Usuario(id),
    aprovado boolean not null default 0
);

create table Comentario(
    idfrom integer not null,
    foreign key (idfrom) references Usuario(id),
    idto integer,
    foreign key (idto) references Usuario(id),
    string varchar(70) not null,
    jogo varchar(25) not null,
    foreign key (jogo) references Jogo(nome),
    id integer primary key auto_increment
);

create table Jogou(
    id integer not null,
    foreign key (id) references Usuario (id),
    nome varchar(25) not null,
    foreign key (nome) references Jogo (nome),
    horas float,
    ultacesso datetime,
    avaliacao float
);

create table Versao(
	num float,
	nome varchar(25),
	foreign key (nome) references Jogo(nome),
	primary key(num, nome)
);

create table Plataforma(
	nome varchar(25),
	foreign key (nome) references Jogo(nome),
	plataforma varchar(10),
	primary key(nome, plataforma)
);

insert into Usuario values(1, "Pablo", "1998-08-24", "AdminBD");

insert into Usuario values(2, "Maria", "1995-05-12", "AdminJG");

insert into Usuario values(3, "Joana", "1993-03-14", "Dev");
insert into Usuario values(4, "Matheus", "1999-02-16", "Dev");
insert into Usuario values(5, "Manuel", "1996-05-24", "Dev");
insert into Usuario values(6, "Larisa", "1992-12-01", "Dev");

insert into Usuario values(7, "Diogo", "1998-07-21", "Usuario");
insert into Usuario values(8, "Adriana", "1999-12-08", "Usuario");
insert into Usuario values(9, "Keytlyn", "2000-07-23", "Usuario");

insert into Jogo values(3, "Acao", 9.99, "Hora de Matar", "18", 0, 2, 0);
insert into Jogo values(4, "Indie", 15.99, "Hora de Aventura", "10", 28, 2, 1);
insert into Jogo values(5, "Aventura", 23.99, "Trust Hollow", "13", 13, 2, 1);
insert into Jogo values(5, "RPG", 2.99, "Red Cape", "Livre", 15, 2, 1);
insert into Jogo values(5, "RPG", 3.99, "Blood Moon", "Livre", 0, 2, 0);

insert into Comentario values(8, null, "Nao gostei.", "Red Cape", 1);
insert into Comentario values(5, 8, "Problema teu.", "Red Cape", 2);
insert into Comentario values(8, 5, "E por causa desses erros ai.", "Red Cape", 3);
insert into Comentario values(9, null, "Ta com error =(.", "Trust Hollow", 4);

insert into Jogou values(1, "Red Cape", 0.2, "2016-07-14 04:33:03", 6.2);
insert into Jogou values(2, "Red Cape", 2, "2018-04-07 10:39:21", 3.2);
insert into Jogou values(6, "Red Cape", 3.1, "2017-03-24 17:43:53", 7.4);
insert into Jogou values(7, "Red Cape", 5.2, "2018-01-17 21:59:24", 1.2);
insert into Jogou values(8, "Hora de Aventura", 2.1, "2018-06-13 22:23:13", 4.8);
insert into Jogou values(7, "Hora de Aventura", 8.5, "2018-06-18 17:47:52", 9.6);
insert into Jogou values(9, "Trust Hollow", 0.6, "2017-07-07 21:12:41", 6.3);

insert into Versao values(1.0, "Hora de Matar");
insert into Versao values(1.8, "Hora de Aventura");
insert into Versao values(1.3, "Trust Hollow");
insert into Versao values(2.0, "Red Cape");

insert into Plataforma values("Hora de Matar", "windows");
insert into Plataforma values("Hora de Matar", "linux");
insert into Plataforma values("Hora de Aventura", "windows");
insert into Plataforma values("Hora de Aventura", "mac");
insert into Plataforma values("Trust Hollow", "mac");
insert into Plataforma values("Red Cape", "windows");
insert into Plataforma values("Red Cape", "linux");
insert into Plataforma values("Red Cape", "mac");
