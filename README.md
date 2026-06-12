# T.U.M. Flutter Challenge - Gestión de Inventario (INV. PRO)

Bienvenido al repositorio de la prueba técnica para el proyecto T.U.M. Esta es una mini aplicación construida en Flutter que cumple con todos los requisitos solicitados.

## 🚀 Características Principales

1. **Login Funcional**: Autenticación real implementada con Supabase (email y contraseña).
2. **Dashboard Dinámico**: Lectura en tiempo real de la base de datos (tabla `products` en Supabase), mostrando el stock y precios formateados.
3. **Pantalla de Detalles (Hero Animation)**: Transición fluida y moderna hacia una tercera pantalla navegable con los detalles completos del producto.
4. **UI Premium**: Diseño moderno con efecto "Glassmorphism" (cristal esmerilado), modo oscuro elegante, tipografía Plus Jakarta Sans y animaciones fluidas.

## 🛠️ Tecnologías Usadas

* **Framework**: Flutter (Dart)
* **Backend as a Service**: Supabase (Auth & Base de Datos)
* **Navegación**: GoRouter
* **UI & Animaciones**: Flutter Animate, Google Fonts

## 🐳 Ejecución con Docker (Requisito Obligatorio)

Todo el entorno de la aplicación ha sido contenedorizado para facilitar su evaluación sin necesidad de instalar el SDK de Flutter localmente.

### Requisitos previos:
* Docker y Docker Compose instalados en el sistema.

### Instrucciones para levantar el proyecto:

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/juandiegoceron-ux/tum-flutter-challenge.git
   cd tum-flutter-challenge
   ```

2. Ejecutar el contenedor mediante Docker Compose:
   ```bash
   docker-compose up --build
   ```

3. Abrir el navegador y acceder al puerto configurado (ej. http://localhost:8080).

## 👤 Autor
**Juan D. Cerón**
Candidato para la línea de Informática - Proyecto T.U.M.
