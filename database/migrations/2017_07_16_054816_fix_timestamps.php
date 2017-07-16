<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class FixTimestamps extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE clients ALTER COLUMN created_at set default current_timestamp");
        DB::statement("ALTER TABLE clients ALTER COLUMN updated_at set default current_timestamp");

        DB::statement("
            CREATE FUNCTION update_updated_at_column() RETURNS trigger
                LANGUAGE plpgsql
            AS $$
            BEGIN
                NEW.updated_at = NOW();
                RETURN NEW;
            END;
        $$;");

        DB::statement("CREATE TRIGGER t_clients_updated_at BEFORE UPDATE ON clients FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column()");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
