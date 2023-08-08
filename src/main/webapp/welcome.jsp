<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
</head>
<style>

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Lato', 'Arial', sans-serif;
}

/* HEADINGS */

h1, p {
  color: #fff;
  text-align: center;
  line-height: 1.4;
}

h1 {
  font-size: 2.2rem;
}

h2 {
  color: #000;
  font-size: 1.3rem;
  text-align: center;
  line-height: 1.4;
  margin-bottom: 10px;
}

/* BASIC SETUP */

.page-wrapper {
  width: 100%;
  height: auto;
}

.nav-wrapper {
  width: 100%;
  position: -webkit-sticky; /* Safari */
  position: sticky;
  top: 0;
  background-color: #fff;
}

.grad-bar {
  width: 100%;
  height: 5px;
  background: linear-gradient(-45deg, #EE7752, #E73C7E, #23A6D5, #23D5AB);
  background-size: 400% 400%;
  	-webkit-animation: gradbar 15s ease infinite;
	-moz-animation: gradbar 15s ease infinite;
	animation: gradbar 15s ease infinite;
}

/* NAVIGATION */

.navbar {
  display: grid;
  grid-template-columns: 1fr 3fr;
  align-items: center;
  height: 50px;
  overflow: hidden;
}

.navbar img {
  height: 16px;
  width: auto;
  justify-self: start;
  margin-left: 20px;
}

.navbar ul {
  list-style: none;
  display: grid;
  grid-template-columns: repeat(6,1fr);
  justify-self: end;
  
}

.nav-item a {
  color: #000;
  font-size: 0.9rem;
  font-weight: 400;
  text-decoration: none;
  transition: color 0.3s ease-out;
}


.nav-item a:hover {
  color: #3498db;
}

/* SECTIONS */

.headline {
  width: 100%;
  height: 50vh;
  min-height: 350px;
  background: linear-gradient(rgba(0,0,0,0.3),rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1435224668334-0f82ec57b605?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDd8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80');
  background-size: cover;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.features {
  width: 100%;
  height: auto;
  background-color: #f1f1f1;
  display: flex;
  padding: 50px 20px;
  justify-content: space-around;
}

.feature-container {
  flex-basis: 30%;
  margin-top: 10px;
}

.feature-container p {
  color: #000;
  text-align: center;
  line-height: 1.4;
  margin-bottom: 15px;
}

.feature-container img {
  width: 100%;
  margin-bottom: 15px;
}

/* SEARCH FUNCTION */

#search-icon {
  font-size: 0.9rem;
  margin-top: 3px;
  margin-left: 15px;
  transition: color 0.3s ease-out;
}

#search-icon:hover {
  color: #3498db;
  cursor: pointer;
}

.search {
  transform: translate(-35%);
  -webkit-transform: translate(-35%);
  transition: transform 0.7s ease-in-out;
  color: #3498db;
}

.no-search {
  transform: translate(0);
  transition: transform 0.7s ease-in-out;
}

.search-input {
  position: absolute;
  top: -4px;
  right: -125px;
  opacity: 0;
  z-index: -1;
  transition: opacity 0.6s ease;
}

.search-active {
  opacity: 1;
  z-index: 0;
}

input {
  border: 0;
  border-left: 1px solid #ccc;
  border-radius: 0; /* FOR SAFARI */
  outline: 0;
  padding: 5px;
}

/* MOBILE MENU & ANIMATION */

.menu-toggle .bar{
  width: 25px;
  height: 3px;
  background-color: #3f3f3f;
  margin: 5px auto;
  -webkit-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.menu-toggle {
  justify-self: end;
  margin-right: 25px;
  display: none;
}

.menu-toggle:hover{
  cursor: pointer;
}

#mobile-menu.is-active .bar:nth-child(2){
  opacity: 0;
}

#mobile-menu.is-active .bar:nth-child(1){
  -webkit-transform: translateY(8px) rotate(45deg);
  -ms-transform: translateY(8px) rotate(45deg);
  -o-transform: translateY(8px) rotate(45deg);
  transform: translateY(8px) rotate(45deg);
}

#mobile-menu.is-active .bar:nth-child(3){
  -webkit-transform: translateY(-8px) rotate(-45deg);
  -ms-transform: translateY(-8px) rotate(-45deg);
  -o-transform: translateY(-8px) rotate(-45deg);
  transform: translateY(-8px) rotate(-45deg);
}

/* KEYFRAME ANIMATIONS */

@-webkit-keyframes gradbar {
	0% {
		background-position: 0% 50%
	}
	50% {
		background-position: 100% 50%
	}
	100% {
		background-position: 0% 50%
	}
}

@-moz-keyframes gradbar {
	0% {
		background-position: 0% 50%
	}
	50% {
		background-position: 100% 50%
	}
	100% {
		background-position: 0% 50%
	}
}

@keyframes gradbar {
	0% {
		background-position: 0% 50%
	}
	50% {
		background-position: 100% 50%
	}
	100% {
		background-position: 0% 50%
	}
}

/* Media Queries */

  /* Mobile Devices - Phones/Tablets */

@media only screen and (max-width: 720px) { 
  .features {
    flex-direction: column;
    padding: 50px;
  }
  
  /* MOBILE HEADINGS */
  
  h1 {
    font-size: 1.9rem;
  }
  
  h2 {
    font-size: 1rem;
  }
  
  p {
    font-size: 0.8rem;
  }
  
  /* MOBILE NAVIGATION */
     
  .navbar ul {
    display: flex;
    flex-direction: column;
    position: fixed;
    justify-content: start;
    top: 55px;
    background-color: #fff;
    width: 100%;
    height: calc(100vh - 55px);
    transform: translate(-101%);
    text-align: center;
    overflow: hidden;
  }
  
  .navbar li {
    padding: 15px;
  }
  
  .navbar li:first-child {
    margin-top: 50px;
  }
  
  .navbar li a {
    font-size: 1rem;
  }
   
  .menu-toggle, .bar {
    display: block;
    cursor: pointer;
  }
  
  .mobile-nav {
  transform: translate(0%)!important;
}
  
  /* SECTIONS */
  
  .headline {
    height: 20vh;
  }
    
  .feature-container p {
    margin-bottom: 25px;
  }
  
  .feature-container {
    margin-top: 20px;
  }
  
  .feature-container:nth-child(2) {
    order: -1;
  }
  
  /* SEARCH DISABLED ON MOBILE */
  
  #search-icon {
    display: none;
  }
  
  .search-input {
  display: none;
 }
  
}</style>
<body>


<div class="page-wrapper">
 <div class="nav-wrapper">
  <div class="grad-bar"></div>
  <nav class="navbar">
    <img src="data:image/png;base64,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" alt="Company Logo">
    <div class="menu-toggle" id="mobile-menu">
      <span class="bar"></span>
      <span class="bar"></span>
      <span class="bar"></span>
    </div>
    <ul class="nav no-search">
      <li class="nav-item"><a href="#headline">Home</a></li>
      <li class="nav-item"><a href="adminLogin.jsp">Admin</a></li>
      <li class="nav-item"><a href="profLogin.jsp">Professor</a></li>
      <li class="nav-item"><a href="studLogin.jsp">Student</a></li>
      <li class="nav-item"><a href="#">Contact Us</a></li>
      <i class="fas fa-search" id="search-icon"></i>
      <input class="search-input" type="text" placeholder="Search..">
    </ul>
  </nav>
  </div>
  <section class="headline">
    <h1>Welcome To Course Management</h1>
    <p>Digit Insuarance</p>
  </section>
  <section class="features">
    <div class="feature-container">
      <img src="https://cdn-images-1.medium.com/max/2000/1*HFAEJvVOq4AwFuBivNu_OQ.png" alt="Flexbox Feature">
      <h2>Flexbox Featured</h2>
      <p>This pen contains use of flexbox for the headline and feature section! We use it in our mobile navbar and show the power of mixing css grid and flexbox.</p>
    </div>
    <div class="feature-container">
      <img src="https://blog.webix.com/wp-content/uploads/2017/06/20170621-CSS-Grid-Layout-710x355-tiny.png" alt="Flexbox Feature">
      <h2>CSS Grid Navigation</h2>
      <p>While flexbox is used for the the mobile navbar, CSS grid is used for the desktop navbar showing many ways we can use both.</p>
    </div>
    <div class="feature-container">
      <img src="https://www.graycelltech.com/wp-content/uploads/2015/06/GCT-HTML5.jpg" alt="Flexbox Feature">
      <h2>Basic HTML5</h2>
      <p>This pen contains basic html to setup the page to display the responsive navbar.</p>
    </div>
  </section>
</div>


</body>
</html>