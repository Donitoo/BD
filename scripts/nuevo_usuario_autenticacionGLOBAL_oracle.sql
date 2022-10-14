-- Autenticado por el servicio de direectorio empresarial LDAP
-- (Ejm: Internet Directory Service, Active Directory)
-- Requiero un nombre completo (DN)
-- ejm: se usa en la universidad

CREATE USER global_user
	IDENTIFIED GLOBALLY AS 'CN=analyst'
		OU=division1, O=OracleM C=US'
	DEFAULT TABLESPACE example
	QUOTA 5M ON example;