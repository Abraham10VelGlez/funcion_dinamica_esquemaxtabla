# funcion_dinamica_esquemaxtabla
creacion de funcion dinamica de esquema por tabla para multi esquemas eficiencia en datos POSTGRESQL
CREATE OR REPLACE FUNCTION funcionabram(
    esquemaname text
)
--RETURNS TABLE (usox VARCHAR(50),usodescrix VARCHAR(100),valm2constx VARCHAR(50))
--returns TABLE (esquema VARCHAR(50),tablaz VARCHAR(100))
---returns text
RETURNS TABLE (uso varchar(100), usodescri varchar(100), valm2const varchar(100))
AS $$
DECLARE
    abrasql TEXT;
    tiposchema TEXT;
   tipotable TEXT;
  esquemaytabla text;
  res RECORD;
begin
	 tiposchema := CONCAT('nombredeesquema', esquemaname);
	tipotable := CONCAT('tablarepetitivaxesquema', esquemaname);
	--RETURN tipotable;
 -- Construir la consulta dinámicamente
    abrasql := 'select uso,usodescri,valm2const from ' || tiposchema || '.' || tipotable;    
    -- Ejecutar la consulta dinámica
    return QUERY EXECUTE abrasql;      
END;
$$ LANGUAGE plpgsql;


select * from  public.funcionabram('12');
