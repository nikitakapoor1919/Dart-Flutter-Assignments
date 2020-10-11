/*Q2. (Asked by Amazon) O(N)
A professor went to a party. Being an erudite person, he classified the party into two categories.
He proposed that if all the persons in the party are wearing different colored robes, 
then that is a girl’s only party. If we even get one duplicate color, it must be a boy’s party. 
The colors of the robes are represented by positive integers.

Input The first line of each test case contains an integer T, denoting the no of test cases.
Then T test cases follow. he first liTne of each test case contains an integer N denoting the 
number of people in the party. In the next line are N space separated values of Ai denoting the color of the robes.
Output For each test case, print “BOYS” without quotes if it’s a boy’s party, else print “GIRLS”
 */

void main(){
  List<int> robes1=[3,4,2,3,1,3,3,1,2,1,2,1,3];
  
  int TestCases=robes1[0];
  int count=0;
  robes1.removeAt(0); // Remove Test Cases count from List
  while(count<TestCases){
    int i=robes1[0];//robes1[0] contain count of number of people in party
    List<int> list=robes1.sublist(1,i+1);// Create new sublist of particular Test case
    if(list.length==list.toSet().length) // Convert List to Set and check length of list and set
      print("BOYS");
    else
      print("GIRLS");
    count++;  //Iterate to Next Test case
    robes1=robes1.sublist(i+1);//Remove first Test Case Elements from list
  }

}