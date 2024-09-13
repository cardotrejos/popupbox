# Use the official Elixir image
FROM elixir:1.14

# Install Hex + Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set the working directory
WORKDIR /app

# Copy the mix.exs and mix.lock files
COPY mix.exs mix.lock ./

# Install dependencies
RUN mix deps.get --only prod

# Copy the rest of the application code
COPY . .

# Compile the application
RUN MIX_ENV=prod mix compile

# Expose the port the app runs on
EXPOSE 4000

# Start the application
CMD ["mix", "phx.server"]