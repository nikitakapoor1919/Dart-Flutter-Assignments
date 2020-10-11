/*
Q4. Find the Missing Number
You are given a list of n-1 integers and these integers are in the range of 1 to n. There are no duplicates in the list. One of the integers is missing in the list. Write an efficient code to find the missing integer.
Input: arr[] = {1, 2, 4, 6, 3, 7, 8}Output: 5
Input: arr[] = {1, 2, 3, 5}Output: 4
*/

findElm(List list){
  for(var i=0;i<list.length;i++){
    if((i+1)!=list[i])
        return i+1;
  }
}
void main(){
  List list=[1, 2, 4, 6, 3, 7, 8];
  list.sort((a,b)=>a-b);
  print(list);
  print(findElm(list));
}