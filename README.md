# Laurizos Store

Tienda virtual responsive para accesorios de iPhone y accesorios para el cabello. El proyecto conserva la paleta cálida original del `index` y la centraliza con variables CSS para mantener coherencia entre frontend, panel administrativo y futuros módulos PHP.

## Estructura

```text
Proyecto Lauri
├── assets/
├── config/
├── controllers/
├── database/
├── includes/
├── models/
├── uploads/
├── index.html
├── style.css
└── README.md
```

## Qué incluye

- Inicio con hero principal, productos destacados y navegación por módulos.
- Catálogo con búsqueda, filtros por categoría, precio y disponibilidad.
- Carrito, favoritos, historial de pedidos y sección de cuenta.
- Panel administrativo con estadísticas, tablas y base para reportes.
- Esquema MySQL normalizado, seeds coherentes y diagrama MER en Mermaid.
- Capa PHP inicial con conexión PDO, CSRF, modelos y controladores base.

## Base de datos

Importa primero [database/database.sql](database/database.sql) y luego [database/seed.sql](database/seed.sql).

## Archivos clave

- [index.html](index.html): interfaz principal de la tienda.
- [style.css](style.css): tema visual completo con variables y modo oscuro.
- [assets/js/app.js](assets/js/app.js): lógica de catálogo, carrito, favoritos, pedidos y admin demo.
- [config/database.php](config/database.php): conexión PDO reutilizable.
- [database/database.sql](database/database.sql): creación de la estructura relacional.
- [database/seed.sql](database/seed.sql): datos iniciales para pruebas.

## Notas técnicas

- Las imágenes del catálogo usan recursos ya existentes en `/public` y SVG de demostración en `/uploads/productos`.
- El hash de contraseña en el seed es de prueba; cuando conectes autenticación real, los registros nuevos usarán `password_hash()` desde PHP.
- La arquitectura está lista para conectar formularios, endpoints y reportes PDF sin romper la identidad visual.
