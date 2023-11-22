threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

plugin :tmp_restart

app_root = File.expand_path("..", __dir__)
bind "unix://#{app_root}/tmp/sockets/puma.sock"

workers ENV.fetch("WEB_CONCURRENCY") { 2 }
preload_app!
