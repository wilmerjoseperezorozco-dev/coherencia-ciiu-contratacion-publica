# Coherencia CIIU-Objeto en Contratación Pública Colombiana

[![DOI](https://img.shields.io/badge/DOI-pendiente_de_primer_release-lightgrey)](docs/plan-publicacion-cientifica.md)
[![Estado](https://img.shields.io/badge/estado-piloto_exploratorio-blue)](docs/hallazgos-preliminares.md)
[![Licencia código](https://img.shields.io/badge/código-MIT-green)](LICENSE)
[![Licencia contenido](https://img.shields.io/badge/contenido-CC_BY_4.0-lightblue)](https://creativecommons.org/licenses/by/4.0/deed.es)

> El badge de DOI se actualiza automáticamente en cuanto se active la integración con
> Zenodo y se publique el primer release formal — ver
> [`docs/plan-publicacion-cientifica.md`](docs/plan-publicacion-cientifica.md).

Investigación en curso sobre un requisito legal que existe en la normativa colombiana pero
que no se verifica de forma sistemática: que la actividad económica (CIIU) registrada por
un contratista en el RUES sea coherente con el objeto del contrato estatal que se le
adjudica. Colombia Compra Eficiente reconoce explícitamente que la actividad económica es
uno de los mecanismos para verificar la capacidad del proponente de ejecutar el objeto
contratado — pero esa verificación no está automatizada ni auditada a escala en ninguna de
las herramientas públicas o privadas de vigilancia de la contratación que existen hoy.

**Estado: piloto exploratorio.** El hallazgo preliminar (26 empresas, 54 contratos,
documentado en [`docs/hallazgos-preliminares.md`](docs/hallazgos-preliminares.md)) confirma
que el fenómeno es real y medible, no anecdótico — incluyendo un caso concreto de una
empresa registrada como tienda de barrio (CIIU 4711) que ganó diez contratos del SENA para
maquinaria de laboratorio, confecciones y energías renovables, sin ninguna relación con su
actividad declarada. El objetivo de este repositorio es escalar ese piloto a una
metodología cuantitativa reproducible, con anclaje normativo explícito, para convertirlo en
un trabajo de investigación formal.

## Por qué esto no es "otro detector de corrupción"

Colombia ya tiene herramientas serias de vigilancia de la contratación pública: VigIA (el
sistema de priorización de auditorías con machine learning de la Contraloría), Infocontratos
(detección de anomalías en tiempo real) y estudios académicos con millones de registros
sobre concentración y redes de contratistas. Competir de frente en ese terreno — con una
muestra de 21 ciudades y sin acceso institucional al histórico completo — sería una posición
débil frente a actores con presupuesto y acceso de los que este proyecto no dispone.

Lo que este repositorio propone es distinto y más acotado: no busca "encontrar corrupción",
busca medir un indicador de riesgo específico y verificable — la coherencia entre lo que una
empresa dice que hace (su CIIU registrado) y lo que el Estado le está pagando por hacer (el
objeto del contrato) — con un anclaje legal explícito que ninguna de esas herramientas usa
como eje central. Un puntaje de incoherencia bajo no es una acusación; es una señal
estadística que amerita revisión por la entidad competente, nunca una conclusión sobre la
conducta de una empresa o funcionario en particular.

## Contenido

- [`docs/marco-teorico.md`](docs/marco-teorico.md) — antecedentes normativos y académicos,
  y el vacío específico que este trabajo busca cerrar.
- [`docs/metodologia.md`](docs/metodologia.md) — la propuesta cuantitativa completa: cómo
  medir coherencia CIIU-objeto de forma reproducible, en dos niveles (reglas + similitud
  semántica NLP), con su validación y sus límites.
- [`docs/hallazgos-preliminares.md`](docs/hallazgos-preliminares.md) — los resultados reales
  del piloto sobre 26 empresas con cruce RUES↔SECOP verificado por NIT, casos documentados
  uno por uno, y lo que sí y no se puede concluir con esta muestra.
- [`docs/propuesta-mejora-colombia.md`](docs/propuesta-mejora-colombia.md) — qué se podría
  cambiar en el proceso de contratación pública para cerrar esta brecha de verificación.
- [`docs/hoja-de-ruta.md`](docs/hoja-de-ruta.md) — próximos pasos técnicos y frentes
  institucionales (semillero, convocatorias).
- [`docs/plan-publicacion-cientifica.md`](docs/plan-publicacion-cientifica.md) — cómo se
  formaliza este trabajo como producto citable: infraestructura de citación (Zenodo/DOI),
  estrategia de preprint y mapa priorizado de revistas objetivo.
- [`analisis/`](analisis/) — la consulta SQL reproducible que generó el piloto, sobre datos
  abiertos oficiales (RUES `c82u-588k` y SECOP II `jbjy-vk9h` de datos.gov.co).

## Roadmap

El trabajo pendiente está organizado en
[milestones](https://github.com/wilmerjoseperezorozco-dev/coherencia-ciiu-contratacion-publica/milestones)
e [issues](https://github.com/wilmerjoseperezorozco-dev/coherencia-ciiu-contratacion-publica/issues)
de este repositorio, en el orden en que deben resolverse: cruce dirigido por NIT a escala →
Nivel 2 de la metodología (similitud semántica NLP) → validación humana con
precisión/recall → redacción de resultados → formalización (citación, Zenodo, revista).

## Fuente de datos

RUES (registro mercantil) y SECOP II (contratos estatales), ambos datasets abiertos de
[datos.gov.co](https://www.datos.gov.co). El cruce se hace por NIT normalizado entre ambas
fuentes — método documentado en [`docs/metodologia.md`](docs/metodologia.md), reproducible
por cualquiera con la consulta en [`analisis/`](analisis/).

## Licencia

El código de este repositorio (consultas SQL, scripts de análisis) está bajo licencia MIT —
ver [`LICENSE`](LICENSE). El contenido escrito (documentos en `docs/`) está bajo
[Creative Commons Atribución 4.0 Internacional (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/deed.es):
se puede reutilizar y adaptar citando la fuente.
