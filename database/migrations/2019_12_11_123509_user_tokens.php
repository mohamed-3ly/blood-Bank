<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UserTokens extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tokens', function(Blueprint $table) {
			$table->increments('id');
            $table->timestamps();
            $table->integer('client_id')->unsigned();
            $table->string('token');
            $table->enum('platform',['android','ios']);
		});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('tokens');
    }
}
