// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener('DOMContentLoaded', function () {
    const btnToggle = document.querySelector('#sidebar-toggle');
  
    btnToggle.addEventListener('click', function () {
      console.log('click');
      document.getElementById('sidebar').classList.toggle('active');
      console.log(document.getElementById('sidebar'));
    });
  });