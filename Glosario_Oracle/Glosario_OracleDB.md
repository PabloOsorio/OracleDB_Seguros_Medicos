# Glosario de Oracle Database

Al entrar en el uso de **Oracle Database** nos encontramos con los usuarios administrativos **SYS** y **SYSTEM**, cuyas diferencias radican principalmente en los privilegios y el propósito. Además, existen los **roles** que ayudan a definir y limitar las acciones de los usuarios.

##  Usuario SYSTEM (Administración General, Usuarios y Objetos)

###  **Descripción**
- Es una cuenta administrativa con un enfoque más funcional y de gestión diaria.
- Se utiliza para administrar objetos de la base de datos que **no pertenecen al diccionario de datos** (a diferencia del usuario SYS).

###  **Beneficio Principal**
- Permite administrar objetos de usuario como tablas, vistas y procedimientos almacenados.
- Administra configuraciones, usuarios y roles.

###  **Privilegios**
- Tiene el rol **DBA** (Database Administrator), lo que permite realizar la mayoría de las tareas de administración, pero sin acceso directo al diccionario de datos.

---

##  Usuario SYS (Administración Crítica y Diccionario de Datos)

###  **Descripción**
- Es el **usuario principal de Oracle** y posee los privilegios más altos.
- Se utiliza para tareas críticas de administración y mantenimiento del sistema.

###  **Propósito**
- Administra la **estructura interna** de la base de datos.
- Maneja el **diccionario de datos**, que contiene toda la información sobre los objetos de la base de datos (tablas, vistas, índices, etc.).

###  **Roles Asociados**
- **SYSDBA:** Le otorga **control total** sobre la base de datos, incluyendo operaciones de recuperación, respaldo y mantenimiento crítico.
- Este rol permite realizar tareas como apagar, encender la base de datos y gestionar archivos físicos.

---

##  ¿Por Qué Crear Usuarios Administrativos por Separado?

La existencia de usuarios separados como **SYS** y **SYSTEM** ofrece varios beneficios clave:

- **Gestión Más Robusta:** Divide tareas administrativas para evitar errores accidentales.
- **Separación de Responsabilidades:** SYSTEM gestiona usuarios y objetos; SYS se enfoca en el mantenimiento crítico.
- **Seguridad:** Al limitar el uso de SYS, se reduce el riesgo de corrupción de datos. SYSTEM no puede realizar acciones que comprometan el sistema.

---

## Comparación con MySQL y PostgreSQL

###  **MySQL**
- MySQL utiliza una única cuenta raíz (`root`) con **privilegios totales**, similar al usuario SYS de Oracle.
- No hay una separación clara entre una cuenta crítica y una cuenta administrativa diaria.
- Esto simplifica la gestión en sistemas pequeños, pero implica mayores **riesgos de seguridad** en entornos profesionales.

###  **PostgreSQL**
- PostgreSQL tiene al **superusuario `postgres`** (por defecto), que posee control completo sobre la base de datos.
- A diferencia de Oracle, PostgreSQL no tiene una cuenta equivalente a SYSTEM, pero permite la creación de **usuarios y roles** con privilegios específicos.
- Esto brinda **mayor flexibilidad** y seguridad, ya que puedes asignar permisos según el principio de **mínimos privilegios**.

## Recuerda 
- Usa solo SYS para tareas mas alla de simplemente consultar o maniupular datos. Ejemplos **Backup y restore**, **Recuperacion ante desastres**, **Modificar usuarios incluyendo usuarios administradores**, **Restablecer contraseñas de usuarios sin conocer la anterior**

## Tipos de conexiones a la base de datos Oracle 

### **Basico** - Opcion mas sencilla, debes ingresar Host, puerto(generalmente 1521), SID o servicio, Usuario y contraseña
### **Cartera de cloud(Wallet)** - Usada para conectarse a oracle cloud o entornos seguros.
### **JDBC Personalizado** Java Database Connectivity API para conectar aplicaciones Java a bases de datos. Ideal si trabajas con herramientas de terceros o personalizadas 
### **Local/Bequeath** Permite conectarse directamente a la base de datos sin pasar por una red, se usa cuando la aplicacion y la base de datos estan en el mismo servidor. Solo funciona localmente pero es muy rapida y eficiente. 
### **LDAP** Lightweight Directory Access Protocol. Usado por grandes organizacion para autenticar y administrar a traves de un directorio LDAP(Active Directory)

## Arquitectura de las bases de datos en Oracle 

- Oracle introduce un conceptoo llamado Multitenant Architecture que es una diferencia muy marcada respecto a los otros gestores de bases de datos relacionales(MySQL, PostgreSQl,ETC.)
En esta arquitectura el usuario tiene una CDB (Container database) que puede contener multiples PDBs(Pluggable Database).
- Ademas los usuarios que se crean en Oracle son distintos a los de MySQl o PostgreSQl al crear un usuario tambien se creo un esquema con el mismo nombre, el cual es un espacio logico donde se guardaran tablas, vistas, todo lo que este usuario cree. Por ejemplo si quieres hacer un modelo dimensional de tu PDB solo es necesario crear un nuevo usuario y desde ahi empezar a modelarlo para despues insertar los datos de tu esquema relacional (normalizado). Como dato importante dichos esquemas se pueden comunicar entre si, pero por defecto entre esquemas no pueden ver nada que no sea creacion suya (como se resuelve esto pues le das permisos).
- **Entonces que debes hacer al entrar por primera vez a Oracle** Primero entras como system ya que SYS es delicado y gestiona todo el CDB ( Solo no entre como SYS), una vez dentro como system buscas la PDB accedes a ella y creas un nuevo usuario el cual vendra con su esquema y ahora si puedes trabajar en tu PDB recuerda cambiar de usuario iniciando una nueva sesion con ese nombre, recuerda que como usuario resien creado no puedes ver tablas de otros, hacer consultas fuera de su esquema, crear obejtos,(si no tiene RESOURCE), usar conexiones si no tiene connect. Recuerda desde system puedes darle estos permisos a tu usuario recien creado.
- Algunos permisos mas comunes son CONNECT(Permite que el usuario pueda conectarse a la base de datos, obligatorio si quieres que el usuario pueda iniciar sesion) y RESOURCE(Permite que el usuario pueda crear objetos como tablas, vistas, etc) esencial si quieres que tu usuario pueda modelar su base de datos 
- Por lo general lo ideal es crar asi al usuario CREATE USER seguros_medicos IDENTIFIED BY tu_contraseña DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp QUOTA UNLIMITED ON users; CREAS AL USUARIO, LE DAS PERMISO A GUARDAR OBJETOS, LE DAS PERMISO PARA ACCEDER A OPERACIONES TEMPORALES, LE DAS ESPACIO ILIMITADO EN EL TABLESPACE USERS

### CBD (Container database)

- Es la base de datos contenedora, administra el almacenamiento, la memoria y los procesos para todas las bases de datos que contiene. **Solo existe una CDB por instancia en Oracle** pero esta puede contener multiples PDBs.

### Pluggable database(PDB)

-Las PDBs son bases de datos independientes y completamente funcionales dentro de la CDB. Cada PDB tiene su propio conjunto de objetos(tablas, vistas, indices, etc.), pero comparten los recursos del sistema, proporcionados por la CDB. 

### Ventajas de la arquitectura Multitenant 

- Facil administracion: Puedes administrar multiples bases de datos como si fuera una sola.
- Portabilidad: Una PDB puede ser desenchufada (Unplug) de una CDB y enchufada(Plug) en otra, lo que **Facilita migraciones**
- Aislamiento: CADA PDB es independiente, por lo que un problema en una base de daros no afecta a las demas.

**Comandos utiles**

- SET AUTOCOMMIT ON; Solo si quieres activar el auto commit igual, cuestion de gustos.
- SELECT * FROM v$version; --> te ayuda a conocer la version de Oracle Database que tienes.
- SELECT username from dba_users; ---> Te muestra todos los usuarios creados en la base de datos.
- SELECT sid, serial#, username, status FROM v$session WHERE username IS NOT NULL; ---> Lista las sesiones activas en la base de datos.
- SELECT name, open_mode FROM v$pdbs; ---> Muestra las PDBs(Bases de datos enchufables) dentro de la CDB.
- SHOW con_name; ---> Muestra el nombre de la PDB a la que actualmente estas conectado.
- ALTER SESSION SET CONTAINER = "Nombre de PDB" ---> Cambia tu sesion actual para conectarte a la PDB que indiques.
- SELECT name, open_mode, restricted FROM v$pdbs; --> Muestra si las PDBS estan en modo restringido(Solo los administradores pueden acceder a ellas) o abiertas.
- SELECT name, cdb FROM v$database; ---> Devuelve el nombre de la base de datos y un indicador para saber si estas en una CDB o una base de datos no multitenant.
- V$ --> Vistas importantes para monitorear y administrar Oracla Database, no son tablas fisicas, sino vistas de rendimiento en memoria.

## PL/SQL (Procedural language / Structured Query Language) 

Este es el **lenguaje de programacion procedural de Oracle que amplia los usos de SQL.**
- SQL ---> Enfocado a la manipulacion de datos.
- PL/SQL --> Permite crear bloques de codigo con logica de programacion(condicionales, bucles, excepciones, procedimientos y funciones).

### Estructura basica de un bloque PL/SQL.

**DECLARE**
Declaracion 
de 
variables
**BEGIN**
Bloque
de
ejecucion.
*EXCEPTION*
Manejo
de
errores.
**END**;

### "Hola Mundo" con PL/SQL

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hola, mundo desde PL/SQL :D);
END;
/

DBMS_OUTPUT.PUT_LINE --> Es una funcion que imprime mensajes en consola 
y recuerda habilitar la salida para que se muestre el mensaje en consola
SET SERVEROUTPUT ON;
