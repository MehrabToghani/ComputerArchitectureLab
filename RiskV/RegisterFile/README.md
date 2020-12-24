# Register File

## TestBench result
```
# Write Registers: 
#   Register: X 1    |   WriteData:                    1
#   Register: X13    |   WriteData:                12345
#   Register: X30    |   WriteData:  9223372036854775808
# 
# Read Registers: 
#   Register: X 1    |   ReadData:                     1
#   Register: X13    |   ReadData:                 12345
#   Register: X30    |   ReadData:   9223372036854775808
#   Register: X 9    |   ReadData:                     x
# 
# 
# Write in X0 Register.
#   Register: X 0    |   WriteData:                   14
# 
# Read from X0 Register.
#   Register: X 0    |   ReadData:                     0
```