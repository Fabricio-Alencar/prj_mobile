import 'package:flutter/material.dart';
import '../widgets/app_navegacao.dart';
import '../widgets/app_topo.dart';
import '../widgets/menu/app_menu_hamburger.dart';
import '../widgets/infos/informacoes_pessoais.dart';
import '../widgets/infos/foto_area.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopo(),
      drawer: AppMenuHamburger(), // Menu lateral
      bottomNavigationBar:
          const AppNavegacao(currentIndex: 3), // Barra inferior

      body: LayoutBuilder(
        builder: (context, constraints) {
          // Limita largura máxima em telas grandes (desktop/tablet)
          double maxWidth =
              constraints.maxWidth > 900 ? 900 : constraints.maxWidth;

          return Center(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              width: maxWidth, // Faz o conteúdo centralizado e responsivo
              child: Column(
                children: [
                  //HEADER (Stack)
                  FotoArea(
                      foto_internet:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwxvt4wLWkQJORatJts_lQpSE_iZsKQVP8-Q&s'),

                  SizedBox(height: 10),

                  // Nome do usuário
                  Text(
                    'Pichula Alves Cardoso Alencar',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Informações pessoais
                  Container(
                    margin: EdgeInsets.only(
                        left: 40), // desloca tudo 30px para a direita
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InformacoesPessoais(
                          informacao: "(11) 98754-0000",
                          tipo: "telefone",
                        ),
                        SizedBox(height: 10),
                        InformacoesPessoais(
                          informacao: "pichula@email.com",
                          tipo: "email",
                        ),
                        SizedBox(height: 10),
                        InformacoesPessoais(
                          informacao: "São Paulo - SP, Brasil",
                          tipo: "localizacao",
                        ),
                        SizedBox(height: 40),

                        // Titulo - Meus aparelhos
                        Text(
                          'Meus Aparelhos',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        InformacoesPessoais(
                          informacao: "000000-000",
                          tipo: "dispositivos",
                        ),
                        SizedBox(height: 10),
                        InformacoesPessoais(
                          informacao: "000100-010",
                          tipo: "dispositivos",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
