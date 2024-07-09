-- Criar a extensão uuid-ossp
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Criar a tabela schema_banco
CREATE TABLE schema_banco (
    id UUID DEFAULT uuid_generate_v1() PRIMARY KEY,
    dados JSONB
);

-- Inserir os dados
INSERT INTO schema_banco (dados)
VALUES 
('{
    "pacientes": [
        {"nome": "Paulo", "endereço": "Rua Pedro Firmino", "telefone": "123-456"}
    ],
    "médicos": [
        {"nome": "Dr. Mauricio", "especialidade": "Otorrinolaringologista"}
    ],
    "especialidades": [
        {"descrição": "Otorrinolaringologista"}
    ],
    "consultas": [
        {"data": "2023-10-24"}
    ]
}'),
('{
    "pacientes": [
        {"nome": "Romario", "endereço": "Rua Cascata", "telefone": "789-224"}
    ],
    "médicos": [
        {"nome": "Dr. Carlos", "especialidade": "Cardiologista"}
    ],
    "especialidades": [
        {"descrição": "Cardiologista"}
    ],
    "consultas": [
        {"data": "2023-10-23"}
    ]
}'),
('{
    "pacientes": [
        {"nome": "Bebeto", "endereço": "Rua Toronto", "telefone": "888-777"}
    ],
    "médicos": [
        {"nome": "Dr. Zidane", "especialidade": "Urologista"}
    ],
    "especialidades": [
        {"descrição": "Urologista"}
    ],
    "consultas": [
        {"data": "2023-10-22"}
    ]
}'),
('{
    "pacientes": [
        {"nome": "Vampeta", "endereço": "Rua Barrilha", "telefone": "999-555"}
    ],
    "médicos": [
        {"nome": "Dr. Mauricio", "especialidade": "Cardiologista"}
    ],
    "especialidades": [
        {"descrição": "Cardiologista"}
    ],
    "consultas": [
        {"data": "2023-10-21"}
    ]
}'),
('{
    "pacientes": [
        {"nome": "Ronaldo", "endereço": "Rua Brasilia", "telefone": "999-999"}
    ],
    "médicos": [
        {"nome": "Dr. Murici", "especialidade": "Cardiologista"}
    ],
    "especialidades": [
        {"descrição": "Cardiologista"}
    ],
    "consultas": [
        {"data": "2023-10-20"}
    ]
}');
--Selecionar todos os registros da tabela schema_banco:
SELECT * FROM schema_banco;

--Selecionar a lista de médicos:
SELECT dados->>'médicos' AS médicos FROM schema_banco;

--Selecionar a lista de pacientes onde o médico é "Dr. Mauricio":
SELECT dados->'pacientes' AS pacientes
FROM schema_banco
WHERE dados->'médicos' @> '[{"nome": "Dr. Mauricio"}]';

--Selecionar cada paciente individualmente onde o médico é "Dr. Mauricio":
SELECT jsonb_array_elements_text(dados->'pacientes') AS paciente
FROM schema_banco
WHERE (dados->'médicos')::jsonb @> '[{"nome": "Dr. Mauricio"}]';


