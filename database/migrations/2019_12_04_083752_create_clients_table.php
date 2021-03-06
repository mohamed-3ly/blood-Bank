<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateClientsTable extends Migration {

	public function up()
	{
		Schema::create('clients', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->string('phone');
			$table->string('password');
			$table->string('email')->unique();
			$table->string('name');
			$table->date('date_of_birth');
			$table->integer('blood_type_id')->unsigned();
			$table->date('last_donation_date');
			$table->string('pin_code')->nullable();
			$table->integer('city_id')->unsigned();
			$table->string('api_token',60)->unique()->nullable();
		});
	}

	public function down()
	{
		Schema::drop('clients');
	}
}