<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class FunClientDelete extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("
            create function client_delete(_id integer) returns void
                language plpgsql
            as $$
            BEGIN
              delete from clients where id = _id;
            END;
            $$;
        ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement('drop function if exists client_delete(integer)');
    }
}
