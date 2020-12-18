# Data Memory

## TestBench result
```
# Write Data:
#   Address:                    1    |   WriteData:                    1
#   Address:                   13    |   WriteData:                12345
#   Address:                16384    |   WriteData:  9223372036854775808
# 
# Read Data
#   Address:                    1    |   ReadData:                     1
#   Address:                   13    |   ReadData:                 12345
#   Address:                16384    |   ReadData:   9223372036854775808
#   Address:                    9    |   ReadData:                    x
```