// ignore: unused_import
import 'package:bmi_app/constant/app_constant.dart';
import 'package:bmi_app/constant/widgets/left_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  // ignore: unused_field
  late String valueChoose = listItem[0];
  List listItem = [
    "cm",
    "feet",
    "meter",
  ];
  String _result = "";
  double height = 0;
  double weight = 0;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  get newValue => null;

  late double bmi;
  String message = 'Please enteryour height an weight';

  void calculate() {
    // ignore: unused_local_variable
    final ValueChanged<String>? onChanged;
    final double height = double.parse(heightController.value.text);
    final double weight = double.parse(weightController.value.text);

    if (height <= 0 || weight <= 0) {
      setState(() {
        // ignore: unused_local_variable
        var _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      bmi = weight / (height * height);
      if (bmi < 18.5) {
        message = "You are underweight";
      } else if (bmi < 25) {
        message = 'You body is fine';
      } else if (bmi < 30) {
        message = 'You are overweight';
      } else {
        message = 'You are obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var selectedCurrency;
    // ignore: unused_local_variable
    var dropdownItems;
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Column(children: [
                  Text(
                    "BMI Calculator",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {
                'Settings',
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  radioButton("Man", Colors.blue, 0),
                  radioButton("Women", Colors.orange, 1),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Your Height :",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 50,
                width: 100,
                child: DropdownButton(
                  hint: Text("Select Item"),
                  dropdownColor: Colors.deepPurple,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  value: valueChoose,
                  onChanged: (newValues) {
                    setState(() {
                      valueChoose = newValue as String;
                    });
                  },
                  items: listItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your Height in Cm",
                  filled: true,
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Your Weight in Kg :",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: weightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your Weight in Kg",
                  filled: true,
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      // ignore: unused_local_variable
                      height = double.parse(heightController.value.text);
                      // ignore: unused_local_variable
                      weight = double.parse(weightController.value.text);
                    });

                    calculateBmi(height, weight);
                  },
                  color: Colors.green,
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Your BMI is :",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "$_result",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              LeftBar(
                barWidth: 80,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 140,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 80,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void calculateBmi(double height, double weight) {
    double finalresult = weight / (height * height / 100);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      _result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        // ignore: deprecated_member_use
        child: FlatButton(
          color: currentIndex == index ? color : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentIndex == index ? Colors.white : color,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void handleClick(String value) {}
}
