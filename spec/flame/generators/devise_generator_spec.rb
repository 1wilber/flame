require "generator_spec"

describe Flame::DeviseGenerator, type: :generator do
  destination File.expand_path("../../../tmp", __FILE__)

  before(:all) do
    prepare_destination
    run_generator
  end

  it "generates devise User" do
    assert_file "app/models/user.rb"
  end

  it "generates sessions controller" do
    assert_file "app/controllers/sessions_controller.rb"
  end

  it "modifies routes" do
    assert_file "config/routes.rb", <<~RUBY
      Rails.application.routes.draw do
        devise_for :users, defaults: {format: :json}, controllers: {sessions: "sessions"}
        get "/users/current", to: "application#current", defaults: {format: :json}

        get "*path", to: "pages#index", constraints: ->(request) do
          !request.xhr? && request.format.html?
        end
      end
    RUBY
  end

  it "creates a devise user model with the correct content" do
    assert_file "app/models/user.rb", <<~RUBY
      class User < ApplicationRecord
        devise :database_authenticatable, :registerable, :timeoutable, timeout_in: 1.day
      end
    RUBY
  end
end
