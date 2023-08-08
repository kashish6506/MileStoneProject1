<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Home page</title>
<style >body {
  margin: 0;
  background-image: linear-gradient(
    -30deg,
    #3f51b5 0%,
    #2196f3 50%,
    #87ceeb 100%
  );
  overflow-x: hidden;
  color: white;
  font-family: sans-serif;
  height: 200vh;
}

header {
  position: fixed;
  z-index: 500;
}

li {
  list-style: none;
  display: inline;
  font-size: 2vw;
  margin: 30px;
}

a {
  color: white;
  text-decoration: none;
  position: relative;
}

a::after {
  content: "";
  transition: 500ms;
  display: block;
  position: absolute;
  width: inherit; height: 0.5vw;
  top: 4vw; right: 0; bottom: 0; left: 0;
  border-radius: 1rem 0;
  background-color: white;
}

a:hover::after {
  top: 3vw;
}

h1 {
  position: absolute;
  font-size: 6vw;
  z-index: 200;
  top: 35vh; left: 20vw;
  font-family: 'Montserrat', sans-serif;
}

h1::after {
  content: "";
  display: block;
  position: absolute;
  background-color: #312ecb;
  border-radius: 1rem 0;
  width: 10vw; height: 1.5vw;
  top: 5vw; right: 0; bottom: 0; left: auto;
  z-index: -1;
}

img {
  position: absolute;
  width: 15vw; height: 15vw;
  top: 35vh; left: 25vw;
  z-index: 150;
}

.blob {
  position: absolute;
  background-color: rgba(156, 195, 230, 0.6);
  background-image: linear-gradient(
    45deg,
    #3f51b5 0%,
    #2196f3 50%,
    #87ceeb 100%
  );
}

#blob1 {
  right: -10vw; top: 15vw;
  width: 50vw; height: 30vw;
  rotate: 30deg;
  border-radius: 90% 50%;
  z-index: 150;
}

#blob2 {
  left: -10vw; top: 35vw;
  width: 70vw; height: 30vw;
  border-radius: 30% 70%;
}

#blob3 {
  left: -5vw; top: 5vw;
  width: 40vw; height: 20vw;
  border-radius: 60% 50%;
  rotate: -10deg;
}

#line {
  position: absolute;
  top: -13vw; left: -10vw;
  width: 120vw; height: auto;
  z-index: 120;
}
</style>
</head>
<body>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&display=swap" rel="stylesheet">
<header>
  <nav>
    <ul>
      <li><a href="Getscore">Get Scores</a></li>
      <li><a href="markCard.jsp">Mark Card</a></li>
      <li><a href="Changecourse.jsp">Change course</a></li>
      <li><a href="Logout">Logout</a></li>
    </ul>
  </nav>
</header>
<h1>Welcome Student</h1>

<div class="blob" id="blob1"></div>
<div class="blob" id="blob2"></div>
<div class="blob" id="blob3"></div>

    <path style="stroke-width: 3px; stroke-linecap: round; stroke: rgb(179, 192, 239); paint-order: stroke; fill: none;" d="M 410.107 119.627 C 610.559 91.754 447.468 205.23 267.236 230.292 C 98.654 236.087 197.1 61.629 103.197 159.266 C 142.803 121.311 -69.077 302.058 126.896 342.895"></path>
</svg>
</html>