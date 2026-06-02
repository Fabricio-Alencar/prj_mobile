import 'package:flutter/material.dart';

class CardTempHumi extends StatelessWidget {
  final String message;
  final String tipo;

  const CardTempHumi({
    super.key,
    required this.message,
    required this.tipo,
  });

  // Função que retorna a URL da imagem de acordo com o tipo
  String _getImagem() {
    switch (tipo) {
      case 'umidade':
        return 'https://cdn-icons-png.flaticon.com/512/3262/3262968.png';
      default:
        return 'https://cdn-icons-png.flaticon.com/512/1684/1684375.png';
    }
  }

  String _getTitulo() {
    switch (tipo) {
      case 'umidade':
        return 'Umidade do Solo:';
      default:
        return 'Temperatura do ambiente:';
    }
  }

  @override
  Widget build(BuildContext context) {
    final imagem = _getImagem();
    final titulo = _getTitulo();

    return Card(
      color: Theme.of(context).colorScheme.surface,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Image.network(
                  imagem,
                  width: 52,
                  height: 52,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
