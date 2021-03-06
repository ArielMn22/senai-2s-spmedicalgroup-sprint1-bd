USE SPMEDICALGROUP_TARDE;
GO

--VIEWS
CREATE VIEW MEDICOS_VIEW AS
--MEDICOS
SELECT
	USUARIOS.NOME AS NOME_M�DICO,
	USUARIOS.EMAIL,
	ESPECIALIDADES.NOME AS ESPECIALIDADE,
	MEDICOS.CRM
FROM
	MEDICOS
	INNER JOIN
	USUARIOS ON MEDICOS.ID_USUARIO = USUARIOS.ID
	INNER JOIN
	ESPECIALIDADES ON ESPECIALIDADES.ID = MEDICOS.ID_ESPECIALIDADE
GO

CREATE VIEW PACIENTES_VIEW AS
--PACIENTES
SELECT
	USUARIOS.NOME AS PACIENTES,
	USUARIOS.EMAIL,
	USUARIOS.TELEFONE,
	PACIENTES.ENDERECO
FROM
	USUARIOS INNER JOIN PACIENTES
	ON PACIENTES.ID_USUARIO = USUARIOS.ID
GO

CREATE VIEW CONSULTAS_VIEW AS
--CONSULTAS
SELECT
	PACIENTES.ID as ID_PACIENTE,
	NOME_PACIENTE.NOME AS PACIENTE,
	MEDICOS.ID AS ID_MEDICO,
	NOME_MEDICO.NOME AS NOME_DO_MEDICO,
	CONSULTAS.DATA_CONSULTA,
	CONSULTAS.OBSERVACOES,
	TIPO_STATUS.NOME AS STATUS_CONSULTA
FROM
	CONSULTAS
	INNER JOIN
	PACIENTES ON CONSULTAS.ID_PACIENTE = PACIENTES.ID
		INNER JOIN
		USUARIOS AS NOME_PACIENTE ON NOME_PACIENTE.ID = PACIENTES.ID_USUARIO
	INNER JOIN
	MEDICOS ON CONSULTAS.ID_MEDICO = MEDICOS.ID
		INNER JOIN
		USUARIOS AS NOME_MEDICO ON NOME_MEDICO.ID = MEDICOS.ID_USUARIO
	INNER JOIN
	TIPO_STATUS ON CONSULTAS.ID_STATUS = TIPO_STATUS.ID

GO

CREATE VIEW ESPECIALIDADE_VIEW AS
--ESPECIALIDADES
SELECT * FROM ESPECIALIDADES
GO

CREATE VIEW STATUS_VIEW AS
--STATUS
SELECT * FROM TIPO_STATUS
GO

CREATE VIEW TIPO_USUARIO_VIEW AS
--TIPOS DE USUARIO
SELECT * FROM TIPO_USUARIO
GO

CREATE VIEW CLINICA_VIEW AS
--CLINICA
SELECT * FROM CLINICA
GO

--SELECTS
SELECT * FROM MEDICOS_VIEW
SELECT * FROM PACIENTES_VIEW
SELECT * FROM CONSULTAS_VIEW
SELECT * FROM ESPECIALIDADE_VIEW
SELECT * FROM STATUS_VIEW
SELECT * FROM TIPO_USUARIO_VIEW
SELECT * FROM CLINICA_VIEW

--INDEX-NAO-CLUSTERIZADO
CREATE NONCLUSTERED INDEX ID_PACIENTE_NC
ON PACIENTES(ID)

CREATE NONCLUSTERED INDEX ID_MEDICO_NC
ON MEDICOS(ID)

--Ativa as estatisticas de pesquisa do banco de dados, � necess�rio apertar Ctrl + M
--SET STATISTICS io ON
--SET STATISTICS time ON