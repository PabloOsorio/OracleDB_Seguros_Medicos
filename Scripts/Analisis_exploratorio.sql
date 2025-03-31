-- Ahora solo por curiosidad hagamos un analisis exploratorio a nuestras tablas y veamos que esten bien relacionadas 
desc clientes;
desc pagos;
desc polizas;
desc siniestros;


Select count(cliente_id) from clientes; 
Select * from clientes fetch first 10 rows only; -- AL parecer es el limit de oracle, es mas largo que el limit de MySQL jeje
Select pago_id, poliza_id, monto from pagos order by monto desc; -- Esta consulta es la misma algo bien

--Consulta para obtener la cobertura y el id del cliente
SELECT c.cliente_id, c.nombre, p.poliza_id, p.tipo_poliza from clientes c join polizas p on c.cliente_id = p.cliente_id;


--Consulta para saber que tipo de poliza estamos ofreciendo mas
SELECT tipo_poliza, COUNT(*) AS cantidad_ofrecida FROM polizas GROUP BY tipo_poliza ORDER BY cantidad_ofrecida DESC FETCH FIRST 2 ROWS ONLY;



--Consulta para conocer el siniestro mas costoso
Select monto_reclamado, descripcion, estado from siniestros order by monto_reclamado desc fetch first 5 rows only;


--Consulta para obtener la cobertura que se le dio al cliente y el monto que reclamo el cliente.
SELECT p.poliza_id, p.cobertura, si.siniestro_id, si.monto_reclamado from polizas p join siniestros si on si.poliza_id = p.poliza_id;


--Consulta para saber que cliente ya se vencio su poliza
SELECT c.cliente_id, c.nombre, p.poliza_id, p.tipo_poliza, p.fecha_fin from clientes c join polizas p on c.cliente_id = p.cliente_id Where p.fecha_fin < sysdate;



