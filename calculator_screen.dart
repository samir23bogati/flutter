import 'package:calculator/components/calculator/button_item.dart';
import 'package:cel/cel.dart';
import 'package:calculator/components/calculator/calculator_button.dart';
import 'package:calculator/components/calculator/color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

class CaluclatorScreen extends StatefulWidget {
  const CaluclatorScreen({super.key});

  @override
  State<CaluclatorScreen> createState() => _CaluclatorScreenState();
}

class _CaluclatorScreenState extends State<CaluclatorScreen> {
  List<ButtonItem> _items = [];
  String input = "";
  String result = "";
  @override
  void initState() {
    super.initState();
    _items = [
      // first row
      ButtonItem(
        label: "AC",
        textColor: AppColor.orange,
        onTap: () {
          input = "";
          result = "";
        },
      ),
      ButtonItem(
        icon: Icons.backspace_outlined,
        textColor: AppColor.orange,
        onTap: () {
          if (input.length == 1) {
            input = "";
          } else {
            input = input.substring(0, input.length - 1);
          }
          result = "";
        },
      ),
      ButtonItem(
        label: "%",
         textColor: AppColor.orange,
        onTap: () {
           input = input + "%";
        },
      ),
      ButtonItem(
        label: "/",
        textColor: AppColor.orange,
        onTap: () {
          input = input + "/";
        },
      ),
      //second row
      ButtonItem(
        label: "7",
        textColor: AppColor.orange,
        onTap: () {
          input = input + "7";
        },
      ),
      ButtonItem(
        label: "8",
        textColor: AppColor.orange,
        onTap: () {
          input = input + "8";
        },
      ),
      ButtonItem(
        label: "9",
        textColor: AppColor.buttonText,
        onTap: () {
          input = input + "9";
        },
      ),
      ButtonItem(
        label: "*",
        textColor: AppColor.buttonText,
        onTap: () {
          input = input + "*";
        },
      ),
      //third row
      ButtonItem(
        label: "4",
        textColor: AppColor.orange,
        onTap: () {
          input = input + "4";
        },
      ),
      ButtonItem(
        label: "5",
        textColor: AppColor.orange,
        onTap: () {
          input = input + "5";
        },
      ),
      ButtonItem(
        label: "6",
        textColor: AppColor.buttonText,
        onTap: () {
          input = input + "6";
        },
      ),
      ButtonItem(
        label: "-",
        textColor: AppColor.buttonText,
        onTap: () {
          input = input + "-";
        },
      ),
      //fourth row
      ButtonItem(
        label: "1",
        textColor: AppColor.orange,
        onTap: () {
          input = input + "1";
        },
      ),
      ButtonItem(
        label: "2",
        textColor: AppColor.orange,
        onTap: () {
          input = input + "2";
        },
      ),
      ButtonItem(
        label: "3",
        textColor: AppColor.buttonText,
        onTap: () {
          input = input + "3";
        },
      ),
      ButtonItem(
        label: "+",
        textColor: AppColor.buttonText,
        onTap: () {
          input = input + "+";
        },
      ),
    ];
  }

  void evaluate() {
    try {
      final e = Environment.standard();
      final ast = e.compile(typeCastInput(input));
      final program = e.makeProgram(ast);
      final evaludatedResult = program.evaluate({});
      if (evaludatedResult is num) {
        setState(() {
          result = evaludatedResult.toString();
        });
      } else {
        Fluttertoast.showToast(
          msg: "Invalid expression",
          backgroundColor: AppColor.orange,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Invalid expression",
        backgroundColor: AppColor.orange,
      );
    }
  }

  String typeCastInput(String input) {
    final re = RegExp(r'\b\d+(\.\d+)?\b');

    final updatedValue = input.replaceAllMapped(re, (match) {
      final String val = match.group(0) ?? "";
      if (val.contains(".") || val.isEmpty) {
        return val;
      } else {
        return "$val.0";
      }
    });
    return updatedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Gap(MediaQuery.of(context).viewPadding.top + 60),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                result,
                style: TextStyle(
                  fontSize: 82,
                  fontWeight: FontWeight.w500,
                  color: AppColor.white,
                ),
              ),
            ),
            Gap(20),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
            input,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textColor,
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              shrinkWrap: true,
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return CalculatorButton(
                  label: _items[index].label,
                  icon: _items[index].icon,
                  textColor: _items[index].textColor,
                  onPressed: () {
                    setState(() {
                      _items[index].onTap();
                    });
                  },
                );
              },
            ),
            Row(
              children: [
                CalculatorButton(
                  label: "0",
                  textColor: AppColor.buttonText,
                  onPressed: () {
                    setState(() {
                      input = input + "0";
                    });
                  },
                ),
                Gap(20),
                CalculatorButton(
                  label: ".",
                  textColor: AppColor.buttonText,
                  onPressed: () {
                    setState(() {
                      input = input + ".";
                    });
                  },
                ),
                Gap(20),
                Expanded(
                  child: CalculatorButton(
                    label: "=",
                    backgroundColor: AppColor.orange,
                    textColor: AppColor.white,
                    onPressed: evaluate,
                    ),
                    
                  ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
