SET SERVEROUTPUT ON;

--- Exercício 01

--- Observação: Ao colocar o & na frente do nome da variável significa que iremos fazer o input  de dados 😉


DECLARE
    v_idade1 NUMBER := &idade1;
    v_idade2 NUMBER := &idade2;
BEGIN
    IF v_idade1 > v_idade2 THEN
        DBMS_OUTPUT.PUT_LINE('A primeira pessoa é mais velha.');
    ELSIF v_idade2 > v_idade1 THEN
        DBMS_OUTPUT.PUT_LINE('A segunda pessoa é mais velha.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ambas possuem a mesma idade.');
    END IF;
END;
/

--- Exercício 02

--- Considerar:
--- 1 ano = 365 dias
--- 1 mês = 30 dias
--- Obs: A função TRUNC pega somente a parte inteira do resultado da divisão.

DECLARE
    v_dias NUMBER := &dias;
    v_anos NUMBER;
    v_meses NUMBER;
    v_restodias NUMBER;
BEGIN
    v_anos := TRUNC(v_dias / 365);
    v_meses := TRUNC(MOD(v_dias,365) / 30);
    v_restodias := MOD(MOD(v_dias,365),30);

    DBMS_OUTPUT.PUT_LINE('Anos: ' || v_anos);
    DBMS_OUTPUT.PUT_LINE('Meses: ' || v_meses);
    DBMS_OUTPUT.PUT_LINE('Dias: ' || v_restodias);
END;
/

--- Exercício 03

DECLARE
    v_salario_base NUMBER := &salario;
    v_bonus NUMBER;
    v_salario_final NUMBER;
BEGIN
    v_bonus := v_salario_base * 0.15;
    v_salario_final := v_salario_base + v_bonus;

    DBMS_OUTPUT.PUT_LINE('Salário Base: ' || v_salario_base);
    DBMS_OUTPUT.PUT_LINE('Bonificação: ' || v_bonus);
    DBMS_OUTPUT.PUT_LINE('Salário Final: ' || v_salario_final);
END;
/

--- Exercício 04


CREATE TABLE STUDENTS (
    MATRICULA NUMBER PRIMARY KEY,
    NOME VARCHAR2(100),
    NOTA_FINAL NUMBER(4,2),
    STATUS VARCHAR2(20)
);

INSERT INTO STUDENTS VALUES (1,'Ana',8,NULL);
INSERT INTO STUDENTS VALUES (2,'Bruno',6,NULL);
INSERT INTO STUDENTS VALUES (3,'Carlos',4,NULL);
INSERT INTO STUDENTS VALUES (4,'Daniela',7,NULL);
INSERT INTO STUDENTS VALUES (5,'Eduardo',5,NULL);
INSERT INTO STUDENTS VALUES (6,'Fernanda',9,NULL);
INSERT INTO STUDENTS VALUES (7,'Gabriel',3,NULL);
INSERT INTO STUDENTS VALUES (8,'Helena',6.5,NULL);
INSERT INTO STUDENTS VALUES (9,'Igor',7.5,NULL);
INSERT INTO STUDENTS VALUES (10,'Julia',2,NULL);

COMMIT;

DECLARE
    v_id NUMBER := &matricula;
    v_nota NUMBER;
    v_status VARCHAR2(20);
BEGIN

    SELECT NOTA_FINAL
    INTO v_nota
    FROM STUDENTS
    WHERE MATRICULA = v_id;

    IF v_nota >= 7 THEN
        v_status := 'Aprovado';
    ELSIF v_nota >= 5 THEN
        v_status := 'Recuperação';
    ELSE
        v_status := 'Reprovado';
    END IF;

    UPDATE STUDENTS
    SET STATUS = v_status
    WHERE MATRICULA = v_id;

    DBMS_OUTPUT.PUT_LINE('Aluno classificado como: ' || v_status);

END;
/