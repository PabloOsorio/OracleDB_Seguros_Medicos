DESC siniestros;
ALTER TABLE siniestros ADD CONSTRAINT chk_monto_reclamado CHECK (monto_reclamado >= 0);
SELECT constraint_name, constraint_type FROM user_constraints WHERE table_name = 'SINIESTROS';
ALTER TABLE PAGOS ADD CONSTRAINT chk_monto CHECK (monto >= 0);
SELECT constraint_name, constraint_type FROM user_constraints WHERE table_name = 'PAGOS';
ALTER TABLE POLIZAS add CONSTRAINT chk_cobertura CHECK(cobertura >= 0);
SELECT constraint_name, constraint_type FROM user_constraints WHERE table_name = 'POLIZAS'