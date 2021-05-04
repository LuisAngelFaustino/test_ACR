create database cielo_rojo;
use cielo_rojo;

create table Aliados(idAliados int primary key auto_increment,Nom varchar(50),address varchar(50),image varchar(50),telephone varchar(10),CreateAt date,UpdatedAt date );
create table SocialNetworks (IdSocialNetwork int primary key auto_increment, descripcion varchar(50),idAliados int, CreateAt date,UpdatedAt date );
create table Rol(idRole int primary key auto_increment, descripcion varchar(50),CreateAt date,UpdatedAt date, enabled varchar(50));
create table usuario(idUser int primary key auto_increment,nom varchar(50),LastName varchar(50), Email varchar(50),UserName varchar(50),Pass varchar(50),CreatedAt date,UpdatedAt date,Enabled varchar(50),IdUserRole int );
create table userRole(idUserRole int primary key auto_increment, idRole int, IdProject int,idUser int);
create table project(IdProject int primary key auto_increment, Nom varchar(50), Title varchar(50),Descripcion varchar(50),CreatedAt date,UpdatedAt date,Enabled varchar(50),IdTypeProject int );
create table Referencias(IdReference int primary key auto_increment,Referece varchar(50),IdProject int, CreatedAt date,UpdatedAt date);
create table Contents(IdContent int primary key auto_increment,Texto varchar(500),Posicion int,IdProject int);
create table TypeProject(IdTypeProject int primary key auto_increment,Descripcion varchar(500));
create table Author(IdAuthor int primary key auto_increment,IdUser int,IdProject int);
create table Awards (IdAward int primary key auto_increment,Nom varchar(50),fecha date,Image varchar(59),IdProject int );
create table Videos (IdVideo int primary key auto_increment,Video varchar(50),Descripcion varchar(50),Posicion int,CreatedAt date,UpdateAt date ,IdProject int);
create table VideosAuthor(IdVideoAuthor int primary key auto_increment,IdVideo int, IdContentAuthor int);
create table ContentAuthor(IdContentAuthor int primary key auto_increment,Nom varchar(50),LastName varchar(50));
create table ImagesAuthor(IdImageAuthor int primary key auto_increment,IdImage int,IdContentAuthor int);
create table Images(IdImage int primary key auto_increment,Image varchar(50),Descripcion varchar(50),Posicion int,CreatedAt date,UpdateAt date,IdProject int);

alter table SocialNetworks add foreign key (idAliados) references Aliados (idAliados);
alter table userRole add foreign key (IdRole) references Rol (IdRole);
alter table userRole add foreign key (IdProject) references project (IdProject);
alter table userRole add foreign key (idUser) references usuario (idUser);
alter table usuario add foreign key (idUserRole) references userRole (idUserRole);
alter table author add foreign key (idUser) references usuario (idUser);
alter table author add foreign key (IdProject) references project (IdProject);
alter table project add foreign key (IdTypeProject) references TypeProject (IdTypeProject);
alter table Referencias add foreign key (idProject) references project (idProject);
alter table Contents add foreign key (idProject) references project (idProject);
alter table Awards add foreign key (idProject) references project (idProject);
alter table videos add foreign key (idProject) references project (idProject);
alter table VideosAuthor add foreign key (idVideo) references Videos (idVideo);
alter table VideosAuthor add foreign key (idContentAuthor) references ContentAuthor (idContentAuthor);
alter table ImagesAuthor add foreign key (idContentAuthor) references ContentAuthor (idContentAuthor);
alter table ImagesAuthor add foreign key (idImage) references Images(idImage);
alter table images add foreign key (idProject) references project (idProject);

CREATE USER 'cesar'@'localhost' identified by 'Cer.16cesarS';
GRANT ALL PRIVILEGES ON cielo_rojo.* TO 'cesar'@'localhost';


