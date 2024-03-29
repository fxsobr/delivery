# Delivery

Implementação de uma API utilizando Elixir, Phoenix, Ecto e PostgreSQL

## Instalação

O projeto necessita do [Elixir](https://elixir-lang.org/) 1.14 e do [Phoenix](https://www.phoenixframework.org/) 1.7.2

Instale as dependências e inicie o servidor.

```sh
cd delivery
mix deps.get
mix phx.server
```

## Banco de Dados

Para alterar as configurações do banco de dados, é necessário acessar a pasta config e editar os valores nos arquivos `dev.exs` e `test.exs`.

```elixir
username: "postgres",
password: "postgres",
hostname: "localhost",
port: 5432,
```

### Inicializando banco

Para criar um nova migration, basta rodar o comando abaixo.

```sh
mix ecto.gen.migration nome_migration
```

Para criar o schema configurado nos arquivo `dev.exs`, basta rodar o comando abaixo.

```sh
mix ecto.setup
```

### Migration

Para realizar enviar uma migration para o banco de dados, basta rodar o comando abaixo.

```sh
mix ecto.migrate
```

### Testes

Para verificar a cobertura de testes utilizando a lib excoveralls, basta rodar o comando abaixo.
`arquivos salvos na pasta cover`

```sh
mix coveralls
```

Para gerar documentação html da cobertura de código, basta rodar o comando abaixo.

```sh
mix coveralls.html
```
