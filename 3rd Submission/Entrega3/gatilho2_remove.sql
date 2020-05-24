PRAGMA FOREIGN_KEYS = OFF;

DROP TRIGGER IF EXISTS validate_email_before_insert_PessoaFeup;
DELETE FROM PessoaFeup WHERE id = 'UP201806829';