import 'package:flutter/material.dart';
import 'package:hello_world/models/SalvaLog.dart';
import 'package:hello_world/screens/dashboard/Conversor.dart';

class Log extends StatefulWidget {
  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  String logString = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de medidas',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Log de conversões",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          backgroundColor: Color.fromARGB(255, 85, 49, 248),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: 'Voltar',
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Conversor()));
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Card(
                color: Color.fromARGB(255, 128, 127, 129),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: listaLog()),
                    readOnly: true,
                    maxLines: 45,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  String listaLog() {
    for (int i = 0; i < SalvaLog.valoresLog.length; i++) {
      logString = logString + SalvaLog.valoresLog[i] + '\n';
    }
    return logString;
  }
}
