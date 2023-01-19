# Clustlixir
Using libcluster in order to create a Elixir cluster and GenServer for node connection monitoring.

![clustlixir](https://user-images.githubusercontent.com/19523657/213338830-2719cfa9-4e8c-47d8-abb4-5c10c62d3f56.gif)

# Try it
Run `mix deps.get` and then `iex -name n1@127.0.0.1 --cookie secret_token -S mix` in the first node/terminal and `iex -name n2@127.0.0.1 --cookie secret_token -S mix` in the second one.

Now, just run `Clustlixir.Ping.ping()` or kill one of those nodes/terminals, and see the magic happen.
