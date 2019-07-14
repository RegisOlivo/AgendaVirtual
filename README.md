# agenda_virtual

O aplicativo agenda_virtual desenvolvido na matéria de desenvolvimento de dispositivos móveis na UTFPR tem como objetivo realizar cadastro de clientes e gerenciar os gastos feitos em estabelecimentos como restaurantes, lanchonetes, etc.

## Instalação do Flutter

- Acesse https://flutter.dev/; Instale o Flutter conforme instruções no site oficial; 
- Para verificar se esta tudo funcionando corretamente execute 'flutter doctor' na linha de comando.

## Configuração Firebase

- Crie um projeto chamado de agenda-virtual; 
- Na area de "desenvolvedor" ative Authentication (E-mail/Senha); 
- Na area de "desenvolvedor" crie o Database; 
- Em "Project Overview" adicione o Firebase ao app (o nome do pacote usado fica em "AndroidManifest.xml" linha 2.

## Instalaçao do Projeto

- Clone do projeto 'git clone https://github.com/RegisOlivo/AgendaVirtual/'.

## Configuração do projeto

- Utilize o Android Studio;
- Dentro de "agenda_virtual/android/app/src/build..gradle" adicione "apply plugin: 'com.google.gms.google-services'"; 
- Dentro de "agenda_virtual/android/build.gradle" em dependencies adicione "classpath 'com.google.gms:google-services:3.2.1'"; 
- Em "pubspec.yaml" no snackbar clique em "Packages get".
