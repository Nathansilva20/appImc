import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imc/imc.dart';

class IMCResultado extends StatefulWidget {
  final IMC imc;
  IMCResultado({required this.imc});

  @override
  _IMCResultadoState createState() => _IMCResultadoState(imc);
}

class _IMCResultadoState extends State<IMCResultado> {
  final IMC _imc;
  Color _corFaixa = Color.fromARGB(255, 255, 255, 255);

  final Map<ClassificacaoIMC, String> _textosClassificacao = {
    ClassificacaoIMC.AbaixoIdeal:
        '🦴 Seu IMC indica que você está abaixo do peso ideal. É importante manter uma dieta equilibrada e buscar orientação médica para alcançar um peso saudável. 🦴',
    ClassificacaoIMC.PesoIdeal:
        ' 🎉Parabéns! Seu IMC está dentro da faixa considerada ideal. Continue mantendo hábitos saudáveis para preservar sua saúde. 🎉',
    ClassificacaoIMC.ObesidadeI:
        ' ⚠️ Seu IMC indica obesidade grau I. É importante adotar medidas para perder peso, como uma dieta balanceada e exercícios físicos regulares, para reduzir os riscos à saúde. ⚠️',
    ClassificacaoIMC.ObesidadeII:
        ' ⚠️ Seu IMC indica obesidade grau II (severa). É fundamental buscar ajuda médica para iniciar um programa de perda de peso e adotar hábitos mais saudáveis para evitar complicações de saúde. ⚠️',
    ClassificacaoIMC.ObesidadeIII:
        ' 🔴 Seu IMC indica obesidade grau III (mórbida). É urgente buscar orientação médica para iniciar um tratamento adequado, que pode incluir mudanças drásticas no estilo de vida, intervenções médicas e acompanhamento profissional constante. 🔴',
  };

  _IMCResultadoState(
    this._imc,
  ) {
    switch (_imc.faixa) {
      case ClassificacaoIMC.AbaixoIdeal:
        _corFaixa = Colors.green;
        break;
      case ClassificacaoIMC.PesoIdeal:
        _corFaixa = Colors.blue;
        break;
      case ClassificacaoIMC.ObesidadeI:
        _corFaixa = Colors.orangeAccent;
        break;
      case ClassificacaoIMC.ObesidadeII:
        _corFaixa = Colors.red;
        break;
      case ClassificacaoIMC.ObesidadeIII:
        _corFaixa = Colors.deepPurple;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do IMC'),
        backgroundColor: _corFaixa,
      ),
      body: Center(
        // Centralizando o conteúdo na tela
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: _corFaixa, width: 9),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    _imc.imc.toStringAsPrecision(3),
                    style: GoogleFonts.caladea(fontSize: 90),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Classificação:',
                    style: TextStyle(fontSize: 16, color: _corFaixa),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    _imc.faixa.descricao,
                    style: TextStyle(fontSize: 20, color: _corFaixa),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    _textosClassificacao[_imc.faixa] ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
