/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import 'bootstrap';
console.log('Hello World from Webpacker')

const cocktails = document.querySelectorAll('.button-show');
const banner = document.querySelector('.banner-img')

cocktails.forEach((cocktail) => {
  cocktail.addEventListener("mouseover", (event) => {
      banner.style.backgroundImage = "linear-gradient(rgba(0,0,0,0.1),rgba(0,0,0,0.1)), url('https://images.unsplash.com/photo-1534003579377-e30914c1d25c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')";
      banner.style.boxShadow = "0 0 15px rgba(0,0,0,0.2)";
  }
  )
});

cocktails.forEach((cocktail) => {
  cocktail.addEventListener("mouseout", (event) => {
      banner.style.backgroundImage = "none";
      banner.style.boxShadow = "none";

  }
  )
});

