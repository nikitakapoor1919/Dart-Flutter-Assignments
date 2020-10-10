/*Q1. Maintain 5 Customer Records and Customer are access by Name.
Each Customer has Address , 
Address can be office, res

Amit —> Address
Office , res
Office address can be N But Unique
Res Address can be N But Unique

Customer also has Orders , Orders are N and Order are access BY Id, Order Contains Product,
Product can be N, Product are sorted by Prices.
Product can be Duplicate.
Also Print Summary Report - Total Amount of Product.*/

void main(){
  Set<String> OfficeAddress={"New Delhi","Gurgaon,Haryana"};
  Set<String> ResAddress={"New Delhi","Gurgaon,Haryana"};
  Map<int,Map> Orders={
    1:
  }
  Map<String,int> Products={
    "LCD":120000,
    "Samsung A50":18000,
    "Iphone X":76000
  };
  Map<String,List> Customer={
    "Nikita":[]
  };

}