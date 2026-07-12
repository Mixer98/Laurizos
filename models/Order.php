<?php
declare(strict_types=1);

require_once __DIR__ . '/BaseModel.php';

final class Order extends BaseModel
{
    public function byUser(int $userId): array
    {
        $stmt = $this->pdo->prepare('SELECT * FROM pedidos WHERE usuario_id = :usuario_id ORDER BY fecha_creacion DESC');
        $stmt->execute(['usuario_id' => $userId]);

        return $stmt->fetchAll();
    }

    public function stats(): array
    {
        $totalOrders = (int) $this->pdo->query('SELECT COUNT(*) FROM pedidos')->fetchColumn();
        $totalSales = (float) $this->pdo->query('SELECT COALESCE(SUM(total), 0) FROM pedidos WHERE estado IN ("pagado", "enviado", "completado")')->fetchColumn();
        $totalUsers = (int) $this->pdo->query('SELECT COUNT(*) FROM usuarios')->fetchColumn();

        return compact('totalOrders', 'totalSales', 'totalUsers');
    }
}