# Flame

Flame is rails app generator inspired in [Suspenders](https://github.com/thoughtbot/suspenders)

## Installation

Add this line to your application's Gemfile:


    $ gem install flamerb
    $ flamerb <app_name>

## Gemfile

* [AMS](https://github.com/rails-api/active_model_serializers) for serialize json (api)
* [Devise](https://github.com/heartcombo/devise) for user authentication
* [Haml](https://github.com/haml/haml) we prefer use haml extension instead classic .erb
* [Pager API](https://github.com/IcaliaLabs/pager-api) & [Pagy](https://github.com/ddnexus/pagy) for api pagination
* [Vite](https://github.com/ElMassimo/vite_ruby) instead webpack
* [Annotate](https://github.com/ctran/annotate_models) generate comments on the model with current schema


for test environment we use:
* [FactoryBot](https://github.com/thoughtbot/factory_bot)
* [FFaker](https://github.com/ffaker/ffaker)
* [RSpec](https://github.com/rspec/rspec-rails)
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)
* [Database Cleanner](https://github.com/DatabaseCleaner/database_cleaner)

## Package.json
* [react](https://yarnpkg.com/package/react) & [react-dom](https://yarnpkg.com/package/react-dom)
* [formik](https://yarnpkg.com/package/formik) & [yup](https://yarnpkg.com/package/yup) for handle and validate forms.
* [axios](https://yarnpkg.com/package/axios) for http request
* [@reduxjs/toolkit](https://yarnpkg.com/package/@reduxjs/toolkit)
* [react-router-dom](https://yarnpkg.com/package/react-router-dom) for routing
* [@mui/material](https://yarnpkg.com/package/@mui/material) library for components
* [@mui/icons-material](https://yarnpkg.com/package/@mui/icons-material) library for icons
* [react-toastify](https://yarnpkg.com/package/react-toastify) simple and beauty notifcations.
* [sass](https://yarnpkg.com/package/sass)

for dev dependencies
* standard
* @vitejs/plugin-react-swc
* eslint-plugin-react


## Style Guide

Projects created with Flame come with  [Standard](https://github.com/standardrb/standard)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/Flame.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

