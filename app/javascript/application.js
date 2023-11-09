// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

/*El motivo por el cual no funcionaba es que DOMContentLoader hace que se ejecute solo al inicio de la app
por lo tanto si uno se iba a otra vista, este no servia mas.*/
/* document.addEventListener('DOMContentLoaded', function () {
    const btnToggle = document.querySelector('#sidebar-toggle');
  
    btnToggle.addEventListener('click', function () {
      console.log('click');
      document.getElementById('sidebar').classList.toggle('active');
      console.log(document.getElementById('sidebar'));
    });
  }); */