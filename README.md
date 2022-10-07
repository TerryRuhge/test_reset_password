# CARPOOL-request-service

This project is going to allow users to request a ride for carpool. It will also let Admins and Members log in and see/assign rides and other info

## 🏁 Getting Started

### Prerequisites
⛏️ Built Using Ruby on Rails v3.0.2p107

You will need to use the described docker image to run CRS

Install it by doing

```
docker pull dmartinez05/ruby_rails_postgresql:latest
```

### Installing

Once in your docker container, clone the repository and do

```
bundle install
rails db:create
rails db:migrate
```

## 🔧 Running the tests

To run the test suite, run 
```
rspec .
```

## 🎈 Usage
To run the app, first clone the repository then do
```
rails s -b 0.0.0.0
```

## ⚙️ Services
* Google OAuth API

## ✍️ Authors
* Joseph Shumway
* Maja Schermuly
* Terry Ruhge
* Miguel Urbina
* John Nichols

## 🎉 Acknowledgements
* TBD
