<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClientsView extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("
            CREATE VIEW v_clients AS SELECT clients.id,
                clients.name,
                clients.surname,
                clients.code,
                clients.email,
                clients.country,
                clients.town,
                clients.address,
                clients.created_at,
                clients.updated_at
           FROM clients;
        ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement('drop view if exists v_clients');
    }
}
