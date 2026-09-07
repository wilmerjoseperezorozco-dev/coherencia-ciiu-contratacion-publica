# Qué se podría mejorar en el sistema colombiano

Estas propuestas parten de un hecho ya establecido en [`marco-teorico.md`](marco-teorico.md):
la norma colombiana **ya reconoce** que la actividad económica registrada debe ser coherente
con lo que una empresa ejecuta — el problema no es de vacío normativo, es de verificación
automática ausente. Las propuestas siguientes son deliberadamente incrementales: se apoyan
en infraestructura que Colombia ya tiene (SECOP II, RUES, Colombia Compra Eficiente, VigIA),
no proponen construir un sistema nuevo desde cero.

## 1. Verificación automática al momento de adjudicación, no solo como requisito subsanable

Hoy la coherencia entre actividad económica y objeto del contrato es un requisito
habilitante que se puede subsanar hasta antes de la adjudicación — en la práctica, eso
significa que nadie la verifica de forma sistemática salvo que alguien la cuestione
manualmente. Colombia Compra Eficiente ya integra SECOP II con el RUES para otros fines de
verificación; extender esa integración para calcular un índice de coherencia CIIU-objeto
(como el propuesto en [`metodologia.md`](metodologia.md)) en el momento de la evaluación de
ofertas es una extensión natural de infraestructura ya existente, no un sistema nuevo.

## 2. Alertar el uso de códigos CIIU "comodín" (n.c.p.) cuando existe un código más específico

El hallazgo del patrón sistémico con el código 4659 (ver
[`hallazgos-preliminares.md`](hallazgos-preliminares.md)) sugiere una intervención más
simple que la anterior y de menor fricción: cuando una empresa se registra o actualiza su
matrícula mercantil bajo un código "n.c.p." (no clasificado previamente) existiendo un
código más específico cuya descripción calza mejor con su objeto social declarado, la Cámara
de Comercio podría sugerir la corrección en el momento del registro — sin bloquear el
trámite, solo como alerta informativa. Esto no requiere cambios normativos, es una mejora de
interfaz en el proceso de matrícula mercantil.

## 3. Priorización de auditoría complementaria a VigIA

VigIA ya prioriza auditorías por indicadores de riesgo de precio, tiempo y concentración.
Un índice de coherencia CIIU-objeto es una dimensión adicional, no redundante, que podría
sumarse como una señal más dentro de ese mismo sistema de priorización — la Contraloría no
necesitaría construir infraestructura nueva, solo un nuevo indicador de entrada.

## 4. Obligar granularidad de clase (4 dígitos), no permitir grupo (3 dígitos)

Un hallazgo técnico de este mismo proyecto de datos (documentado por separado en el pipeline
de extracción): parte de los registros de RUES traen el CIIU en formatos incompletos o de
revisiones anteriores a la vigente. Un registro mercantil que solo especifica el grupo (3
dígitos, ej. "469" en vez de una clase real de 4 dígitos) es, por definición, insuficiente
para verificar coherencia — no se puede evaluar coherencia contra una categoría demasiado
amplia. Exigir el nivel de clase (4 dígitos) como mínimo obligatorio en el registro es un
prerrequisito de datos para que cualquiera de las tres propuestas anteriores funcione.

## 5. Ampliar el estándar de datos abiertos a portales de contratación fuera de SECOP

Como se documenta en [`marco-teorico.md`](marco-teorico.md), no toda entidad con capital
público o mixto publica en SECOP — algunas Empresas de Servicios Públicos con participación
estatal operan portales propios. Una recomendación de política de datos abiertos (no de
tecnología): exigir que estos portales independientes publiquen bajo el mismo estándar
abierto (Open Contracting Data Standard, que Colombia ya adoptó parcialmente para SECOP II)
para que herramientas como esta puedan cubrir ese universo sin depender de scraping
específico por entidad.

## Lo que este trabajo NO propone

No propone que un algoritmo bloquee adjudicaciones de forma automática, ni que reemplace el
criterio de un funcionario o de un órgano de control. El índice de coherencia es una señal
de priorización de revisión humana — como ya lo es VigIA — no un mecanismo de decisión
automatizada sobre la legalidad de un contrato.
