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

class Customer {
  String name;
  double totalprice = 0;
  List cust_values = new List<List>();
  List<Set> address = new List<Set>();
  Set<String> office_add = new Set<String>();
  Set<String> resd_add = new Set<String>();
  Map<String, List> order_details = new Map<String, List>();
  List<List> product = new List<List>(); //price and product name??
  Customer(String name) {
    this.name = name;
  }
  void setrelation() {
    address = [office_add, resd_add];
    cust_values = [address, order_details];
  }
}

void main() {
  //Creating customer class objects
  Customer c1 = new Customer("Nikita");
  Customer c2 = new Customer("Shalvi");

  //adding address details
  c1.office_add = {"New Delhi", "Noida"};
  c1.resd_add = {"Kanpur", "Gurgaon"};
  c2.office_add = {"Noida", "Pune"};
  c2.resd_add = {"Gurgaon", "New Delhi"};
  //adding product prices in list
  c1.product.add([4000, 3400, 2000]);
  c1.product.add([2200, 500, 2440]);
  c1.product.add([1100, 222, 500]);
  c2.product.add([2300, 4500, 2233]);
  c2.product.add([2232, 2122]);
  //sorting list based on prices
  c1.product[0].sort((a, b) => a - b);
  c1.product[1].sort((a, b) => a - b);
  c1.product[2].sort((a, b) => a - b);
  c2.product[0].sort((a, b) => a - b);
  c2.product[1].sort((a, b) => a - b);
  for (int i = 0; i < c1.product.length; i++) {
    c1.totalprice += c1.product[i]
        .fold(0, (previousValue, element) => previousValue + element);
  }
  for (int i = 0; i < c2.product.length; i++) {
    c2.totalprice += c2.product[i]
        .fold(0, (previousValue, element) => previousValue + element);
  }
  //adding product details according to orderid
  c1.order_details = {
    "ORDERID001": c1.product[0],
    "ORDERID002": c1.product[1],
    "ORDERID003": c1.product[2]
  };
  c2.order_details = {"ORDERID567": c2.product[0], "ORDERID865": c2.product[1]};
  c1.setrelation();
  c2.setrelation();
  //Creating Map for customer records
  Map<String, List> cust_records = new Map<String, List>();
  cust_records.putIfAbsent(c1.name, () => c1.cust_values);
  cust_records.putIfAbsent(c2.name, () => c2.cust_values);

  //ACCESS RECORDS USING CUSTOMER NAME AS THE ACCESS KEY
  cust_records.forEach((key, value) {
    print("Customer name: $key");
    value.forEach((element) {
      if (element is List) {
        print("Office address: " + element[0].toString());
        print("Resedential address: " + element[1].toString());
      } else
        print("Customer order Records:\n $element");
    });
  });
  print("Customer: " +
      c1.name.toString() +
      " Total Price: " +
      c1.totalprice.toString());
  print("Customer: " +
      c2.name.toString() +
      " Total Price: " +
      c1.totalprice.toString());
}