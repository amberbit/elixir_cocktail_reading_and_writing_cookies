use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cookies_test_app, CookiesTestApp.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :cookies_test_app, CookiesTestApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "cookies_test_app_test",
  pool: Ecto.Adapters.SQL.Sandbox, # Use a sandbox for transactional testing
  size: 1
