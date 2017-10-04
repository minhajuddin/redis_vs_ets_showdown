# config data
count_records = 1000_000
parallel = Enum.max [div(System.schedulers_online(), 2), 1]
time_seconds = 30

ETS.init(count_records)
Redis.init(count_records)

input_sample = (1..count_records) |> Enum.shuffle |> Enum.take(1000)
redis_input_sample = input_sample |> Enum.map(&to_string/1)

Benchee.run(%{
  "ets_get_1000"    => fn ->
    input_sample |> Enum.each(fn x -> ETS.get(x) end)
  end,
  "redis_get_1000" => fn ->
    redis_input_sample |> Enum.each(fn x -> Redis.get(x) end)
  end,
  "ets_get_multi"    => fn ->
    ETS.get_multi(input_sample)
  end,
  "redis_get_multi" => fn ->
    Redis.get_multi(redis_input_sample)
  end,
}, time: time_seconds, parallel: parallel, formatters: [
  &Benchee.Formatters.HTML.output/1,
  &Benchee.Formatters.Console.output/1,
], formatter_options: [html: [file: "reports/benchmark-#{count_records}.html"]])
