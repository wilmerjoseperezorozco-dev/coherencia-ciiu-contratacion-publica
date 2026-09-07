# Hallazgos preliminares (piloto, n=26 empresas / 54 contratos)

**Advertencia de alcance, para leer antes que todo lo demás:** esta es una muestra piloto,
no un estudio concluyente. Sirve para demostrar que el fenómeno es real y medible, y para
diseñar la metodología de escala descrita en [`metodologia.md`](metodologia.md) — no para
afirmar qué tan extendido está el problema en el universo nacional de contratación. Ningún
caso aquí documentado implica una acusación de irregularidad contra la empresa o entidad
mencionada: son clasificaciones de texto (CIIU vs. objeto de contrato) leídas directamente
de datos públicos oficiales, presentadas como lo que son — un indicador de riesgo que
amerita revisión, no una conclusión sobre conducta.

## El caso más claro: Jp Soluciones Colombia S.A.S.

- **CIIU registrado en RUES:** 4711 — "Comercio al por menor en establecimientos no
  especializados con surtido compuesto principalmente por alimentos, bebidas (alcohólicas y
  no alcohólicas) o tabaco" (una tienda de barrio / minimercado, en términos llanos).
- **10 contratos con el SENA Regional Guajira**, ninguno relacionado con alimentos:
  - Kits para proyectos de ciencia y tecnología (Tecnoacademia)
  - Materiales y maquinaria para el área de confecciones
  - Equipos para el Laboratorio de Energías Renovables
  - Equipos de diseño de moda de alta tecnología
  - Materiales de formación de cocina (el más cercano a su CIIU, y aun así es material de
    *formación*, no venta de alimentos)
  - Apoyo logístico para actividades de bienestar de aprendices
  - Materiales de formación en economía popular
- Valor acumulado de estos 10 contratos: más de 1.400 millones de pesos.

Una tienda de barrio, según su propio registro mercantil, ganando de forma sostenida
contratos de suministro de maquinaria y equipos de laboratorio para un mismo cliente
institucional. Es exactamente el patrón que motivó esta investigación, confirmado con datos
reales y verificados por NIT, no por coincidencia de nombre.

## El patrón sistémico: el código "comodín" 4659

Cuatro empresas **independientes entre sí** (sin relación aparente) están registradas bajo
el mismo código genérico **4659 — "Comercio al por mayor de otros tipos de maquinaria y
equipo n.c.p."** mientras operan de forma específica en insumos y equipos médicos:

| Empresa | Objeto de los contratos ganados |
|---|---|
| Caldas Médicas S.A.S. | Material odontológico, condones (plan de salud pública), material médico-quirúrgico, dispositivos médicos |
| Distmedias y Ortopédicos S.A.S. | Suministro no especificado a un dispensario médico |
| Tech-Médica Equipos Médicos S.A.S. | Succionadores quirúrgicos |
| Distribuidora Ingebo S.A.S. | Mantenimiento especializado de equipos biomédicos |

El catálogo CIIU sí tiene un código específico para esto (4645, "Comercio al por mayor de
productos farmacéuticos, medicinales, cosméticos y de tocador") — pero ninguna de las cuatro
lo usa. Esto no es necesariamente mala fe: es más probable que sea una consecuencia de que
4659 es un código "comodín" fácil de elegir al momento de constituir la empresa, sin que
nadie corrija esa clasificación después. El efecto práctico es el mismo que si fuera
deliberado: el registro mercantil deja de servir para verificar la capacidad real de la
empresa, que es justo la función que le da la normativa (ver
[`marco-teorico.md`](marco-teorico.md)). Este patrón — vaguedad sistemática por uso de
códigos "n.c.p." como default — es en sí mismo un hallazgo, distinto y más extendido que el
caso de incoherencia flagrante de Jp Soluciones.

## Un mismatch de tipo de actividad, no solo de sector

**Distribuidora Ingebo S.A.S.** merece mención aparte: registrada bajo un código de
**comercio** (venta de bienes, división 46), su contrato real es de **servicios
especializados de mantenimiento biomédico** (división 33 — instalación, mantenimiento y
reparación especializados). No es solo que le falte precisión dentro del sector médico —
está clasificada en el tipo de actividad económica equivocado (venta vs. servicio técnico),
una categoría de error distinta y más estructural que la simple genericidad del código 4659.

## Contraejemplos: casos coherentes, útiles como control metodológico

Para que el índice de coherencia sea creíble, tiene que distinguir bien los casos que sí
están correctos. Dos ejemplos reales de la misma muestra que confirman que el método no
marca todo como sospechoso:

- **Industrias Enfacol S.A.S.** (CIIU 2920, fabricación de carrocerías para vehículos y
  remolques) vendió una ambulancia 4x4 a un hospital. Es coherente: una ambulancia es,
  técnicamente, una carrocería especializada sobre un chasís — exactamente el tipo de
  producto que describe su CIIU.
- **Tod's D'Blanko S.A.S.** (CIIU 1410, confección de prendas de vestir) vendió vestido y
  calzado de labor a una ESE. Coherente de manual.

## Limitación honesta de esta muestra

Del total de contratos cruzados, una fracción relevante trae el campo `objeto_del_contrato`
como `"No definido"` en la fuente SECOP — esos casos se excluyeron de cualquier
clasificación (no se puede evaluar coherencia sobre un campo vacío) y no deben confundirse
con "coherentes" ni con "incoherentes". Cualquier índice agregado que se calcule sobre esta
muestra debe reportar ese porcentaje de no-verificables de forma explícita, no ocultarlo en
el denominador.

## Qué prueba este piloto, y qué no

**Sí prueba:** el fenómeno de incoherencia CIIU-objeto es real, existe en datos oficiales
verificados por NIT, tiene al menos un patrón claro (código comodín) y al menos un caso
flagrante (Jp Soluciones) — suficiente para justificar escalar la metodología.

**No prueba:** qué porcentaje de la contratación pública colombiana tiene este problema, si
existe intencionalidad en algún caso particular, ni si hay una relación causal con
corrupción — ninguna de esas preguntas se puede responder con n=26 y sin la validación
humana a escala descrita en [`metodologia.md`](metodologia.md).
