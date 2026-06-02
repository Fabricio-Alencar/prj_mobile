import 'package:flutter/material.dart';

class CardUmidadeAutomacao extends StatelessWidget {
  final double umidadeMinima;
  final double umidadeMaxima;
  final Function(double) onMinChanged;
  final Function(double) onMaxChanged;

  const CardUmidadeAutomacao({
    super.key,
    required this.umidadeMinima,
    required this.umidadeMaxima,
    required this.onMinChanged,
    required this.onMaxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Umidade Mínima",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  Text(
                    "${umidadeMinima.round()}%",
                    style: const TextStyle(
                      color: Color(0xff04ab49),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Slider(
                min: 0,
                max: 100,
                divisions: 100,
                value: umidadeMinima,
                label: "${umidadeMinima.round()}%",
                activeColor: const Color(0xFF00C853),
                inactiveColor: const Color(0xFF00C853).withOpacity(0.2),
                onChanged: onMinChanged,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Umidade Máxima",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  Text(
                    "${umidadeMaxima.round()}%",
                    style: const TextStyle(
                      color: Color(0xff21189d),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Slider(
                min: 0,
                max: 100,
                divisions: 100,
                value: umidadeMaxima,
                label: "${umidadeMaxima.round()}%",
                activeColor: const Color(0xff21189d),
                inactiveColor: const Color(0xff21189d).withOpacity(0.2),
                onChanged: onMaxChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
