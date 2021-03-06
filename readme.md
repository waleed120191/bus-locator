<p align="center"><img src="https://laravel.com/assets/img/components/logo-laravel.svg"></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
</p>

## Implementation

Prototype of a bus service app that allows:

1) The user to login and then user is redirected to the next page.

2) The next page is a locate bus page which allows users to locate the bus stop nearest him, and check bus arrival information. It is ok to hard code the user's location for this prototype. You can mock up a list of bus stop addresses to insert into the DB.

3) User can register a new bus for a particular location/bus stop.

## Auth server

Login button works on Oauth2 - implict grant. It is used for security reason (protection from XSS and CSRF). Client id is hardcoded for this example. Sample client can be created by running following artisan command : php artisan passport:client --client.

## Reactjs

HomeController@index is used for SPA init page. API requests are made from frontend along with token to GET & POST data.

## Step by step guide to configure project locally

1) git clone https://github.com/waleed120191/bus-locator
2) On CLI go to root folder bus-locatar and run command composer update.
3) Then run command npm install && npm run dev.
4) Then run command composer dumpautoload.
5) Then run command php artisan passport:keys
6) Ideal way is to run migration and client command But for quick setup, Import db.sql.
7) At root folder in .env file configure DB config.
8) On CLI go to root folder bus-locatar and run command php artisan serve. The url mentioned will be url to start with.



