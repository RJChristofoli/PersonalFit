:muscle: PersonalFit
Aplicativo desenvolvido em Flutter para conectar alunos e personal trainers de forma simples, rápida e eficiente.

:brain: Arquitetura
Organização do projeto seguindo princípios de Clean Architecture e separação de responsabilidades:

lib/
├── core/   # Arquivos centrais (ex: temas, constantes e helpers genéricos)

│

├── modules/                    # Módulos organizados por camada

│   ├── data/                   # Models, repositórios e fontes de dados (ex: API, local)

│   ├── domain/                 # Entidades e lógica de negócio (ex: Personal, serviços)

│   └── presentation/          # Camada de apresentação (UI + controllers)

│       ├── controllers/       # Controladores responsáveis pela lógica das telas

│       ├── pages/             # Telas da aplicação (ex: HomePage, Detalhes, Confirmação)

│       └── widgets/           # Componentes reutilizáveis

│
├── app.dart                   # Configuração principal da aplicação (rotas, tema, etc.)

└── main.dart                  # Ponto de entrada do app

:rocket: Como rodar o projeto
:white_check_mark: Pré-requisitos
:white_check_mark: Flutter SDK

:white_check_mark: Dart

:white_check_mark: Android Studio ou VSCode com o plugin do Flutter instalado

:white_check_mark: Emulador Android ou dispositivo físico

:link: Mock API utilizada: https://mockapi.io/clone/688be45dcd9d22dda5cb9878

:gear: Passo a passo
# 1. Clone o repositório
git clone https://github.com/RJChristofoli/PersonalFit.git
cd PersonalFit

# 2. Instale as dependências
flutter pub get

# 3. Execute um emulador (ou conecte um dispositivo físico)
flutter emulators            # Lista os emuladores disponíveis
flutter emulators --launch <nome_do_emulador>

# 4. Rode o app
flutter run


:man_technologist: Autor
Rafael Christofoli
