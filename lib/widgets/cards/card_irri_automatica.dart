import 'package:flutter/material.dart';

class CardIrriAutomatica extends StatelessWidget {
  final bool irrigadorLigado;
  final ValueChanged<bool> onChanged;

  const CardIrriAutomatica({
    super.key,
    required this.irrigadorLigado,
    required this.onChanged,
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00C853).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.bolt_outlined,
                    color: Color(0xFF00C853),
                    size: 28,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Irrigação Automática",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                      Text(
                        "Ativar irrigação automática",
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: irrigadorLigado,
                  activeColor: const Color(0xFF00C853),
                  onChanged: onChanged,
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Divider(
              thickness: 0.8,
              color: Color(0xffa6a3a3),
            ),
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF00C853).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF00C853).withOpacity(0.2),
                ),
              ),
              child: const Text(
                "A irrigação inicia quando a umidade atingir o valor mínimo definido e para ao alcançar a umidade máxima",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF166E05),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
