<?php
declare(strict_types=1);

require_once __DIR__ . '/BaseModel.php';

final class User extends BaseModel
{
    public function findByEmail(string $email): ?array
    {
        $stmt = $this->pdo->prepare('SELECT * FROM usuarios WHERE email = :email LIMIT 1');
        $stmt->execute(['email' => $email]);
        $user = $stmt->fetch();

        return $user ?: null;
    }

    public function create(array $data): int
    {
        $stmt = $this->pdo->prepare('INSERT INTO usuarios (rol_id, nombre, apellidos, email, telefono, password_hash, estado, fecha_creacion, fecha_actualizacion)
            VALUES (:rol_id, :nombre, :apellidos, :email, :telefono, :password_hash, :estado, NOW(), NOW())');

        $stmt->execute([
            'rol_id' => (int) $data['rol_id'],
            'nombre' => $data['nombre'],
            'apellidos' => $data['apellidos'],
            'email' => $data['email'],
            'telefono' => $data['telefono'],
            'password_hash' => password_hash($data['password'], PASSWORD_DEFAULT),
            'estado' => $data['estado'] ?? 'activo',
        ]);

        return (int) $this->pdo->lastInsertId();
    }

    public function authenticate(string $email, string $password): ?array
    {
        $user = $this->findByEmail($email);

        if (!$user || !password_verify($password, $user['password_hash'])) {
            return null;
        }

        return $user;
    }
}