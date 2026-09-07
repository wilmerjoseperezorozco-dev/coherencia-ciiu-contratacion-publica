# Metodología

## 1. Fuentes y cruce de datos

- **RUES** (`c82u-588k`, datos.gov.co): registro mercantil. Aporta NIT, razón social, forma
  jurídica, y el código CIIU de actividad económica principal (`cod_ciiu_act_econ_pri`).
- **SECOP II** (`jbjy-vk9h`, datos.gov.co): contratos estatales, filtrados a `es_pyme='Si'`.
  Aporta NIT/documento del proveedor adjudicado, entidad contratante, objeto del contrato,
  tipo de contrato y valor.
- **Catálogo CIIU Rev. 4 A.C. (2020)**: reconstruido en este mismo proyecto de datos a
  partir del texto oficial de la Resolución DIAN 000114 de 2020 (499 clases, 88 divisiones,
  21 secciones) — corrige un catálogo de referencia previo desactualizado que databa de
  2012 y que subestimaba la tasa real de clasificación válida.

**Cruce:** por NIT normalizado (`empresas.nit` sin dígito de verificación =
`contratos_secop.numero_documento`, solo cuando `tipo_documento='NIT'`). La consulta exacta
está en [`analisis/consulta_cruce_ciiu_objeto.sql`](../analisis/consulta_cruce_ciiu_objeto.sql).

### Limitación de tamaño de muestra, y cómo se resuelve para escalar

El piloto actual (26 empresas, 54 contratos) surge de dos muestreos **independientes**:
300 empresas RUES y 300 contratos SECOP por ciudad, extraídos por separado, no dirigidos a
los mismos NIT. La tasa de cruce (~0,4%) es un artefacto de ese diseño de muestreo, **no**
una medida de la tasa real de solapamiento entre empresas formales y contratistas del
Estado. Para escalar este piloto a un estudio con n grande, el paso metodológico correcto no
es "extraer más empresas al azar" — es invertir el orden: partir de la lista de NIT
ganadores de contratos SECOP (que ya se tiene completa por consulta directa a la API) y
buscar **cada uno** de esos NIT en RUES de forma dirigida. Esto convierte el cruce de un
0,4% incidental a, potencialmente, un cruce cercano al 100% de los contratos PyME
verificables contra el registro mercantil — la limitación pasa a ser solo cuántos NIT
distintos ganaron contratos en el periodo de estudio, no el diseño de muestreo.

## 2. Indicador de coherencia CIIU-objeto (dos niveles)

### Nivel 1 — Reglas por sección (rápido, interpretable, punto de partida)

Cada contrato se clasifica en una de tres categorías:

- **Coherente**: el objeto del contrato contiene vocabulario propio de la sección/división
  CIIU del contratista (ej. contratista con CIIU de sección F "Construcción" y objeto que
  menciona "obra", "construcción", "obras civiles").
- **Incoherente**: el objeto del contrato corresponde claramente a una sección CIIU distinta
  a la registrada (el caso Jp Soluciones documentado en
  [`hallazgos-preliminares.md`](hallazgos-preliminares.md) es un incoherente de manual).
- **No verificable**: el campo `objeto_del_contrato` viene como `"No definido"` en la fuente
  — en el piloto esto ocurre en una fracción no menor de los registros y debe excluirse del
  índice, nunca imputarse.

### Nivel 2 — Similitud semántica con embeddings (la versión de tesis)

El Nivel 1 es frágil ante lenguaje libre y jerga técnica. La versión rigurosa —la que
correspondería a un trabajo de grado— reemplaza el diccionario de palabras clave por:

1. Generar un embedding de la descripción oficial de la clase CIIU (`clase_desc` del
   catálogo reconstruido) con un modelo de lenguaje en español (Sentence-Transformers
   multilingüe o BETO/BERT en español).
2. Generar un embedding del `objeto_del_contrato` con el mismo modelo.
3. Calcular similitud coseno entre ambos vectores.
4. Definir un **índice de incoherencia clasificatoria** = `1 - similitud_coseno`, con un
   umbral calibrado contra una muestra de validación humana (ver sección 3).

La referencia citable para calibrar el umbral: un estudio comparativo de modelos NLP para
clasificación de empresas (MDPI *Information*, 2024) reporta ~92% de exactitud con
similitud coseno usando umbral 0,6 sobre BERT — punto de partida razonable a ajustar con
datos propios, no un valor a copiar sin validar.

## 3. Validación (obligatoria antes de reportar cualquier hallazgo agregado)

Ningún índice automático se reporta como conclusión sin pasar por:

1. **Muestra de validación humana**: tomar una muestra aleatoria de contratos marcados como
   incoherentes por el modelo (y una muestra de los marcados como coherentes, como control)
   y revisarlos manualmente uno por uno — exactamente como se hizo con los 26 casos del
   piloto actual.
2. **Reportar precisión y recall del método** contra esa muestra validada antes de aplicarlo
   a conclusiones agregadas (por entidad, por sección, por ciudad).
3. Nunca reportar un caso individual como "corrupción" — el índice es un indicador
   estadístico de riesgo que amerita revisión por la entidad de control competente, no una
   conclusión sobre la conducta de una empresa o funcionario específico. Esta distinción es
   metodológica, no solo prudencial: un índice de coherencia textual no tiene, por
   construcción, capacidad de establecer intencionalidad.

## 4. Límites explícitos de este trabajo

- La muestra RUES/SECOP actual cubre 21 ciudades, no es un censo nacional — cualquier cifra
  agregada debe presentarse como hallazgo de la muestra, nunca extrapolada sin más al
  universo nacional (844.873 empresas SAS activas, verificado contra datos.gov.co).
- El campo `objeto_del_contrato` de SECOP viene como texto libre sin estandarizar, escrito
  por cada entidad contratante — una fracción de los registros no es verificable
  (`"No definido"`) y debe excluirse, no imputarse.
- SECOP no cubre el 100% de la contratación pública/mixta en Colombia (ver nota de alcance
  en [`marco-teorico.md`](marco-teorico.md)).
- Coherencia CIIU-objeto es una señal de riesgo entre varias posibles (junto a concentración,
  plazos de licitación, número de oferentes) — no sustituye ni pretende superar a VigIA o a
  la literatura de banderas rojas ya existente, la complementa desde un ángulo específico que
  hoy no está cubierto.
