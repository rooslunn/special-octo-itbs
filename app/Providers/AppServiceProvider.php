<?php

namespace App\Providers;

use App\Repositories\ClientRepository;
use Illuminate\Support\ServiceProvider;
use App\Services\ClientService;
use App\Http\Requests\CreateClientRequest;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('ClientService', function () {
            return new ClientService();
        });

        $this->app->bind('ClientRepository', function () {
            return new ClientRepository();
        });

        $this->app->bind('CreateClientRequest', function () {
            return new CreateClientRequest();
        });
    }
}
