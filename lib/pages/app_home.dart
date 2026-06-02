import 'package:flutter/material.dart';
import '../services/api_service.dart';

import '../widgets/app_topo.dart';
import '../widgets/app_navegacao.dart';
import '../widgets/menu/app_menu_hamburger.dart';
import '../widgets/infos/titulo.dart';
import '../widgets/cards/card_temperatura_umidade.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Vincula o callback do serviço para atualizar a UI quando chegarem novos dados
    apiService.onDataReceived = () {
      if (mounted)
        setState(() {}); // Atualiza a tela com segurança se ainda estiver ativa
    };
    // Inicia a conexão com o backend (WebSocket) para receber dados em tempo real
    apiService.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppTopo(),
      drawer: AppMenuHamburger(),
      bottomNavigationBar: const AppNavegacao(currentIndex: 0),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth =
                constraints.maxWidth > 900 ? 900 : constraints.maxWidth;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Titulo(
                          titulo: "Painel",
                          subtitulo:
                              "Atualizado em: ${apiService.ultimaAtualizacao}",
                        ),
                        const SizedBox(height: 20),
                        CardTempHumi(
                            message:
                                "${apiService.umidadeSoloAtual.toStringAsFixed(1)}%",
                            tipo: "umidade"),
                        const SizedBox(height: 20),
                        CardTempHumi(
                            message:
                                "${apiService.temperaturaAtual.toStringAsFixed(1)}°C",
                            tipo: "temperatura"),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
