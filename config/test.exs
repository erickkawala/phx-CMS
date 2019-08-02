use Mix.Config

# Configure your database
config :hello, Hello.Repo,
  username: "postgres",
  password: "postgres",
  database: "hello_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hello, HelloWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# config bcrypt for testing
# Optional: during tests (and tests only), 
# you may want to reduce the number of rounds 
# so it does not slow down your test suite. 
# If you have a config/test.exs, you should add:
config :bcrypt_elixir, :log_rounds, 4