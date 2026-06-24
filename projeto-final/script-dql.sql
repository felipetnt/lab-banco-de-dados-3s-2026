SELECT AVG(valor_honorarios) AS media_honorarios
FROM tb_contrato;

SELECT MAX(valor_honorarios) AS maior_honorario
FROM tb_contrato;

SELECT MIN(valor_honorarios) AS menor_honorario
FROM tb_contrato;

SELECT COUNT(*) AS total_contratos
FROM tb_contrato;

SELECT SUM(valor_honorarios) AS faturamento_total
FROM tb_contrato;

SELECT a.nome AS advogado, COUNT(c.id_contrato) AS quantidade_contratos
FROM tb_advogado a
INNER JOIN tb_contrato c ON a.id_advogado = c.id_advogado
GROUP BY a.nome
ORDER BY quantidade_contratos DESC;

SELECT a.nome AS advogado, SUM(c.valor_honorarios) AS total_faturado
FROM tb_advogado a
INNER JOIN tb_contrato c ON a.id_advogado = c.id_advogado
GROUP BY a.nome
ORDER BY total_faturado DESC;

SELECT e.nome AS especialidade, COUNT(c.id_contrato) AS total_contratos
FROM tb_especialidade e
INNER JOIN tb_contrato c ON e.id_especialidade = c.id_especialidade
GROUP BY e.nome;

SELECT e.nome AS especialidade, SUM(c.valor_honorarios) AS total_arrecadado
FROM tb_especialidade e
INNER JOIN tb_contrato c ON e.id_especialidade = c.id_especialidade
GROUP BY e.nome;

SELECT
    c.numero_contrato,
    cli.nome AS cliente,
    a.nome AS advogado,
    e.nome AS especialidade,
    c.valor_honorarios
FROM tb_contrato c
INNER JOIN tb_cliente cli ON c.id_cliente = cli.id_cliente
INNER JOIN tb_advogado a ON c.id_advogado = a.id_advogado
INNER JOIN tb_especialidade e ON c.id_especialidade = e.id_especialidade
ORDER BY c.numero_contrato;

SELECT
    cli.nome AS cliente,
    a.nome AS advogado
FROM tb_cliente cli
INNER JOIN tb_contrato c ON cli.id_cliente = c.id_cliente
INNER JOIN tb_advogado a ON a.id_advogado = c.id_advogado
ORDER BY cliente;

SELECT
    a.nome AS advogado,
    e.nome AS especialidade,
    a.numero_oab
FROM tb_advogado a
INNER JOIN tb_especialidade e ON a.id_especialidade = e.id_especialidade
ORDER BY e.nome;
