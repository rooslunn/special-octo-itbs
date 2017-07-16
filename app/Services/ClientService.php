<?php declare(strict_types=1);
/**
 * Created by PhpStorm.
 * User: russ
 * Date: 16.07.17
 * Time: 10:43
 */

namespace App\Services;

use App\Repositories\ClientRepository;


class ClientService
{
    private $clientRepository;

    public function __construct(ClientRepository $clientRepository)
    {
        $this->clientRepository = $clientRepository;
    }

    public function list()
    {
        $list = $this->clientRepository->all();
        return $list;
    }

    public function create(array $data)
    {
        $client = $this->clientRepository->create($data);
        return $client;
    }

    public function update(array $data)
    {
        $client = $this->clientRepository->update($data);
        return $client;
    }

    public function delete(int $id)
    {
        return $this->clientRepository->delete($id);
    }
}