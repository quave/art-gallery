cd db
npx sequelize-cli db:migrate
npx sequelize-cli db:seed:all
cd ..
bin/www