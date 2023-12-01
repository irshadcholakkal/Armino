import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  List<String> options = <String>['Today', 'Tomorrow'];
  String dropdownValue = 'Today';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        underline: const SizedBox(),
        isExpanded: true,
        style:GoogleFonts.poppins(color:const Color(0xFFF6C8A4),fontSize: 25,fontWeight: FontWeight.w500),
        dropdownColor: const Color(0xFFAC736A),
        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFFF6C8A4),size: 40,),
        selectedItemBuilder: (BuildContext context) {
          return options.map((String value) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                dropdownValue,
              ),
            );
          }).toList();
        },
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

Widget LoadingScreen(BuildContext context) {
  return Scaffold(
    backgroundColor:
    Color(0xFFAC736A),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        Lottie.asset('asset/Loading.json'),
        CircularProgressIndicator(
          color:
              Color(0xFFF6C8A4),
          strokeCap: StrokeCap.round,
          strokeAlign: 1,
          strokeWidth: 3,
        ),
        // box(0.2, 0, context),
        Text(
          'Please Check Internet Connection !',
          style: TextStyle(color: Colors.white.withOpacity(0.8)),
        )
      ],
    ),
  );
}