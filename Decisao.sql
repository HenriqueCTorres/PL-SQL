set SERVEROUTPUT ON;

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