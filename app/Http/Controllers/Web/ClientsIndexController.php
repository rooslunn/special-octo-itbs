<?php

namespace App\Http\Controllers\Web;


class ClientsIndexController
{
    public function __invoke()
    {
        return view('clients.index');
    }
}
