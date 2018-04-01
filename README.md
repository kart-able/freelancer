# README

This is an attemp to reproduce the Freelancer portfolio from https://blackrockdigital.github.io/startbootstrap-freelancer/ with a few additions from Ruby on Rails.

###Site management

To name just a few of the gems and the possibilities offered:
- Logged in users - with devise - can edit their own posts. See https://github.com/plataformatec/devise
- Authorizations are given through Cancancan abilities. See https://github.com/CanCanCommunity/cancancan
- With Active admin, you can manage the whole backend. See https://github.com/activeadmin/activeadmin

I did not use roles, which can extend the setup of Cancancan, as this was not necessary. For this, you could consider Active_admin_role. See https://github.com/yhirano55/active_admin_role

Have a look at the ability file that I have commented extensively.

###CSS

Some stuff won't work:
- for some reason, the collapsible menu for smaller screens does not expand at all
- SVG from FontAwesome eventually need a page reload after a click on a page link

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

---
You are welcome to fork and make suggestions!