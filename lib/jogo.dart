import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _resultadoFinal = "Boa sorte!!!";
  var _pontuacaoUsuario = 0;
  var _pontuacaoApp = 0; // Nova variável para contar pontos do App
  Color _corResultado = Colors.black; // Cor padrão inicial

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuário: " + escolhaUsuario);

    // Atualiza a imagem conforme a escolha do App
    setState(() {
      _imagemApp = AssetImage("images/$escolhaApp.png");
    });

    // Verifica quem venceu
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _resultadoFinal = "Parabéns!!! Você ganhou :)";
        _corResultado = Colors.green;
        _pontuacaoUsuario += 1; // Incrementa ponto do usuário
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        _resultadoFinal = "Puxa!!! Você perdeu :(";
        _corResultado = Colors.red;
        _pontuacaoApp += 1; // Incrementa ponto do App
      });
    } else {
      setState(() {
        _resultadoFinal = "Empate!!! Tente novamente :/";
        _corResultado = Colors.blue; // Azul para empate
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          const Text(
            "Escolha do App",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Image(image: _imagemApp, height: 100),
          const SizedBox(height: 20),
          const Text(
            "Escolha uma opção abaixo:",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: const Image(
                      image: AssetImage('images/pedra.png'),
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text("Pedra", style: TextStyle(fontSize: 18))
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: const Image(
                      image: AssetImage('images/papel.png'),
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text("Papel", style: TextStyle(fontSize: 18))
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: const Image(
                      image: AssetImage('images/tesoura.png'),
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text("Tesoura", style: TextStyle(fontSize: 18))
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            _resultadoFinal,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: _corResultado),
          ),
          const SizedBox(height: 20),
          Text(
            "Você: $_pontuacaoUsuario     Casa: $_pontuacaoApp",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
