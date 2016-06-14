defmodule Mix.Tasks.Alice.Console do
  use Mix.Task

  alias Alice.Adapters.REPL

  @shortdoc "Starts an Alice REPL"
  def run(_) do
    Alice.start(:normal, %{adapter: REPL})
    Process.register(self, __MODULE__)
    receive do
      :stop -> REPL.send_message("Goodbye!")
    end
  end

  def stop, do: send(__MODULE__, :stop)
end