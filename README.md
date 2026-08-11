# AgroLink Mobile 📱🌱

O **AgroLink Mobile** é uma aplicação desenvolvida em Flutter para monitoramento e controle inteligente de sistemas de irrigação e automação agrícola em tempo real. O aplicativo permite acompanhar leituras de sensores ambientais, gerenciar ciclos de irrigação manuais ou automáticos e personalizar a navegação do usuário.

---

## 🛠️ Tecnologias Utilizadas

* **Framework:** Flutter (Dart)
* **Plataformas:** Android, iOS e Web
* **Gerenciamento de Estado/Tema:** ThemeController e AppThemes
* **Comunicação de Dados:** REST API (via `ApiService`)

---

## ✨ Funcionalidades

* **Monitoramento Ambiental:** Exibição de cards telemetry em tempo real com dados de temperatura e umidade.
* **Controle de Irrigação:**
  * Modo Manual (acionamento sob demanda).
  * Modo Automático (acionamento por regras de umidade do solo).
* **Painel de Automação:** Configuração de limites e gatilhos de irrigação automática.
* **Estatísticas Rápidas:** Métricas consolidadas sobre o uso e métricas do sistema.
* **Perfil do Usuário:** Gerenciamento de informações pessoais e personalização do aplicativo.
* **Suporte a Temas:** Alternância de temas (Dark/Light mode).

---

## 📁 Estrutura de Pastas (`lib/`)

```text
lib/
├── app.dart                   # Configuração inicial do MaterialApp e rotas
├── main.dart                  # Ponto de entrada da aplicação
├── pages/                     # Telas principais da aplicação
│   ├── app_automacao.dart     # Tela de configurações de automação
│   ├── app_home.dart          # Dashboard principal
│   ├── app_irrigacao.dart     # Painel de controle de irrigação
│   └── app_perfil.dart        # Tela do perfil do usuário
├── services/
│   └── api_service.dart       # Comunicação com a API backend
├── themes/
│   ├── app_themes.dart        # Definições de estilos e cores do tema
│   └── theme_controller.dart  # Controle dinâmico de troca de tema
└── widgets/                   # Componentes reutilizáveis
    ├── app_navegacao.dart     # Barra de navegação inferior/lateral
    ├── app_topo.dart          # Cabeçalho padrão do app
    ├── cards/                 # Widgets de cards informativos e de controle
    │   ├── card_estatisticas_rapidas.dart
    │   ├── card_irri_automatica.dart
    │   ├── card_irri_manual.dart
    │   ├── card_irrigacao.dart
    │   ├── card_temperatura_umidade.dart
    │   └── card_umidade_automacao.dart
    ├── infos/                 # Exibição de perfis, títulos e fotos
    └── menu/                  # Menu hambúrguer de navegação
```

---

## 🚀 Como Executar o Projeto

### Pré-requisitos

* [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado.
* Dispositivo físico conectado ou emulador (Android/iOS) configurado.

### Passo a Passo

1. **Clone o repositório:**
   ```bash
   git clone [https://github.com/seu-usuario/agrolink-mobile.git](https://github.com/seu-usuario/agrolink-mobile.git)
   cd agrolink-mobile
   ```

2. **Instale as dependências:**
   ```bash
   flutter pub get
   ```

3. **Execute o aplicativo:**
   ```bash
   flutter run
   ```

---

## 🔗 Integração com o Backend

O aplicativo se conecta ao servidor Backend (`back_prj_mobile`) através das rotas mapeadas na classe `ApiService`, responsável por enviar e receber o estado das bombas de irrigação e as leituras de telemetria do solo e ambiente.
