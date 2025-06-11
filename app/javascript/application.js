import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs"
Rails.start()

// console.log("Rails UJS chargé ?", typeof Rails)
document.addEventListener("DOMContentLoaded", function () {
  const carousel = document.querySelector('#teamCarousel');
  if (carousel) {
    const bsCarousel = new bootstrap.Carousel(carousel, {
      interval: 3000,
      ride: 'carousel',
      pause: false,
      wrap: true
    });
  }
});
