enum ClassificacaoIMC {
  AbaixoIdeal,
  PesoIdeal,
  ObesidadeI,
  ObesidadeII,
  ObesidadeIII,
}

extension FaixaIMCExt on ClassificacaoIMC {
  String get descricao {
    switch (this) {
      case ClassificacaoIMC.AbaixoIdeal:
        return 'Magreza';
      case ClassificacaoIMC.PesoIdeal:
        return 'Peso Normal';
      case ClassificacaoIMC.ObesidadeI:
        return 'Sobrepeso 1';
      case ClassificacaoIMC.ObesidadeII:
        return 'Obesidade Grau II';
      case ClassificacaoIMC.ObesidadeIII:
        return 'Obesidade Grave - Grau III';
      default:
        return '';
    }
  }
}

class IMC {
  double peso;
  double altura;

  IMC({required this.peso, required this.altura});

  double get imc {
    return peso / (altura * altura);
  }

  ClassificacaoIMC get faixa {
    double valueIMC = this.imc;

    if (valueIMC < 18.5) return ClassificacaoIMC.AbaixoIdeal;
    if (valueIMC >= 18.5 && valueIMC < 24.9) return ClassificacaoIMC.PesoIdeal;
    if (valueIMC >= 25.0 && valueIMC < 29.9) return ClassificacaoIMC.ObesidadeI;
    if (valueIMC >= 30.0 && valueIMC < 39.9)
      return ClassificacaoIMC.ObesidadeII;
    if (valueIMC >= 40) return ClassificacaoIMC.ObesidadeIII;

    return ClassificacaoIMC.AbaixoIdeal;
  }
}
