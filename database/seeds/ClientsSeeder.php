<?php

use Illuminate\Database\Seeder;

use App\Client;

class ClientsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Client::truncate();

        $faker = \Faker\Factory::create();

        for ($i = 0; $i < 10; ++$i) {
            Client::create([
                'name' => $faker->firstName,
                'surname' => $faker->lastName,
                'code' => $faker->creditCardNumber,
                'email' => $faker->freeEmail,
                'address' => $faker->streetAddress,
                'town' => $faker->city,
                'country' => $faker->country,
            ]);
        }
    }
}
