<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('weather_data', function (Blueprint $table) {
            // Add an index to the email column of the users table
            DB::statement('ALTER TABLE weather_data ADD INDEX index_city (city)');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('weather_data', function (Blueprint $table) {
            // Remove the index
            DB::statement('ALTER TABLE weather_data DROP INDEX index_city');
        });
    }
};
