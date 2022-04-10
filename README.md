![](https://img.shields.io/badge/Microverse-blueviolet)

# Blog app

> Blog app: Authentication

![image](https://user-images.githubusercontent.com/87689547/162636896-028ef2d8-532d-4629-840e-74eb9433c415.png)

> This application allows you to post your blog like and comments other blogs sign up and sign in to have more previlages

## Built With

- Ruby on Rails
- Bootstrap

## Live Demo 
[gitblogie](https://gitblogie.herokuapp.com/)

## Getting Started

To get a local copy up and running follow these simple example steps.

Simply click on `Code` drop down menu should appear then `download ZIP` after extraction you could follow `Usage` step

### Prerequisites

`gems`
`ruby`

### Setup

###### Do this step if you didn't download as ZIP, if you did, skip to next step please

to setup the project on your local, run these commands

```shell
git clone https://github.com/Amrhub/blog-app

cd blog-app  // to open the project
```

### Install

```shell
    bundle install # install dependencies
```

### Usage

To make sure project works as expected create instance file from `config/application_example.yml` with name "application.yml" with required data in application_example.

```shell
    rails db:create # create database
    rails db:migrate # migrate tables
    rails db:seed # load all data in database from seed.rb
    # or use rails db:setup instead of previous three but it will depend on latest version of schema.rb when running

    rails s # start local host
    rails c # to start rails console
```

### Tests

```shell
rspec # Run all tests
rspec spec/models # run tests for only models
```

## Authors

👤 **Amr Ahmed**

- GitHub: [@Amrhub](https://github.com/Amrhub)
- LinkedIn: [Amr Ahmed](https://linkedin.com/in/amr-abdelrehim-ahmed)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.
