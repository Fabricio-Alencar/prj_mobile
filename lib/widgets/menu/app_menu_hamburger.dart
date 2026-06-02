import 'package:flutter/material.dart';

// IMPORTS DO TEMA
import '../../app.dart';
import '../../themes/app_themes.dart';

class AppMenuHamburger extends StatelessWidget {
  const AppMenuHamburger({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 70, // Ajustado para um tamanho mais confortável
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // CONFIGURAÇÕES
            // ListTile(
            //   leading: const Icon(Icons.settings),
            //   title: const Text('Configurações'),
            //   onTap: () {
            //     Navigator.pop(
            //        context); // Importante fechar o drawer antes de navegar
            //     Navigator.pushNamed(context, '/configuracoes');
            //   },
            // ),

            //const Divider(),

            // 🎨 TROCAR TEMA
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Tema'),
              onTap: () {
                Navigator.pop(context); // Fecha o drawer

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Escolher tema'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _temaOption(context, "Verde", AppThemes.verde,
                            Color(0xFF7A9544)),
                        _temaOption(
                            context, "Azul", AppThemes.azul, Color(0xFF547A96)),
                        _temaOption(
                          context,
                          "Vermelho",
                          AppThemes.vermelho,
                          Colors.red,
                        ),
                        _temaOption(context, "Escuro", AppThemes.escuro,
                            Color(0xff3b3b3a)),
                      ],
                    ),
                  ),
                );
              },
            ),

            const Divider(),

            // SAIR
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Sair', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context); // Fecha o drawer
                _showSairDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Função auxiliar para o Modal de Sair (Organização)
  void _showSairDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sair do aplicativo'),
        content: const Text('Tem certeza que deseja sair da sua conta?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            child: const Text('Sair', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // 🔧 FUNÇÃO AUXILIAR PARA OS TEMAS
  Widget _temaOption(BuildContext context, String nome, ThemeData tema, cor) {
    return ListTile(
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: cor, // 👈 cor da bolinha
          shape: BoxShape.circle,
        ),
      ),
      title: Text(nome),
      onTap: () {
        themeController.setTheme(tema);
        Navigator.pop(context); // fecha modal
      },
    );
  }
}
