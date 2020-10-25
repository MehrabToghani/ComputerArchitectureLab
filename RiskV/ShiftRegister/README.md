# Universal ShiftRegister
n bit ShiftRegister.
Abilities:
- enable or disable shifting
- shift left and right
- parallel Load


## TestBench result
```
# xxxx
# -----     Load 1101
# 1101 
# -----     Reset
# 0000 
# -----     Left Shift 1
# 0001
# 0011 
# 0111 
# 1111 
# -----     Reset
# 0000 
# -----     Right Shift 1
# 1000 
# 1100 
# 1110 
# 1111 
# -----     Load 1001
# 1001 
# -----     No Change
# 1001 
# 1001 
# 1001 
```