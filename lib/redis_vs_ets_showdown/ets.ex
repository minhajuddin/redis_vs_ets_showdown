defmodule ETS do
  def init(count_records) do
    :ets.new(:kv, [:named_table,
                   {:read_concurrency, true},
                   {:write_concurrency, true},
                   :protected])

    1..count_records
    |> Enum.each(fn rec ->
      :ets.insert(:kv, {rec, rec})
    end)
  end

  def get(key), do: :ets.lookup(:kv, key)
  def get_multi(keys), do: Enum.map(keys, &get/1)

end
