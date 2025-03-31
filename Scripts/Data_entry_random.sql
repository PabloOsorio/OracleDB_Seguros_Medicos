
BEGIN -- Datos RANDOM para clientes 
    FOR i IN 1..200 LOOP
        --Insertar en la tabla Clientes
        INSERT INTO clientes (cliente_id, nombre, fecha_nacimiento, direccion, telefono)
        VALUES (
            i, --cliente_id secuencial
            'Cliente ' || DBMS_RANDOM.STRING('U', 5), --Nombre aleatorio
            TO_DATE('1980-01-01', 'YYYY-MM-DD') + (DBMS_RANDOM.VALUE * 365 * 40),--Fecha de nacimiento aleatoria
            'Dirección ' || DBMS_RANDOM.STRING('U', 5), --Dirección aleatoria
            '555-000' || LPAD(i, 4, '0') --Teléfono secuencial
        );
  END LOOP;
  COMMIT;
END; 
/

BEGIN -- Datos RANDOM para polizas
    FOR i in 1..200 LOOP
    INSERT INTO polizas (poliza_id, cliente_id, tipo_poliza, cobertura, fecha_inicio, fecha_fin)
    VALUES (
        i,
        i,
        CASE
            When dbms_random.value > 0.5 then 'Gastos medicos' else 'Inmobiliario'
        END,
        dbms_random.value * (100000) + 200000,
        TO_DATE('2020-01-01', 'YYYY-MM-DD') + (dbms_random.value * 365 * 5 ),
        TO_DATE('2025-01-01', 'YYYY-MM-DD') + (dbms_random.value * 365 * 5 )
        );
    END LOOP;
    COMMIT;
end;
/

BEGIN -- Datos random para pagos
    for i in 1..200 LOOP
    INSERT INTO pagos (pago_id, poliza_id, fecha_pago, monto, metodo_pago)
    VALUES(
        i,
        i,
        TO_DATE('2023-01-01', 'YYYY-MM-DD') + (dbms_random.value * 365 * 5),
        dbms_random.value * 100000,
        CASE
            WHEN dbms_random.value > 0.5 then 'Tarjeta' else 'Efectivo' 
        END
        );
    END LOOP;
    COMMIT;
end;
/
        
BEGIN -- Datos random para siniestros
    for x in 1..200 LOOP
    INSERT INTO siniestros(siniestro_id, poliza_id, fecha_sinistro, descripcion, monto_reclamado, estado)
    Values(
        x,
        x,
        TO_DATE('2023-01-01','YYYY-MM-DD') + (dbms_random.value * 365 * 5), -- Generamos dias en 5 años en adelante Oracle maneja las fechas de forma que si sumamos numeros es como sumas dias. 
        'Siniestro ' || dbms_random.String('A', 30), -- A letras mayusculas y minusculas, U solo letras mayusculas, X letras y numeros
        dbms_random.value * 10000,
        CASE
            WHEN dbms_random.value > 0.5 then 'En proceso' else 'Cerrado' 
        END
        );
    END LOOP
    COMMIT;
end;
/
        
        
        
        