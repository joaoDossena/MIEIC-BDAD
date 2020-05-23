--Verificar que o email esta certo, caso nao envia uma mensagem
Drop Trigger IF EXISTS validate_email_before_insert_PessoaFeup;
CREATE TRIGGER validate_email_before_insert_PessoaFeup
   BEFORE INSERT ON PessoaFEUP
BEGIN
   SELECT
      CASE
	WHEN NEW.email NOT LIKE '%_@__%.__%' THEN
   	  RAISE (rollback,'Formato de email errado!')
       END;
END;