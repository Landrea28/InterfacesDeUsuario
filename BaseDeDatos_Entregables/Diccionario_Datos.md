# Diccionario de Datos - FrescaTemporada

## Tabla: `KLS_USUARIOS`
Almacena los usuarios registrados en el sistema, diferenciando entre roles de administrador y usuario normal.
- **id_usuario** (NUMBER, PK): Identificador único autoincrementable.
- **nombre** (VARCHAR2 100): Nombre completo del usuario.
- **email** (VARCHAR2 150): Correo electrónico del usuario (Único).
- **password** (VARCHAR2 255): Contraseña encriptada/texto plano.
- **rol** (VARCHAR2 20): Rol del usuario en el sistema (`admin` o `usuario`).

## Tabla: `KLS_ALIMENTOS`
Almacena la información de las frutas y verduras.
- **id_alimento** (NUMBER, PK): Identificador único autoincrementable.
- **nombre** (VARCHAR2 100): Nombre de la fruta o verdura.
- **tipo** (VARCHAR2 20): Indica si es 'Fruta' o 'Verdura'.
- **calorias** (NUMBER): Cantidad de calorías por cada 100 gramos.
- **temporada** (VARCHAR2 50): Rango de meses en los que está en temporada.

## Tabla: `KLS_RECETAS`
Almacena recetas creadas por los usuarios en el sistema.
- **id_receta** (NUMBER, PK): Identificador único autoincrementable de la receta.
- **titulo** (VARCHAR2 200): Título de la receta.
- **preparacion** (CLOB): Instrucciones y pasos de preparación.
- **id_usuario** (NUMBER, FK): Identificador del usuario que creó la receta (Relación con `KLS_USUARIOS`).

## Tabla: `KLS_RECETA_ALIMENTO`
Tabla intermedia que relaciona los alimentos utilizados en cada receta y sus cantidades.
- **id_receta_alimento** (NUMBER, PK): Identificador único de la relación.
- **id_receta** (NUMBER, FK): Referencia a la receta.
- **id_alimento** (NUMBER, FK): Referencia al alimento (fruta/verdura).
- **cantidad** (VARCHAR2 50): Cantidad del alimento utilizado (ej. "2 tazas", "150g").

## Tabla: `KLS_AUDITORIA`
Registra de forma automática (mediante triggers) los cambios (INSERT, UPDATE, DELETE) en las tablas principales.
- **id_auditoria** (NUMBER, PK): Identificador autoincrementable.
- **tabla_afectada** (VARCHAR2 50): Nombre de la tabla donde ocurrió el evento.
- **operacion** (VARCHAR2 10): Tipo de operación (`INSERT`, `UPDATE` o `DELETE`).
- **usuario_bd** (VARCHAR2 50): Usuario de la base de datos que realizó el cambio.
- **fecha** (TIMESTAMP): Fecha y hora exacta de la modificación.
- **datos_anteriores** (VARCHAR2 4000): Información de la fila antes del cambio (para UPDATE y DELETE).
- **datos_nuevos** (VARCHAR2 4000): Información de la fila después del cambio (para INSERT y UPDATE).
