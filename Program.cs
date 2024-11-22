using MySql.Data.MySqlClient;
using dotnet_mysql_minimal_api;
using static System.Runtime.InteropServices.JavaScript.JSType;
using Microsoft.AspNetCore.Mvc;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});


var app = builder.Build();


app.UseSwagger();
app.UseSwaggerUI();


app.UseHttpsRedirection();




///////////////////// MEXER SÓ AQUI DENTRO (DEFINIR ENDPOINTS)


// Adicionar o middleware de CORS
app.UseCors("AllowAll");


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


// Verificar se email existe
app.MapPost("/VerificarEmailJaExiste", (EmailRequest payload) => {
    // Criar a conexão
    var conn = obterConexao();

    // Lógica do endpoint
    var data = conn.EmailJaExiste(payload);

    // Retorno
    return Results.Ok(data);
});


/////////////////////


app.Run();

