# RedisVsEtsShowdown

Benchmark Redis vs ets for simple key value stuff

# How to use

    # tweak vars in lib/bench.exs and run it
    mix run lib/bench.exs

### Quick explanation of names

*ets_get_1000*: does an ets lookup 1000 times

*redis_get_1000*: does a redis lookup 1000 times using `HGET`

*ets_get_multi*: does an ets lookup 1000 times

*redis_get_multi*: does a single `HMGET` Redis lookup

### HTML reports available in the ./reports folder

https://minhajuddin.github.io/redis_vs_ets_showdown/reports/benchmark-1000.html  
https://minhajuddin.github.io/redis_vs_ets_showdown/reports/benchmark-1000000.html  

https://minhajuddin.github.io/redis_vs_ets_showdown/reports/benchmark-1000_comparison.html  
https://minhajuddin.github.io/redis_vs_ets_showdown/reports/benchmark-1000000_comparison.html  


### Benchmark for 1000_000 records

```
Operating System: Linux
CPU Information: Intel(R) Core(TM) i7-4700MQ CPU @ 2.40GHz
Number of Available Cores: 8
Available memory: 12.019272 GB
Elixir 1.5.1
Erlang 20.1
Benchmark suite executing with the following configuration:
warmup: 2.00 s
time: 30.00 s
parallel: 4
inputs: none specified
Estimated total run time: 2.13 min


Benchmarking ets_get_1000...
Benchmarking ets_get_multi...
Benchmarking redis_get_1000...
Benchmarking redis_get_multi...
Generated reports/benchmark-1000000.html
Generated reports/benchmark-1000000_comparison.html
Generated reports/benchmark-1000000_ets_get_1000.html
Generated reports/benchmark-1000000_ets_get_multi.html
Generated reports/benchmark-1000000_redis_get_1000.html
Generated reports/benchmark-1000000_redis_get_multi.html

Name                      ips        average  deviation         median
ets_get_multi          3.31 K        0.30 ms    ±20.60%        0.28 ms
ets_get_1000           2.87 K        0.35 ms    ±75.38%        0.31 ms
redis_get_multi        0.34 K        2.95 ms    ±17.46%        3.01 ms
redis_get_1000       0.0122 K       82.15 ms    ±15.77%       77.68 ms

Comparison:
ets_get_multi          3.31 K
ets_get_1000           2.87 K - 1.15x slower
redis_get_multi        0.34 K - 9.76x slower
redis_get_1000       0.0122 K - 271.91x slower
```

### Benchmark for 1000 records

```
Operating System: Linux
CPU Information: Intel(R) Core(TM) i7-4700MQ CPU @ 2.40GHz
Number of Available Cores: 8
Available memory: 12.019272 GB
Elixir 1.5.1
Erlang 20.1
Benchmark suite executing with the following configuration:
warmup: 2.00 s
time: 30.00 s
parallel: 4
inputs: none specified
Estimated total run time: 2.13 min


Benchmarking ets_get_1000...
Benchmarking ets_get_multi...
Benchmarking redis_get_1000...
Benchmarking redis_get_multi...
Generated benchmark-1000.html
Generated benchmark-1000_comparison.html
Generated benchmark-1000_ets_get_1000.html
Generated benchmark-1000_ets_get_multi.html
Generated benchmark-1000_redis_get_1000.html
Generated benchmark-1000_redis_get_multi.html

Name                      ips        average  deviation         median
ets_get_multi          4.06 K        0.25 ms    ±12.31%        0.24 ms
ets_get_1000           3.96 K        0.25 ms    ±18.72%        0.23 ms
redis_get_multi        0.34 K        2.90 ms    ±12.34%        2.99 ms
redis_get_1000       0.0115 K       87.27 ms    ±17.31%       81.36 ms

Comparison:
ets_get_multi          4.06 K
ets_get_1000           3.96 K - 1.02x slower
redis_get_multi        0.34 K - 11.78x slower
redis_get_1000       0.0115 K - 354.04x slower
```
