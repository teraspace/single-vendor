# Setup on local with Docker
    * The project runs at port 9000, so please make sure that nothing else is running on port 9000
    * Clone the project repository
    * cd inside_project_folder/
    * docker-compose up --build
    * Open another terminal and run the following commands in the same project directory.
    * docker-compose exec web bundle exec rails db:create
    * docker-compose exec web bundle exec rails db:migrate
    * docker-compose exec web bundle exec rails db:seed
    * docker-compose exec web bundle exec rake spree_sample:load 
    * docker-compose exec web bundle exec rails g spree:frontend:copy_storefront
    * Visit http://localhost:9000/


# Deploy on development server
* **Prerequisites**:
    * Install [awscli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html).
    * Configure **aws**
        * Run **aws configure**
            ```
          AWS Access Key ID: 
          AWS Secret Access Key: 
          Default region name: 
          Default output format:
* **Run the commands inside the project folder**
    * **eb init**
        * For initialization
    * **eb list**
        * To verify your environment.
    * **eb deploy**
        * It will deploy the changes till last commit changes on development server.
        
#### Note:
    Don't forget to commit your changes before deployment.
