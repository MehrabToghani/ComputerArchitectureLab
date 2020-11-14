# Memory
Custom size Memory with the ability to async read and sync write

## TestBench result
In this test, a register gives its output as an address to the memory, memory reads the data and gives it to the full adder, full adder add the data with one and returns it to the register.  

```
# address:   7  |  data:          0
# address:   1  |  data:          1
# address:   2  |  data:          3
# address:   4  |  data:          2
# address:   3  |  data:          4
# address:   5  |  data:          5
# address:   6  |  data:          6
# address:   7  |  data:          0
# address:   1  |  data:          1
# address:   2  |  data:          3
# address:   4  |  data:          2
# address:   3  |  data:          4
# address:   5  |  data:          5
# address:   6  |  data:          6
# address:   7  |  data:          0
# address:   1  |  data:          1
# address:   2  |  data:          3
# address:   4  |  data:          2
# address:   3  |  data:          4
# address:   5  |  data:          5
# address:   6  |  data:          6
```