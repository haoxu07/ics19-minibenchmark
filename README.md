# ics19-minibenchmark
The mini benchmark to quantify skid effect. function_function.c is template c file of a loop. This loop calls two functions: g() and f(). One function is with heavy instruction, while the other is with light instruction. 
The script in /scripts/ directory is used to parameter the instruction number for each function. An example in run.sh, will generate 100 executables with different length of function g() and f(). 
