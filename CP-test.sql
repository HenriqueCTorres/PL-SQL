set SERVEROUTPUT ON;

-- 1º Exercício - Comparação de idades
DECLARE
    v_idade1 Number:= 20;
    v_idade2 Number:= 21;
BEGIN
    if v_idade1 > v_idade2 then
    DBMS_OUTPUT.PUT_LINE('A idade: ' || v_idade1 || ' é maior que a: ' || v_idade1 || '');
    elsif v_idade1 < v_idade2 then
    DBMS_OUTPUT.PUT_LINE('A idade: ' || v_idade2 || ' é maior que a: ' || v_idade1 || '');
    else
    DBMS_OUTPUT.PUT_LINE('A idade: ' || v_idade1 || ' é igual a: ' || v_idade2 || '');
    End if;
end;
/

-- 2º Exercício - Conversão de dias
DECLARE
    v_dias NUMBER:= 100;
    v_anos NUMBER;
    v_meses NUMBER;
    v_restodias NUMBER;
BEGIN
    -- Calcular anos
    v_anos := TRUNC(v_dias / 365);

    -- Calcular meses
    v_meses := TRUNC(MOD(v_dias, 365) / 30);

    -- Calcular dias restantes
    v_restodias := MOD(MOD(v_dias, 365), 30);

    -- Mostrar resultado
    DBMS_OUTPUT.PUT_LINE('Dias informados: ' || v_dias);
    DBMS_OUTPUT.PUT_LINE('Anos: ' || v_anos);
    DBMS_OUTPUT.PUT_LINE('Meses: ' || v_meses);
    DBMS_OUTPUT.PUT_LINE('Dias: ' || v_restodias);

END;
/

-- 3º Exercício - Bonificação salarial
DECLARE
    v_salario NUMBER:= 1500;
    v_salariototal NUMBER :=0;
BEGIN
    v_salariototal := v_salario * 1.15;
    DBMS_OUTPUT.PUT_LINE('O salário final será de: R$' || v_salariototal || '');
END;

-- 4º Exercício - STUDENTS
-- Criar a tabela
DROP TABLE STUDENTS;

CREATE TABLE STUDENTS (
    matricula INT PRIMARY KEY,
    nome VARCHAR(100),
    nota1 DECIMAL(4,2),
    nota2 DECIMAL(4,2),
    nota_final DECIMAL(4,2),
    status_aprovacao VARCHAR(20)
);

-- Inserir 10 alunos
INSERT INTO STUDENTS VALUES (1001, 'Ana Souza', 7.5, 8.0, 7.75, 'Aprovado');
INSERT INTO STUDENTS VALUES (1002, 'Bruno Lima', 6.0, 5.5, 5.75, 'Reprovado');
INSERT INTO STUDENTS VALUES (1003, 'Carlos Mendes', 8.5, 9.0, 8.75, 'Aprovado');
INSERT INTO STUDENTS VALUES (1004, 'Daniela Rocha', 7.0, 6.5, 6.75, 'Aprovado');
INSERT INTO STUDENTS VALUES (1005, 'Eduardo Alves', 4.5, 5.0, 4.75, 'Reprovado');
INSERT INTO STUDENTS VALUES (1006, 'Fernanda Costa', 9.0, 8.5, 8.75, 'Aprovado');
INSERT INTO STUDENTS VALUES (1007, 'Gabriel Martins', 6.5, 7.0, 6.75, 'Aprovado');
INSERT INTO STUDENTS VALUES (1008, 'Helena Ribeiro', 5.0, 5.5, 5.25, 'Reprovado');
INSERT INTO STUDENTS VALUES (1009, 'Igor Carvalho', 8.0, 7.5, 7.75, 'Aprovado');
INSERT INTO STUDENTS VALUES (1010, 'Juliana Pereira', 6.0, 6.5, 6.25, 'Aprovado');

-- Bloco PL/SQL
DECLARE
    v_id INTEGER := 1007;
    v_notafinal DECIMAL(4,2);
BEGIN
    SELECT nota_final
    INTO v_notafinal
    FROM STUDENTS
    WHERE matricula = v_id;

    IF v_notafinal >= 7 THEN
        UPDATE STUDENTS
        SET status_aprovacao = 'Aprovado'
        WHERE matricula = v_id;
        DBMS_OUTPUT.PUT_LINE('O aluno: ' || v_id || ' foi aprovado');

    ELSIF v_notafinal >= 5 AND v_notafinal < 7 THEN
        UPDATE STUDENTS
        SET status_aprovacao = 'Recuperação'
        WHERE matricula = v_id;
        DBMS_OUTPUT.PUT_LINE('O aluno: ' || v_id || ' está de recuperação');

    ELSE
        UPDATE STUDENTS
        SET status_aprovacao = 'Reprovado'
        WHERE matricula = v_id;
        DBMS_OUTPUT.PUT_LINE('O aluno: ' || v_id || ' está reprovado');
    END IF;
END;
/