/*
Generate Emp Salary Slip
Employee —> Id , _Name , _Basic Salary
Compute - _HRA 30% of the _Basic Salary
_DA - 10% of the _Basic Salary
_TA - 20% of the _Basic Salary
_Bonus - 5% of the _Basic Salary
_PF - 5% From Emp and 5% from Employer
Stdin, stdout - Hint

Print
Id - 1001
_Name - Ram Kumar Sharma (Title Case)
_Basic Salary  - $ 10,000.00
_HRA-     $3,000.00
_TA - 
_DA- 
_Bonus 
_PF - 
Gross Salary - BS + _HRA + _DA  + _TA + _bonus - _PF
NetSalary - GS - _TAX
_TAX - 10L. —30%
7L - 10L - 20%
7L 5L - 10%
*/
import 'dart:io'; 

class Employee
{ 
  int _Eid;
  String _Name;
  double _Basic;
  double _HRA;
  double _DA;
  double _TA;
  double _Bonus;
  double _PF;
  Employee(int Eid,String Name,double Basic){
    this._Eid=Eid;
    this._Name=Name;
    this._Basic=Basic;
    _HRA=_Basic*30/100;
    _DA=_Basic*10/100;
    _TA=_Basic*20/100;
    _PF=_Basic*5/100+_Basic*5/100;
    _Bonus=_Basic*5/100;
  }
  String titleCase(String text) {
    if (text.length <= 1) return text.toUpperCase();
    var words = text.split(' ');
    var capi_talized = words.map((word) {
      var first = word.substring(0, 1).toUpperCase();
      var rest = word.substring(1);
      return '$first$rest';
    });
    return capi_talized.join(' ');
  }
   void ShowDetails(){
    print("**********************************");
    print("Eid: $_Eid"); 
    _Name=titleCase(_Name);
    print("Name: $_Name"); 
    print("Basic: Rs. ${_Basic.toStringAsFixed(2)}"); 
    print("HRA: Rs. ${_HRA.toStringAsFixed(2)}"); 
    print("DA: Rs. ${_DA.toStringAsFixed(2)}"); 
    print("TA: Rs. ${_TA.toStringAsFixed(2)}"); 
    print("Bonus: Rs. ${_Bonus.toStringAsFixed(2)}"); 
    print("PF: Rs. ${_PF.toStringAsFixed(2)}"); 
    double GS=_Basic+_HRA+_DA+_TA+_Bonus-_PF;
    print("Gross Salary: Rs. ${GS.toStringAsFixed(2)}");
    double _Tax=GS >1000000 ? 30:(GS>700000 && GS<1000000) ? 20:(GS>500000 && GS<700000) ? 10 :0;
    print("Net Salary: Rs. ${(GS-_Tax).toStringAsFixed(2)}");
    print("**********************************");
  }
}
void main(){
  print("Enter Eid:"); 
  int Eid =int.parse( stdin.readLineSync()); 
  print("Enter Name:"); 
  String Name = stdin.readLineSync(); 
  print("Enter Basic:"); 
  double Basic =double.parse( stdin.readLineSync());
  Employee Nikita=Employee(Eid,Name,Basic);
  Nikita.ShowDetails();
}