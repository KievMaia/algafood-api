ALTER TABLE pedido
    ALTER COLUMN data_criacao TYPE timestamptz(0),
	ALTER COLUMN data_confirmacao TYPE timestamptz(0),
	ALTER COLUMN data_cancelamento TYPE timestamptz(0),
	ALTER COLUMN data_entrega TYPE timestamptz(0);
	
ALTER TABLE usuario
	ALTER COLUMN data_cadastro TYPE timestamptz(0);