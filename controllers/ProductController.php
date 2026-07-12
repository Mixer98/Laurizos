<?php
declare(strict_types=1);

require_once __DIR__ . '/../models/Product.php';

final class ProductController
{
    public function index(array $filters = []): array
    {
        return (new Product())->all($filters);
    }

    public function show(int $id): ?array
    {
        return (new Product())->find($id);
    }
}