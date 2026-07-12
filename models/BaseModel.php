<?php
declare(strict_types=1);

require_once __DIR__ . '/../config/database.php';

abstract class BaseModel
{
    protected PDO $pdo;

    public function __construct()
    {
        $this->pdo = db();
    }
}