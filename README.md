# libtime
Time and duration manipulation library

```bash
make clean && make && ./bin/time-test

test-1: time-sub
ts-1(f): 25527.000000050; ts-2(t): 25532.000000010;
duration: 5.00s

test-2: time-since
duration: 12ms555µs

test-3: duration-str
duration: 10h30m15.10s PASS
duration: -10h30m15.10s PASS
duration: 23ms17µs PASS
duration: 18µs41ns PASS
duration: 87ns PASS
duration: 52.13s PASS

test-4: duration-parse
duration: 14h10m15s200ms30000us40ns PASS
duration: -14h10m15s200ms30000us40ns PASS
duration: 1h PASS
duration: 12 PASS
duration: h PASS
duration:  PASS

PASS!
```
