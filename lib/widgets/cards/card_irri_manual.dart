import 'package:flutter/material.dart';

class CardIrriManual extends StatelessWidget {
  final bool isAtivo;
  final VoidCallback onToggle;

  const CardIrriManual({
    super.key,
    required this.isAtivo,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // circulo
            Center(
              child: AnimatedContainer(
                duration: const Duration(
                    milliseconds:
                        300), // Define o tempo de transição entre as mudanças de estilo (cores, tamanho, sombra).
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: isAtivo
                      ? const Color(0xFF7B00FF)
                      : const Color(0xFFE2E2EC),
                  shape: BoxShape.circle,
                  // Adicionei um leve brilho quando ativo para combinar com o print
                ),
                child: Icon(
                  Icons.opacity,
                  size: 40,
                  color: isAtivo ? Colors.white : Color(0xFF4e4e57),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // status
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: isAtivo
                      ? const Color(0xFFE2E2FC)
                      : const Color(0xffdbdbf9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isAtivo ? 'Sistema Ativo' : 'Sistema Inativo',
                  style: TextStyle(
                    color: isAtivo
                        ? const Color(0xFF7B00FF)
                        : const Color(0xFF5E5E77),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // botão
            SizedBox(
              height: 40,
              child: ElevatedButton.icon(
                onPressed: onToggle,
                icon: const Icon(Icons.power_settings_new, color: Colors.white),
                label: Text(
                  isAtivo ? 'Parar Irrigação' : 'Iniciar Irrigação',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isAtivo ? Colors.red : const Color(0xFF00B067),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
