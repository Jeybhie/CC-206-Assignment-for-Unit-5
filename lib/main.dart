import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // manage the sum section
  double sum = 0;

  // either use a TextEditingController for each input field to get the value
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController sumController = TextEditingController();
  // or store each value in the state
  double firstAddNum = 0, secondAddNum = 0;
  String operationUsed = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 121, 212, 124)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Add Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: add1Controller,
                          decoration:
                              const InputDecoration(labelText: "First Number"),
                          // update the firstAddNum state
                          onChanged: (value) {
                            setState(() {
                              firstAddNum = double.parse(value);
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: Center(
                          child: Text(operationUsed,
                              style: const TextStyle(
                                fontSize: 25,
                              )),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: add2Controller,
                          decoration:
                              const InputDecoration(labelText: "Second Number"),
                          // update the secondAddNum state
                          onChanged: (value) {
                            setState(() {
                              secondAddNum = double.parse(value);
                            });
                          },
                        ),
                      ),

                      Text(' = $sum'),
                      // 3.a Add an IconButton here
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              sum = firstAddNum + secondAddNum;
                              operationUsed = "+";
                            });
                          },
                          icon: const Icon(Icons.add)),
                      // b.b Add an button here
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            firstAddNum = 0;
                            secondAddNum = 0;
                            add1Controller.clear();
                            add2Controller.clear();
                            sum = 0;
                            operationUsed = "";
                          });
                        },
                        child: const Text("Clear"),
                      ),
                    ],
                  ),

                  // 3.c - Add the other operations
                  // Minus Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            sum = firstAddNum - secondAddNum;
                            operationUsed = "-";
                          });
                        },
                        child: const Icon(Icons.remove),
                      ),
                      // Multiplication Row
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            sum = firstAddNum * secondAddNum;
                            operationUsed = "x";
                          });
                        },
                        child: const Icon(Icons.clear),
                      ),
                      // Division Row
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            sum = firstAddNum / secondAddNum;
                            operationUsed = "÷";
                          });
                        },
                        child: const Text("÷",
                            style: TextStyle(
                              fontSize: 25,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
