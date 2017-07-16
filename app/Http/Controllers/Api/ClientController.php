<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use App\Services\ClientService;

class ClientController extends Controller
{
    private $clientService;

    public function __construct(ClientService $clientService)
    {
        $this->clientService = $clientService;
    }

    public function list()
    {
        $clients = $this->clientService->list();
        return response()->json($clients, 200);
    }

    public function create(Request $request)
    {
        $data = $request->input();
        $client = $this->clientService->create($data);
        return response()->json($client, 201);
    }

    public function update(Request $request, int $client_id)
    {
        $data = $request->input();
        $data['id'] = $client_id;
        $client = $this->clientService->update($data);
        return response()->json($client, 200);
    }

    public function delete(int $id)
    {
        $result = $this->clientService->delete($id);
        return response()->json($result, 200);
    }
}
