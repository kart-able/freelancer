# README

This is an attemp to reproduce the Freelancer portfolio from https://blackrockdigital.github.io/startbootstrap-freelancer/ with Ruby on Rails.

Some stuff won't work:
- for some reason, the collapsible menu for smaller screens does not expand at all
- SVG from FontAwesome need a page reload after a click on a page link

These SVG (Scalable Vector Graphics) were not present on the original page, 

        <i class="fas fa-star"></i>
        <div style="font-size:3em; color:Tomato">
          <i class="fas fa-camera-retro"></i>
        </div>

but I decided to test them for the stars which were not showing in the <hr> tag in place of 

        <hr class="star-light">

Actually, the stars don't show at the right place when using fa-svg-with-js.css combined with fontawesome-all.js
even if I modified 

        hr.star-dark:after { 
in
 
        hr.star-dark::after {

One need to do it the old fashion way i.e. with font-awesome.css (not fontawesome.css) together with freelancer.css

You are welcome to fork and make suggestions!