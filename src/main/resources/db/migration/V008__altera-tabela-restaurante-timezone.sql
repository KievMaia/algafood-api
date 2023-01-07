set time zone 'UTC';

ALTER TABLE restaurante
    ALTER COLUMN data_atualizacao TYPE timestamptz(0),
	ALTER COLUMN data_cadastro TYPE timestamptz(0);