// Importa os componentes do Flutter (UI)
import 'package:flutter/material.dart';

class CardIrrigacao extends StatefulWidget {
  const CardIrrigacao({
    super.key,
  });

  @override
  _CardIrrigacaoState createState() => _CardIrrigacaoState();
}

class _CardIrrigacaoState extends State<CardIrrigacao> {
  double humidity = 45;
  bool irrigadorLigado = false;
  bool modoAutomatico = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // ✅ correção aqui
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Ativar irrigação quando % de umidade for:",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$humidity%",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 1),
            Slider(
              value: humidity,
              min: 0,
              max: 100,
              divisions: 100, // 🔥 isso força valores inteiros
              onChanged: (value) {
                setState(() {
                  humidity = value.roundToDouble();
                });
              },
            ),
            Row(
              children: [
                // 🔸 Card modo automático
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Color(0x80C8C8C8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Modo ativado:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              modoAutomatico = !modoAutomatico;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            decoration: BoxDecoration(
                              color: Color(0xFF829FC3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              modoAutomatico ? "Automático" : "Manual",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 🔸 Card botão on/off
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Color(0x80C8C8C8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Ligar irrigador manualmente:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Switch(
                          value: irrigadorLigado,
                          activeColor: Color(0xff166e05),
                          onChanged: (value) {
                            setState(() {
                              irrigadorLigado = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
