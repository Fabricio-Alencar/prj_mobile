import 'package:flutter/material.dart';

class FotoArea extends StatelessWidget {
  final String foto_internet;

  const FotoArea({
    super.key,
    required this.foto_internet,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Permite elementos saírem do limite
      children: [
        // Fundo (primeira camada)
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            // 🔥 cor principal do tema
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        // Card (segunda camada, topo arredondado)
        Positioned(
          top: 70,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              // 🔥 fundo do app (tema)
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
          ),
        ),

        // Avatar (terceira camada)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Center(
            child: CircleAvatar(
              radius: 85,
              backgroundColor: Theme.of(context).colorScheme.background,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(foto_internet),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
