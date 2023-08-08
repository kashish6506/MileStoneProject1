<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
/* ***********

Todo list;
  - Overview

************* */

@import url('https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700');

:root {
  --drawer: #16191C;
  --text-primary: #FFFFFF;
  --text-secondary: #86909A;
  --text-faded: #C3C5C7;
  --background-primary: #22272B;
  --background-secondary: #374148;
  --background-secondary-faded: rgba(55,65,72,0.5);
  --background-card: #2C343A;
  --accent-primary: rgba(54,80,209,1);
  --accent-primary-faded: rgba(54,80,209,0.5);
  --accent-primary-transparent: rgba(54,80,209,0);
  --status-red: #EF4836;
  --status-green: #36D744;
}

::-webkit-scrollbar {
  width: 4px;
  height: 4px;
}
::-webkit-scrollbar-button {
  width: 0px;
  height: 0px;
}
::-webkit-scrollbar-thumb {
  background: #e1e1e1;
  border: 0px none #ffffff;
  border-radius: 50px;
}
::-webkit-scrollbar-thumb:hover {
  background: #ffffff;
}
::-webkit-scrollbar-thumb:active {
  background: #16191C;
}
::-webkit-scrollbar-track {
  background: rgba(102,102,102,30);
  border: 0px none #ffffff;
  border-radius: 50px;
}
::-webkit-scrollbar-track:hover {
  background: #666666;
}
::-webkit-scrollbar-track:active {
  background: #333333;
}
::-webkit-scrollbar-corner {
  background: transparent;
}

html, body {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  overflow: hidden;
  font-family: 'Open Sans', sans-serif;
  color: #EEE;
}

.container {
  display: flex;
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
  box-sizing: border-box;
  flex-direction: row;
}

.container .drawer {
  display: flex;
  position: relative;
  height: 100%;
  width: 100px;
  margin: 0;
  flex-grow: 0;
  flex-shrink: 0;
  background: var(--drawer);
  box-shadow: 1px 0px 3px rgba(0,0,0,0.16), 1px 0px 3px rgba(0,0,0,0.23);
  box-sizing: border-box;
  flex-direction: column;
  justify-content: space-between;
  z-index: 2;
}

.container .drawer .navicon {
  display: block;
  position: relative;
  width: 100px;
  height: 100px;
  line-height: 100px;
  margin: 0;
  padding: 0;
  text-align: center;
  color: var(--text-primary);
  font-size: 40px;
  opacity: 0.6;
  box-sizing: border-box;
  
  transition: all 0.22s ease;
}

.container .drawer .navicon:hover {
  opacity: 1;
}

.container .drawer .menu {
  display: block;
  position: relative;
  width: 100px;
  height: auto;
  box-sizing: border-box;
}

.container .drawer .menu a {
  display: block;
  width: 100px;
  height: 50px;
  line-height: 50px;
  margin: 0;
  padding: 0;
  text-align: center;
  color: var(--text-primary);
  font-size: 25px;
  opacity: 0.6;
  
  transition: all 0.22s ease;
}

.container .drawer .menu a.active {
  opacity: 1;
  pointer-events: none;
  cursor: default;
}

.container .drawer .menu a i {
  display: block;
  margin: 0 auto;
  width: 50px;
  border-radius: 2px;
}

.container .drawer .menu a.active i {
  background: var(--accent-primary);
  animation: 0.3s ease-out 0s 1 fadeIn;
}

.container .drawer .menu a:hover {
  opacity: 1;
}

.container .drawer .credits {
  display: block;
  position: relative;
  width: 100px;
  margin: 0;
  padding: 20px 0;
  color: var(--text-primary);
  opacity: 0.4;
  text-align: center;
  font-size: 10px;
  cursor: default;
}

.container .content {
  display: block;
  position: relative;
  width: auto;
  height: 100%;
  flex-grow: 1;
  background: var(--background-primary);
  box-sizing: border-box;
  z-index: 1;
}

.container .content .page {
  display: flex;
  position: absolute;
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  overflow-x: hidden;
  overflow-y: scroll;
  flex-direction: column;
  justify-content: space-between;
  transition: all 0.22s ease;
  
  top: 30px;
  transform: scale(1.3);
  opacity: 0;
  pointer-events: none;
}

.container .content .page.active {
  top: 0;
  transform: scale(1);
  opacity: 1;
  pointer-events: auto;
}

.container .content .page.noflex {
  display: block;
}

.container .content .page > .header {
  display: block;
  position: relative;
  width: 100%;
  height: 120px;
  margin: 0;
  padding: 0 40px;
  box-sizing: border-box;
  flex-grow: 0;
  flex-shrink: 0;
}

.container .content .page > .header .title {
  display: block;
  position: relative;
  height: 120px;
  width: auto;
  box-sizing: border-box;
}

.container .content .page > .header .title h2 {
  display: block;
  position: relative;
  line-height: 120px;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-weight: 200;
}

.container .content .page .grid {
  display: flex;
  position: relative;
  width: 100%;
  height: 480px;
  flex-grow: 0;
  flex-shrink: 0;
  box-sizing: border-box;
  margin: 0;
  padding: 0 40px;
  overflow: hidden;
}

.container .content .page .grid .card {
  display: flex;
  position: relative;
  height: 480px;
  width: 350px;
  background: var(--background-card);
  border-radius: 4px;
  box-sizing: border-box;
  padding: 0 20px;
  margin: 0 20px 0 0;
  flex-direction: column;
  justify-content: space-between;
}

.container .content .page .grid .card.wide {
  width: 650px;
}

.container .content .page .grid .card .head {
  display: flex;
  position: relative;
  width: 100%;
  height: 75px;
  overflow: hidden;
  box-sizing: border-box;
  flex-direction: row;
  justify-content: space-between;
}

.container .content .page .grid .card .head .icon {
  display: block;
  width: 75px;
  height: 75px;
  line-height: 75px;
  text-align: center;
  padding: 0;
  margin: 0;
  background: var(--accent-primary);
  font-size: 1.2em;
}

.container .content .page .grid .card .head .stat {
  display: block;
  width: auto;
  height: 75px;
  line-height: 75px;
  text-align: center;
  padding: 0 20px;
  margin: 0;
}

.container .content .page .grid .card .head .status {
  display: block;
  position: relative;
  width: auto;
  height: 75px;
  line-height: 75px;
  text-align: center;
  padding: 0 20px;
  margin: 0;
}

.container .content .page .grid .card .head .status:after {
  content: '';
  display: block;
  position: relative;
  width: 15px;
  height: 15px;
  border-radius: 15px;
  background: var(--status-red);
  top: 50%;
  left: 100%;
  transform: translateY(-50%);
}

.container .content .page .grid .card .head .status.up:after {
  background: var(--status-green);
}

.container .content .page .grid .card .body {
  display: block;
  position: relative;
  width: 100%;
  height: auto;
  margin: 0;
  padding: 0;
}

.container .content .page .grid .card .body h2 {
  display: block;
  position: relative;
  width: 100%;
  height: 30px;
  margin: 0;
  padding: 0;
  text-transform: uppercase;
  line-height: 30px;
  font-size: 12px;
  font-weight: 600;
  color: var(--text-secondary);
}

.container .content .page .grid .card .body p {
  display: block;
  position: relative;
  width: 100%;
  height: auto;
  margin: -5px 0 0 0;
  padding: 0;
  color: var(--text-faded);
  font-size: 16px;
}

.container .content .page .grid .card .footer {
  display: block;
  position: relative;
  height: 80px;
  width: 100%;
  margin: 0;
  padding: 15px 0;
  box-sizing: border-box;
  border-top: 1px solid rgba(134,144,154,0.4);
}

.container .content .page .grid .card .footer .user {
  display: block;
  position: relative;
  height: 50px;
  box-sizing: border-box;
  margin: 0;
  float: left;
}

.container .content .page .grid .card .footer .user .user-icon {
  display: block;
  position: relative;
  height: 50px;
  width: 50px;
  border-radius: 25px;
  padding: 0;
  margin: 0 20px 0 0;
  background: var(--background-secondary);
  float: left;
}

.container .content .page .grid .card .footer .user .username {
  display: block;
  position: relative;
  height: 50px;
  line-height: 50px;
  font-weight: 300;
  font-size: 18px;
  float: left;
}

.container .content .page .grid .card-verticle {
  display: flex;
  position: relative;
  height: 480px;
  width: 300px;
  box-sizing: border-box;
  margin: 0 20px 0 0;
  flex-direction: column;
  justify-content: space-between;
}

.container .content .page .grid .card-verticle .card-small {
  display: flex;
  position: relative;
  height: 230px;
  width: 300px;
  background: var(--background-card);
  border-radius: 4px;
  box-sizing: border-box;
  padding: 20px;
  margin: 0 20px 0 0;
  flex-direction: column;
  justify-content: space-between;
}

.container .content .page .grid .card-verticle .card-small .title {
  display: block;
  position: relative;
  width: 100%;
  height: 40px;
  line-height: 40px;
  color: var(--text-secondary);
  text-transform: uppercase;
  font-weight: 600;
  font-size: 14px;
}

.container .content .page .grid .card-verticle .card-small .text {
  display: block;
  position: relative;
  width: 100%;
  height: 60px;
  line-height: 60px;
  margin: 0;
  color: var(--text-primary);
  text-transform: uppercase;
  font-weight: 300;
  font-size: 2.3em;
}

.container .content .page .grid .card-verticle .card-small .graph {
  display: block;
  position: relative;
  width: 100%;
  height: 60px;
  padding: 0;
  margin: 0;
}

.container .content .page .grid .card-verticle .card-small .graph .bar {
  display: block;
  position: relative;
  height: 60px;
  width: 15px;
  background: var(--text-secondary);
  margin: 0 10px 0 0;
  padding: 0;
  float: left;
}

.container .content .page .grid .card-verticle .card-small .graph .bar .bar-content {
  display: block;
  position: absolute;
  bottom: 0;
  left: 0;
  height: 0px;
  width: 15px;
  background: var(--status-green);
  padding: 0;
}

.container .content .page .grid .card a.download {
  display: inline-block;
  position: relative;
  box-sizing: border-box;
  margin: 8px 10px;
  padding: 0 10px;
  height: 32px;
  line-height: 32px;
  border-radius: 1px;
  text-decoration: none;
  float: right;
  color: var(--text-primary);
  background: var(--status-green);
  opacity: 0.8;
  transition: all 0.2s ease;
}

.container .content .page .grid .card a.download:hover {
  opacity: 1;
}

.container .content .page .grid .card a.download i {
  padding: 0 0 0 5px;
}

.container .content .page .grid .users-table {
  display: table;
  position: relative;
  width: 100%;
  height: auto;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  border-radius: 3px;
  background: var(--background-card);
  overflow: hidden;
  transition: all 0.22s ease;
  
  transform: translateX(-100%);
}

.container .content .page .grid .users-table .users-item {
  display: table-row;
  position: relative;
  width: 100%;
  height: 50px;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  transition: all 0.22s ease;
  transform: translateX(0);
}

.container .content .page .grid .users-table .users-item.header {
  background: var(--background-secondary);
  cursor: default;
  user-select: none;
  text-transform: uppercase;
}

.container .content .page .grid .users-table .users-item .table-item {
  display: table-cell;
  position: relative;
  height: 50px;
  color: var(--text-primary);
  line-height: 50px;
  padding: 0 10px;
  text-overflow: ellipsis;
  cursor: pointer;
}

.container .content .page .grid .users-table .users-item:hover .table-item {
  background: var(--background-secondary-faded);
}

.container .content .page .grid .users-table .users-item .table-item.noflex {
  width: 40px;
}

.container .content .page .grid .users-table .users-item .user-edit-controls {
  display: block;
  position: absolute;
  height: 50px;
  width: 170px;
  top: 0;
  right: -170px;
  text-align: center;
}

.container .content .page .grid .users-table .users-item.active {
  transform: translateX(-170px);
}

.container .content .page .grid .users-table .users-item .user-edit-controls a.table-edit-button {
  display: inline-block;
  position: relative;
  margin: 5px 0;
  padding: 0 20px;
  color: var(--text-primary);
  background: var(--accent-primary);
  height: 40px;
  line-height: 40px;
  text-decoration: none;
  transition: all 0.22s ease;
}

.container .content .page .grid .users-table .users-item .user-edit-controls a.table-edit-button:hover {
  color: var(--text-primary);
  background: var(--accent-primary-faded);
}

.container .content .page .grid .user-edit {
  display: table;
  position: relative;
  width: 100%;
  height: 480px;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  border-radius: 3px;
  background: var(--background-card);
  overflow: hidden;
  transition: all 0.22s ease;
  
  transform: translateX(-120%);
}

.container .content .page .grid .user-edit .header {
  display: block;
  position: relative;
  width: 100%;
  height: 60px;
  line-height: 60px;
  box-sizing: border-box;
}

.container .content .page .grid .user-edit .header .icon {
  display: inline-block;
  position: relative;
  width: 60px;
  height: 60px;
  padding: 0;
  margin: 0 20px 0 0;
  box-sizing: border-box;
  text-align: center;
  background: var(--accent-primary);
}

.container .content .page .grid .user-edit .header .icon i {
  display: block;
  position: relative;
  line-height: 60px;
  color: var(--text-primary);
  font-size: 1.4em;
}

.container .content .page .grid .user-edit .header a.button {
  display: inline-block;
  position: relative;
  float: right;
  color: var(--text-primary);
}

.container .content .page .grid .user-edit .header a.close {
  display: inline-block;
  position: relative;
  float: right;
  width: 60px;
  height: 60px;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  text-align: center;
  background: var(--accent-primary);
  color: var(--text-primary);
}

.container .content .page .grid.edit-users .users-table {
  transform: translateX(0);
}

.container .content .page .grid.edit-users .user-edit {
  transform: translateX(0);
  margin: 0 60px 0 0;
}

.container .content .page .info-container {
  display: block;
  position: relative;
  width: 100%;
  height: 480px;
  box-sizing: border-box;
  margin: 0;
  padding: 0 40px;
}

.container .content .page .info-container .info {
  display: block;
  position: relative;
  width: 100%;
  min-height: 50px;
  background: var(--background-secondary);
  border-radius: 2px;
  box-sizing: border-box;
  margin: 0 0 15px 0;
  padding: 0 20px;
  line-height: 50px;
}

.container .content .page .info-container .info a {
  display: inline-block;
  position: relative;
  float: left;
  color: var(--text-secondary);
  margin: 0 10px 0 0;
  padding: 0 20px 0 0;
  text-size: 1.5em;
  text-decoration: none;
  text-transform: uppercase;
  
}

.container .content .page .info-container .info a:after {
  content: '';
  display: block;
  position: absolute;
  top: 50%;
  right: 0;
  width: 1px;
  height: 70%;
  transform: translateY(-50%);
  background: var(--text-secondary);
}

.container .sidebar {
  display: block;
  position: relative;
  width: 250px;
  height: 100%;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  background: var(--background-secondary);
  box-shadow: -3px 0px 6px rgba(0,0,0,0.16), -3px 0px 6px rgba(0,0,0,0.23);
  z-index: 2;
  
  display: none;
}

.container .dialog {
  position: fixed;
  display: block;
  width: 100%;
  height: 100%;
  z-index: 1000;
  top: 0;
  left: 0;
  box-sizing: border-box;
  overflow: hidden;
  transition: all 0.22s ease;
  
  pointer-events: none;
  background: rgba(34,39,43,0);
}

.container .dialog.active {
  pointer-events: auto;
  background: rgba(34,39,43,0.65);
}

.container .dialog .dialog-block {
  display: flex;
  position: absolute;
  margin: 0;
  padding: 0;
  width: 450px;
  height: 350px;
  background: var(--background-primary);
  top: 50%;
  left: 50%;
  box-sizing: border-box;
  box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
  flex-direction: column;
  justify-content: space-between;
  transform: translateX(-50%) translateY(-50%) scale(0);
  
  transition: all 0.22s 0.3s ease;
}

.container .dialog.active .dialog-block {
  transform: translateX(-50%) translateY(-50%) scale(1);
}

.container .dialog .dialog-block:after {
  content: '';
  display: block;
  position: absolute;
  left: 0;
  top: 0;
  height: 2px;
  width: 100%;
  background: var(--accent-primary);
}

.container .dialog .dialog-block h2 {
  display: block;
  width: 100%;
  height: 45px;
  line-height: 45px;
  text-align: center;
  font-weight: 300;
}

.container .dialog .dialog-block .controls {
  display: block;
  position: absolute;
  width: 100%;
  height: 60px;
  bottom: 0;
  left: 0;
  padding: 0 16px 16px 16px;
  box-sizing: border-box;
}

.container .dialog .dialog-block .controls .button {
  float: right;
  font-family: inherit;
  background: transparent;
  border: none;
  outline: none;
  cursor: pointer;
  font-size: 16px;
  height: 40px;
  line-height: 40px;
  padding: 0 10px;
  text-decoration: none;
  text-transform: uppercase;
  color: var(--text-secondary);
  transition: all 0.22s ease;
}

.container .dialog .dialog-block .controls .button:first-child {
  color: var(--text-primary);
}

.container .dialog .dialog-block .controls .button:hover {
  background: rgba(255,255,255,0.1);
}

@keyframes fadeIn {
  0% {
    background: var(--accent-primary-transparent);
  }
  100% {
    background: var(--accent-primary);
  }
}</style>

<script>$('.menu a[data-menu]').on('click', function() {
	  var menu = $(this).data('menu');
	  $('.menu a.active').removeClass('active');
	  $(this).addClass('active');
	  $('.active[data-page]').removeClass('active');
	  $('[data-page="' + menu  + '"]').addClass('active');
	});

	$('body').on('click', '[data-dialog]', function() {
	  var action = $(this).data('dialog');
	  switch (action) {
	    case 'logout':
	      $('.dialog').toggleClass('active');
	      break;
	    }
	});

	$('body').on('click', '[data-dialog-action]', function() {
	  var action = $(this).data('dialog-action');
	  switch (action) {
	    case 'cancel':
	      $(this).closest('.dialog.active').toggleClass('active');
	      break;
	    }
	});

	function updateGraph(data) {
	  $('.graph .bar[data-day]').each(function() {
	    var day = $(this).data('day');
	    var barH = $(this).height();
	    switch (day) {
	      case 'sunday':
	        $(this).find('.bar-content').css('height', (barH / 100) * data[day]  + 'px');
	        break;
	      case 'monday':
	        $(this).find('.bar-content').css('height', (barH / 100) * data[day]  + 'px');
	        break;
	      case 'tuesday':
	        $(this).find('.bar-content').css('height', (barH / 100) * data[day]  + 'px');
	        break;
	      case 'wednesday':
	        $(this).find('.bar-content').css('height', (barH / 100) * data[day]  + 'px');
	        break;
	      case 'thursday':
	        $(this).find('.bar-content').css('height', (barH / 100) * data[day]  + 'px');
	        break;
	      case 'friday':
	        $(this).find('.bar-content').css('height', (barH / 100) * data[day]  + 'px');
	        break;
	      case 'saturday':
	        $(this).find('.bar-content').css('height', (barH / 100) * data[day]  + 'px');
	        break;
	               }
	  });
	}

	function addUserToTable(data) {
	  var table = $('.users-table');
	  var ele = '<div class="users-item"><div class="table-item noflex">' + data['id'] + '</div><div class="table-item">' + data['email'] + '</div><div class="table-item">' + data['username'] + '</div><div class="table-item">' + data['nickname'] + '</div><div class="table-item">' + (data['premium'] ? "Active" : "Inactive") + '</div><div class="table-item">' + (data['premium'] ? "Premium" : "Not Premium") + '<div class="user-edit-controls"><a href="#" class="table-edit-button">Edit</a></div></div></div>';
	  table.append(ele);
	}

	var tempData = {
	  sunday: 40,
	  monday: 50,
	  tuesday: 30,
	  wednesday: 20,
	  thursday: 30,
	  friday: 60,
	  saturday: 90
	}

	var users = [
	  {
	    "id": 0,
	    "email": "suzannenixon@medicroix.com",
	    "username": "Rosemarie45",
	    "nickname": "Mildred11",
	    "active": true,
	    "premium": false
	  },
	  {
	    "id": 10,
	    "email": "mildrednixon@medicroix.com",
	    "username": "Lorrie24",
	    "nickname": "Warren15",
	    "active": false,
	    "premium": true
	  },
	  {
	    "id": 20,
	    "email": "warrennixon@medicroix.com",
	    "username": "Celina35",
	    "nickname": "Beck16",
	    "active": false,
	    "premium": false
	  },
	  {
	    "id": 30,
	    "email": "becknixon@medicroix.com",
	    "username": "Simone18",
	    "nickname": "Tonia12",
	    "active": false,
	    "premium": true
	  },
	  {
	    "id": 40,
	    "email": "tonianixon@medicroix.com",
	    "username": "Alejandra31",
	    "nickname": "Eileen42",
	    "active": true,
	    "premium": false
	  },
	  {
	    "id": 50,
	    "email": "eileennixon@medicroix.com",
	    "username": "Ofelia4",
	    "nickname": "Walsh36",
	    "active": true,
	    "premium": true
	  },
	  {
	    "id": 60,
	    "email": "walshnixon@medicroix.com",
	    "username": "Owen24",
	    "nickname": "Mayra0",
	    "active": false,
	    "premium": true
	  },
	  {
	    "id": 70,
	    "email": "mayranixon@medicroix.com",
	    "username": "Tamra8",
	    "nickname": "Graham9",
	    "active": false,
	    "premium": true
	  },
	  {
	    "id": 80,
	    "email": "grahamnixon@medicroix.com",
	    "username": "Dejesus44",
	    "nickname": "Russo5",
	    "active": false,
	    "premium": false
	  }
	];

	$.each(users, function(i, item) {
	  addUserToTable(users[i]);
	});

	updateGraph(tempData);

	$('body').on('click', '.users-item:not(.header)', function() {
	  console.log('click')
	  $(this).toggleClass('active')
	});

	$('body').on('click', '.users-item a.table-edit-button', function() {
	  $(this).closest('.grid').toggleClass('edit-users');
	  $(this).closest('.users-item').toggleClass('active');
	  e.preventDefault();
	});

	$('body').on('click', '.user-edit .header .close', function() {
	  $(this).closest('.grid').toggleClass('edit-users');
	  $(this).closest('.users-item').toggleClass('active');
	  e.preventDefault();
	});</script>
</head>
<body>

<div class="container">
  <div class="drawer">
    <a class="navicon" href="#"><i class="icon ion-navicon"></i></a>
    <div class="menu">
      <a data-menu="dashboard" href="#" class="active"><i class="icon ion-home"></i></a>
      <a data-menu="users" href="#"><i class="icon ion-person-stalker"></i></a>
      <a data-dialog="logout" href="#"><i class="icon ion-log-out"></i></a>
      <a data-menu="download" href="#"><i class="icon ion-code-download"></i></a>
      <a data-menu="about" href="#"><i class="icon ion-information-circled"></i></a>
    </div>
    <span class="credits">uplusion23</span>
  </div>
  <div class="content">
    <div class="page active" data-page="dashboard">
      <div class="header">
        <div class="title">
          <h2>Dashboard</h2>
        </div>
      </div>
      <div class="grid">
        <div class="card">
          <div class="head">
            <span class="icon">
              <i class="icon ion-pound"></i>
            </span>
            <span class="stat">
              Server Status
            </span>
            <div class="status">
            </div>
          </div>
          <div class="body">
            <h2>Server is currently $_status</h2>
            <p>
              The server is running normally and no issues have recently been detected. If you notice an outage, please report it to the administrator.
            </p>
          </div>
          <div class="footer">
            <div class="user">
              <div class="user-icon">
              </div>
              <span class="username">
                Administrator
              </span>
            </div>
          </div>
        </div>
        <div class="card">
          <div class="head">
            <span class="icon">
              <i class="icon ion-code-working"></i>
            </span>
            <span class="stat">
              CSGO Status
            </span>
            <div class="status">
            </div>
          </div>
          <div class="body">
            <h2>Cheat is currently $_status</h2>
            <p>
              The server is running normally and no issues have recently been detected. If you notice an outage, please report it to the administrator.
            </p>
          </div>
          <div class="footer">
            <div class="user">
              <div class="user-icon">
              </div>
              <span class="username">
                uplusion23
              </span>
            </div>
          </div>
        </div>
        <div class="card-verticle">
          <div class="card-small">
            <span class="title">
              Active Users
            </span>
            <h2 class="text">12</h2>
            <div class="graph">
              <div class="bar" data-day="sunday">
                <div class="bar-content"></div>
              </div>
              <div class="bar" data-day="monday">
                <div class="bar-content"></div>
              </div>
              <div class="bar" data-day="tuesday">
                <div class="bar-content"></div>
              </div>
              <div class="bar" data-day="wednesday">
                <div class="bar-content"></div>
              </div>
              <div class="bar" data-day="thursday">
                <div class="bar-content"></div>
              </div>
              <div class="bar" data-day="friday">
                <div class="bar-content"></div>
              </div>
              <div class="bar" data-day="saturday">
                <div class="bar-content"></div>
              </div>
            </div>
          </div>
          <div class="card-small">
            <span class="title">
              Overview
            </span>
          </div>
        </div>
      </div>
      <div class="stats">
      </div>
    </div>
    <div class="page noflex" data-page="users">
      <div class="header">
        <div class="title">
          <h2>Users</h2>
        </div>
      </div>
      <div class="grid">
        <div class="user-edit">
          <div class="header">
            <span class="icon">
              <i class="icon ion-person"></i>
            </span>
            <span class="user-edit-name">$_USERNAME</span>
            <a href="#" class="close"><i class="icon ion-close-round"></i></a>
          </div>
        </div>
        <div class="users-table">
          <div class="users-item header">
            <div class="table-item noflex">
              ID
            </div>
            <div class="table-item">
              Email Address
            </div>
            <div class="table-item">
              Username
            </div>
            <div class="table-item">
              Nickname
            </div>
            <div class="table-item">
              Active
            </div>
            <div class="table-item">
              Premium
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="page noflex" data-page="download">
      <div class="header">
        <div class="title">
          <h2>Download</h2>
        </div>
      </div>
      <div class="grid">
        <div class="card wide">
          <div class="head">
            <span class="icon">
              <i class="icon ion-code-working"></i>
            </span>
            <span class="stat">
              Cheat Client
            </span>
            <div class="status">
            </div>
          </div>
          <div class="body">
            <h2>Latest Version: v$_VERSION</h2>
            <p>
              changelog here
            </p>
          </div>
          <div class="footer">
            <div class="user">
              <div class="user-icon">
              </div>
              <span class="username">
                Administrator 
              </span>
            </div>
            <a class="download" href="#">Download <i class="icon ion-archive"></i></a>
          </div>
        </div>
      </div>
    </div>
    <div class="page noflex" data-page="about">
      <div class="header">
        <div class="title">
          <h2>About</h2>
        </div>
      </div>
      <div class="info-container">
        <div class="info">
          <a href="http://uplusion23.net/" target="_blank">Developer</a>
          <span>uplusion23</span>
        </div>
        <div class="info">
          <a href="#" target="_blank">Dashboard Version</a>
          <span>1.0.0</span>
        </div>
      </div>
    </div>
  </div>
  <div class="sidebar">

  </div>
  <div class="dialog">
    <div class="dialog-block">
      <h2>Are you sure you want to logout?</h2>
      <div class="controls">
        <a href="#" class="button">Logout</a>
        <a data-dialog-action="cancel" href="#" class="button">Cancel</a>
      </div>
    </div>
  </div>
</div>
</body>
</html>