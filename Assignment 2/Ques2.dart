/*
Account (Parent)
SavingAccount (Child)
Get ROI - 4% (Annual)
Withdraw with limit

CurrentAccount (Business)
ROI 5% Pay
No Limit
OverDraft limit


FixedDepositAccount
ROI - 7%
LockingPeriod - 2Y

Follow SRP and DRY
*/
import 'dart:io'; 

abstract class Account{
  void ROI();
  void Withdraw(_amt);
}
class SavingAccount extends Account{
  int _timePeriod;
  double _amt;
  get Amount{
    return this._amt;
  }
  SavingAccount(this._amt,this._timePeriod);
  void ROI(){
    if(_timePeriod>1)
      _amt=_amt+_timePeriod*_amt*4/100;  //Get ROI of 4% annualy
  }
  void Withdraw(amt){
    if(amt<40000 && amt <this._amt)
    {      
      this._amt=this._amt-amt;
      print("Amount Left: ${this._amt}");
    }
    else
      print("Limit Exceed!! Sorry Can't Withdraw");
    print("Withdraw Successful!!");
  }
}
class CurrentAccount extends Account{
  double _amt;
  int _timePeriod;
  get Amount{
    return this._amt;
  }
  CurrentAccount(this._amt,this._timePeriod);
  void ROI(){
    if(_timePeriod>1)
      _amt=_amt-(_timePeriod*_amt*5/100); //Give ROI of 5% from amount
  }
  void Withdraw(amt){
    if(amt <this._amt)
    {      
      this._amt=this._amt-amt;
      print("Amount Left: ${this._amt}");
    }
    else if((amt-this._amt)<50000) //Upto 10000 can be OverDraft
    {      
      this._amt=amt-this._amt;
    }
    else
      print("Sorry Can't Withdraw");
    print("Withdraw Successful!!");
  }
}
class FixedDepositAccount extends Account{
  double _amt;
  int _timePeriod;
  get Amount{
    return this._amt;
  }
  FixedDepositAccount(this._amt,this._timePeriod);
  void ROI(){
    if(_timePeriod>1)
      _amt=_amt+_timePeriod*_amt*7/100; //Get ROI of 7% annualy
  }
  void Withdraw(amt){
    if(_timePeriod>2 && amt <this._amt)
    {      
      this._amt=this._amt-amt;
      print("Amount Left: ${this._amt}");
    }
    else
      print("Sorry Can't Withdraw");
    print("Withdraw Successful!!");
  }
}
void main(){
  int choice;
  double amt;
  do{
    print("1.Saving Account");
    print("2.Current Account");
    print("3.Fixed Deposit Account");
    print("4.Exit");
    choice =int.parse( stdin.readLineSync());
    switch(choice){
      case 1:SavingAccount sa=SavingAccount(200000,3);
             print("Enter Amount");
             amt =double.parse( stdin.readLineSync());
             sa.Withdraw(amt);
             break;
      case 2:CurrentAccount ca=CurrentAccount(340000,4);
             print("Enter Amount");
             amt =double.parse( stdin.readLineSync());
             ca.Withdraw(amt);
             break;
      case 3:FixedDepositAccount fa=FixedDepositAccount(231000,1);
             print("Enter Amount");
             amt =double.parse( stdin.readLineSync());
             fa.Withdraw(amt);
             break;
             
    }
  }while(choice!=4);
}