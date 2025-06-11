import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs"
Rails.start()

// console.log("Rails UJS chargé ?", typeof Rails)
document.addEventListener("DOMContentLoaded", function () {
  const carousel = document.querySelector('#teamCarousel');
  if (carousel) {
    new bootstrap.Carousel(carousel, {
      interval: 3000,
      ride: 'carousel',
      pause: false,
      wrap: true
    });
  }

  const checkbox = document.getElementById("is_me_checkbox");
  const authorSelection = document.getElementById("author-selection");

  if (checkbox && authorSelection) {
    checkbox.addEventListener("change", function () {
      if (checkbox.checked) {
        authorSelection.style.display = "none";
      } else {
        authorSelection.style.display = "block";
      }
    });
  }
});
