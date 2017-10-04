defmodule Redis do
  def init(count_records) do
    {:ok, _conn} = Redix.start_link("redis://localhost:6379/0", name: :redix)

    Redix.command!(:redix, ["DEL", "kv"])

    1..count_records
    |> Enum.flat_map(fn rec -> [to_string(rec), to_string(rec)]  end)
    |> Enum.chunk_every(1000)
    |> Enum.each(fn kvs ->
      cmds = ["HMSET", "kv"] ++ kvs
      Redix.command!(:redix, cmds)
    end)

  end

  def get(key), do: Redix.command(:redix, ["HGET", "kv", key])
  def get_multi(keys), do: Redix.command(:redix, ["HMGET", "kv"] ++ keys)
end
