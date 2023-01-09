# CODE-LIBRARY

HTML FORM - https://www.w3docs.com/tools/editor/5943

 * [ORIGINAL](#ORIGINAL)
 * [NEW](#NEW)

----------------------------------------------------------

ORIGINAL

```HTML
<!DOCTYPE html>
<html>
  <head>
    <title>x </title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    
<style>

      html, body {
      min-height: 100%;
      }

      body, div, form, input, select, textarea, p { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 14px;
      color: #666;
      line-height: 22px;
      }
      
      h1 {
      position: absolute;
      margin: 0;
      font-size: 32px;
      color: #fff;
      z-index: 2;
      }

      .testbox {
      display: flex;
      justify-content: center;
      align-items: center;
      height: inherit;
      padding: 20px;
      }

      form {
      width: 100%;
      padding: 20px;
      border-radius: 6px;
      background: #fff;
      box-shadow: 0 0 20px 0 #a82877; 
      }

      .banner {
      position: relative;
      height: 210px;
      background-image: url("https://www.msd.govt.nz/webadmin/images/msd-logo-blue.svg");      
      background-size: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      }

      .banner::after {
      content: "";
      background-color: rgba(0, 0, 0, 0.5); 
      position: absolute;
      width: 100%;
      height: 100%;
      }

      input, textarea, select {
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
      }

      input {
      width: calc(100% - 10px);
      padding: 5px;
      }

      select {
      width: 100%;
      padding: 7px 0;
      background: transparent;
      }

      textarea {
      width: calc(100% - 12px);
      padding: 5px;
      }

      .item:hover p, .item:hover i, .question:hover p, .question label:hover, input:hover::placeholder {
      color: #a82877;
      }

      .item input:hover, .item select:hover, .item textarea:hover {
      border: 1px solid transparent;
      box-shadow: 0 0 6px 0 #a82877;
      color: #a82877;
      }

      .item {
      position: relative;
      margin: 10px 0;
      }

      input[type="date"]::-webkit-inner-spin-button {
      display: none;
      }

      .item i, input[type="date"]::-webkit-calendar-picker-indicator {
      position: absolute;
      font-size: 20px;
      color: #a9a9a9;
      }

      .item i {
      right: 1%;
      top: 30px;
      z-index: 1;
      }

      [type="date"]::-webkit-calendar-picker-indicator {
      right: 0;
      z-index: 2;
      opacity: 0;
      cursor: pointer;
      }

      input[type="time"]::-webkit-inner-spin-button {
      margin: 2px 22px 0 0;
      }

      input[type=radio], input.other {
      display: none;
      }

      label.radio {
      position: relative;
      display: inline-block;
      margin: 5px 20px 10px 0;
      cursor: pointer;
      }

      .question span {
      margin-left: 30px;
      }

      label.radio:before {
      content: "";
      position: absolute;
      top: 2px;
      left: 0;
      width: 15px;
      height: 15px;
      border-radius: 50%;
      border: 2px solid #ccc;
      }

      #radio_5:checked ~ input.other {
      display: block;
      }

      input[type=radio]:checked + label.radio:before {
      border: 2px solid #a82877;
      background: #a82877;
      }

      label.radio:after {
      content: "";
      position: absolute;
      top: 7px;
      left: 5px;
      width: 7px;
      height: 4px;
      border: 3px solid #fff;
      border-top: none;
      border-right: none;
      transform: rotate(-45deg);
      opacity: 0;
      }

      input[type=radio]:checked + label:after {
      opacity: 1;
      }

      .btn-block {
      margin-top: 10px;
      text-align: center;
      }

      button {
      width: 150px;
      padding: 10px;
      border: none;
      border-radius: 5px; 
      background: #a82877;
      font-size: 16px;
      color: #fff;
      cursor: pointer;
      }

      button:hover {
      background: #bf1e81;
      }

      @media (min-width: 568px) {
      .name-item, .city-item {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      }

      .name-item input, .city-item input {
      width: calc(50% - 20px);
      }

      .city-item select {
      width: calc(50% - 8px);
      }
      }
    </style>
  </head>


<!-- HEADER --> 

  <body>
    <div class="testbox">
      <form action="/">

<!-- BANNER TEXT --> 

        <div class="banner">
          <h1>  </h1>
        </div>
        <div class="item">



<!-- QUESTION 1, DATE OF EVENT --> 

          <p>Date of Event</p>
          <input type="date" name="bdate" />
          <i class="fas fa-calendar-alt"></i>
        </div>
        <div class="item">

<!-- QUESTION 2, TIME EVENT --> 

          <p>Time of Event</p>
          <input type="time" name="name" />
          <i class="fas fa-clock"></i>
        </div>
        <div class="item">

<!-- QUESTION 3, SELECT ARTIST--> 

          <p>Select Artist</p>
          <select>
            <option value=""></option>
            <option value="1">*Please select*</option>
            <option value="2">Artist 1</option>
            <option value="3">Artist 2</option>
            <option value="4">Artist 3</option>
            <option value="5">Artist 4</option>
          </select>
        </div>
        <div class="item">

<!-- QUESTION 4, Description of Event --> 

          <p>Description of Event</p>
          <textarea rows="3" ></textarea>
        </div>
        <div class="item">

<!-- QUESTION 5, PROMOTERS NAME --> 

          <p>Promoter's Name</p>
          <input type="text" name="name"/>
        </div>
        <div class="item">
          <p>Venue Name</p>

<!-- QUESTION 6, VENUE NAME --> 

          <input type="text" name="name"/>
        </div>
        <div class="item">

<!-- QUESTION  7, VENUE ADDRESS--> 

          <p>Venue Address</p>
          <input type="text" name="name" placeholder="Street address" />
          <input type="text" name="name" placeholder="Street address line 2" />
          <div class="city-item">
            <input type="text" name="name" placeholder="City" />
            <input type="text" name="name" placeholder="Region" />
            <input type="text" name="name" placeholder="Postal / Zip code" />

            <select>
              <option value="">Country</option>
              <option value="1">Russia</option>
              <option value="2">Germany</option>
              <option value="3">France</option>
              <option value="4">Armenia</option>
              <option value="5">USA</option>
            </select>
          </div>
        </div>
        <div class="item">

<!-- QUESTION 8, VENUE CAPACITY --> 

          <p>Venue Capacity</p>
          <input type="text" name="name"/>
        </div>
        <div class="item">

<!-- QUESTION 9, EXPECTED ATTENDANCE  --> 

          <p>Expected Attendance</p>
          <input type="text" name="name"/>
        </div>
        <div class="item">

<!-- QUESTION 10, TYPE OF PERFORMANCE --> 

          <p>Type of Performance</p>
          <select>
            <option value=""></option>
            <option value="1">*Please select*</option>
            <option value="2">Solo Performance</option>
            <option value="3">Full Band</option>
          </select>
        </div>
        <div class="item">

<!-- QUESTION 11, SET TIME  --> 

          <p>Set Time (in minutes)</p>
          <input type="text" name="name"/>
        </div>
        <div class="item">

<!-- QUESTION 12, CONTACT PERSON  --> 

          <p>Contact Person</p>
          <div class="name-item">
            <input type="text" name="name" placeholder="First" />
            <input type="text" name="name" placeholder="Last" />
          </div>
        </div>
        <div class="item">

<!-- QUESTION 13, CONTACT EMAIL  --> 

          <p>Contact Email</p>
          <input type="text" name="name"/>
        </div>
        <div class="item">

<!-- QUESTION 14, CONTACT NUMBER  --> 

          <p>Contact Number</p>
          <input type="text" name="name"/>
        </div>
        <div class="question">

<!-- QUESTION 15, WILL THIS EVENT BE RECORDED --> 

          <p>Will this event be recorded?</p>
          <div class="question-answer">
            <div>
              <input type="radio" value="none" id="radio_1" name="recorded" />
              <label for="radio_1" class="radio"><span>Yes</span></label>
            </div>
            <div>
              <input type="radio" value="none" id="radio_2" name="recorded" />
              <label for="radio_2" class="radio"><span>No</span></label>
            </div>
          </div>
        </div>

<!-- BUTTON --> 

        <div class="btn-block">
          <button type="submit" href="/">SEND</button>
        </div>
      </form>
    </div>
  </body>
</html>
```
