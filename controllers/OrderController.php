<?php
declare(strict_types=1);

require_once __DIR__ . '/../models/Order.php';

final class OrderController
{
    public function history(int $userId): array
    {
        return (new Order())->byUser($userId);
    }

    public function dashboard(): array
    {
        return (new Order())->stats();
    }
}