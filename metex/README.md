# Metex

Example from The Little Elixir and OTP Guidebook.

## Open Weather Map

You can get an API key by creating an account on
openweathermap.org. Then fill it in at the bottom
of the `lib/worker.ex` file.

## Usage

```bash
iex -S mix
```

```elixir
iex> Metex.temperatures_of(["Miami", "Orlando"])
:ok
Miami: 26.3°C, Orlando: 28.9°C
```

