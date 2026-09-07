-- Consulta reproducible que genera la muestra piloto documentada en
-- docs/hallazgos-preliminares.md. Corre contra el esquema del pipeline de extracción RUES +
-- SECOP II (ver docs/metodologia.md para el detalle completo de cómo se construyeron
-- `empresas` y `contratos_secop`, ambos derivados de datasets abiertos de datos.gov.co:
-- RUES c82u-588k y SECOP II jbjy-vk9h).
--
-- El cruce es por NIT normalizado: empresas.nit (sin digito de verificacion) debe calzar
-- con contratos_secop.numero_documento cuando el tipo de documento del proveedor
-- adjudicado es 'NIT' (no cedula de ciudadania, que corresponde a personas naturales).

select
    e.razon_social,
    e.ciiu,
    e.ciiu_desc,
    c.objeto_contrato,
    c.tipo_contrato,
    c.entidad_contratante,
    c.valor_contrato,
    c.ciudad
from empresas e
join contratos_secop c
    on c.empresa_id = e.id
order by e.razon_social;

-- Nota de escala (ver docs/metodologia.md, seccion 1): esta consulta depende de que
-- contratos_secop.empresa_id ya este poblado por un cruce previo de NIT normalizado:
--
-- update contratos_secop c
-- set empresa_id = e.id
-- from empresas e
-- where c.tipo_documento = 'NIT'
--   and c.numero_documento = split_part(e.nit, '-', 1)
--   and c.empresa_id is distinct from e.id;
--
-- Para escalar de la muestra piloto (26 empresas) a un estudio de n grande, el paso
-- correcto NO es repetir el muestreo independiente de RUES/SECOP por ciudad -- es invertir
-- el orden: tomar la lista completa de NIT ganadores de contratos SECOP (consulta directa a
-- jbjy-vk9h, sin necesidad de que el NIT ya este en `empresas`) y buscar cada uno de esos
-- NIT de forma dirigida en RUES (c82u-588k, $where nit in (...)), en vez de depender de que
-- el NIT haya caido por coincidencia en una muestra de 300 empresas por ciudad.
