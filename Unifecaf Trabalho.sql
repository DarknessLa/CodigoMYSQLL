
CREATE DATABASE Faculdade;
USE Faculdade;

-- 1. Tabela de Departamentos
CREATE TABLE Departamentos (
    departamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- 2. Tabela de Professores
CREATE TABLE Professores (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(15),
    especialidade VARCHAR(100),
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(departamento_id)
);

-- 3. Tabela de Cursos
CREATE TABLE Cursos (
    curso_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(departamento_id)
);

-- 4. Tabela de Alunos
CREATE TABLE Alunos (
    aluno_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(255),
    data_nascimento DATE
);

-- 5. Tabela de Disciplinas
CREATE TABLE Disciplinas (
    disciplina_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id)
);

-- 6. Tabela de Turmas
CREATE TABLE Turmas (
    turma_id INT AUTO_INCREMENT PRIMARY KEY,
    ano YEAR NOT NULL,
    semestre ENUM('1', '2') NOT NULL,
    disciplina_id INT,
    professor_id INT,
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(disciplina_id),
    FOREIGN KEY (professor_id) REFERENCES Professores(professor_id)
);

-- 7. Tabela de Matrícula
CREATE TABLE Matricula (
    matricula_id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    turma_id INT,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id)
);

-- 8. Tabela de Notas
CREATE TABLE Notas (
    nota_id INT AUTO_INCREMENT PRIMARY KEY,
    matricula_id INT,
    nota DECIMAL(5,2) NOT NULL,
    data_registro DATE NOT NULL,
    FOREIGN KEY (matricula_id) REFERENCES Matricula(matricula_id)
);
