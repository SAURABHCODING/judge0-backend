# ✅ Dockerfile for Judge0-compatible API (Railway-ready)
FROM ruby:3.2

# Set environment variables
ENV GEM_HOME="/usr/local/bundle"
ENV PATH="$GEM_HOME/bin:$PATH"

# Set working directory
WORKDIR /app

# Copy all files
COPY . .

# Install required Linux packages
RUN apt-get update && apt-get install -y \
    libpq-dev \
    sudo \
    nodejs \
    npm \
    cron && rm -rf /var/lib/apt/lists/*

# Install Ruby dependencies
RUN gem install bundler && bundle install

# Set permissions for tmp and log directories
RUN mkdir -p tmp log && chmod -R 777 tmp log

# Expose port for API
EXPOSE 3000

# Default command to run
CMD ["bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0"]
