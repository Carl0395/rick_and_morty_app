# 🛸 Rick And Morty App

Aplicación desarrollada en Flutter que consume la API pública de Rick and Morty para mostrar información sobre personajes, estado, ubicación, foto, etc.

## 📋 Tabla de Contenidos

- [🛸 Rick And Morty App](#-rick-and-morty-app)
  - [📋 Tabla de Contenidos](#-tabla-de-contenidos)
  - [✨ Características](#-características)
  - [🛠️ Tecnologías Utilizadas](#️-tecnologías-utilizadas)
  - [📁 Estructura del Proyecto](#-estructura-del-proyecto)
  - [🚀 Instalación y Ejecución](#-instalación-y-ejecución)
  - [📸 Pantallas](#-pantallas)
    - [Splash pantalla de carga:](#splash-pantalla-de-carga)
    - [Lista de personajes:](#lista-de-personajes)
    - [Detalle de un personaje:](#detalle-de-un-personaje)
    - [Vista de error en el detalle de un personaje:](#vista-de-error-en-el-detalle-de-un-personaje)
    - [Vista de error en la lista de personajes:](#vista-de-error-en-la-lista-de-personajes)
- [🧪 Pruebas Unitarias en `rick_and_morty_app`](#-pruebas-unitarias-en-rick_and_morty_app)
  - [📁 Estructura de Pruebas](#-estructura-de-pruebas)
  - [🧰 Herramientas Utilizadas](#-herramientas-utilizadas)
  - [🚀 Ejecución de Pruebas](#-ejecución-de-pruebas)
  - [📄 Licencia](#-licencia)

## ✨ Características

- **Listado de Personajes**: Muestra una lista de personajes obtenidos desde la [API de Rick and Morty](https://rickandmortyapi.com/).
- **Detalles del Personaje**: Muestra mayor detalle de un personaje seleccionado indicando, genero, origen, estado, ubicación, etc.
- **Paginación**: Para cargar mas personajes desplázate hasta el final de la lista
- **Actualizar lista:** Puedes deslizar la lista hacia abajo y la lista actualizará los personajes, cargando los de la siguiente página
## 🛠️ Tecnologías Utilizadas

- **[Flutter](https://flutter.dev/)**: Framework de UI para desarrollar aplicaciones nativas multiplataforma.
- **[Dart](https://dart.dev/)**: Lenguaje de programación utilizado por Flutter.
- **[Riverpod](https://riverpod.dev/es/)**: Paquete de flutter utilizado para la gestión de estado.
- **[Freezed](https://pub.dev/packages/freezed)**: Generador de código para las clases de datos.
- **[GraphQL](https://pub.dev/packages/graphql_flutter)**: Paquete de Flutter que permite hacer peticiones a la API de Rick And Morty.

## 📁 Estructura del Proyecto

El proyecto ha sido implementado siguiendo la arquitectura limpia y buenas practicas utilizando diferentes patrones de diseño como el patron Factory, Repository, Dependency Injection, entre otros, además de los principios SOLID.

```
fakestore-ecommerce-app/
├── lib/
├── core/                      # Inyección de dependencia, rutas, Configuración Graphql, utilidades.
├── features/
│   ├── characters/            # Visualización de personajes
│   │   ├── data/              # modelos, implementación de repositorio
│   │   ├── domain/            # Casos de uso
│   │   └── presentation/      # Widgets, páginas, controladores
│   └── character_detail/      # Detalle personaje
│       ├── domain/
│       └── presentation/
├── shared/                    # Componentes compartidos entre features
│   ├── data/                  # Fuente de datos
│   ├── domain/                # Entidades
│   └── presentation/          # Widgets
└── main.dart                  # Punto de entrada de la app
```

## 🚀 Instalación y Ejecución

Sigue los siguientes pasos para clonar y ejecutar el proyecto en tu entorno local:

1. **Clonar el repositorio**

   ```bash
   git clone https://github.com/Carl0395/rick_and_morty_app.git
   cd rick_and_morty_app
   ```

2. **Instalar dependencias**

   Asegúrate de tener Flutter instalado. Luego, ejecuta:

   ```bash
   flutter pub get
   ```

3. Ejecuta el comando

   ```dart
   dart run build_runner watch -d
   ```
   Para la generación de código de Riverpod
   
4. **Ejecutar la aplicación**

   Para ejecutar la aplicación en un dispositivo o emulador conectado:

   ```bash
   flutter run
   ```

## 📸 Pantallas

### Splash pantalla de carga:

<img src="screenshots/01-splash.png" alt="Products List" width="200"/>

### Lista de personajes:

<img src="screenshots/02-characters.png" alt="Characters List" width="200"/>

### Detalle de un personaje:

<img src="screenshots/03-character-detail.png" alt="Character Detail" width="200"/>

### Vista de error en el detalle de un personaje:

<img src="screenshots/04-character-detail-error.png" alt="Character Detail Error" width="200"/>

### Vista de error en la lista de personajes:

<img src="screenshots/05-characters-error.png" alt="Characters List Error" width="200"/>


# 🧪 Pruebas Unitarias en `rick_and_morty_app`

Esta app incluye una suite de pruebas unitarias para garantizar la fiabilidad y robustez de las funcionalidades principales. A continuación, se detallan las pruebas implementadas y cómo ejecutarlas.

## 📁 Estructura de Pruebas

Las pruebas se encuentran en el directorio `test/` y cubren los siguientes módulos:

- **`character_remote_data_source_test.dart`**: Pruebas para la clase `CharacterRemoteDataSource`, incluyendo:
  - `getCharacters(int page)`: Verifica la obtención de la lista de personajes.
  - `getCharacter(String id)`: Verifica la obtención de un personaje específico por ID.
  - `handleGraphQLException()`: Verifica la validación de errores.

## 🧰 Herramientas Utilizadas

- **Framework de Pruebas**: [flutter_test](https://pub.dev/packages/flutter_test)
- **Mocking**: [mocktail](https://pub.dev/packages/mocktail)
- **Fixtures:** Datos de prueba

## 🚀 Ejecución de Pruebas

Para ejecutar todas las pruebas unitarias, utiliza el siguiente comando en la raíz del proyecto:

```bash
flutter test
```

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.