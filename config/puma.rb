# ✅ Set sensible defaults if ENV vars are missing
threads_count = Integer(ENV.fetch('RAILS_MAX_THREADS', 5))
process_count = Integer(ENV.fetch('RAILS_SERVER_PROCESSES', 1))

threads threads_count, threads_count
workers process_count

# ✅ Fix crash when PORT is missing
port ENV.fetch('PORT', 3000)
environment ENV.fetch('RAILS_ENV', 'production')

plugin :tmp_restart
