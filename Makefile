install:
	cp .env.example .env
	docker-compose up -d
	docker-compose exec app php composer.phar install
	docker-compose exec app php artisan key:generate
	docker-compose exec app php artisan migrate
	docker-compose exec app php artisan db:seed
	docker-compose exec app php artisan passport:install

	npm install
update: ## 初期化処理
	docker-compose exec app php composer.phar install -n
	docker-compose exec app php artisan config:clear
	docker-compose exec app php artisan cache:clear
	docker-compose exec app php artisan view:clear
	docker-compose exec app php artisan migrate --force
	docker-compose exec app php artisan storage:link

	npm run production
    # echo "CREATE SCHEMA `j_system2` DEFAULT CHARACTER SET utf8mb4;" | mysql -u root -pexample