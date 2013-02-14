Name: Ana Mei 
Project Name: Calculator

Design:

The user is able to input numbers and operations using the buttons on the calculator.

The input are stored as a string in two different NSMutableArrays

For Example:1 + 15 x 4 - 3
 The numbers will be stored inside an array list nums = [1,15,4,3] and op = [ +,  x ,- ]


While( ops is not empty){

Go through the current array to find the first operation that need to be carried out. In this case, it is "x". Then match the values from the other ray.

If all the operations are in the same ranking such as all "+" and "-", then picked the pick operations that come up
- int index = the index of "x" 
- get the two values using nums[index] and nums[index+1]
- carry out the operation and store the result 
- remove the used operation "x" from the array
- remove the two values from the list and replace with the new result 
- continue until there's only one member left in the array list
}
display the final value in the nums array as the result

Note:

The program will display an "Error" message if attempt to divide by 0. In that case, the user must reset the calculator by pressing clear before doing any more work. 

The result is given in float format.
