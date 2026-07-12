<?php
declare(strict_types=1);

require_once __DIR__ . '/../models/User.php';

final class AuthController
{
    public function login(string $email, string $password): ?array
    {
        return (new User())->authenticate($email, $password);
    }

    public function register(array $data): int
    {
        return (new User())->create($data);
    }
}