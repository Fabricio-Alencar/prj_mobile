import 'package:flutter/material.dart';

class AppTopo extends StatelessWidget implements PreferredSizeWidget {
  const AppTopo({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Color(0xffffffff),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.eco,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(width: 6),
                Text(
                  "AgroLink",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override //se tiver o implements coloque esta função
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
