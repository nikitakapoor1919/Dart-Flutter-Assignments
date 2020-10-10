/*
Q3. Find the Leader Element in an Array
Write a program to print all the LEADERS in the array. An element is leader if it is 
greater than all the elements to its right side. And the rightmost element is always a leader. 
For example int the array {300,40,60,90,100,12,16, 17, 4, 3, 5, 2}, leaders are 300,100,17, 5 and 2.
*/

findLeader(List list){
  print(list[0]); //rightmost element is always a leader
  for (int i = 1; i < list.length; i++) 
  { 
        for (int j = i+1; j < list.length; j++) 
        { 
            if (list[i] < list[j]) 
                break; 
        }     
        if (j == list.length) 
            print(list[i]);
  } 
}
void main(){
  List list=[300,40,60,90,100,12,16, 17, 4, 3, 5, 2];
  findLeader(list);
}