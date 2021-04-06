# Part 1

In *Repeatable read* the dirty read is "not possible", therefore the results are different

*Terminal 1*
![image](https://user-images.githubusercontent.com/69856251/113670960-6b1dcd80-96be-11eb-8ffc-eab02d335565.png)
_____________________________

*Terminal 2*
![image](https://user-images.githubusercontent.com/69856251/113671022-7d980700-96be-11eb-8f22-1de9672b4a14.png)

# Part 2

In Terminal 2 presumably a serialisation anomaly occured, preventing the query from finishing.
The legend has it, the query is still trying to complete...

![image](https://user-images.githubusercontent.com/69856251/113672146-05324580-96c0-11eb-9bde-36a16eaa71a7.png)

