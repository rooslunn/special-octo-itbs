<?php declare(strict_types=1);
/**
 * Created by PhpStorm.
 * User: russ
 * Date: 16.07.17
 * Time: 10:47
 */

namespace App\Repositories;


use Illuminate\Support\Facades\DB;

class ClientRepository
{
    public function all()
    {
        $clients = DB::table('v_clients')->get();
        return $clients;
    }

    public function create(array $data): array
    {
        $results = DB::select("select client_insert (:name, :surname, :code, :email, :country, :town, :address)",
            [
                'name' => $data['name'],
                'surname' => $data['surname'],
                'code' => $data['code'],
                'email' => $data['email'],
                'country' => $data['country'],
                'town' => $data['town'],
                'address' => $data['address'],
            ]
        );
        $data['id'] = $results[0]->client_insert;
        return $data;
    }

    public function update(array $data): array
    {
        DB::select("select client_update (:id, :name, :surname, :code, :email, :country, :town, :address)",
            [
                'id' => $data['id'],
                'name' => $data['name'],
                'surname' => $data['surname'],
                'code' => $data['code'],
                'email' => $data['email'],
                'country' => $data['country'],
                'town' => $data['town'],
                'address' => $data['address'],
            ]
        );
        return $data;
    }

    public function delete(int $id)
    {
        DB::select("select client_delete(:id)", ['id' => $id]);
        return $id;
    }
}