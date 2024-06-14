import 'dart:io';
import 'dart:math';
import 'jogador_classe.dart';

int obterNumero(String comando, int minimo, int max) {
  while (true) {

    try {
  stdout.write('$comando \n');
  String? input = stdin.readLineSync();
  if (input != null) {
    int v = int.parse(input);
    if (v >= minimo && v <= max) {
      return v;
    } else {
      print('Valor fora dos limites minimo e maximo');
    }
  } else {
    print('Valor nulo');
  }
} on FormatException {
  print('Formato de número inválido! Utilize apenas números inteiros.');
      print('(Exemplo: 1)\n Reiniciando o Jogo...');
}

catch (e) {
  print("Erro inesperado: $e");
}
  }
}


void imprimirQuantidade(int quantidadeAtual) {
  for (int i = 0; i < quantidadeAtual; i++) {
    stdout.write(' | ');
  }
  print('');
}


void modoDoisJogadores(int quantidadePalito, int maxRetirar){
  final jogador1 = JogadorClasse();
  final jogador2 = JogadorClasse();
  do {
    print("Insira o nome do jogador 1:");
    jogador1.nome = stdin.readLineSync()?.trim();
    print("Insira o nome do jogador 2:");
    jogador2.nome = stdin.readLineSync()?.trim();
    if (jogador1.nome == null || jogador1.nome!.isEmpty || jogador2.nome == null || jogador2.nome!.isEmpty) {
      print("Insira os nomes por favor");
    }
  } while (jogador1.nome == null || jogador1.nome!.isEmpty || jogador2.nome == null || jogador2.nome!.isEmpty);

  print(" Començando o jogo...");
  print(" Quantidade de palitos: ");
  imprimirQuantidade(quantidadePalito);
  do{
    int jogada1 = jogador1.fazerJogada(maxRetirar,quantidadePalito,jogador1.nome);
      quantidadePalito-=jogada1;
      print(" ${jogador1.nome} retirou $jogada1 palitos");
      print(" Quantidade de Palitos:");
      imprimirQuantidade(quantidadePalito);
    if(quantidadePalito==0){
      print(" ${jogador2.nome} venceu o jogo\n\n Iniciando novo Jogo...");
      break;
    }
    int jogada2 = jogador2.fazerJogada(maxRetirar,quantidadePalito, jogador2.nome);

      quantidadePalito-=jogada2;
      print(" ${jogador2.nome} retirou $jogada2 palitos");
      print(" Quantidade atual palitos: ${quantidadePalito}");
  } while(quantidadePalito > 0);
  print(" ${jogador1.nome} venceu o jogo\n\n Iniciando nova partida...");
}

int jogadaComp(int qntMax, qntAtual){
  final aleatoria = Random();
  return aleatoria.nextInt(min(qntMax, qntAtual));
}

void modoComputador(int quantidadePalito, int maxRetirar){
  final jogadorUnico = JogadorClasse();
  do {
    print(" Insira seu nome:");
    jogadorUnico.nome = stdin.readLineSync();
  } while (jogadorUnico.nome == null);
  print(" Começando o Jogo...");
  do {
    int jogar = jogadorUnico.fazerJogada(maxRetirar, quantidadePalito, jogadorUnico.nome);
    print("${jogadorUnico.nome} retirou $jogar palitos");
    quantidadePalito -= jogar;
    print(" Quantidade de Palitos: ");
    imprimirQuantidade(quantidadePalito);
    if(quantidadePalito==0){
      print(" Computador venceu!\n Iniciando nova partida...");
      break;
    }
    int jogarComp = jogadaComp(maxRetirar, quantidadePalito);
    quantidadePalito -= jogarComp;
    print(" Computador retirou $jogarComp palitos!");
    print(" Quantidade de Palitos: ");
    imprimirQuantidade(quantidadePalito);
  } while(quantidadePalito>0);
  print(" ${jogadorUnico.nome} venceu o Jogo!\n Iniciando nova partida...");

}

void main(){

  print('Bem vindo ao Jogo Nim!');
    final quantidadePalito =
        obterNumero("Digite a quantidade de palitos no jogo de 5 e 33", 5, 33);
    final maxRetirar = obterNumero(
        'Digite a quantide máxima de palitos a ser retirada (3, 5)', 3, 5);

    while (true) {

      try {
  print("Qual forma você deseja jogar?\n [1] 2 jogadores?\n [2] Você e a máquina?\n [3]Sair");
  String? resposta = stdin.readLineSync();
  if(resposta!=null){
    int? resp = int.tryParse(resposta);
    if(resp == 1){
      modoDoisJogadores(quantidadePalito, maxRetirar);  
    }
    else if(resp == 2){
      modoComputador(quantidadePalito, maxRetirar);
    }
    else if(resp == 3){
      print("Saindo...");
      break;
    }
    else{
      print("Resposta invalida tente novamente");
    }
  }
  else{
    print("Responda por favor");
  }
}
on FormatException {
      print('Formato de número inválido! Utilize apenas números inteiros.');
      print('(Exemplo: 1)\n Reiniciando o Jogo...');}
catch (e) {
  print("Ocorreu algum erro: $e\n Reiniciando o Jogo...");
}
    }
}