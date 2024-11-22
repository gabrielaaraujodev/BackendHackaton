using MySql.Data.MySqlClient;
using dotnet_mysql_minimal_api;
using static System.Runtime.InteropServices.JavaScript.JSType;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();


app.UseSwagger();
app.UseSwaggerUI();


app.UseHttpsRedirection();




///////////////////// MEXER SÓ AQUI DENTRO (DEFINIR ENDPOINTS)

var obterConexao = () =>
{
    // Criar a conexão
    var connectionString = builder.Configuration["MySqlConnection"];
    var conexao = new DatabaseService(connectionString);
    return conexao;
};


app.MapPost("/Login", (UserRequest payload) =>
{
    // Criar a conexão
    var conn = obterConexao();

    // Lógica do endpoint
    var estaLogadoComSucesso = conn.ValidarLogin(payload.Email, payload.Password);

    // Retorno
    return Results.Ok(estaLogadoComSucesso);
});


// Armazenar um cadastro
app.MapPost("/Registrar", (RegisterInsert payload) => {
    // Criar a conexão
    var conn = obterConexao();

    // Lógica do endpoint
    var data = conn.Register(payload);

    // Retorno
    return Results.Ok(data);
});


/////////////////////


app.Run();

