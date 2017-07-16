<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class FunClientInsert extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("create function client_insert(_name character varying, _surname character varying, _code character varying, _email character varying, _country character varying, _town character varying, _address character varying) returns integer
	        language plpgsql
            as $$
            DECLARE
                client_id integer;
            BEGIN
              insert into clients (name, surname, code, email, country, town, address)
                values (_name, _surname, _code, _email, _country, _town, _address) returning id into client_id;
                return client_id;
            END;
            $$
        ;");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement("DROP FUNCTION IF EXISTS client_insert(VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR);");
    }
}
