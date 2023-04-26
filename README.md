[Turing School](https://turing.edu/) is an industry leading, online computer programming school, focused solely on helping students launch fulfilling careers in technology.

In week 6 of Mod 3 the final solo project assignment is a multiday solo project named Road Trip Planner API. Listed below are our specifications and outcomes of the project. 

## Learning Goals

* Expose an API that aggregates data from multiple external APIs

* Expose an API that requires an authentication token

* Expose an API for CRUD functionality

* Determine completion criteria based on the needs of other developers

* Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## Built With

Ruby v3.1.1 and Rails 7.0.4.3, RSpec 3.12 versions, PostgreSQL.

## How to Run the Project
To run the Road Trip Planner API project, follow these steps:

* Clone the repository from GitHub: git clone https://github.com/Elle-M/sweater-weather.git

* Install dependencies: bundle install

* Set up the required environment variables, such as API keys and access tokens, by creating a .env file or through an environment configuration file. [MapQuest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)
[Weather API](https://www.weatherapi.com/) 

* Run the database migrations: rails db:migrate

* Start the Rails server: rails s

* The API will be available at http://localhost:3000 by default, but you can configure the port as needed.

* Use an API testing tool, such as Postman, to interact with the exposed API endpoints and test the functionality of the Road Trip Planner.

## Testing

This project includes thorough testing using RSpec, a popular testing framework for Ruby. Both API consumption (client-side testing) and API exposure (server-side testing) are covered in the test suite. Mocking tools such as VCR or Webmock are used to simulate external API responses and ensure reliable and accurate testing. The project utilized Test Driven Development, and the SimpleCov gem to determine percentage of test coverage.

## About

As a back-end developer, the team is building an application to plan road trips. The front-end team will communicate with your back-end through this API to get weather information for the destination of a road trip. The API will aggregate data from multiple external APIs to provide accurate and up-to-date weather information.

The API is built using a service-oriented architecture, and it requires authentication token for accessing certain endpoints. It also provides CRUD functionality for managing user accounts and road trip destinations.

## Schema

<img width="305" alt="Screenshot 2023-04-26 at 9 25 37 AM" src="https://user-images.githubusercontent.com/113124260/234651749-c77eb20c-e6f9-4126-8998-817fa1133496.png">

## Author

[Elle Majors](https://github.com/Elle-M)

