<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class FunClientUpdate extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("create function client_update(_id integer, _name character varying, _surname character varying, _code character varying, _email character varying, _country character varying, _town character varying, _address character varying) returns void
	        language plpgsql
            as $$
            BEGIN
              update clients set 
                name = _name,
                surname = _surname,
                code = _code,
                email = _email,
                country = _country,
                town = _town,
                address = _address
              where
                id = _id;
            END;
            $$;");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement("DROP FUNCTION IF EXISTS client_update(INTEGER, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR);");
    }
}
