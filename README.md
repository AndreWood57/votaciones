# votaciones

Con este proyecto pretendemos ofrecer una plataforma para poder votar en cualquiera de los comicios que se pueden dar en los próximos meses.
La idea es hacer una simulación en la que basándonos en unos partidos que concurren a las elecciones y sus candidatos,
y mediante las votaciones de los inscritos se puedan repartir los escaños asignados a una determinada circunscripción electoral.
Como pretende ser una aplicación genérica para cualquier convocatoria electoral, también se debe recoger información sobre:

- Tipo de elección de que se trate (generales, autonómicas, europeas o locales).
- Provincia por la que se implanta la aplicación.
- Número de cargos electos a designar.
- Fecha de la consulta.
- Otros.

Cada votante deberá registrar sus datos personales para poder ejercer el voto.
Información necesaria que se deberá registrar previamente en la base de datos para que la aplicación funcione:
partidos, candidatos (junto con su orden de elección) y convocatoria (tipo, provincia, número de electos, etc…).
Partiendo de toda esta información, existen dos roles de usuarios diferentes que podrán acceder a funcionalidades diferentes (Administrador y Votante).

El estado de la convocatoria puede ser:

- Cerrada. No se puede votar ni sacar resultados, pero sí es válida toda la gestión de votantes (alta, baja, modificación, etc.)
- Abierta. Solo se puede votar.
- Finalizada. Solo se pueden sacar resultados.

El administrador de la plataforma podrá realizar las operaciones oportunas para que el proceso de elecciones se desarrolle correctamente.
Dichas operaciones pueden resumirse en:

─ Listado de censo.
Lo podrá realizar en cualquier momento del proceso y obtendrá todos los datos de los
votantes y si ha votado o no.

─ Apertura y Cierre del escrutinio.
Hasta que el administrador no habilite la opción, no se podrá comenzar a votar. De la
misma forma, cuando finalice dicho plazo se procederá al cierre de la opción.

─ Final de proceso y presentación de resultados.
Según los votos obtenidos por cada partido, y aplicando la ley de D’hont mostrará la
información que estime oportuna y sobre todo, los candidatos que han salido elegidos,
teniendo en cuenta que cada circunscripción tiene un número distinto de puestos
electos.

El votante podrá ejercer la opción de:

─ Darse de alta.
─ Darse de baja siempre y cuando el escrutinio esté Cerrado.
─ Modificar sus datos personales (incluyendo password), siempre y cuando el escrutinio esté Cerrado.
─ Ver resultados de las votaciones, una vez finalizada.

Nota: el administrador es un votante más.

Para la implementación del proyecto se han establecido unas fases que deben ser respetadas por el programador.

Diseño.
─ Diseño de la base de datos.
─ Introducción de datos de partidos, candidatos y convocatoria.

Votantes.
─ Diseñar una interfaz general para la aplicación que dé cabida a todas las opciones.
─ Siempre con el escrutinio “Cerrado”.
─ Habilitar una opción de menú para dar de alta votantes mediante un formulario. Pedir:
─ NIF.
─ Password.
─ Fecha nacimiento.
─ Nombre y Apellidos.
─ Domicilio.
Comprobar que el NIF no esté registrado ya.
Grabar el password encriptado.
Contestar al votante con un mensaje indicando la incidencia de la grabación (alta correcta o fallida).

El administrador se da de alta como un votante más, se supone que luego el DBA le otorga manualmente esos privilegios.
─ Habilitar otra opción para dar de baja votantes.
─ Habilitar una tercera opción para modificar datos de votantes.Se puede modificar todo menos el NIF.
─ Ofrecer al administrador la posibilidad de realizar listados de Censo en cualquier momento que lo estime oportuno, sin tener en cuenta el estado del escrutinio.
─ Apertura de Votaciones. Escrutinio=”Abierto”.
─ Los votantes ya pueden ejercer el voto, se acreditan al entrar con NIF y password y eligen el partido.
Si el proceso es correcto, se informa al votante de tal eventualidad, se registra que ya han votado y se le suma un voto al partido seleccionado.
