<?php
session_start();
include '../filter_wisata/db_connect.php';
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@4.0.0/fonts/remixicon.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="itinerary.css" />
    <title>Web Design Mastery | Rayal Park</title>
  </head>
  <body>
    <header class="header">
      <nav>
        <div class="nav__bar">
          <div class="logo">
            <a href="#"><img src="../img/logo1.png" alt="logo" /></a>
          </div>
          <div class="nav__menu__btn" id="menu-btn">
            <i class="ri-menu-line"></i>
          </div>
        </div>
        <ul class="nav__links" id="nav-links">
          <li><a href="../landing/dashboard.php">Home</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#service">Services</a></li>
          <li><a href="#explore">Explore</a></li>
          <li><a href="#contact">Contact</a></li>
        </ul>
        <button class="btn nav__btn">Login</button>
      </nav>
      <div class="section__container header__container" id="home">
        <p>Simple - Unique - Friendly</p>
        <h1>Create a Story of Your <br />Journey with <span>Rootify</span>.</h1>
      </div>
    </header>

    <section class="section__container booking__container">
      <form action="itinerary-results.php" class="booking__form" method="POST">
        <div class="input__group">
          <span><i class="ri-calendar-2-fill"></i></span>
          <div>
            <label for="check-in">START-TRIP</label>
            <input type="date" id="startDate" name="startDate" required>
          </div>
        </div>
        <div class="input__group">
          <span><i class="ri-calendar-2-fill"></i></span>
          <div>
            <label for="check-out">END-TRIP</label>
            <input type="date" id="endDate" name="endDate" required>
          </div>
        </div>
        <div class="input__group">
          <span><i class="ri-user-fill"></i></span>
          <div>
            <label for="guest">TRIP TYPE</label>
            <select id="tripType" name="tripType" required>
                <option value="solo">Solo</option>
                <option value="partner">Partner</option>
                <option value="friends">Friends</option>
                <option value="family">Family</option>
            </select>
          </div>
        </div>
        <div class="input__group">
          <span><i class="ri-money-dollar-circle-fill"></i></span>
          <div>
            <label for="check-out">BUDGET</label>
            <select id="budget" name="budget" required>
              <option value="low">Low</option>
              <option value="medium">Medium</option>
              <option value="high">High</option>
          </select>
          </div>
        </div>
        <!-- Tambahkan elemen hr di sini -->
        <hr class="form-divider">

        <!-- interest -->
        <div class="form-section">
          <h3>What are you interested in?</h3>
          <div class="interests-grid">
              <label class="interest-option">
                  <input type="checkbox" name="interests[]" value="nature">
                  <span class="interest-card">Nature</span>
              </label>
              <label class="interest-option">
                  <input type="checkbox" name="interests[]" value="culture">
                  <span class="interest-card">Culture</span>
              </label>
              <label class="interest-option">
                  <input type="checkbox" name="interests[]" value="shopping">
                  <span class="interest-card">Shopping</span>
              </label>
              <label class="interest-option">
                  <input type="checkbox" name="interests[]" value="education">
                  <span class="interest-card">Education</span>
              </label>
              <label class="interest-option">
                  <input type="checkbox" name="interests[]" value="beach">
                  <span class="interest-card">Beach</span>
              </label>
              <label class="interest-option">
                  <input type="checkbox" name="interests[]" value="recreation">
                  <span class="interest-card">Recreation</span>
              </label>
              <label class="interest-option">
                  <input type="checkbox" name="interests[]" value="history">
                  <span class="interest-card">History</span>
              </label>
          </div>
      </div>
        <div class="input__group input__btn">
          <button class="btn" type="submit" name="submit">PLANNING</button>
        </div>
      </form>
    </section>    

    <section class="section__container about__container" id="about">
      <div class="about__image">
        <img src="assets/about.jpg" alt="about" />
      </div>
      <div class="about__content">
        <p class="section__subheader">ABOUT US</p>
        <h2 class="section__header">The Best Holidays Start Here!</h2>
        <p class="section__description">
          With a focus on quality accommodations, personalized experiences, and
          seamless booking, our platform is dedicated to ensuring that every
          traveler embarks on their dream holiday with confidence and
          excitement.
        </p>
        <div class="about__btn">
          <button class="btn">Read More</button>
        </div>
      </div>
    </section>

    <section class="section__container room__container">
      <p class="section__subheader">OUR LIVING ROOM</p>
      <h2 class="section__header">The Most Memorable Rest Time Starts Here.</h2>
      <div class="room__grid">
        <div class="room__card">
          <div class="room__card__image">
            <img src="assets/room-1.jpg" alt="room" />
            <div class="room__card__icons">
              <span><i class="ri-heart-fill"></i></span>
              <span><i class="ri-paint-fill"></i></span>
              <span><i class="ri-shield-star-line"></i></span>
            </div>
          </div>
          <div class="room__card__details">
            <h4>Deluxe Ocean View</h4>
            <p>
              Bask in luxury with breathtaking ocean views from your private
              suite.
            </p>
            <h5>Starting from <span>$299/night</span></h5>
            <button class="btn">Book Now</button>
          </div>
        </div>
        <div class="room__card">
          <div class="room__card__image">
            <img src="assets/room-2.jpg" alt="room" />
            <div class="room__card__icons">
              <span><i class="ri-heart-fill"></i></span>
              <span><i class="ri-paint-fill"></i></span>
              <span><i class="ri-shield-star-line"></i></span>
            </div>
          </div>
          <div class="room__card__details">
            <h4>Executive Cityscape Room</h4>
            <p>
              Experience urban elegance and modern comfort in the heart of the
              city.
            </p>
            <h5>Starting from <span>$199/night</span></h5>
            <button class="btn">Book Now</button>
          </div>
        </div>
        <div class="room__card">
          <div class="room__card__image">
            <img src="assets/room-3.jpg" alt="room" />
            <div class="room__card__icons">
              <span><i class="ri-heart-fill"></i></span>
              <span><i class="ri-paint-fill"></i></span>
              <span><i class="ri-shield-star-line"></i></span>
            </div>
          </div>
          <div class="room__card__details">
            <h4>Family Garden Retreat</h4>
            <p>
              Spacious and inviting, perfect for creating cherished memories
              with loved ones.
            </p>
            <h5>Starting from <span>$249/night</span></h5>
            <button class="btn">Book Now</button>
          </div>
        </div>
      </div>
    </section>

    <footer class="footer" id="contact">
      <div class="section__container footer__container">
        <div class="footer__col">
          <div class="logo">
            <a href="#home"><img src="assets/logo.png" alt="logo" /></a>
          </div>
          <p class="section__description">
            Discover a world of comfort, luxury, and adventure as you explore
            our curated selection of hotels, making every moment of your getaway
            truly extraordinary.
          </p>
          <button class="btn">Book Now</button>
        </div>
        <div class="footer__col">
          <h4>QUICK LINKS</h4>
          <ul class="footer__links">
            <li><a href="#">Browse Destinations</a></li>
            <li><a href="#">Special Offers & Packages</a></li>
            <li><a href="#">Room Types & Amenities</a></li>
            <li><a href="#">Customer Reviews & Ratings</a></li>
            <li><a href="#">Travel Tips & Guides</a></li>
          </ul>
        </div>
        <div class="footer__col">
          <h4>OUR SERVICES</h4>
          <ul class="footer__links">
            <li><a href="#">Concierge Assistance</a></li>
            <li><a href="#">Flexible Booking Options</a></li>
            <li><a href="#">Airport Transfers</a></li>
            <li><a href="#">Wellness & Recreation</a></li>
          </ul>
        </div>
        <div class="footer__col">
          <h4>CONTACT US</h4>
          <ul class="footer__links">
            <li><a href="#">rayalpark@info.com</a></li>
          </ul>
          <div class="footer__socials">
            <a href="#"><img src="assets/facebook.png" alt="facebook" /></a>
            <a href="#"><img src="assets/instagram.png" alt="instagram" /></a>
            <a href="#"><img src="assets/youtube.png" alt="youtube" /></a>
            <a href="#"><img src="assets/twitter.png" alt="twitter" /></a>
          </div>
        </div>
      </div>
      <div class="footer__bar">
        Copyright © 2023 Web Design Mastery. All rights reserved.
      </div>
    </footer>

    <?php include '../chatbot/chatbot.php'; ?>
    <script src="https://unpkg.com/scrollreveal"></script> 
    <script src="/js/filter.js"></script>
  </body>
</html>
