CREATE DATABASE Clinica;
USE Clinica;

CREATE TABLE Pacientes (
    ID_Paciente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    Endereco VARCHAR(200),
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Grupo_Sanguineo VARCHAR(3),
    Data_Cadastro DATE NOT NULL
);

CREATE TABLE Medicos (
    ID_Medico INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CRM VARCHAR(20) UNIQUE NOT NULL,
    Especialidade VARCHAR(50) NOT NULL,
    Telefone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Consultas (
    ID_Consulta INT PRIMARY KEY AUTO_INCREMENT,
    ID_Paciente INT,
    ID_Medico INT,
    Data_Hora DATETIME NOT NULL,
    Tipo_Consulta VARCHAR(50),
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID_Paciente),
    FOREIGN KEY (ID_Medico) REFERENCES Medicos(ID_Medico)
);

CREATE TABLE Prontuarios (
    ID_Prontuario INT PRIMARY KEY AUTO_INCREMENT,
    ID_Paciente INT,
    Data_Criacao DATE NOT NULL,
    Historico_Medico TEXT,
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID_Paciente)
);

CREATE TABLE Exames (
    ID_Exame INT PRIMARY KEY AUTO_INCREMENT,
    ID_Paciente INT,
    ID_Medico INT,
    Tipo_Exame VARCHAR(100) NOT NULL,
    Data_Solicitacao DATE NOT NULL,
    Data_Realizacao DATE,
    Resultado TEXT,
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID_Paciente),
    FOREIGN KEY (ID_Medico) REFERENCES Medicos(ID_Medico)
);

CREATE TABLE Medicamentos (
    ID_Medicamento INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Principio_Ativo VARCHAR(100),
    Dosagem VARCHAR(50),
    Forma_Farmaceutica VARCHAR(50)
);

CREATE TABLE Prescricoes (
    ID_Prescricao INT PRIMARY KEY AUTO_INCREMENT,
    ID_Consulta INT,
    ID_Medicamento INT,
    Posologia VARCHAR(200) NOT NULL,
    Duracao VARCHAR(50),
    FOREIGN KEY (ID_Consulta) REFERENCES Consultas(ID_Consulta),
    FOREIGN KEY (ID_Medicamento) REFERENCES Medicamentos(ID_Medicamento)
);

-- Inserindo Pacientes
INSERT INTO Pacientes (Nome, Data_Nascimento, CPF, Endereco, Telefone, Email, Grupo_Sanguineo, Data_Cadastro) VALUES
('Maria Silva', '1985-03-15', '12345678901', 'Rua das Flores, 123', '(11) 98765-4321', 'maria@email.com', 'A+', '2023-01-10'),
('João Santos', '1990-07-22', '23456789012', 'Av. Principal, 456', '(11) 97654-3210', 'joao@email.com', 'O-', '2023-01-15'),
('Ana Oliveira', '1978-11-30', '34567890123', 'Praça Central, 789', '(11) 96543-2109', 'ana@email.com', 'B+', '2023-02-01'),
('Carlos Ferreira', '1995-05-05', '45678901234', 'Rua do Comércio, 321', '(11) 95432-1098', 'carlos@email.com', 'AB-', '2023-02-10'),
('Juliana Costa', '1982-09-18', '56789012345', 'Alameda dos Anjos, 654', '(11) 94321-0987', 'juliana@email.com', 'A-', '2023-03-05'),
('Pedro Almeida', '1973-12-25', '67890123456', 'Travessa da Paz, 987', '(11) 93210-9876', 'pedro@email.com', 'O+', '2023-03-20'),
('Fernanda Lima', '1988-06-07', '78901234567', 'Rua das Palmeiras, 159', '(11) 92109-8765', 'fernanda@email.com', 'B-', '2023-04-02'),
('Ricardo Souza', '1992-02-14', '89012345678', 'Av. dos Estados, 753', '(11) 91098-7654', 'ricardo@email.com', 'AB+', '2023-04-15'),
('Mariana Santos', '1980-08-20', '90123456789', 'Rua da Saudade, 852', '(11) 90987-6543', 'mariana@email.com', 'A+', '2023-05-01'),
('Gabriel Rodrigues', '1998-04-01', '01234567890', 'Praça da Liberdade, 147', '(11) 89876-5432', 'gabriel@email.com', 'O-', '2023-05-10'),
('Isabela Martins', '1975-10-10', '12345098765', 'Av. Brasil, 369', '(11) 88765-4321', 'isabela@email.com', 'B+', '2023-06-01'),
('Lucas Pereira', '1993-07-07', '23456109876', 'Rua das Acácias, 258', '(11) 87654-3210', 'lucas@email.com', 'AB-', '2023-06-15'),
('Camila Ferreira', '1987-01-23', '34567210987', 'Alameda das Rosas, 951', '(11) 86543-2109', 'camila@email.com', 'A-', '2023-07-01'),
('Rodrigo Carvalho', '1970-06-30', '45678321098', 'Travessa do Sol, 753', '(11) 85432-1098', 'rodrigo@email.com', 'O+', '2023-07-15'),
('Amanda Nunes', '1996-12-12', '56789432109', 'Rua da Esperança, 159', '(11) 84321-0987', 'amanda@email.com', 'B-', '2023-08-01');

-- Inserindo Médicos
INSERT INTO Medicos (Nome, CRM, Especialidade, Telefone, Email) VALUES
('Dr. Roberto Silva', 'CRM12345', 'Cardiologia', '(11) 99876-5432', 'dr.roberto@clinica.com'),
('Dra. Carla Santos', 'CRM23456', 'Dermatologia', '(11) 98765-4321', 'dra.carla@clinica.com'),
('Dr. Marcelo Oliveira', 'CRM34567', 'Ortopedia', '(11) 97654-3210', 'dr.marcelo@clinica.com'),
('Dra. Patricia Ferreira', 'CRM45678', 'Pediatria', '(11) 96543-2109', 'dra.patricia@clinica.com'),
('Dr. Fernando Costa', 'CRM56789', 'Neurologia', '(11) 95432-1098', 'dr.fernando@clinica.com'),
('Dra. Beatriz Almeida', 'CRM67890', 'Ginecologia', '(11) 94321-0987', 'dra.beatriz@clinica.com'),
('Dr. Ricardo Lima', 'CRM78901', 'Urologia', '(11) 93210-9876', 'dr.ricardo@clinica.com'),
('Dra. Luciana Souza', 'CRM89012', 'Oftalmologia', '(11) 92109-8765', 'dra.luciana@clinica.com'),
('Dr. Gustavo Santos', 'CRM90123', 'Psiquiatria', '(11) 91098-7654', 'dr.gustavo@clinica.com'),
('Dra. Mariana Rodrigues', 'CRM01234', 'Endocrinologia', '(11) 90987-6543', 'dra.mariana@clinica.com'),
('Dr. Paulo Martins', 'CRM12340', 'Pneumologia', '(11) 89876-5432', 'dr.paulo@clinica.com'),
('Dra. Cristina Pereira', 'CRM23401', 'Reumatologia', '(11) 88765-4321', 'dra.cristina@clinica.com'),
('Dr. André Ferreira', 'CRM34012', 'Gastroenterologia', '(11) 87654-3210', 'dr.andre@clinica.com'),
('Dra. Renata Carvalho', 'CRM45123', 'Oncologia', '(11) 86543-2109', 'dra.renata@clinica.com'),
('Dr. Thiago Nunes', 'CRM56234', 'Clínica Geral', '(11) 85432-1098', 'dr.thiago@clinica.com');

-- Inserindo Consultas
INSERT INTO Consultas (ID_Paciente, ID_Medico, Data_Hora, Tipo_Consulta, Status) VALUES
(1, 1, '2023-09-01 09:00:00', 'Rotina', 'Realizada'),
(2, 2, '2023-09-02 10:30:00', 'Retorno', 'Realizada'),
(3, 3, '2023-09-03 14:00:00', 'Emergência', 'Realizada'),
(4, 4, '2023-09-04 11:15:00', 'Rotina', 'Realizada'),
(5, 5, '2023-09-05 16:45:00', 'Primeira Consulta', 'Realizada'),
(6, 6, '2023-09-06 08:30:00', 'Retorno', 'Realizada'),
(7, 7, '2023-09-07 13:00:00', 'Rotina', 'Realizada'),
(8, 8, '2023-09-08 15:30:00', 'Emergência', 'Realizada'),
(9, 9, '2023-09-09 10:00:00', 'Primeira Consulta', 'Realizada'),
(10, 10, '2023-09-10 12:45:00', 'Retorno', 'Realizada'),
(11, 11, '2023-09-11 09:30:00', 'Rotina', 'Agendada'),
(12, 12, '2023-09-12 14:15:00', 'Primeira Consulta', 'Agendada'),
(13, 13, '2023-09-13 11:00:00', 'Retorno', 'Agendada'),
(14, 14, '2023-09-14 16:30:00', 'Emergência', 'Agendada'),
(15, 15, '2023-09-15 08:45:00', 'Rotina', 'Agendada');

-- Inserindo Prontuários
INSERT INTO Prontuarios (ID_Paciente, Data_Criacao, Historico_Medico) VALUES
(1, '2023-01-10', 'Paciente com histórico de hipertensão.'),
(2, '2023-01-15', 'Alergia a penicilina.'),
(3, '2023-02-01', 'Cirurgia de apendicite em 2020.'),
(4, '2023-02-10', 'Diabético tipo 2.'),
(5, '2023-03-05', 'Asma desde a infância.'),
(6, '2023-03-20', 'Histórico familiar de câncer de mama.'),
(7, '2023-04-02', 'Fratura no braço direito em 2019.'),
(8, '2023-04-15', 'Miopia e astigmatismo.'),
(9, '2023-05-01', 'Tratamento para depressão desde 2021.'),
(10, '2023-05-10', 'Hipotireoidismo.'),
(11, '2023-06-01', 'Rinite alérgica.'),
(12, '2023-06-15', 'Histórico de enxaqueca.'),
(13, '2023-07-01', 'Gastrite crônica.'),
(14, '2023-07-15', 'Em tratamento para hipertensão.'),
(15, '2023-08-01', 'Colesterol elevado.');

-- Inserindo Exames
INSERT INTO Exames (ID_Paciente, ID_Medico, Tipo_Exame, Data_Solicitacao, Data_Realizacao, Resultado) VALUES
(1, 1, 'Eletrocardiograma', '2023-09-01', '2023-09-05', 'Ritmo sinusal normal.'),
(2, 2, 'Exame de Pele', '2023-09-02', '2023-09-06', 'Identificada lesão suspeita.'),
(3, 3, 'Raio-X Joelho', '2023-09-03', '2023-09-07', 'Sem fraturas visíveis.'),
(4, 4, 'Hemograma Completo', '2023-09-04', '2023-09-08', 'Valores dentro da normalidade.'),
(5, 5, 'Ressonância Magnética Cerebral', '2023-09-05', '2023-09-09', 'Sem alterações significativas.'),
(6, 6, 'Ultrassom Pélvico', '2023-09-06', '2023-09-10', 'Útero e ovários normais.'),
(7, 7, 'PSA', '2023-09-07', '2023-09-11', 'Níveis ligeiramente elevados.'),
(8, 8, 'Tonometria', '2023-09-08', '2023-09-12', 'Pressão intraocular normal.'),
(9, 9, 'Avaliação Psiquiátrica', '2023-09-09', '2023-09-13', 'Sintomas de ansiedade moderada.'),
(10, 10, 'Teste de Tolerância à Glicose', '2023-09-10', '2023-09-14', 'Indicativo de pré-diabetes.'),
(11, 11, 'Espirometria', '2023-09-11', '2023-09-15', 'Capacidade pulmonar reduzida.'),
(12, 12, 'Densitometria Óssea', '2023-09-12', '2023-09-16', 'Osteopenia leve.'),
(13, 13, 'Endoscopia Digestiva', '2023-09-13', '2023-09-17', 'Gastrite erosiva leve.'),
(14, 14, 'Mamografia', '2023-09-14', '2023-09-18', 'Sem sinais de malignidade.'),
(15, 15, 'Check-up Completo', '2023-09-15', '2023-09-19', 'Resultados gerais satisfatórios.');

-- Inserindo Medicamentos
INSERT INTO Medicamentos (Nome, Principio_Ativo, Dosagem, Forma_Farmaceutica) VALUES
('Cardiolex', 'Enalapril', '10mg', 'Comprimido'),
('DermaClear', 'Betametasona', '0,5mg/g', 'Creme'),
('OsteoForte', 'Alendronato de Sódio', '70mg', 'Comprimido'),
('PediVit', 'Polivitamínico', '5ml', 'Xarope'),
('NeuroCalm', 'Pregabalina', '75mg', 'Cápsula'),
('GinkoFem', 'Estradiol', '1mg', 'Comprimido'),
('UroFlow', 'Tansulosina', '0,4mg', 'Cápsula'),
('OcuVision', 'Latanoprosta', '0,005%', 'Colírio'),
('MentaZen', 'Sertralina', '50mg', 'Comprimido'),
('EndoBalance', 'Metformina', '500mg', 'Comprimido'),
('PulmoAir', 'Salbutamol', '100mcg/dose', 'Aerossol'),
('ArticFlex', 'Condroitina', '400mg', 'Cápsula'),
('GastroGuard', 'Omeprazol', '20mg', 'Cápsula'),
('OncoShield', 'Tamoxifeno', '20mg', 'Comprimido'),
('ImmunoBoost', 'Complexo Vitamínico', '1000mg', 'Comprimido Efervescente');

-- Inserindo Prescrições (15 entradas)
INSERT INTO Prescricoes (ID_Consulta, ID_Medicamento, Posologia, Duracao) VALUES
(1, 1, '1 comprimido de 12 em 12 horas', '7 dias'),
(2, 2, 'Aplicar na área afetada 2 vezes ao dia', '14 dias'),
(3, 3, '1 comprimido uma vez por semana', '3 meses'),
(4, 4, '5ml duas vezes ao dia', '5 dias'),
(5, 5, '1 cápsula antes de dormir', '30 dias'),
(6, 6, '1 comprimido diariamente', '28 dias'),
(7, 7, '1 cápsula pela manhã', '60 dias'),
(8, 8, '1 gota em cada olho 3 vezes ao dia', '7 dias'),
(9, 9, '1 comprimido pela manhã', '30 dias'),
(10, 10, '1 comprimido após as refeições', '90 dias'),
(11, 11, '2 jatos quando necessário', 'Uso contínuo'),
(12, 12, '1 cápsula 2 vezes ao dia', '30 dias'),
(13, 13, '1 cápsula 30 minutos antes do café da manhã', '14 dias'),
(14, 14, '1 comprimido diariamente', '5 anos'),
(15, 15, '1 comprimido dissolvido em água uma vez ao dia', '30 dias');

-- Listar todos os pacientes com tipo sanguíneo A+:
SELECT Nome, Data_Nascimento, Grupo_Sanguineo 
FROM Pacientes 
WHERE Grupo_Sanguineo = 'A+';

-- Contar o número de consultas por médico:
SELECT m.Nome, COUNT(c.ID_Consulta) as Total_Consultas
FROM Medicos m
LEFT JOIN Consultas c ON m.ID_Medico = c.ID_Medico
GROUP BY m.ID_Medico, m.Nome;

-- Listar os exames realizados nos últimos 30 dias:
SELECT p.Nome as Paciente, m.Nome as Medico, e.Tipo_Exame, e.Data_Realizacao
FROM Exames e
JOIN Pacientes p ON e.ID_Paciente = p.ID_Paciente
JOIN Medicos m ON e.ID_Medico = m.ID_Medico
WHERE e.Data_Realizacao >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- Encontrar pacientes que nunca tiveram consultas:
SELECT p.Nome, p.CPF
FROM Pacientes p
LEFT JOIN Consultas c ON p.ID_Paciente = c.ID_Paciente
WHERE c.ID_Consulta IS NULL;

-- Listar médicos com suas especialidades e número de consultas agendadas:
SELECT m.Nome, m.Especialidade, COUNT(c.ID_Consulta) as Consultas_Agendadas
FROM Medicos m
LEFT JOIN Consultas c ON m.ID_Medico = c.ID_Medico AND c.Status = 'Agendada'
GROUP BY m.ID_Medico, m.Nome, m.Especialidade;

-- Encontrar os medicamentos mais prescritos:
SELECT m.Nome, COUNT(p.ID_Prescricao) as Vezes_Prescrito
FROM Medicamentos m
JOIN Prescricoes p ON m.ID_Medicamento = p.ID_Medicamento
GROUP BY m.ID_Medicamento, m.Nome
ORDER BY Vezes_Prescrito DESC
LIMIT 5;

-- Listar pacientes com consultas e seus respectivos prontuários:
SELECT p.Nome, c.Data_Hora, pr.Historico_Medico
FROM Pacientes p
JOIN Consultas c ON p.ID_Paciente = c.ID_Paciente
JOIN Prontuarios pr ON p.ID_Paciente = pr.ID_Paciente
WHERE c.Status = 'Realizada'
ORDER BY c.Data_Hora DESC;

-- Calcular a idade média dos pacientes por tipo sanguíneo:
SELECT Grupo_Sanguineo, AVG(YEAR(CURDATE()) - YEAR(Data_Nascimento)) as Idade_Media
FROM Pacientes
GROUP BY Grupo_Sanguineo;

-- Encontrar médicos que não realizaram consultas nos últimos 30 dias:
SELECT m.Nome, m.Especialidade
FROM Medicos m
LEFT JOIN Consultas c ON m.ID_Medico = c.ID_Medico AND c.Data_Hora >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
WHERE c.ID_Consulta IS NULL;

-- Listar os exames com resultados pendentes:
SELECT p.Nome as Paciente, e.Tipo_Exame, e.Data_Solicitacao
FROM Exames e
JOIN Pacientes p ON e.ID_Paciente = p.ID_Paciente
WHERE e.Resultado IS NULL OR e.Resultado = '';

-- Procedure para agendar uma nova consulta, verificando disponibilidade do médico:
DELIMITER //

CREATE PROCEDURE AgendarConsulta(
    IN p_ID_Paciente INT,
    IN p_ID_Medico INT,
    IN p_Data_Hora DATETIME,
    IN p_Tipo_Consulta VARCHAR(50)
)
BEGIN
    DECLARE medico_ocupado INT;
    
    -- Verifica se o médico já tem consulta no horário
    SELECT COUNT(*) INTO medico_ocupado
    FROM Consultas
    WHERE ID_Medico = p_ID_Medico AND Data_Hora = p_Data_Hora;
    
    IF medico_ocupado = 0 THEN
        INSERT INTO Consultas (ID_Paciente, ID_Medico, Data_Hora, Tipo_Consulta, Status)
        VALUES (p_ID_Paciente, p_ID_Medico, p_Data_Hora, p_Tipo_Consulta, 'Agendada');
        SELECT 'Consulta agendada com sucesso.' AS Mensagem;
    ELSE
        SELECT 'Médico não disponível neste horário.' AS Mensagem;
    END IF;
END //

DELIMITER ;

-- Procedure para gerar relatório de pacientes com exames pendentes:
DELIMITER //

CREATE PROCEDURE RelatorioExamesPendentes()
BEGIN
    SELECT 
        p.Nome AS Paciente,
        p.Telefone,
        m.Nome AS Medico,
        e.Tipo_Exame,
        e.Data_Solicitacao,
        DATEDIFF(CURDATE(), e.Data_Solicitacao) AS Dias_Pendentes
    FROM Exames e
    JOIN Pacientes p ON e.ID_Paciente = p.ID_Paciente
    JOIN Medicos m ON e.ID_Medico = m.ID_Medico
    WHERE e.Data_Realizacao IS NULL
    ORDER BY Dias_Pendentes DESC;
END //

DELIMITER ;

-- Procedure para calcular estatísticas de consultas por especialidade:
DELIMITER //

CREATE PROCEDURE EstatisticasConsultasPorEspecialidade()
BEGIN
    SELECT 
        m.Especialidade,
        COUNT(c.ID_Consulta) AS Total_Consultas,
        AVG(DATEDIFF(c.Data_Hora, p.Data_Cadastro)) AS Media_Dias_Desde_Cadastro,
        COUNT(DISTINCT c.ID_Paciente) AS Pacientes_Unicos
    FROM Medicos m
    LEFT JOIN Consultas c ON m.ID_Medico = c.ID_Medico
    LEFT JOIN Pacientes p ON c.ID_Paciente = p.ID_Paciente
    GROUP BY m.Especialidade
    ORDER BY Total_Consultas DESC;
END //

DELIMITER ;

-- Procedure para atualizar o status de consultas antigas:
DELIMITER //

CREATE PROCEDURE AtualizarStatusConsultasAntigas()
BEGIN
    DECLARE consultas_atualizadas INT;
    
    UPDATE Consultas
    SET Status = 'Realizada'
    WHERE Data_Hora < CURDATE() AND Status = 'Agendada';
    
    SET consultas_atualizadas = ROW_COUNT();
    
    SELECT CONCAT('Foram atualizadas ', consultas_atualizadas, ' consultas.') AS Resultado;
END //

DELIMITER ;

-- Procedure para análise de prescrições e possíveis interações medicamentosas:
DELIMITER //

CREATE PROCEDURE AnalisarInteracoesMedicamentosas(IN p_ID_Paciente INT)
BEGIN
    WITH PrescricoesPaciente AS (
        SELECT DISTINCT m.Nome AS Medicamento, m.Principio_Ativo
        FROM Prescricoes p
        JOIN Consultas c ON p.ID_Consulta = c.ID_Consulta
        JOIN Medicamentos m ON p.ID_Medicamento = m.ID_Medicamento
        WHERE c.ID_Paciente = p_ID_Paciente
    )
    SELECT 
        p1.Medicamento AS Medicamento1,
        p2.Medicamento AS Medicamento2,
        'Possível interação' AS Alerta
    FROM PrescricoesPaciente p1
    JOIN PrescricoesPaciente p2 ON p1.Medicamento < p2.Medicamento
    WHERE p1.Principio_Ativo <> p2.Principio_Ativo;
END //

DELIMITER ;

