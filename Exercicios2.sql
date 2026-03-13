set SERVEROUTPUT ON;


-- 1º Exercício
DECLARE
v_numero Number:=0;
begin
if v_numero > 0 then
DBMS_OUTPUT.PUT_LINE('Positivo');
elsif v_numero < 0 then
DBMS_OUTPUT.PUT_LINE('Negativo');
elsif v_numero = 0 then
DBMS_OUTPUT.PUT_LINE('Zero');
End if;
end;
/

-- 2º Exercício
DECLARE
v_idade Number:=64;
begin
if v_idade < 18 then
DBMS_OUTPUT.PUT_LINE('Fraldinha');
elsif v_idade >= 18 and v_idade < 65 then
DBMS_OUTPUT.PUT_LINE('É di maior');
elsif v_idade >= 65 then
DBMS_OUTPUT.PUT_LINE('Tá idoso!');
End if;
end;
/

-- 3º Exercício
DECLARE
v_idade Number:=60;
begin
if v_idade <= 12 then
DBMS_OUTPUT.PUT_LINE('Criança');
elsif v_idade >= 13 and v_idade <= 17 then
DBMS_OUTPUT.PUT_LINE('Adolescente');
elsif v_idade >= 18 and v_idade <= 59 then
DBMS_OUTPUT.PUT_LINE('Adulto');
else
DBMS_OUTPUT.PUT_LINE('Idoso');
End if;
end;
/

-- 4º Exercício
DECLARE
v_nome VARCHAR2(20):= 'Pedro';
v_nota Number:= 3;
begin
if v_nota < 4 then
DBMS_OUTPUT.PUT_LINE('O aluno: ' || v_nome || ' está Reprovado');
elsif v_nota >= 4 and v_nota <= 5 then
DBMS_OUTPUT.PUT_LINE('O aluno: ' || v_nome || ' está de Exame');
else
DBMS_OUTPUT.PUT_LINE('O aluno: ' || v_nome || ' está Aprovado');
End if;
end;
/

-- 5º Exercício
DECLARE
v_valor Number:= 500;
v_total Number;
begin
if v_valor >= 500 then
v_total:= (v_valor - (v_valor * 0.20));
DBMS_OUTPUT.PUT_LINE('O valor ficará no total de: R$' || v_total || ' por conta do desconto de 20%');
elsif v_valor >= 200 and v_valor < 500 then
v_total:= (v_valor - (v_valor * 0.10));
DBMS_OUTPUT.PUT_LINE('O valor ficará no total de: R$' || v_total || ' por conta do desconto de 10%');
else
DBMS_OUTPUT.PUT_LINE('O valor ficará no total de: R$' || v_valor || '');
End if;
end;
/

-- 6º Exercício
DECLARE
v_imc Number:= 40;
begin
if v_imc < 18.5 then
DBMS_OUTPUT.PUT_LINE('Abaixo do peso');
elsif v_imc < 25 then
DBMS_OUTPUT.PUT_LINE('Peso normal');
elsif v_imc < 30 then
DBMS_OUTPUT.PUT_LINE('Sobrepeso');
else
DBMS_OUTPUT.PUT_LINE('Obesidade');
End if;
end;
/