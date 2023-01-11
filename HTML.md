# CODE-LIBRARY

HTML FORM - https://www.w3docs.com/tools/editor/5943

 * [TEMPLATE](#TEMPLATE)
 * [ORIGINAL](#ORIGINAL)
 * [NEW](#NEW)

----------------------------------------------------------

### TEMPLATE

``` html
<!DOCTYPE html>
<html>

<!-- FONT, LIKELY IF NOT USING A PICTURE--> 

  <head>
    <title>x </title>
    <link href=https://fonts.googleapis.com/css?family=Roboto:300,400,500,700 rel="stylesheet">
    <link rel="stylesheet" href=https://use.fontawesome.com/releases/v5.5.0/css/all.css integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

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
      background-image: url(https://www.msd.govt.nz/webadmin/images/msd-logo-blue.svg);      
      background-size: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      background-repeat: no-repeat;
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
      right: 0;_30px
      z-index: 2;
      opacity: 0;
      cursor: pointer;
      }

     input[type="time"]::-webkit-inner-spin-button {
      margin: 2px 22px 0 0;
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
      width: calc 50% - 20px);
      }

      .city-item select {
      width: calc(50% - 8px);
      }

            /*  -----------------------------------------------------RADIO --------------------------------------------------- */

     input[type=radio], input.other {
      display: none;
      }
      label.radio {
      position: relative;
      display: inline-block;
      margin: 10px 0px 0px 0px;
      cursor: pointer;
      padding-left: 30px;
      }

      .question span {
      margin-left: 0px;
  

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


      /*  -----------------------------------------------------LIST BOX --------------------------------------------------- */

  .checkbox-inline {
  columns: 1;
  border: solid 1px ;
  display: inline-block;
  position: relative;
  text-align: top;  
 margin: -2px -2px -2px -2px;
}

/*  --------------------------------------------------CHECK BOX SPECIFIC ------------------------------------------------- */

  .box {
        margin-bottom: 0px;
        margin-top: 0px;
        margin-right: 5px
        display: block;
        position: relative;
        padding-left: 35px;
        cursor: pointer;
        font-size: 10px;
        text-align:left;  
        columns: 1;
        display: inline-block;
        border: solid 1px ;
        width: 110px;
        height: 27px;
        }

      }
      /* Hide the default style of the checkbox */
      input[type=checkbox] {
        visibility: hidden;
      }
      /* Create a custom checkbox */
      .mark {
        position: absolute;
        top: 0;
        left: 0;
        height: 25px;
        width: 25px;
        border: 1px solid #ccc;
        background-color: #999999;

      }

.mark-inline {
  -webkit-columns: 3;
  -moz-columns: 3;
  columns: 5
  rows 3;
}

      /* Specify the background color for the checkbox while hovering */
      .box:hover input + .mark {
       background-color: #1c87c9;
      }

      /* Specify the background color for the checkbox when the checkbox is active */
      .box input:active + .mark {
        background-color: #ffcc00;
      }

      /* Specify the background color for the checkbox when it is checked */
      .box input:checked + .mark {
       background-color: #8ebf42;
      }

      /* Checkmark to be shown in checkbox */
      /* It will not be shown when not checked */
      .mark:after {
        content: "";
        position: absolute;
        display: none;
      }

      /* Display checkmark when checked */
      .box input:checked + .mark:after {
        display: block;
      }

      /* Styling the checkmark using webkit */
      /* Rotated the rectangle by 45 degree and showing only two border to make it look like a tick mark */
      .box .mark:after {
        left: 8px;
        bottom: 5px;
        width: 6px;
        height: 12px;
        border: solid #eee;
        border-width: 0 4px 4px 0;
        -webkit-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        transform: rotate(45deg);
      }
      }
      /*  --------------------------------------------------CHECK BOX END------------------------------------------------- */

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

  <!--    --------------------------------------------------QUESTIONS------------------------------------------------- --> 


<!-- DATE --> 

          <p>Date </p>
          <input type="date" name="bdate" />
          <i class="fas fa-calendar-alt"></i>
        </div>
        <div class="item">

<!-- TIME --> 

          <p>Time </p>
          <input type="time" name="name" />
          <i class="fas fa-clock"></i>
        </div>
        <div class="item">

<!-- BOOLEAN --> 

        <p>Boolean</p>
          <select>
            <option value="1">*Please select*</option>
            <option value="2">Yes </option>
            <option value="3">No</option>
          </select>
        </div>
        <div class="item">

<!-- DROPDOWN --> 

          <p>Dropdown</p>
            <select>
              <option value="">*Please select*</option>
              <option value="1">Wellington</option>
              <option value="2">Christchurch</option>
              <option value="3">Auckland</option>
              <option value="4">Southern</option>
              <option value="5">Central</option>
            </select>
          </div>
        <div class="item">

<!-- NAME  --> 

          <p>Name</p>
          <div class="name-item">
            <input type="text" name="name" placeholder="First" />
            <input type="text" name="name" placeholder="Last" />
          </div>
</div>
        <div class="item">



<!-- FREE TEXTBOX  --> 

          <p>Text</p>
          <input type="text" name="name"/>
        </div>
        <div class="item">

<!-- CHECKBOX INLINE  --> 

<fieldset class="checkbox-inline">
  <legend>Checkbox List</legend>

      <label class="box">Test
        <input type="checkbox"> 
        <span class="mark"></span>
      </label>

        <label class="box">Test
        <input type="checkbox">
        <span class="mark"></span>
      </label>

      <label class="box">Test
        <input type="checkbox">
        <span class="mark"></span>
      </label>

      <label class="box">Test
        <input type="checkbox">
        <span class="mark"></span>
      </label>

      <label class="box">Test
        <input type="checkbox">
        <span class="mark"></span>
      </label>

</fieldset>

<!-- CHECKBOX --> 

     <p style="margin-top:15px">Custom checkboxes</p>
     
      <label class="box">One
        <input type="checkbox" >
        <span class="mark"></span>
      </label>

      <label class="box">Two
        <input type="checkbox" checked="checked">
        <span class="mark"></span>
      </label>

      <label class="box">Three
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

      <label class="box">Four
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

      <label class="box">Five
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

      <label class="box">Six
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

     <label class="box">Seven
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

     <label class="box">Eight
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

     <label class="box">Nine
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

     <label class="box">Ten
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

<!-- RADIO BUTTON -->

   <p style="margin-top:10px">Radio Button</p> 

            <div>
              <input type="radio" value="none" id="radio_1" name="recorded" />
              <label for="radio_1" class="radio"><span>Yes</span></label>
            </div>

            <div>
              <input type="radio" value="none" id="radio_2" name="recorded" />
              <label for="radio_2" class="radio"><span>No</span></label>
            </div>

            <div>
              <input type="radio" value="none" id="radio_3" name="recorded" />
              <label for="radio_3" class="radio"><span>Other</span></label>
            </div>

            </div>
       </div>

<!-- COMPLETE BUTTON --> 

        <div class="btn-block">
          <button type="submit" href="/">COPY</button>
        </div>

      </form>
    </div>

  </body>
</html>

```

### ORIGINAL

```
HTML

<!DOCTYPE html>
<html>

<!-- FONT, LIKELY IF NOT USING A PICTURE--> 

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


### NEW
```
HTML
<!DOCTYPE html>
<html>

<!-- FONT, LIKELY IF NOT USING A PICTURE--> 

  <head>
    <title>x </title>
    <link href=https://fonts.googleapis.com/css?family=Roboto:300,400,500,700 rel="stylesheet">
    <link rel="stylesheet" href=https://use.fontawesome.com/releases/v5.5.0/css/all.css integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

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
      background-image: url(https://www.msd.govt.nz/webadmin/images/msd-logo-blue.svg);      
      background-size: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      background-repeat: no-repeat;
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
      right: 0;_30px
      z-index: 2;
      opacity: 0;
      cursor: pointer;
      }

     input[type="time"]::-webkit-inner-spin-button {
      margin: 2px 22px 0 0;
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
      width: calc 50% - 20px);
      }

      .city-item select {
      width: calc(50% - 8px);
      }

            /*  -----------------------------------------------------RADIO --------------------------------------------------- */

     input[type=radio], input.other {
      display: none;
      }
      label.radio {
      position: relative;
      display: inline-block;
      margin: 10px 0px 0px 0px;
      cursor: pointer;
      padding-left: 30px;
      }

      .question span {
      margin-left: 0px;
  

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


      /*  -----------------------------------------------------LIST BOX --------------------------------------------------- */

  .checkbox-inline {
  columns: 1;
  border: solid 1px ;
  display: inline-block;
  position: relative;
  text-align: top;  
 margin: -2px -2px -2px -2px;
}

/*  --------------------------------------------------CHECK BOX SPECIFIC ------------------------------------------------- */

  .box {
        margin-bottom: 0px;
        margin-top: 0px;
        margin-right: 5px
        display: block;
        position: relative;
        padding-left: 35px;
        cursor: pointer;
        font-size: 10px;
        text-align:left;  
        columns: 1;
        display: inline-block;
        border: solid 1px ;
        width: 110px;
        height: 27px;
        }

      }
      /* Hide the default style of the checkbox */
      input[type=checkbox] {
        visibility: hidden;
      }
      /* Create a custom checkbox */
      .mark {
        position: absolute;
        top: 0;
        left: 0;
        height: 25px;
        width: 25px;
        border: 1px solid #ccc;
        background-color: #999999;

      }

.mark-inline {
  -webkit-columns: 3;
  -moz-columns: 3;
  columns: 5
  rows 3;
}

      /* Specify the background color for the checkbox while hovering */
      .box:hover input + .mark {
       background-color: #1c87c9;
      }

      /* Specify the background color for the checkbox when the checkbox is active */
      .box input:active + .mark {
        background-color: #ffcc00;
      }

      /* Specify the background color for the checkbox when it is checked */
      .box input:checked + .mark {
       background-color: #8ebf42;
      }

      /* Checkmark to be shown in checkbox */
      /* It will not be shown when not checked */
      .mark:after {
        content: "";
        position: absolute;
        display: none;
      }

      /* Display checkmark when checked */
      .box input:checked + .mark:after {
        display: block;
      }

      /* Styling the checkmark using webkit */
      /* Rotated the rectangle by 45 degree and showing only two border to make it look like a tick mark */
      .box .mark:after {
        left: 8px;
        bottom: 5px;
        width: 6px;
        height: 12px;
        border: solid #eee;
        border-width: 0 4px 4px 0;
        -webkit-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        transform: rotate(45deg);
      }
      }
      /*  --------------------------------------------------CHECK BOX END------------------------------------------------- */

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

  <!--    --------------------------------------------------QUESTIONS------------------------------------------------- --> 


<!-- QUESTION DATE OF SURVEY--> 

          <p>Date of Survey</p>
          <input type="date" name="bdate" />
          <i class="fas fa-calendar-alt"></i>
        </div>
        <div class="item">

<!-- QUESTION TIME OF SURVEY--> 

          <p>Time of Survey</p>
          <input type="time" name="name" />
          <i class="fas fa-clock"></i>
        </div>
        <div class="item">



<!-- QUESTION WHERE ARE YOU CURRENTLY LIVING--> 

          <p>Where are you currently living</p>
          <select>
            <option value="1">*Please select*</option>
            <option value="2">Living in a car </option>
            <option value="3">Living in a tent</option>
            <option value="4">In a homeless/night shelter </option>
            <option value="5">In a public place</option>
            <option value="6">Transient </option>
            <option value="7">Couch surfing </option>
            <option value="8">Marae</option>
            <option value="9">Cabin </option>
            <option value="10">Caravan </option>
            <option value="11">Camp Ground </option>
            <option value="12">Other (e.g. Garage) </option>
            <option value="13">Boarding </option>
            <option value="14">Staying with friends/family </option>
            <option value="15">Private rental </option>
            <option value="16">Own home </option>
            <option value="17">Hospital </option>
            <option value="18">Prison </option>

          </select>
        </div>
        <div class="item">

<!--  ALTERNATIVE--> 


<p style="margin-top:10px">Where are you currently living</p>
     
      <label class="box">Living in a car <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Living in a tent  <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">In a night shelter  <input type="checkbox" >  <span class="mark"></span>  </label>
      <label class="box">In a public place<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Transient <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Couch surfing<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Marae<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Cabin <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Caravan <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Camp Ground<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Other (e.g. Garage)<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Boarding <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">With friends/family<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Private rental <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Own home<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Hospital      <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Prison <input type="checkbox" >  <span class="mark"></span>   </label>

<!-- QUESTION WHY ARE YOU NEEDING HELP? --> 

<p style="margin-top:10px"> Why are you needing help </p>
     
      <label class="box">Financial stress <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Employment reasons   <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Medical<input type="checkbox" >  <span class="mark"></span>  </label>
      <label class="box">Public Transport<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Tenancy ending <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Tenancy eviction<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Unhealthy house<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Family reasons <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Personal Safety <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Children<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Gang Affiliation concern<input type="checkbox" >  <span class="mark"></span>   </label>

<!-- QUESTION IF OTHER? --> 

           <p style="margin-top:10px"> If there is another reason you are needing help not listed above, please enter here?</p>
          <input type="text" name="name" placeholder="*Type here*"/>
        </div>
        <div class="item">

<!-- QUESTION How long have you been in your current accommodation? --> 

          <p>How long have you been in your current accommodation?</p>
          <input type="text" name="name" placeholder="*Type here*"/>
        </div>
        <div class="item">

<!-- QUESTION If we could provide some support could you stay where you are? --> 

        <p>If we could provide some support could you stay where you are</p>
          <select>
            <option value="1">*Please select*</option>
            <option value="2">Yes </option>
            <option value="3">No</option>
          </select>
        </div>
        <div class="item">

<!-- QUESTION  Do you have children --> 

          <p>Do you have children</p>
          <select>
              <option value="1">*Please select*</option>
              <option value="2">Yes</option>
              <option value="3">No</option>
          <select>
        </div>
        <div class="item">

<!-- QUESTION WHEN DO YOU NEED TO MOVE --> 

          <p>When do you need to move</p>
            <select>
              <option value="">*Please select*</option>
              <option value="1">Immediately</option>
              <option value="2">7 days or less</option>
              <option value="3">8-60 days</option>
              <option value="4">61-91 days</option>
            </select>
        </div>
        <div class="item">

<!-- QUESTION Who is in your household and who is needing housing assistance?? --> 

        <p style="margin-top:10px"> Who is in your household and who is needing housing assistance?? </p>
        <textarea rows="3">
*Type here*
        </textarea >
        </div>
        <div class="item">

<!-- QUESTION 6 WHAT OTHER HOUSING OPTIONS HAVE YOU BEEN LOOKING AT ?  --> 
          <p>What other housing options have you been looking at and applying for?</p>
          <select>
            <option value="1">*Please select*</option>
            <option value="2">Searched for houses/accommodation online </option>
            <option value="3">Talked to family or friends </option>
            <option value="4">Applied for houses/accommodation </option>
            <option value="5">Registered with real estate agents</option>
            <option value="6">Found a place</option>
            <option value="7">Have not begun looking</option>

          </select>
        </div>
        <div class="item">

<!-- ALTERNATIVE ?  --> 

<p style="margin-top:10px"> What other housing options have you been looking at and applying for? </p>
     
      <label class="box">Searched online<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Talked family /friends <input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Applied <input type="checkbox" >  <span class="mark"></span>  </label>
     <label class="box">Estate agents<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Found a place<input type="checkbox" >  <span class="mark"></span>   </label>
      <label class="box">Not started<input type="checkbox" >  <span class="mark"></span>   </label>
</label>




<!-- ------------------------------------------- -->

<!-- QUESTION  REGION--> 

          <p>Region</p>
            <select>
              <option value="">*Please select*</option>
              <option value="1">Wellington</option>
              <option value="2">Christchurch</option>
              <option value="3">Auckland</option>
              <option value="4">Southern</option>
              <option value="5">Central</option>
            </select>
          </div>
        <div class="item">






<!-- QUESTION 11, x  --> 

          <p>x</p>
          <select>
            <option value="1">*Please select*</option>
            <option value="2">Option1</option>
            <option value="3">Option2</option>
          </select>
        </div>
        <div class="item">

<!-- QUESTION 12, NAME  --> 

          <p>x</p>
          <div class="name-item">
            <input type="text" name="name" placeholder="First" />
            <input type="text" name="name" placeholder="Last" />
          </div>
</div>
        <div class="item">



<!-- QUESTION 13, x  --> 

          <p>x</p>
          <input type="text" name="name"/>
        </div>
        <div class="item">

<!-- QUESTION 14, x  --> 

<fieldset class="checkbox-inline">
  <legend>Checkbox List</legend>

      <label class="box">Test
        <input type="checkbox"> 
        <span class="mark"></span>
      </label>

        <label class="box">Test
        <input type="checkbox">
        <span class="mark"></span>
      </label>

      <label class="box">Test
        <input type="checkbox">
        <span class="mark"></span>
      </label>

      <label class="box">Test
        <input type="checkbox">
        <span class="mark"></span>
      </label>

      <label class="box">Test
        <input type="checkbox">
        <span class="mark"></span>
      </label>

</fieldset>

<!-- CHECKBOX --> 

     <p style="margin-top:15px">Custom checkboxes</p>
     
      <label class="box">One
        <input type="checkbox" >
        <span class="mark"></span>
      </label>

      <label class="box">Two
        <input type="checkbox" checked="checked">
        <span class="mark"></span>
      </label>

      <label class="box">Three
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

      <label class="box">Four
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

      <label class="box">Five
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

      <label class="box">Six
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

     <label class="box">Seven
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

     <label class="box">Eight
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

     <label class="box">Nine
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

     <label class="box">Ten
        <input type="checkbox">
        <span class="mark"> </span>
        </label>

<!-- QUESTION 15, Radio Button -->

   <p style="margin-top:10px">Radio Button</p> 

            <div>
              <input type="radio" value="none" id="radio_1" name="recorded" />
              <label for="radio_1" class="radio"><span>Yes</span></label>
            </div>

            <div>
              <input type="radio" value="none" id="radio_2" name="recorded" />
              <label for="radio_2" class="radio"><span>No</span></label>
            </div>

            <div>
              <input type="radio" value="none" id="radio_3" name="recorded" />
              <label for="radio_3" class="radio"><span>Other</span></label>
            </div>

            </div>
       </div>

<!-- COMPLETE BUTTON --> 

        <div class="btn-block">
          <button type="submit" href="/">COPY</button>
        </div>

      </form>
    </div>

  </body>
</html>
```

