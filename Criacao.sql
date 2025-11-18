CREATE TABLE empresa(
    nro SERIAL primary key,
    nome VARCHAR(100) UNIQUE NOT NULL ,
    nome_fantasia VARCHAR(100) NOT NULL
);

CREATE TABLE plataforma(
    nro SERIAL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL,
    qtd_user int default 0,
    empresa_fund int ,
    empresa_respo int,
    data_fund DATE,
    FOREIGN KEY (empresa_fund, empresa_respo) references empresa(nro) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE conversao(
    moeda VARCHAR(3) PRIMARY KEY ,
    nome VARCHAR(50) NOT NULL,
    fator_conver FLOAT NOT NULL
);


CREATE TABLE pais(
    ddi VARCHAR(4)PRIMARY KEY ,
    nome VARCHAR(50) UNIQUE,
    moeda VARCHAR(3),
    FOREIGN KEY (moeda) REFERENCES conversao(moeda) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE usuario(
    id SERIAL PRIMARY KEY ,
    nick VARCHAR(50) UNIQUE ,
    email VARCHAR(100) UNIQUE NOT NULL ,
    data_nasc DATE NOT NULL ,
    telefone VARCHAR(20) NOT NULL,
    end_postal VARCHAR(100),
    pais_residencia VARCHAR(4),
    FOREIGN KEY (pais_residencia) REFERENCES pais(DDI) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE plataformaUsuario(
    id_usuario int NOT NULL ,
    nro_plataforma INT NOT NULL ,
    nro_usuario int NOT NULL,
    FOREIGN KEY (nro_plataforma) REFERENCES plataforma(nro) ON DELETE CASCADE ON UPDATE CASCADE ,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (id_usuario, nro_plataforma)
);

CREATE TABLE streamerPais(
    id_usuario int,
    ddi_pais VARCHAR(4),
    nro_passporte VARCHAR(15) UNIQUE NOT NULL,
    PRIMARY KEY (id_usuario, ddi_pais),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ddi_pais) REFERENCES  pais(ddi) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE empresaPais (
    nro_empresa int,
    ddi_pais
);

















