USE laurizos;

INSERT INTO roles (id, nombre, descripcion, permisos) VALUES
(1, 'Administrador', 'Acceso total al sistema', JSON_OBJECT('dashboard', true, 'productos', true, 'pedidos', true, 'usuarios', true)),
(2, 'Cliente', 'Acceso a catálogo, compras y perfil', JSON_OBJECT('catalogo', true, 'carrito', true, 'favoritos', true, 'pedidos', true));

INSERT INTO usuarios (id, rol_id, nombre, apellidos, email, telefono, password_hash, estado) VALUES
(1, 1, 'Laura', 'Gómez', 'admin@laurizos.com', '3000000001', '$2y$10$7F5vW7M1n7m2O9z1hQ7Hpeb0v0WlP4q8t9dB5Q6JQ4m7E0x2V8uY8m', 'activo'),
(2, 2, 'Camila', 'Pérez', 'cliente@laurizos.com', '3000000002', '$2y$10$7F5vW7M1n7m2O9z1hQ7Hpeb0v0WlP4q8t9dB5Q6JQ4m7E0x2V8uY8m', 'activo');

INSERT INTO categorias (id, nombre, slug, descripcion) VALUES
(1, 'Accesorios para iPhone', 'accesorios-iphone', 'Fundas, cargadores y protección para iPhone'),
(2, 'Accesorios para el cabello', 'accesorios-cabello', 'Productos y herramientas para el cuidado capilar');

INSERT INTO subcategorias (id, categoria_id, nombre, slug, descripcion) VALUES
(1, 1, 'Fundas', 'fundas-iphone', 'Fundas de protección y diseño'),
(2, 1, 'Cargadores', 'cargadores-iphone', 'Cargadores y bases inalámbricas'),
(3, 1, 'Cables', 'cables-iphone', 'Cables certificados y reforzados'),
(4, 1, 'Protección', 'proteccion-iphone', 'Láminas y accesorios de pantalla'),
(5, 2, 'Peines', 'peines-cabello', 'Peines y cepillos para rizos'),
(6, 2, 'Tratamientos', 'tratamientos-cabello', 'Mascarillas y nutricosmética capilar'),
(7, 2, 'Serums', 'serums-cabello', 'Aceites y sérums de acabado'),
(8, 2, 'Herramientas', 'herramientas-cabello', 'Accesorios térmicos y de styling');

INSERT INTO proveedores (id, nombre, email, telefono, direccion, estado) VALUES
(1, 'Electro Supply', 'ventas@electrosupply.com', '6015550001', 'Bogotá, Colombia', 'activo'),
(2, 'Protect Lab', 'hola@protectlab.com', '6015550002', 'Medellín, Colombia', 'activo'),
(3, 'Hair Care Co', 'contacto@haircare.co', '6015550003', 'Cali, Colombia', 'activo'),
(4, 'Beauty Line', 'ventas@beautyline.com', '6015550004', 'Barranquilla, Colombia', 'activo');

INSERT INTO productos (id, categoria_id, subcategoria_id, proveedor_id, sku, nombre, slug, descripcion, precio_compra, precio_venta, stock_minimo, estado, marca, etiquetas) VALUES
(1, 1, 1, 1, 'IPH-CASE-001', 'Funda MagSafe Velvet Amber', 'funda-magsafe-velvet-amber', 'Funda premium con acabado mate, soporte MagSafe y protección de bordes reforzada.', 52000, 89000, 5, 'activo', 'Lauri Tech', 'magsafe,protección,antigolpes'),
(2, 1, 2, 1, 'IPH-CHG-002', 'Cargador inalámbrico Duo Charge', 'cargador-inalambrico-duo-charge', 'Base compacta para carga inalámbrica con superficie antideslizante y carga rápida.', 88000, 139000, 4, 'activo', 'Lauri Tech', 'carga rápida,wireless,usb-c'),
(3, 1, 3, 1, 'IPH-CBL-003', 'Cable trenzado Premium 1.5 m', 'cable-trenzado-premium-15m', 'Cable reforzado con conector Lightning y recubrimiento textil anti-ruptura.', 22000, 49000, 10, 'activo', 'Lauri Tech', 'cable,trenzado,durable'),
(4, 1, 4, 2, 'IPH-GLS-004', 'Lámina de vidrio templado ProShield', 'lamina-de-vidrio-templado-proshield', 'Protector de pantalla con alta transparencia y recubrimiento oleofóbico.', 15000, 39000, 3, 'agotado', 'Lauri Tech', 'vidrio templado,protector,pantalla'),
(5, 2, 5, 4, 'CAB-COM-001', 'Set de peines wide-tooth glow', 'set-de-peines-wide-tooth-glow', 'Set de peines anchos para desenredar sin romper la fibra capilar.', 18000, 36000, 8, 'activo', 'Laurizos Beauty', 'peine,curly girl,anti-frizz'),
(6, 2, 6, 3, 'CAB-MSK-002', 'Mascarilla hidratante repair jar', 'mascarilla-hidratante-repair-jar', 'Tratamiento profundo para rizos secos con brillo y control del frizz.', 41000, 78000, 6, 'activo', 'Laurizos Beauty', 'mascarilla,hidratación,nutrición'),
(7, 2, 7, 3, 'CAB-OIL-003', 'Aceite capilar amber glow', 'aceite-capilar-amber-glow', 'Aceite ligero para puntas abiertas y acabado luminoso sin sensación grasa.', 28000, 52000, 12, 'activo', 'Laurizos Beauty', 'aceite,brillo,sellado'),
(8, 2, 8, 4, 'CAB-DIF-004', 'Difusor universal para secador', 'difusor-universal-para-secador', 'Accesorio universal para secadores con flujo de aire distribuido y acabado profesional.', 35000, 69000, 2, 'agotado', 'Laurizos Beauty', 'difusor,secador,volumen');

INSERT INTO variaciones_productos (id, producto_id, codigo_variacion, color, talla, modelo, valor_extra, stock, activo) VALUES
(1, 1, 'VAR-IPH-CASE-001-A', 'Ámbar', NULL, 'iPhone 14', 0, 12, 1),
(2, 1, 'VAR-IPH-CASE-001-B', 'Arena', NULL, 'iPhone 15', 5000, 12, 1),
(3, 2, 'VAR-IPH-CHG-002-A', 'Café', NULL, '20W', 0, 8, 1),
(4, 3, 'VAR-IPH-CBL-003-A', 'Blanco cálido', '1.5 m', 'Lightning', 0, 30, 1),
(5, 5, 'VAR-CAB-COM-001-A', 'Caramelo', NULL, 'Set 2 piezas', 0, 22, 1),
(6, 6, 'VAR-CAB-MSK-002-A', 'N/A', '500 ml', 'Reparación intensa', 0, 9, 1),
(7, 7, 'VAR-CAB-OIL-003-A', 'N/A', '50 ml', 'Argán y coco', 0, 15, 1),
(8, 8, 'VAR-CAB-DIF-004-A', 'Negro arena', NULL, 'Universal', 0, 0, 1);

INSERT INTO inventario (producto_id, cantidad_disponible, reservado, punto_reorden) VALUES
(1, 24, 0, 5),
(2, 16, 0, 4),
(3, 52, 0, 10),
(4, 8, 0, 3),
(5, 44, 0, 8),
(6, 19, 0, 6),
(7, 27, 0, 6),
(8, 0, 0, 2);

INSERT INTO imagenes_productos (producto_id, ruta, titulo, alt_text, es_principal, orden) VALUES
(1, '/uploads/productos/iphone-case.svg', 'Funda MagSafe', 'Funda premium para iPhone', 1, 1),
(1, '/uploads/productos/iphone-case.svg', 'Detalle funda', 'Vista lateral de la funda', 0, 2),
(2, '/uploads/productos/magsafe-charger.svg', 'Cargador inalámbrico', 'Base inalámbrica para iPhone', 1, 1),
(3, '/uploads/productos/braided-cable.svg', 'Cable trenzado', 'Cable Lightning reforzado', 1, 1),
(4, '/uploads/productos/tempered-glass.svg', 'Vidrio templado', 'Protector de pantalla', 1, 1),
(5, '/public/wide-tooth-comb-set-curly-hair.png', 'Set de peines', 'Peines anchos para rizos', 1, 1),
(6, '/public/hair-treatment-mask-jar.png', 'Mascarilla capilar', 'Tratamiento nutritivo', 1, 1),
(7, '/public/hair-oil-bottle-amber.png', 'Aceite capilar', 'Serum de brillo', 1, 1),
(8, '/public/hair-dryer-diffuser-attachment.png', 'Difusor', 'Accesorio para secador', 1, 1);

INSERT INTO direcciones (id, usuario_id, alias, destinatario, telefono, pais, estado_region, ciudad, municipio, direccion1, direccion2, codigo_postal, es_principal) VALUES
(1, 2, 'Casa principal', 'Camila Pérez', '3000000002', 'Colombia', 'Cundinamarca', 'Bogotá', 'Bogotá', 'Calle 123 #45-67', 'Apto 402', '110111', 1);

INSERT INTO pedidos (id, usuario_id, direccion_id, numero_pedido, estado, subtotal, impuestos, costo_envio, total, metodo_pago, notas) VALUES
(1, 2, 1, 'PED-1001', 'completado', 126000, 0, 12000, 138000, 'Tarjeta', 'Pedido entregado correctamente'),
(2, 2, 1, 'PED-1002', 'enviado', 75000, 0, 12000, 87000, 'PSE', 'En ruta de entrega'),
(3, 2, 1, 'PED-1003', 'pagado', 202000, 0, 12000, 214000, 'Transferencia', 'Listo para despacho');

INSERT INTO detalle_pedidos (pedido_id, producto_id, variacion_id, sku_snapshot, nombre_snapshot, cantidad, precio_unitario, total_linea) VALUES
(1, 1, 1, 'IPH-CASE-001', 'Funda MagSafe Velvet Amber', 1, 89000, 89000),
(1, 5, 5, 'CAB-COM-001', 'Set de peines wide-tooth glow', 1, 36000, 36000),
(2, 6, 6, 'CAB-MSK-002', 'Mascarilla hidratante repair jar', 1, 78000, 78000),
(3, 2, 3, 'IPH-CHG-002', 'Cargador inalámbrico Duo Charge', 1, 139000, 139000),
(3, 7, 7, 'CAB-OIL-003', 'Aceite capilar amber glow', 1, 52000, 52000);

INSERT INTO favoritos (usuario_id, producto_id) VALUES
(2, 1),
(2, 6),
(2, 7);

INSERT INTO pagos (pedido_id, referencia, metodo, monto, moneda, estado, transaccion, fecha_pago) VALUES
(1, 'PAY-REF-1001', 'Tarjeta', 138000, 'COP', 'aprobado', 'TX-1001', NOW()),
(2, 'PAY-REF-1002', 'PSE', 87000, 'COP', 'aprobado', 'TX-1002', NOW()),
(3, 'PAY-REF-1003', 'Transferencia', 214000, 'COP', 'pendiente', NULL, NULL);