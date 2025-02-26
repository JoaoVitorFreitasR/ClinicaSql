# Sistema de Gerenciamento de Clínica Médica

Este repositório contém um projeto de banco de dados SQL projetado para gerenciar informações de uma clínica médica. Ele foi desenvolvido para armazenar e organizar dados essenciais, como informações de pacientes, médicos, consultas, exames, medicamentos e prescrições.

## ⚙️ Características Principais

- **Integridade Referencial**: Uso de chaves primárias e estrangeiras para garantir a consistência dos dados.
- **Dados de Amostra**: Inclusão de registros de exemplo em todas as tabelas para facilitar testes e demonstrações.
- **Estrutura Normalizada**: Redução de redundância e maior eficiência no armazenamento de dados.

## 📂 Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas principais:

- **Pacientes**: Informações dos pacientes, como nome, idade e contato.
- **Médicos**: Dados dos médicos, incluindo especialidade e registro profissional.
- **Consultas**: Informações sobre as consultas agendadas e realizadas.
- **Exames**: Detalhes dos exames solicitados para os pacientes.
- **Medicamentos**: Cadastro de medicamentos utilizados na clínica.
- **Prescrições**: Relacionamento entre médicos, pacientes e medicamentos prescritos.

## 🛠️ Comandos SQL Utilizados

Os principais comandos SQL utilizados no projeto incluem:

- **`CREATE TABLE`**: Para criar a estrutura das tabelas.
- **`INSERT INTO`**: Para inserir dados nas tabelas.
- **`FOREIGN KEY`**: Para estabelecer relações entre tabelas.
- **`SELECT`**: Para realizar consultas e recuperar informações do banco de dados.
- **`JOIN`**: Para combinar dados de múltiplas tabelas.
- **`DELIMITER` e `CREATE PROCEDURE`**: Para criar e executar stored procedures.

## 🚀 Como Usar

1. Clone este repositório:

   ```bash
   git clone https://github.com/seu-usuario/sistema-clinica-sql.git
   ```

2. Importe o arquivo SQL no seu sistema de gerenciamento de banco de dados (por exemplo, MySQL Workbench ou outro).

3. Execute os scripts SQL para criar as tabelas e inserir os dados de amostra.

4. Utilize as queries disponíveis para explorar e testar o banco de dados.

## 📝 Licença

Este projeto está sob a licença MIT. Consulte o arquivo [LICENSE](LICENSE) para mais detalhes.

---

**Contribuições são bem-vindas!** Caso queira colaborar com melhorias, sinta-se à vontade para abrir uma issue ou enviar um pull request.
