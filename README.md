# WebInsightHaven

Platform dedicated to simplifying complex technical topics by providing clear and concise information.

## Prerequisites

Install Docker by following this link : https://docs.docker.com/engine/installation

## Setting up the environment

Start by cloning this repository.

Then copy the file `.env.example` to a file named `.env`. For instance:

```bash
cp .env.example .env
```

**Next, make sure that there is no application running on port 80**, then start all the Docker containers with the
```bash
docker compose up -d
```

Enter your web container with docker exec :
```bash
docker exec -ti web_insight_haven_web bash
```

Run the following command to create your Laravel App Key :
```bash
php artisan key:generate
```

You can then down & up your containers :
```bash
docker compose down
docker compose up -d
```

First time on the project, you must run migration
```bash
php artisan migrate
```

If you want data in your database, you can run seed
```bash
php artisan db:seed
```

Feel free to use the following command to reset your database to initial state (with fake data) :
```bash
php artisan migrate:fresh --seed
```

## Project details

### Main URLs

* Plateform : http://webinsighthaven.localhost
* PHPMyAdmin : http://phpmyadmin.webinsighthaven.localhost
* Traefik dashboard : http://traefik.webinsighthaven.localhost
* Mailhog : http://mailhog.webinsighthaven.localhost
