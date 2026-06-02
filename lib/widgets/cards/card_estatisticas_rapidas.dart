import 'package:flutter/material.dart';

class CardEstatisticasRapidas extends StatelessWidget {
  final int usodiario;
  final int usosemanal;
  final String ultimaexecucao;

  const CardEstatisticasRapidas({
    super.key,
    required this.usodiario,
    required this.usosemanal,
    required this.ultimaexecucao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFB2F2E3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Estatísticas Rápidas",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 20),
          _LinhaEstatistica(context, "Uso Hoje:", "${usodiario} litros"),
          const SizedBox(height: 12),
          _LinhaEstatistica(context, "Esta Semana:", "${usosemanal} litros"),
          const SizedBox(height: 12),
          _LinhaEstatistica(
              context, "Última Execução:", "${ultimaexecucao} atrás"),
        ],
      ),
    );
  }

  // Função auxiliar para criar as linhas de estatística
  Widget _LinhaEstatistica(
    BuildContext context,
    String label,
    String value,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ],
    );
  }
}
