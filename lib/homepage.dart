import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController wgtController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController InController = TextEditingController();

  var result = "";
  var bgColors = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Container(
        color: bgColors,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      bgColors = Colors.purple;
                    });
                  },
                  child: Container(
                    child: Center(child: Text('MALE')),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 130,
                    width: 130,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      bgColors = Colors.cyan;
                    });
                  },
                  child: Container(
                    child: Center(child: Text('FEMALE')),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 130,
                    width: 130,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 200,
                width: 200,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: TextField(
                          controller: wgtController,
                          keyboardType: TextInputType.number,
                          decoration:
                          InputDecoration(hintText: "Enter your weight"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: TextField(
                          controller: ftController,
                          onTap: () {},
                          decoration: InputDecoration(hintText: "Enter feets"),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20)),
                  width: 130,
                  height: 130,
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: TextField(
                          controller: InController,
                          onTap: () {},
                          decoration: InputDecoration(hintText: "Enter inchs"),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20)),
                  width: 130,
                  height: 130,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  var wg = wgtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = InController.text.toString();

                  if (wg != "" && ft != "" && inch != "") {
                    var iwt = int.parse(wg);
                    var ift = int.parse(ft);
                    var iinch = int.parse(inch);

                    var tInch = (ift * 12) + iinch;
                    var tCm = tInch * 2.54;
                    var tm = tCm / 100;
                    var bmi = iwt / (tm * tm);

                    var lable = "";

                    if (bmi > 25) {
                      lable = "You're overWeight";
                      bgColors = Colors.orange;
                    } else if (bmi < 18) {
                      lable = "You're UnderWeight";
                      bgColors = Colors.red;
                    } else {
                      lable = "You're Healthy";
                      bgColors = Colors.green;
                    }

                    setState(() {
                      result =
                      "$lable \n your bmi is: ${bmi.toStringAsFixed(2)}";
                    });
                  } else {
                    setState(() {
                      result = "Please fill all the blanks";
                    });
                  }
                },
                child: Text("calculate")),
            Text(result),
          ],
        ),
      ),
    );
  }
}
