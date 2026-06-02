import 'package:flutter/material.dart';

import '../services/api_service.dart';

import '../widgets/app_topo.dart';
import '../widgets/app_navegacao.dart';
import '../widgets/infos/titulo.dart';
import '../widgets/menu/app_menu_hamburger.dart';

import '../widgets/cards/card_irri_automatica.dart';
import '../widgets/cards/card_umidade_automacao.dart';

class Automacao extends StatefulWidget {
  const Automacao({super.key});

  @override
  State<Automacao> createState() => AutomacaoState();
}

class AutomacaoState extends State<Automacao> {
  double _minLocal = 30.0;
  double _maxLocal = 70.0;

  bool _editando = false;

  @override
  void initState() {
    super.initState();

    _minLocal = apiService.umidadeMinima;
    _maxLocal = apiService.umidadeMaxima;

    apiService.onDataReceived = () {
      if (!mounted) return;

      // So atualiza as barrinhas (min e max) com os dados do back se o usuario não estiver editando
      if (!_editando) {
        _minLocal = apiService.umidadeMinima;
        _maxLocal = apiService.umidadeMaxima;
      }

      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppTopo(),
      drawer: AppMenuHamburger(),
      bottomNavigationBar: const AppNavegacao(currentIndex: 2),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth =
                constraints.maxWidth > 900 ? 900 : constraints.maxWidth;

            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: maxWidth,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Titulo(
                          titulo: "Automação",
                          subtitulo: "Controle automático de irrigação",
                        ),
                        const SizedBox(height: 20),

                        CardIrriAutomatica(
                          irrigadorLigado: apiService.modoAutomatico,
                          onChanged: (valor) async {
                            bool sucesso =
                                await apiService.alterarStatusAutomacao(valor);

                            //Mostra mensagem se não conseguiu enviar o valor e o usuario continua na tela (mounted == true)
                            if (!sucesso && mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Falha ao atualizar automação.",
                                  ),
                                ),
                              );
                            }
                          },
                        ),

                        const SizedBox(height: 20),

                        CardUmidadeAutomacao(
                          // Valores locais
                          umidadeMinima: _minLocal,
                          umidadeMaxima: _maxLocal,

                          // Alterar mínima
                          onMinChanged: (valor) {
                            setState(() {
                              _editando = true;
                              _minLocal = valor;
                            });
                          },

                          // Alterar máxima
                          onMaxChanged: (valor) {
                            setState(() {
                              _editando = true;
                              _maxLocal = valor;
                            });
                          },
                        ),

                        const SizedBox(height: 10),

                        // BOTÃO SALVAR
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              bool ok = await apiService.alterarLimitesUmidade(
                                _minLocal,
                                _maxLocal,
                              );

                              // terminou edição
                              _editando = false;

                              if (!context.mounted) return;

                              //Retorna mensagem embaixo da tela
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    ok ? "Limites salvos!" : "Erro ao salvar.",
                                  ),
                                  backgroundColor:
                                      ok ? Colors.green : Colors.red,
                                ),
                              );
                            },
                            child: const Text(
                              "Salvar Configurações de Solo",
                            ),
                          ),
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
