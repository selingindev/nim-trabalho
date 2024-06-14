import 'dart:io';

class JogadorClasse{
  String? nome;


  int fazerJogada(int quantidadeMax, int quantidadePalito, String? nome){
    while(true){
      try {
  print("$nome insira a quantidade de palítos para retirar");
  String? input = stdin.readLineSync();
  if(input == null){
    print("Valor nullo");
  }
  else{
    int retirar = int.parse(input);
    if(retirar > 0 && retirar <= quantidadeMax && retirar <= quantidadePalito){
      return retirar;
    }
    else{
      print("Valor inválido! Insira outro!");
    }
  }
}on FormatException {
      print('Formato de número inválido! Utilize apenas números inteiros.');
      print('(Exemplo: 10)');} 
catch (e) {
  print("Erro inesperado: $e");
}
    }
  }

}