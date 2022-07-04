select Numero, FechaNegocio, Observacion, Periodo, TipoCambio, TotalMN, MontoAOperar from [CUSAERCA22018].GEN.transferenciaefectivo where fechanegocio = '2018-01-04'


select Numero, FechaNegocio, Observacion, Periodo, TipoCambio, TotalMN, MontoAOperar from [SGRPAM2018].GEN.transferenciaefectivo where fechanegocio = '2018-01-04' and IdLocal like '%48'