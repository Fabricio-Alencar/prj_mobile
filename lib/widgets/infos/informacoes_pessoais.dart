import 'package:flutter/material.dart';

class InformacoesPessoais extends StatelessWidget {
  final String informacao;
  final String tipo;

  const InformacoesPessoais({
    super.key,
    required this.informacao,
    required this.tipo,
  });

  // Função que retorna o icon de acordo com o tipo
  IconData _getIcon() {
    switch (tipo) {
      case 'telefone':
        return Icons.phone;
      case 'email':
        return Icons.email;
      case 'localizacao':
        return Icons.location_on;
      default:
        return Icons.wifi;
    }
  }

  @override
  Widget build(BuildContext context) {
    final icon = _getIcon();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 35,
          color: Theme.of(context).iconTheme.color,
        ),
        const SizedBox(width: 20),
        Text(
          informacao,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
