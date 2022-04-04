import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  final inputUserController = TextEditingController();
  void convert() {
    setState(() {
      _inputUser = double.parse(inputUserController.text);
      _kelvin = (_inputUser + 273.15);
      _reamur = (_inputUser * 4 / 5);
    });
  }

  @override
  void dispose() {
    inputUserController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                decoration:
                    InputDecoration(hintText: 'Masukkan suhu dalam celcius'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: inputUserController,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text('kelvin'),
                      Text('$_kelvin'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('reamur'),
                      Text('$_reamur'),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: convert,
                  child: Text('convert'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue))
            ],
          ),
        ),
      ),
    );
  }
}
