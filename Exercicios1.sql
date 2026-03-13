-- Criação de tabelas já reformulada conforme os pedidos dos exercícios
CREATE TABLE ALUNO (RM NUMBER(10), NOME VARCHAR(50), SOBRENOME VARCHAR(50), IDADE INT,
CONSTRAINT ALUNO_PK PRIMARY KEY (RM));

INSERT INTO ALUNO (RM,NOME,SOBRENOME,IDADE) VALUES (1,'Antonio','Alves',18);
INSERT INTO ALUNO (RM,NOME,SOBRENOME,IDADE) VALUES (2,'Beatriz','Bernardes',21);
INSERT INTO ALUNO (RM,NOME,SOBRENOME,IDADE) VALUES (3,'Cláudio','Cardoso',20);
INSERT INTO ALUNO (RM,NOME,SOBRENOME,IDADE) VALUES (4,'Gustavo','Douglas',18);

-- Comando obrigatório antes do Declare
-- Sem ele NADA é exibido no terminal
SET SERVEROUTPUT ON
-- Exercício 1
BEGIN
    DBMS_OUTPUT.PUT_LINE('PALMEIRAS NÃO TEM MUNDIAL!');
END;

-- Exercício 2
SET SERVEROUTPUT ON

DECLARE
    v_nome Varchar(20);
    v_sobrenome Varchar(20);
BEGIN
    SELECT nome, sobrenome
    INTO v_nome, v_sobrenome -- Uso INTO para indicar em qual variável vou salvar
    FROM aluno
    Where rm = 1;

    DBMS_OUTPUT.PUT_LINE('O nome do aluno é: ' || v_nome || ' ' || v_sobrenome); -- Funciona como print
END;

-- Exercício 3
SET SERVEROUTPUT ON

DECLARE
    v_nome VARCHAR(20);
    i_idade INT;
BEGIN
    SELECT nome, idade
    INTO v_nome, i_idade -- Uso INTO para indicar em qual variável vou salvar
    FROM aluno
    Where rm = 4;

    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome || ' - Idade: ' || i_idade); -- Funciona como print
END;

-- Pra apagar a tabela DROP TABLE aluno;

-- Resposta:
--- Criação da nossa tabela Aluno
CREATE TABLE ALUNO ( RM NUMBER(10), NOME VARCHAR2(50),
CONSTRAINT ALUNO_PK PRIMARY KEY(RM));

--- Carga de Dados
INSERT INTO ALUNO (RM,NOME) VALUES (1,'Antonio Alves');
INSERT INTO ALUNO (RM,NOME) VALUES (2,'Beatriz Bernardes');
INSERT INTO ALUNO (RM,NOME) VALUES (3,'Cláudio Cardoso');


--- Comando obrigatório antes do Declare
--- Sem ele NADA é exibido no terminal
SET SERVEROUTPUT ON

DECLARE
    v_nome Varchar(20);
BEGIN
   SELECT nome
   INTO v_nome --- Uso INTO para indicar em qual variável vou salvar
   FROM aluno
   Where rm = 1;
   DBMS_OUTPUT.PUT_LINE('O nome do aluno é: '||v_nome); ---Funciona como print
END;
/

--- Exercício 1: Crie um bloco PL/SQL que exiba a mensagem: "Palmeiras não tem mundial"

SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Palmeiras NÃO tem Mundial 🏆');
END;
/


--- Exercício 2: Adicione uma coluna chamada “sobrenome” na tabela aluno, altere o bloco PL-SQL

CREATE TABLE ALUNO_COMPLETO (
  RM NUMBER(10),
  NOME VARCHAR2(50),
  SOBRENOME VARCHAR2(30),
  CONSTRAINT ALUNO_COMPLETO_PK PRIMARY KEY (RM)
);


INSERT INTO ALUNO_COMPLETO (RM, NOME, SOBRENOME)
VALUES (1, 'Antonio', 'Alves');

INSERT INTO ALUNO_COMPLETO (RM, NOME, SOBRENOME)
VALUES (2, 'Beatriz', 'Bernardes');

INSERT INTO ALUNO_COMPLETO (RM, NOME, SOBRENOME)
VALUES (3, 'Cláudio', 'Cardoso');

COMMIT;


SET SERVEROUTPUT ON;

DECLARE
  v_nome      VARCHAR2(50);
  v_sobrenome VARCHAR2(30);
BEGIN
  SELECT nome, sobrenome
  INTO v_nome, v_sobrenome
  FROM aluno_completo
  WHERE rm = 1;

  DBMS_OUTPUT.PUT_LINE(
    'O nome completo do aluno é: ' || v_nome || ' ' || v_sobrenome);
END;
/


-- Crie um bloco PL/SQL que declare as variáveis v_nome e v_idade, faça a atribuição de
-- valores e exiba:
--Nome: Gustavo – Idade: 18
--Obs:
--v_nome := ‘Gustavo’;

SET SERVEROUTPUT ON;

DECLARE
  v_nome VARCHAR2(50);
  v_idade NUMBER;
BEGIN
  v_nome := 'Gustavo';
  v_idade := 18;

  DBMS_OUTPUT.PUT_LINE(
    'Nome: ' || v_nome || ' – Idade: ' || v_idade);
END;
/