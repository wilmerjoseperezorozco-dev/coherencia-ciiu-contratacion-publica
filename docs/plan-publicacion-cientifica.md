# Plan de formalización y publicación científica

Este documento complementa [`hoja-de-ruta.md`](hoja-de-ruta.md) — que cubre la estrategia
técnica y los frentes institucionales (semillero CUC, Jóvenes Investigadores Minciencias) —
enfocándose específicamente en cómo convertir este repositorio en un producto **citable y
publicable formalmente**: infraestructura de citación (Zenodo/DOI), estrategia de preprint y
mapa priorizado de revistas objetivo, con el timeline atado a los
[milestones de GitHub](https://github.com/wilmerjoseperezorozco-dev/coherencia-ciiu-contratacion-publica/milestones)
de este mismo repositorio.

## 1. Infraestructura de citación (hacerlo ahora, no al final)

Dejar esto listo desde el piloto — no esperar al paper terminado — porque cada avance del
repositorio ya queda citable mientras tanto, lo cual es evidencia de trayectoria útil para
cualquier convocatoria (ver `hoja-de-ruta.md`).

1. **`CITATION.cff`** (ya añadido en la raíz del repo): metadatos que GitHub renderiza
   automáticamente como botón "Cite this repository" y que Zenodo lee para generar el
   registro del DOI. Hay que completar el campo `orcid` en cuanto exista.
2. **ORCID iD**: crear una cuenta gratuita en [orcid.org](https://orcid.org) (2-3 minutos).
   Es el identificador de autor que casi toda revista académica e indexador (Zenodo,
   SciELO, Scopus, DOAJ) espera hoy como estándar. Sin esto, cualquier publicación futura
   queda desconectada de un perfil de autor verificable.
3. **Vincular el repositorio a Zenodo**: en
   [zenodo.org/account/settings/github](https://zenodo.org/account/settings/github/),
   autenticar con la cuenta de GitHub del repositorio y activar el toggle **ON** para
   `coherencia-ciiu-contratacion-publica`. Esto es una acción de cuenta que solo el
   titular puede hacer — no se puede automatizar desde aquí.
4. **Primer release con DOI**: una vez activado el paso 3, cualquier GitHub Release nuevo
   dispara automáticamente un registro en Zenodo con:
   - Un **DOI de versión** (uno distinto por cada release, ej. `v0.2.0-cruce-escala`).
   - Un **DOI de concepto** fijo, que siempre resuelve a la última versión — es el que se
     usa para citar "el proyecto" en general, independientemente de en qué fase esté.
   - Actualizar `CITATION.cff` con ese DOI en cuanto se reciba (descomentar la línea `doi:`).

**Cuándo hacer el primer release:** no con el estado actual (piloto n=26, ya documentado
como tal), sino al cerrar M1-M3 (cruce a escala + Nivel 2 NLP + validación humana con
precisión/recall reportados) — un release demasiado temprano le resta seriedad al DOI. El
issue correspondiente ya está creado bajo el milestone M5.

## 2. Estrategia de preprint

Antes del envío formal a una revista, subir el borrador completo (post-M4) a un servidor de
preprints. Esto fija prioridad de autoría con fecha verificable y permite recibir feedback
antes de comprometerse con el ciclo de revisión de una revista específica.

- **SciELO Preprints** (preprints.scielo.org) — la opción más natural: es la infraestructura
  de preprints de referencia en América Latina, indexada, gratuita, y acepta español. Varias
  de las revistas objetivo de la sección 3 son parte del mismo ecosistema SciELO, lo que
  reduce fricción editorial.
- **SSRN** (Social Science Research Network) — alternativa si se busca visibilidad
  internacional más allá de Latinoamérica, con una sección específica de *Law & Economics* /
  *Political Economy* relevante para el ángulo normativo de este trabajo.
- **arXiv (cs.CL)** — solo si el componente NLP (Nivel 2, embeddings) se desarrolla lo
  suficiente como para tener peso metodológico propio, no como canal principal dado que el
  público de arXiv es técnico, no de política pública.

## 3. Revistas objetivo, priorizadas

La lista está ordenada por ajuste temático y viabilidad realista para una primera
publicación formal, no solo por prestigio. Un envío exitoso a un target de nivel 2 vale más
que un rechazo en un target de nivel 1 sin trayectoria previa que lo respalde.

### Nivel 1 — ajuste temático directo, alcance internacional

| Revista | Por qué encaja | Nota |
|---|---|---|
| **Data & Policy** (Cambridge University Press) | Publicó VigIA, la herramienta de la Contraloría ya citada en `marco-teorico.md` — continuidad temática directa con el mismo ecosistema editorial. Open access, revisión por pares con foco en aplicabilidad de política pública. | Candidato natural para el primer envío formal una vez el paper tenga Nivel 2 + validación completos. |
| **Government Information Quarterly** (Elsevier) | La revista de mayor impacto en e-government/datos abiertos gubernamentales a nivel global. | Barrera de entrada más alta (revisión más exigente, journal de mayor factor de impacto) — target de mediano plazo, no de primer intento. |
| **Data for Policy** (conferencia + special issues asociados a Data & Policy, Cambridge) | Mismo ecosistema que Data & Policy; presentar como ponencia antes de journal es una vía de validación intermedia. | Revisar convocatoria anual de llamado a ponencias. |

### Nivel 2 — revistas colombianas/regionales indexadas, más alcanzables como primer paper formal

| Revista | Por qué encaja |
|---|---|
| **Revista de Derecho** (Universidad del Norte, Barranquilla) | Ángulo normativo/regulatorio (el vacío de verificación en Colombia Compra Eficiente) encaja directamente; además es la universidad de referencia regional en el Atlántico. |
| **Revista de Economía Institucional** (Universidad Externado de Colombia) | El argumento central del proyecto — un requisito legal que existe pero no se verifica sistemáticamente — es exactamente un problema de economía institucional (costos de transacción, cumplimiento normativo). |
| **Estudios Gerenciales** (Universidad ICESI) | Buen ajuste para la metodología cuantitativa (indicador, validación, métricas) con enfoque de gestión/control. |
| **Revista CS** (Universidad ICESI) | Ciencias sociales aplicadas, indexada en Publindex, acepta trabajo empírico sobre Colombia con metodología mixta. |
| **Ópera** (Universidad Externado, políticas públicas) | Foco en política pública colombiana, buen lugar para la sección de `propuesta-mejora-colombia.md` como aporte de política, no solo el hallazgo técnico. |

### Vía previa recomendada: congresos y semilleros

Antes de cualquier revista, presentar avances en espacios de semillero es lo que sustenta la
vinculación formal descrita en `hoja-de-ruta.md` y da retroalimentación de bajo riesgo:

- **RedCOLSI** (Red Colombiana de Semilleros de Investigación) — Encuentro Departamental
  Atlántico, y de ahí el nacional si clasifica.
- Jornadas/coloquios internos de investigación de la institución a la que se vincule
  formalmente (CUC u otra).

## 4. Timeline atado a los milestones del repositorio

No son fechas fijas — son el orden de dependencia correcto, que es lo que realmente importa
aquí (hacer M5 antes que M3 produce un paper sin validación, que ningún nivel 1 ni nivel 2
va a aceptar):

1. **M1 + M2** (cruce a escala + Nivel 2 NLP) en paralelo donde sea posible — M2 no depende
   estrictamente de que M1 esté 100% cerrado, puede prototiparse sobre la muestra actual.
2. **M3** (validación humana) — bloqueante explícito antes de reportar cualquier cifra
   agregada. No se salta ni se acelera artificialmente.
3. **M5, paso 1-2** (ORCID + vínculo Zenodo + primer release con DOI) — en paralelo con M4,
   no después. Es trabajo de una tarde, no hay razón para posponerlo.
4. **M4** (redacción) usando las cifras validadas de M3.
5. **M5, paso 3-4** (preprint en SciELO Preprints → envío al primer target de la sección 3).

## 5. Notas de autoría

- **CRediT (Contributor Roles Taxonomy)**: si en algún punto se suma un asesor, coautor o
  colaborador de semillero, usar la taxonomía CRediT estándar (Conceptualization, Data
  curation, Methodology, Writing, etc.) en el paper — la mayoría de revistas de nivel 1 y
  varias de nivel 2 ya la piden explícitamente.
- **Afiliación institucional**: mientras la vinculación formal a un grupo de investigación
  reconocido (ver `hoja-de-ruta.md`) no se concrete, es válido publicar como investigador
  independiente con afiliación declarada como tal — no es un impedimento para preprint ni
  para la mayoría de revistas de nivel 2, aunque sí puede ser un requisito explícito en
  algunas convocatorias (ej. Jóvenes Investigadores Minciencias exige grupo reconocido, no
  la revista en sí).
