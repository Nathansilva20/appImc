import 'package:flutter/material.dart';
import 'package:imc/imc.dart';
import 'package:imc/resultado.dart';

class Home extends StatefulWidget {
  @override
  _HomeIMCState createState() => _HomeIMCState();
}

class _HomeIMCState extends State<Home> {
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();

  void _limparCampos() {
    _alturaController.text = "";
    _pesoController.text = "";
  }

  void _btnCalcularIMC() {
    double alt = double.parse(_alturaController.text);
    double pes = double.parse(_pesoController.text);

    var myImc = IMC(altura: alt, peso: pes);

    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => IMCResultado(
                    imc: myImc,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200, // Definir a cor de fundo aqui
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          backgroundColor: Colors.teal,
          actions: [
            IconButton(icon: Icon(Icons.refresh), onPressed: _limparCampos)
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 24.0),
                Icon(
                  Icons.calculate_outlined,
                  color: Colors.teal,
                  size: 80.0,
                ),
                SizedBox(height: 24.0),
                TextField(
                  controller: _alturaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Altura',
                    labelStyle: TextStyle(color: Colors.teal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    prefixIcon: Icon(Icons.height, color: Colors.teal),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _pesoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Peso',
                    labelStyle: TextStyle(color: Colors.teal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    prefixIcon: Icon(Icons.line_weight, color: Colors.teal),
                  ),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: _btnCalcularIMC,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  ),
                  child: Text('Calcular IMC',
                      style: TextStyle(fontSize: 16.0, color: Colors.white)),
                ),
              ],
            ),
          ),
        ));
  }
}
