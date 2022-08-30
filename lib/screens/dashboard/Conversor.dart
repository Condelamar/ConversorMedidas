import 'package:flutter/material.dart';
import 'package:hello_world/models/Conversao.dart';
import 'package:hello_world/models/SalvaLog.dart';
import 'package:hello_world/screens/Log.dart';

class Conversor extends StatefulWidget {
  @override
  State<Conversor> createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  var controller;
  String dropdownValue = 'Milhas';
  String dropdownValue2 = 'Quilômetros';
  double top = 0.0;
  double valorConversao = 0;
  double valorLog = 0;
  static String logTeste = '';

  List<String> imperiais = ["Milhas", "Jardas"];

  Conversao C = new Conversao();
  SalvaLog L = new SalvaLog();

  @override
  void initState() {
    super.initState();
    controller = Log();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Conversor de Medidas",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Conversor de Medidas",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              backgroundColor: Color.fromARGB(255, 85, 49, 248),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                tooltip: 'Log',
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Log()));
                },
              ),
            ),
            body: Builder(builder: (context) {
              return Column(
                children: [
                  widgetTextField(),
                  Column(
                    children: [
                      Text(
                        "Converter de",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 400,
                        child: Container(
                          color: Colors.white,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            elevation: 16,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            underline: Container(
                              height: 2,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['Milhas', 'Jardas']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Text(
                        "Para",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 400,
                        child: Container(
                          color: Colors.white,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue2,
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            elevation: 16,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            underline: Container(
                              height: 2,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue2 = newValue!;
                              });
                            },
                            items: <String>['Quilômetros', 'Centímetros']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 85, 49, 248),
                              elevation: 15,
                              shadowColor: Colors.green),
                          child: Text(
                            'Converter',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            if (dropdownValue2.contains('Quilômetros') &&
                                dropdownValue.contains('Milhas')) {
                              valorConversao = C.converteMilhaKm();
                              L.setValoreslog(valorConversao.toString());
                            } else if (dropdownValue2.contains('Quilômetros') &&
                                dropdownValue.contains('Jardas')) {
                              valorConversao = C.converteJardaKm();
                              L.setValoreslog(valorConversao.toString());
                            } else if (dropdownValue2.contains('Centímetros') &&
                                dropdownValue.contains('Milhas')) {
                              valorConversao = C.converteMilhaCm();
                              L.setValoreslog(valorConversao.toString());
                            } else if (dropdownValue2.contains('Centímetros') &&
                                dropdownValue.contains('Jardas')) {
                              valorConversao = C.converteJardaCm();
                              L.setValoreslog(valorConversao.toString());
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              );
            })));
  }

  widgetTextField() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(border: InputBorder.none, hintText: "Valor"),
      onSubmitted: (String value) {
        C.setValorPassado(double.parse(value));
      },
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Alert Dialog titulo"),
          content: new Text(valorConversao.toString()),
          actions: <Widget>[
            new TextButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
