import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs"
Rails.start()

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

  const isMeCheckbox = document.getElementById("is_me_checkbox");
  const anonymousCheckbox = document.getElementById("anonymous_checkbox");
  const authorSelection = document.getElementById("author-selection");

  function toggleAuthorFields() {
    if (isMeCheckbox?.checked || anonymousCheckbox?.checked) {
      authorSelection.style.display = "none";
    } else {
      authorSelection.style.display = "block";
    }
  }

  if (isMeCheckbox && anonymousCheckbox && authorSelection) {
    isMeCheckbox.addEventListener("change", () => {
      if (isMeCheckbox.checked) {
        anonymousCheckbox.checked = false;
      }
      toggleAuthorFields();
    });

    anonymousCheckbox.addEventListener("change", () => {
      if (anonymousCheckbox.checked) {
        isMeCheckbox.checked = false;
      }
      toggleAuthorFields();
    });

    toggleAuthorFields(); // appel initial
  }
});
