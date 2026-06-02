import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Dominio do backend hospedado na Azure
  static const String _azureDomain = "backmobile.azurewebsites.net";

  WebSocketChannel? _channel;

  // Função utilizada para avisar a interface gráfica que novos dados chegaram
  VoidCallback? onDataReceived;

  // Dados recebidos do backend
  double temperaturaAtual = 0.0;
  double umidadeSoloAtual = 0.0;

  bool modoAutomatico = false;
  bool modoManual = false;

  double umidadeMinima = 30.0;
  double umidadeMaxima = 70.0;

  String ultimaAtualizacao = "Conectando...";

  // =========================================================
  // CONEXÃO WEBSOCKET
  // =========================================================

  void connect() {
    if (_channel != null) return;

    try {
      _channel = WebSocketChannel.connect(
        Uri.parse('wss://$_azureDomain/ws/sensores'),
      );

      _channel!.stream.listen(
        (message) {
          final dados = jsonDecode(message);

          temperaturaAtual = (dados['temperatura'] as num?)?.toDouble() ?? 0.0;

          umidadeSoloAtual = (dados['umidade_solo'] as num?)?.toDouble() ?? 0.0;

          modoAutomatico = dados['automatico'] ?? false;
          modoManual = dados['manual'] ?? false;

          umidadeMinima = (dados['umidade_minima'] as num?)?.toDouble() ?? 30.0;

          umidadeMaxima = (dados['umidade_maxima'] as num?)?.toDouble() ?? 70.0;

          ultimaAtualizacao = dados['ultima_atualizacao'] ?? "Sem atualização";

          if (onDataReceived != null) {
            onDataReceived!();
          }
        },
        onError: (error) {
          _reconectar();
        },
        onDone: () {
          _reconectar();
        },
      );
    } catch (e) {
      _reconectar();
    }
  }

  void _reconectar() {
    _channel = null;

    Future.delayed(
      const Duration(seconds: 5),
      () => connect(),
    );
  }

  // =========================================================
  // CONTROLE MANUAL
  // =========================================================
  //Future é usado para operações que podem demorar
  Future<bool> alterarStatusIrrigadorManual(bool ligado) async {
    final url = Uri.parse(
      'https://$_azureDomain/controle/modo',
    );

    try {
      final resposta = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "manual": ligado,

          // Se manual foi ligado -> desliga automático
          // Se manual não foi ligado --> automatico mantem seu valor (modoAutomatico)
          "automatico": ligado ? false : modoAutomatico,
        }),
      );

      return resposta.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // =========================================================
  // CONTROLE AUTOMÁTICO
  // =========================================================

  Future<bool> alterarStatusAutomacao(bool ativo) async {
    final url = Uri.parse(
      'https://$_azureDomain/controle/modo',
    );

    try {
      final resposta = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "automatico": ativo,
          // Se ligar automático -> desliga manual
          "manual": ativo ? false : modoManual,
        }),
      );

      return resposta.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // =========================================================
  // ALTERAR LIMITES
  // =========================================================

  Future<bool> alterarLimitesUmidade(
    double min,
    double max,
  ) async {
    final url = Uri.parse(
      'https://$_azureDomain/controle/limites',
    );

    try {
      final resposta = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "minima": min,
          "maxima": max,
        }),
      );

      return resposta.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // =========================================================
  // ENCERRAR
  // =========================================================

  void dispose() {
    _channel?.sink.close();
  }
}

final apiService = ApiService();
