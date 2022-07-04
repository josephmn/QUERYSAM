USE [SGRPAm2018]
GO


-- CUZCO 1-- TRAE INFO
exec EjecutarT_C 'CUSAERCA12018','SGRPAM2018','43' 
-- CUZCO 2-- TRAE INFO
exec EjecutarT_C 'CUSAERCA22018','SGRPAM2018','44' 

-- CUZCO 1-- LLEVA INFO
exec transferenciasautomaticas  'SGRPAM2018','CUSAERCA12018','43' 
-- CUZCO 2-- LLEVA INFO
exec transferenciasautomaticas  'SGRPAM2018','CUSAERCA22018','44' 


