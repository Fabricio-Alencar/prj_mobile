import 'package:flutter/material.dart';
import '../services/api_service.dart';

import '../widgets/app_topo.dart';
import '../widgets/app_navegacao.dart';
import '../widgets/infos/titulo.dart';
import '../widgets/menu/app_menu_hamburger.dart';
import '../widgets/cards/card_irri_manual.dart';
import '../widgets/cards/card_estatisticas_rapidas.dart';

class Irrigacao extends StatefulWidget {
  const Irrigacao({super.key});

  @override
  State<Irrigacao> createState() => IrrigacaoState();
}

class IrrigacaoState extends State<Irrigacao> {
  @override
  void initState() {
    super.initState();
    apiService.onDataReceived = () {
      if (mounted) setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppTopo(),
      drawer: AppMenuHamburger(),
      bottomNavigationBar: const AppNavegacao(currentIndex: 1),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth =
                constraints.maxWidth > 900 ? 900 : constraints.maxWidth;

            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Titulo(
                          titulo: "Controle de Irrigação",
                          subtitulo:
                              "Gerencie a distribuição de água de forma manual",
                        ),
                        const SizedBox(height: 20),
                        CardIrriManual(
                          // Mostra se botão esta ativo ou não (modoManual = true ==> Botão ativado)
                          isAtivo: apiService.modoManual,
                          onToggle: () async {
                            // Envia para o servidor o valor inverso ao estado armazenado na variavel modoManual
                            // Clickou no botão trocou o estado
                            bool sucesso =
                                await apiService.alterarStatusIrrigadorManual(
                                    !apiService.modoManual);

                            if (!sucesso && mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Falha ao comunicar com o servidor.")),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        const CardEstatisticasRapidas(
                          usodiario: 45,
                          usosemanal: 280,
                          ultimaexecucao: "2 horas",
                        ),
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
