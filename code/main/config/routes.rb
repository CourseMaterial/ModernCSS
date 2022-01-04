
Rails.application.routes.draw do
  root to: "home#intro"
  get "home/intro", to: "home#intro"
  get "box", to: "home#box"
  get "page", to: "home#page"
end
