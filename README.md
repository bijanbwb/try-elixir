# try-elixir

Assorted examples created while learning Elixir.

### Prerequisites

Installation of Erlang and Elixir are easy with Homebrew:

```bash
brew install erlang elixir
```

### Examples

Many of the examples are easy to compile and run with `iex`:

```
iex calc.ex
iex(1)> Calc.hello
"Hello World"
iex(2)> Calc.add(5, 5)
10
iex(3)> 1 |> Calc.inc |> Calc.inc
3
```

For projects generated with Mix (the ones in folders), we can run the
`mix` test command to verify that all is well.

