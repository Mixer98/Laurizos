<?php
declare(strict_types=1);

require_once __DIR__ . '/BaseModel.php';

final class Product extends BaseModel
{
    public function all(array $filters = []): array
    {
        $sql = 'SELECT p.*, c.nombre AS categoria_nombre, sc.nombre AS subcategoria_nombre, i.ruta AS imagen_principal
                FROM productos p
                INNER JOIN categorias c ON c.id = p.categoria_id
                INNER JOIN subcategorias sc ON sc.id = p.subcategoria_id
                LEFT JOIN imagenes_productos i ON i.producto_id = p.id AND i.es_principal = 1
                WHERE p.estado <> "inactivo"';
        $params = [];

        if (!empty($filters['categoria_id'])) {
            $sql .= ' AND p.categoria_id = :categoria_id';
            $params['categoria_id'] = (int) $filters['categoria_id'];
        }

        if (!empty($filters['estado'])) {
            $sql .= ' AND p.estado = :estado';
            $params['estado'] = (string) $filters['estado'];
        }

        $sql .= ' ORDER BY p.fecha_creacion DESC';
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetchAll();
    }

    public function find(int $id): ?array
    {
        $stmt = $this->pdo->prepare('SELECT * FROM productos WHERE id = :id LIMIT 1');
        $stmt->execute(['id' => $id]);
        $product = $stmt->fetch();

        return $product ?: null;
    }

    public function create(array $data): int
    {
        $stmt = $this->pdo->prepare('INSERT INTO productos (categoria_id, subcategoria_id, proveedor_id, sku, nombre, slug, descripcion, precio_compra, precio_venta, stock_minimo, estado, marca, etiquetas, fecha_creacion, fecha_actualizacion)
            VALUES (:categoria_id, :subcategoria_id, :proveedor_id, :sku, :nombre, :slug, :descripcion, :precio_compra, :precio_venta, :stock_minimo, :estado, :marca, :etiquetas, NOW(), NOW())');

        $stmt->execute([
            'categoria_id' => (int) $data['categoria_id'],
            'subcategoria_id' => (int) $data['subcategoria_id'],
            'proveedor_id' => $data['proveedor_id'] !== null ? (int) $data['proveedor_id'] : null,
            'sku' => $data['sku'],
            'nombre' => $data['nombre'],
            'slug' => $data['slug'],
            'descripcion' => $data['descripcion'],
            'precio_compra' => (float) $data['precio_compra'],
            'precio_venta' => (float) $data['precio_venta'],
            'stock_minimo' => (int) $data['stock_minimo'],
            'estado' => $data['estado'],
            'marca' => $data['marca'],
            'etiquetas' => $data['etiquetas'],
        ]);

        return (int) $this->pdo->lastInsertId();
    }
}