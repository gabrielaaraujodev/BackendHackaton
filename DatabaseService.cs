using MySql.Data.MySqlClient;

namespace dotnet_mysql_minimal_api
{
    public class DatabaseService
    {
        private readonly string _connectionString;

        public DatabaseService(string connectionString)
        {
            _connectionString = connectionString;
        }

        public bool Register(RegisterInsert payload)
        {
            bool result = false;

            using (var connection = new MySqlConnection(_connectionString))
            {
                connection.Open();

                string insertQuery = "";

                if (payload.UserType == "ong")
                {
                    insertQuery = $"""
                        INSERT INTO ONG (Nome, CNPJ, Endereco, E_mail, Senha)
                        VALUES ('{payload.NomeONG}', '{payload.Cnpj}', '{payload.Endereco}', 
                                '{payload.Email}', '{payload.Password}')
                    """;
                }
                else if (payload.UserType == "voluntario")
                {
                    insertQuery = $"""
                        INSERT INTO Voluntario (Nome, CPF, RegistroConselho, Formacao_Academica, E_mail, Senha)
                        VALUES ('{payload.NomeVoluntario}', '{payload.CPF}', '{payload.RegistroConselho}', 
                                '{payload.AreaAtuacao}', '{payload.Email}', '{payload.Password}')
                    """;
                }
                else
                {
                    return false; 
                }

                using (var insertCommand = new MySqlCommand(insertQuery, connection))
                {
                    int rowsAffected = insertCommand.ExecuteNonQuery();
                    result = rowsAffected > 0; 
                }
            }

            return result;
        }

        public bool ValidarLogin(string email, string senhaHash)
        {
            using (var connection = new MySqlConnection(_connectionString))
            {
                connection.Open();

                string queryONG = $"""
                    SELECT * FROM ONG 
                    WHERE E_mail = '{email}' 
                    AND 
                    Senha = '{senhaHash}'
                """;
                using (var command = new MySqlCommand(queryONG, connection))
                {
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            return true; 
                        }
                    }
                }

                string queryVoluntario = $"""
                    SELECT * 
                    FROM Voluntario 
                    WHERE E_mail = '{email}' 
                    AND 
                    Senha = '{senhaHash}'
                """;

                using (var command = new MySqlCommand(queryVoluntario, connection))
                {
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            return true; 
                        }
                    }
                }
                return false; 
            }
        }
        public bool EmailJaExiste(EmailRequest email)
        {
            using (var connection = new MySqlConnection(_connectionString))
            {
                connection.Open();

                if (email.Usertype == "ong")
                {
                    string queryVoluntario = $"""
                        SELECT * FROM ONG 
                        WHERE E_mail = '{email.Email}'
                    """;
                    using (var command = new MySqlCommand(queryVoluntario, connection))
                    {
                        using (var reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                return true;
                            }
                        }
                    }

                    return false;
                }
                else
                {
                    string queryVoluntario = $"""
                        SELECT * FROM Voluntario 
                        WHERE E_mail = '{email.Email}'
                    """;
                    using (var command = new MySqlCommand(queryVoluntario, connection))
                    {
                        using (var reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                return true;
                            }
                        }
                    }

                    return false;
                }
                    
            }
        }
    }
}
