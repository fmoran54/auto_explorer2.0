# Auto Explorer

## Descripción

Auto Explorer es una aplicación básica desarrollada en Flutter que permite visualizar una lista de autos destacados y consultar información adicional de uno de los vehículos.

El proyecto fue realizado como parte de la asignatura Programación 4, con el objetivo de aplicar los conceptos básicos de Flutter, el uso de widgets, interacción con botones, instalación de paquetes externos y publicación del proyecto en GitHub.

---

## Objetivo

Desarrollar una aplicación sencilla y ordenada utilizando Flutter, aplicando widgets básicos para construir una interfaz relacionada con el mundo de los automóviles.

La aplicación permite visualizar varios vehículos y utilizar un botón para mostrar información detallada de un auto destacado.

---

## 1. Configuración del entorno

Antes de iniciar el proyecto se verificó que Flutter y las herramientas necesarias estuvieran correctamente instaladas mediante el comando:

```bash
flutter doctor
```

El resultado indicó que el entorno se encontraba correctamente configurado y sin problemas.

![Flutter Doctor](capturas/01_flutter_doctor.png)

---

## 2. Creación del proyecto Flutter

El proyecto fue creado utilizando Flutter y Visual Studio Code.

Después de crear el proyecto se generó automáticamente la estructura básica de carpetas y archivos necesaria para desarrollar la aplicación.

### Estructura inicial del proyecto

![Estructura inicial del proyecto](capturas/02_estructura_proyecto.png)

### Primera ejecución

Antes de realizar modificaciones se ejecutó la aplicación inicial de Flutter en el simulador para comprobar que el proyecto funcionaba correctamente.

![Primera ejecución](capturas/03_primera_ejecucion.png)

---

## 3. Simulador iOS

Para realizar las pruebas de la aplicación se utilizó el simulador de iOS.

Después de ejecutar el proyecto, Auto Explorer quedó instalado en el dispositivo virtual.

![Simulador iOS](capturas/04_simulador_ios.png)

---

## 4. Desarrollo de Auto Explorer

La aplicación fue desarrollada principalmente en el archivo `lib/main.dart` utilizando Visual Studio Code.

Durante el desarrollo se fueron agregando los elementos necesarios para construir la interfaz y posteriormente implementar la interacción del botón.

![Desarrollo en Visual Studio Code](capturas/05_desarrollo_vscode.png)

---

## 5. Pantalla principal

La pantalla principal de Auto Explorer utiliza widgets básicos de Flutter, entre ellos:

- `MaterialApp`
- `Scaffold`
- `AppBar`
- `Column`
- `Card`
- `ListTile`
- `Icon`
- `Text`
- `ElevatedButton`

La aplicación utiliza colores personalizados en tonos gris azulado y muestra una lista de cuatro vehículos:

- Toyota Supra
- Ford Mustang
- Nissan GT-R
- Chevrolet Corvette

![Pantalla principal](capturas/08_pantalla_principal.png)

---

## 6. Interacción básica

La aplicación incluye el botón **Ver auto destacado**.

Al presionar el botón se muestra información adicional del Nissan GT-R, incluyendo datos como tipo de vehículo, motor, cilindrada, potencia, transmisión, tracción y combustible.

Esta interacción se realiza utilizando `setState`, permitiendo mostrar la información después de presionar el botón.

![Funcionamiento del botón](capturas/09_funcionamiento_boton.png)

---

## 7. Instalación de Google Fonts

Para personalizar la tipografía de la aplicación se utilizó el paquete externo `google_fonts`.

El paquete fue instalado desde la terminal utilizando el comando:

```bash
flutter pub add google_fonts
```

![Instalación de Google Fonts](capturas/06_instalacion_google_fonts.png)

Después de la instalación, la dependencia quedó registrada en el archivo `pubspec.yaml`.

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8
  google_fonts: ^8.2.1
```

![Google Fonts en pubspec.yaml](capturas/07_pubspec_google_fonts.png)

El paquete Google Fonts se utiliza en la aplicación para aplicar la fuente Montserrat y mejorar la presentación visual de los textos.

---

## 8. Aplicación ejecutándose

Después de completar el desarrollo se ejecutó nuevamente el proyecto en el simulador para comprobar el funcionamiento de la aplicación.

Auto Explorer muestra correctamente la lista de vehículos y la información correspondiente al auto destacado.

![Auto Explorer ejecutándose](capturas/10_aplicacion_simulador.png)

---

## 9. Publicación en GitHub

El proyecto fue publicado en un repositorio público de GitHub.

Durante el desarrollo se realizaron diferentes commits para registrar de manera progresiva los cambios realizados en la aplicación.

El repositorio cuenta con más de los cuatro commits requeridos para el proyecto.

![Repositorio en GitHub](capturas/11_repositorio_github.png)

---

## Tecnologías utilizadas

- Flutter
- Dart
- Visual Studio Code
- Google Fonts
- Git
- GitHub
- iOS Simulator

---

## Autor

**Freddy Andres Moran Soriano**

Programación 4