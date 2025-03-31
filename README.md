Proyecto de Base de Datos en Oracle SQL

Este proyecto consiste en la creación, gestión y análisis de una base de datos de seguros médicos utilizando **Oracle Database**. La creacion de la estructura de las tablas fue propuesta por mi y por nociones acerca de como se grestionaria la arquitectura de la misma y los datos en las tablas fueron randoms aun que bien formulados para que tuviera sentido.

## **Descripción del Proyecto**
Se creó una base de datos recreando una compañía de seguros médicos, con tablas clave para administrar clientes, pólizas, pagos y siniestros.

### **Tablas Creadas:**
- **Clientes:** Información personal de los clientes.
- **Pólizas:** Detalles sobre los diferentes tipos de pólizas.
- **Pagos:** Registro de pagos realizados por los clientes.
- **Siniestros:** Información de los siniestros reportados.

---

## **Pasos Realizados**

### 1. **Creación de Tablas**
Se crearon las tablas en Oracle SQL con las siguientes estructuras principales:
- `Clientes(cliente_id, nombre, fecha_nacimiento, direccion, telefono)`
- `Polizas(poliza_id, cliente_id, tipo_poliza, cobertura, fecha_inicio, fecha_fin)`
- `Pagos(pago_id, poliza_id, fecha_pago, monto, metodo_pago)`
- `Siniestros(siniestro_id, poliza_id, fecha_siniestro, descripcion, monto_reclamado, estado)`

### 2. **Inserción de Datos**
Se usaron bucles `PL/SQL` para generar datos y poblar las tablas con 200 registros aleatorios utilizando `DBMS_RANDOM`.

### 3. **Consultas SQL**
Se realizaron consultas SQL para obtener información relevante, tales como:
- Obtener el tipo de póliza más ofrecido.
- Consultar siniestros en proceso.
- Verificar las relaciones entre las tablas mediante `JOIN`.
[Consultas realizadas a lo largo del proyecto](https://github.com/PabloOsorio/OracleDB_Seguros_Medicos/tree/main/Scripts)

### 4. **Exportación de Datos a CSV**
Se exportaron los datos a archivos CSV desde **SQL Developer** usando la opción de `Exportar` y seleccionando el formato `Delimited (CSV)`.
[Datos en csv](https://github.com/PabloOsorio/OracleDB_Seguros_Medicos/tree/main/DATA)

---

## 🚀 **Cómo Ejecutar el Proyecto**
1. Conéctate a tu instancia de **Oracle Database**.
2. Ejecuta los scripts SQL de creación de tablas y carga de datos.
3. Utiliza SQL Developer para realizar consultas o exportar a CSV.
4. Puedes usar herramientas como **Excel** para analizar los datos exportados.
5. Ademas cree una pequeña guia acerca de como usar y entender un poco mas acerca de OracleDB. [Glosario Oracle](https://github.com/PabloOsorio/OracleDB_Seguros_Medicos/blob/main/Glosario_Oracle/Glosario_OracleDB.md)


