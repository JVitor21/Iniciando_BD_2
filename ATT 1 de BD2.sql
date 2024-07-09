-- Criar a tabela Teste
CREATE TABLE Teste (
    teste_id SERIAL PRIMARY KEY
);

-- Inserir um valor na tabela
INSERT INTO Teste (teste_id) VALUES (2);

-- Selecionar todos os registros da tabela
SELECT * FROM Teste;
