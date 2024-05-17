CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    nivel_acesso INT DEFAULT 0, -- Adiciona uma coluna para o nível de acesso do usuário
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_nascimento DATE, -- Adiciona campos adicionais de perfil
    genero VARCHAR(10),
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    ativo BOOLEAN DEFAULT TRUE -- Adiciona uma coluna para indicar se a conta está ativa
);

INSERT INTO usuarios (nome, username, email, senha, data_nascimento, genero, endereco, telefone) 
VALUES ('Flavio', 'flavindopneu', 'flavindoidodopneu@gmail.com', SHA2(CONCAT('flavin123', 'salt'), 256), '1990-01-01', 'Masculino', 'Endereço', '123456789');

SELECT * FROM usuarios 
WHERE username = 'flavindopneu' AND senha = SHA2(CONCAT('flavin123', 'salt'), 256);

INSERT INTO usuarios (nome, username, email, senha, nivel_acesso) 
VALUES ('Admin', 'admin123', 'admin@example.com', SHA2(CONCAT('senha_admin', 'salt'), 256), 1);

CREATE TABLE logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    atividade VARCHAR(255),
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO logs (usuario_id, atividade) VALUES (1, 'Usuário Flavio fez login');