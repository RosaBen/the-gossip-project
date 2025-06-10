import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs"
Rails.start()

console.log("Rails UJS chargé ?", typeof Rails)
