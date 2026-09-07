# Marco teórico y antecedentes

## 1. El anclaje normativo: la actividad económica sí importa legalmente

Dos piezas normativas colombianas sostienen la premisa de esta investigación — que la
coherencia entre el CIIU registrado de un contratista y el objeto de un contrato estatal no
es un detalle administrativo, sino un requisito con función de control:

1. **Colombia Compra Eficiente** reconoce que la actividad económica (o la posibilidad de
   que una persona jurídica desarrolle las actividades objeto del proceso de contratación
   dentro de su objeto social) es uno de los elementos para verificar la capacidad del
   proponente de ejecutar el objeto contratado y su experiencia en él. Es un requisito
   habilitante subsanable antes de la adjudicación — pero la guía de la propia entidad
   advierte que los proponentes no deberían cambiar su actividad económica de forma
   oportunista, precisamente porque se usa para esa verificación de capacidad.
2. La normativa tributaria colombiana (regulación del Sistema General de Riesgos Laborales)
   establece que cuando se encuentra inconsistencia entre la clasificación CIIU con la que
   fue afiliado un contratista y la actividad económica real del objeto del contrato,
   corresponde una reclasificación — lo cual confirma que el sistema colombiano ya
   contempla, en otro contexto regulatorio, que esta inconsistencia es real, medible y
   corregible.

Ninguna de las dos normas exige hoy una verificación automática y sistemática de esta
coherencia al momento de la adjudicación — ambas dependen de que alguien la detecte
manualmente, caso por caso. Ese es el vacío operativo que esta investigación cuantifica.

## 2. Lo que ya existe: vigilancia de la contratación pública en Colombia

El ecosistema de vigilancia de SECOP es más robusto de lo que parece a primera vista, y
cualquier trabajo nuevo tiene que posicionarse frente a él, no ignorarlo:

- **VigIA** (Contraloría General / DNP): sistema de aprendizaje automático para priorizar
  auditorías de contratación pública mediante índices de riesgo, publicado en *Data &
  Policy* (Cambridge University Press).
- **Infocontratos**: herramienta de IA sobre datos abiertos de datos.gov.co para detección
  de anomalías y alertas tempranas en tiempo real.
- **Open Contracting Partnership**: investigación multi-país (incluyendo Colombia) sobre
  "banderas rojas" de contratación — los indicadores más informativos identificados fueron
  plazos de licitación anormalmente cortos y número promedio de oferentes por proceso.
- Estudios académicos de minería de datos sobre más de 5,6 millones de registros de SECOP
  (2013-2019) y trabajos sobre concentración y "apego preferencial" en redes de
  contratistas de obra pública.

**El vacío identificado:** toda esta literatura opera del lado de los datos del contrato
(precio, plazos, número de oferentes, red de relaciones entre contratistas y entidades). Ninguna de las fuentes revisadas cruza sistemáticamente el **registro mercantil** (RUES,
con su clasificación CIIU oficial) contra el **objeto del contrato adjudicado** como
indicador de riesgo independiente, pese a que —como muestra la sección 1— existe una base
normativa explícita para hacerlo. Esa es la contribución específica que este trabajo busca
hacer: no reemplazar las herramientas existentes, sino agregar una dimensión de análisis que
hoy no está cubierta.

## 3. Métodos cuantitativos disponibles para medir coherencia texto-categoría

La tarea de fondo —decidir si la descripción de un objeto contractual es consistente con la
descripción oficial de una categoría económica— es un problema de clasificación de texto
bien estudiado en NLP, con dos familias de enfoque relevantes para este trabajo:

- **Basado en reglas / diccionario controlado**: mapear palabras clave típicas de cada
  sección/división CIIU contra el texto del objeto del contrato. Simple, interpretable,
  pero frágil ante variación de lenguaje (sinónimos, jerga técnica, texto en mayúsculas sin
  puntuación, como es el caso real del campo `objeto_del_contrato` de SECOP).
- **Similitud semántica con embeddings (NLP)**: representar tanto la descripción oficial de
  la clase CIIU como el objeto del contrato como vectores (embeddings de un modelo tipo
  BERT/Sentence-Transformers en español) y medir similitud coseno entre ambos. Un estudio
  comparativo de modelos NLP para clasificación de empresas por descripción textual
  (*Comparative Analysis of NLP-Based Models for Company Classification*, MDPI,
  *Information* 2024) reporta que modelos BERT con similitud coseno alcanzan ~92% de
  exactitud usando un umbral de 0,6 — una referencia cuantitativa concreta y citable para
  calibrar el umbral de coherencia que se propone en [`metodologia.md`](metodologia.md).

La literatura de clasificación de contratos legales con NLP (revisiones sistemáticas de
tareas de clasificación de texto legal, 2024-2025) confirma que el ajuste fino de modelos
transformer preentrenados es el enfoque dominante actual para este tipo de tarea, superando
a los métodos puramente basados en reglas cuando el texto de origen es heterogéneo — como es
el caso del campo `objeto_del_contrato` de SECOP, escrito libremente por cada entidad
contratante sin un formato estandarizado.

## Referencias

- VigIA: Cambridge University Press, *Data & Policy* — https://www.cambridge.org/core/journals/data-and-policy/article/vigia-prioritizing-public-procurement-oversight-with-machine-learning-models-and-risk-indices/34D04747A94A7099E3CD8B91221338ED
- Infocontratos — https://herramientas.datos.gov.co/usos/infocontratos
- Open Contracting Partnership, "Examining procurement red flags in Latin America with data" (2019) — https://www.open-contracting.org/2019/06/27/examining-procurement-red-flags-in-latin-america-with-data/
- *Comparative Analysis of NLP-Based Models for Company Classification*, MDPI *Information*, 2024 — https://www.mdpi.com/2078-2489/15/2/77
- Colombia Compra Eficiente, ficha de jurisprudencia sobre subsanabilidad de capacidad jurídica y actividad económica — https://sintesis.colombiacompra.gov.co/jurisprudencia/ficha/19851
- Resolución DIAN 000114 de 2020 (base normativa del catálogo CIIU vigente usado en este
  trabajo) — https://www.dian.gov.co/normatividad/Normatividad/Resoluci%C3%B3n%20000114%20de%2021-12-2020.pdf

## Nota de alcance: SECOP no es el universo completo de la contratación pública/mixta

Un hallazgo metodológico relevante surgido durante esta investigación: no toda entidad con
capital público o mixto en Colombia publica su contratación a través de SECOP. Empresas de
Servicios Públicos con participación estatal (ej. acueductos y alcantarillados municipales)
con frecuencia operan portales de contratación propios, independientes de SECOP. Esto
significa que el universo analizado en este trabajo — SECOP II vía datos.gov.co — es una
porción real pero incompleta de la contratación con recursos públicos o mixtos en Colombia.
Ampliar la cobertura a estos portales independientes es una línea de trabajo futura explícita
(ver [`propuesta-mejora-colombia.md`](propuesta-mejora-colombia.md)), no resuelta en este
piloto.
