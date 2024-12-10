import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final TextEditingController _controller = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Application"),
            centerTitle: true,
            backgroundColor: const Color(0xFF0d5bd9),
          ),
          body: Column(
            children: [
              Text(
                "Let's Get Started",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  height: 2,
                  shadows: [
                    Shadow(
                    color:Colors.black.withOpacity(0.6),
                    blurRadius: 8,
                    offset:Offset(4,4),
                ),
                 Shadow(
                    color:Colors.black.withOpacity(0.4),
                    blurRadius: 6,
                    offset:Offset(-4,-4),
                ),
                  ],
                   ),
                ),
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GradientText(
                "Access your potential, one login away.",
                style:TextStyle(
                fontSize: 32,
                ),
                colors: [
                  Color.fromARGB(255, 1, 1, 14),
                  Color.fromARGB(255, 195, 67, 7),
                ],
              ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: TextField(
                  controller: _controller,
                  cursorColor: const Color.fromARGB(96, 190, 6, 135),
                  keyboardType: TextInputType.text,// TextInputType.number
                  //inputFormtters:[FilteringTextInputFormatter.digitsOnly],

                  maxLength: 320,
                  decoration:InputDecoration(
                    hintText: "abc123@gmail.com",
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                
                    ),

                    fillColor: const Color.fromARGB(255, 243, 239, 239),
                    filled: true,
                    prefixIcon: Icon(Icons.mail),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                        color: Colors.red ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                        color: Colors.yellow, width: 3),
                    ),
                    labelText: "Enter your email address",
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                  ),
                ),
              ),
Padding(
  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
  child: TextField(
    cursorColor: const Color.fromARGB(96, 190, 6, 135),
    keyboardType: TextInputType.text, 
    maxLength: 50, 
    decoration: InputDecoration(
      hintText: "Samir23bogati",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      fillColor: const Color.fromARGB(255, 243, 239, 239),
      filled: true,
      prefixIcon: const Icon(Icons.person), 
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.yellow, width: 3),
      ),
      labelText: "Enter your username",
      floatingLabelAlignment: FloatingLabelAlignment.center,
    ),
  ),
),

              
             MaterialButton(
              onPressed: () {
                if(_controller.text.isEmpty){
                  Fluttertoast.showToast(
                    msg: " No Input From User",
                    timeInSecForIosWeb: 4,
                  );
                }else{
                  Fluttertoast.showToast(
                    msg: _controller.text,
                    timeInSecForIosWeb: 4,
                  );
                }
              },
              child: Text("LOGIN",
              style: TextStyle(
                color:const Color.fromARGB(255, 6, 6, 5),
                fontSize: 22,
              ),
              ),
              ),
            ]
          )
             
                ),
    );
             
}
}
