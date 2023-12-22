CREATE DATABASE teste;
USE teste;

CREATE TABLE pessoas(
cpf varchar(11) PRIMARY KEY NOT NULL,
nome varchar(50) not null,
idade int not null
);

insert into pessoas(cpf, nome, idade) values ('44444444444', 'Gabriel', 18);
insert into pessoas(cpf, nome, idade) values ('99999999999', 'Pedro', 17);

delete from pessoas where pessoas.cpf = '99999999999' ;
SELECT * from pessoas;

DELIMITER //

CREATE TRIGGER trigger_teste_idade_pessoa
BEFORE INSERT ON pessoas FOR EACH ROW
BEGIN
    IF NEW.idade < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pessoa precisa ter mais de 18 anos.';
    END IF;
END;
//
DELIMITER ;