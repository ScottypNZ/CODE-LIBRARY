# CODE-LIBRARY

HTML FORM - https://www.w3docs.com/tools/editor/5943

 * [TEMPLATE](#TEMPLATE)
 * [ORIGINAL](#ORIGINAL)
 * [NEW](#NEW)
 * [SAVE TO FILE](#SAVE-TO-FILE)
 * [TAB](#TAB)
 * [CLIENT FORM](#CLIENT-FORM)
 * [LATEST](#LATEST)
 

----------------------------------------------------------

### TEMPLATE

``` html
<!DOCTYPE html>
<html>

<!--  --------------------  HEADER TEXT FORMATTING--------------------  --> 

<!-- HEADER --> 

  <body>
    <div class="testbox">
      <form action="/">

<!-- BANNER TEXT --> 

        <div class="banner">
          <h1>  </h1>
        </div>
        <div class="item">

<!--  --------------------  GENERAL FORMATTING--------------------  --> 

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
      color: #bbb;
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

      .btn-block  {
      margin-top: 10px;

      display: flex;
      justify-content: center;
      }

      button {
      width: 150px;
      height: 75px;
      margin: 10px;
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

      .item {
      position: relative;
      margin: 10px 0;
      }

      [type="date"]::-webkit-calendar-picker-indicator {
      background-size: 18px;
      background-position: 100% center;
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

  </style>
  </head>



  <!--    --------------------------------------------------QUESTION TYPES------------------------------------------------- --> 

 <form method="post">

<!-- DATE --> 

       <p>Date </p>
       <input type="date" name="date"  min="1900-01-01" value="2000-01-01"/>
        </div>
        <div class="item">

<!-- TIME --> 

       <p>Time </p>
       <input type="time" name="name" />
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

<!-- SELECT MULTIPLE --> 

<p>Select Prefered Car (hold down Ctrl button to select multiple) </p>

  <select multiple>
    <option value="volvo">Volvo</option>
    <option value="saab">Saab</option>
    <option value="fiat">Fiat</option>
    <option value="audi">Audi</option>
 <select>
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
        <input type="checkbox">
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
        <input type="checkbox". id ="check10">
        <span class="mark"> </span>
        </label>

<!-- RADIO BUTTON -->

   <p style="margin-top:10px" 

>Radio Button</p> 

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

<!-- FREE TEXT  --> 

          <p> Free text </p>
          <div class="item">
          <input type="text" name="freetext" id="FreeText">
          </div>

<!-- BUTTON --> 

        <div class="btn-block">
        <button type="button" onclick="alert('Alert box');">ALERT</button>
       <button type="button" onclick="myFunction()">COPY TO CLIPBOARD </button>
        </div>
 
<script>
function myFunction() {
var ExportText = 

'---/\n'+
'Question1: '+document.getElementById("FreeText").value+';'+
'\nQuestion2:'+
'\nQuestion3';

navigator.clipboard.writeText(ExportText);
alert('Text copied to clipboard');
}
</script>  

 
</body>
</html>




```


### NEW
```html
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

### TAB

```HTML
<!DOCTYPE html>
<html lang="en">
  
<head>
    <style>
        body {
            background: rgb(140, 214, 30);
        }
          
        [data-tab-info] {
            display: none;
        }
          
        .active[data-tab-info] {
            display: block;
        }
          
        .tab-content {
            font-size: 30px;
            font-family: sans-serif;
            font-weight: bold;
            color: rgb(82, 75, 75);
        }
          
        .tabs {
            font-size: 40px;
            color: rgb(255, 255, 255);
            display: flex;
            margin: 0;
        }
          
        .tabs span {
            background: rgb(28, 145, 38);
            padding: 10px;
            border: 1px solid rgb(255, 255, 255);
        }
          
        .tabs span:hover {
            background: rgb(29, 185, 112);
            cursor: pointer;
            color: black;
        }
    </style>
</head>
  
<body>
    <div class="tabs">
        <span data-tab-value="#tab_1">Tab-1</span>
        <span data-tab-value="#tab_2">Tab-2</span>
        <span data-tab-value="#tab_3">Tab-3</span>
    </div>
  
    <div class="tab-content">
        <div class="tabs__tab active" id="tab_1" data-tab-info>
            <p>Welcome to GeeksforGeek.</p>
  
        </div>
        <div class="tabs__tab" id="tab_2" data-tab-info>
            <p>Hello Everyone.</p>
  
        </div>
        <div class="tabs__tab" id="tab_3" data-tab-info>
            <p>Learn cool stuff.</p>
  
        </div>
    </div>
    <script type="text/javascript">
        const tabs = document.querySelectorAll('[data-tab-value]')
        const tabInfos = document.querySelectorAll('[data-tab-info]')
  
        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                const target = document
                    .querySelector(tab.dataset.tabValue);
  
                tabInfos.forEach(tabInfo => {
                    tabInfo.classList.remove('active')
                })
                target.classList.add('active');
            })
        })
    </script>
</body>
  
</html>
```


### SAVE TO FILE

```HTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>New Post</title>
  
  <style type="text/css" media="screen">
    body {font-family:verdana, sans-serif; color:#666; background:#fafafa; padding:20px; text-align:center;}
    #page {text-align:left; max-width:600px; margin:0 auto;} 
    h1 {font-size:16px; font-weight:normal; text-align:center;}
    label {font-size:16px;}
    label i {font-style:normal; display:inline-block; text-align:right; width:100px;}
    label textarea {vertical-align:top;}
    button {margin-left:105px; padding:5px; margin-top:5px; font-size:16px;}
    input, textarea {width:400px; font-size:16px; font-family: courier, "courier new", monospace; margin:0 0 5px 0; padding:5px; border:1px solid #eee;}
    select {margin:0 0 5px 0;}
    @media (min-width:300px) and (max-width: 768px) {
      input, textarea {width:100%;}
      label i {display:block; width:auto; text-align:left;}
      button {display:block; margin:0;}
    }
  </style>
  
  <script type="text/javascript">
    // Current date - http://stackoverflow.com/a/4929629/412329
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();

    if(dd<10) {
        dd='0'+dd
        } 

    if(mm<10) {
        mm='0'+mm
        } 

    today = yyyy+'-'+mm+'-'+dd;


    function saveFormAsTextFile()
        // Based on https://thiscouldbebetter.wordpress.com/2012/12/18/loading-editing-and-saving-a-text-file-in-html5-using-javascrip/
        {
        var textToSave =
          '---\n'+
          'title: ' + document.getElementById('title').value + '\n' + // =title
          'location: ' + document.getElementById('location').value + '\n' + // =location
          'date: ' + today + '\n' + // =date - automatically puts today's date =todo: fix bug allowing going over 60 seconds, i.e. 61 seconds
          'senses: ' + document.getElementById('senses').value + '\n' + // =senses - select menu
          'tags: ' + '\n- ' + document.getElementById('tags').value.replace(/,\s/g, "\n- ") + '\n' + 
            // =tags
            // The replace() bit above converts 'tag,tag' to '- tag\n- tag\n' with regular expressions
            // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp
          '---\n' + '\n' + 
          document.getElementById('content').value // =content;

        var textToSaveAsBlob = new Blob([textToSave], {type:"text/plain"});
        var textToSaveAsURL = window.URL.createObjectURL(textToSaveAsBlob);
        var fileNameToSaveAs = document.getElementById("filename").value;

        var downloadLink = document.createElement("a");
        downloadLink.download = fileNameToSaveAs;
        downloadLink.innerHTML = "Download File";
        downloadLink.href = textToSaveAsURL;
        downloadLink.onclick = destroyClickedElement;
        downloadLink.style.display = "none";
        document.body.appendChild(downloadLink);

        downloadLink.click();
        }

    function destroyClickedElement(event)
        {
        document.body.removeChild(event.target);
        }
  </script>
</head>

<body>
  <div id="page">
    
    <h1>New Post</h1>
  
    <label for="title">
      <i>Title</i> <!-- =title - input example -->
      <input id="title" size="40" placeholder="Title">
    </label>
    
    <br>
    
    <label for="title">
      <i>Location</i> <!-- =location - input example -->
      <input id="location" size="40" placeholder="Location">
    </label>
    
    <input type="hidden" id="date" size="40"> <!-- =date - hidden input example (automatically populated with current date in yyyy-mm-dd format) -->
    
    <br>
    
    <label for="senses"> 
      <i>Senses</i> <!-- =senses select menu example -->
      <select name="senses" id="senses" size="1">
        <option value="Touch">Touch</option>
        <option value="Sound">Sound</option>
        <option value="Sight">Smell</option>
        <option value="Sight">Taste</option>
        <option value="Sight">Sight</option>
      </select>
    </label>
    
    <br>
    
    <label for="tags">
      <i>Tags</i>  <!-- =tags textarea example -->
      <textarea id="tags" cols="40" rows="3" placeholder="tag, tag, tag"></textarea>
    </label>
    
    <br>
    
    <label for="content">
    <i>Content</i>  <!-- =content textarea example -->
    <textarea id="content" cols="40" rows="10" placeholder="Write something."></textarea>
    </label>

    <br>
    
    <label for="filename">
      <i>Filename</i>
      <input id="filename" value="" size="40" placeholder="title.md">
    </label>
    
    <button onclick="saveFormAsTextFile()">
      Save to File
    </button>
    
  </div>
</body>
</html>
```

### CLIENT FORM
```html

<!DOCTYPE html>
<html>
  <head>
    <title>Work Broker Templates</title>
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
      h4 {
      text-align: center;
      }
      form {
      width: 450px;
      padding: 20px;
      margin: 50px;
      border-radius: 6px;
      background: #fff;
      box-shadow: 0 0 20px 0 #2828a8; 
      }
      .banner {
      position: relative;
      height: 60px;
      background-size: cover;
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
      resize: vertical;
      min-height: 50px;
      padding: 5px;
      }
      input[type="checkbox"] {
      width: 30px;
      }
      .item:hover p, .item:hover i, .question:hover p, .question label:hover, input:hover::placeholder {
      color: #2828a8;
      }
      .item input:hover, .item select:hover, .item textarea:hover {
      border: 1px solid transparent;
      box-shadow: 0 0 6px 0 #2828a8;
      color: #2828a8;
      }
      .item {
      position: relative;
      margin: 10px 0;
      justify-content: flex-start !important;
      align-items: left !important;
      }
      .item select, .item textarea, .item input {
      margin-top: -10px;
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
      .subsequentOpportunity {
        margin-top: 4px !important;
      }
      .testbox {
      display: flex;
      justify-content: center;
      align-items: flex-start;
      height: inherit;
      padding: 20px;
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
      font-size: 16px;
      color: #fff;
      cursor: pointer;
      }
      #buttonCopy {
        background: #53A360;
      }
      #buttonReset {
        background: #1C5ABC;
        margin-left: 300px;
        margin-top: -20px;
        position: relative;
        top: 10px;
      }
      button:hover {
      background: #bf1e81;
      }
      @media (min-width: 568px) {
      .name-item, .city-item, .item {
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
      .noSpin::-webkit-outer-spin-button,
      .noSpin::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
      }

#snackbarCopy {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  border:5px solid;
  color: #fff;
  text-align: center;
  border-radius: 25px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  bottom: 30px;
  font-size: 17px;
  background-color: #5FBE6E;
  border-color: #53A360;
}

#snackbarCopy.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

#snackbarError {
  visibility: hidden;
  min-width: 250px;
  margin-left: -160px;
  border:5px solid;
  color: #fff;
  text-align: center;
  border-radius: 25px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  bottom: 30px;
  font-size: 17px;
  background-color: #DD2725;
  border-color: #BF1F1E;
}

#snackbarError.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;} 
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;} 
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}


.error-message {
  visibility: hidden;
  color: #cc0033;
  display: inline-block;
  font-size: 12px;
  line-height: 15px;
  margin: 5px 0 0;
}

.error-message.show {
  visibility: visible;
}

.error-label {
  color: #cc0033;
}

.error-input {
  background-color: #fce4e4;
  border: 1px solid #cc0033;
  outline: none;
}

  .inputField {
    position: relative;
    /*display: inline-block;*/
  }
  
  .item .info {
    height: 30px;
    width: 30px;
    margin-left: 10px;
    /*visibility: hidden;
    opacity: 0;
    transition: opacity 0.5s;*/
  }
  
  .item .info .question {
    height: 20px;
    width: 20px;
    margin-top: -1px;
    text-indent: 7px;
    font-weight: bold;
    color: white;
    background-color: #777;
    border-radius: 40px;
  }
  
  .item .tooltip {
    visibility: hidden;
    width: 200px;
    background-color: #7C2BE7;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
    position: relative;
    z-index: 1;
    /*bottom: 150%;*/
    top: -30px;
    left: 70%;
    margin-left: 10px;
    margin-top: 5px;
    /*margin: auto;
      <img src="images/question.png" alt="info" width="20" height="20">*/
    
    /* Fade in tooltip - takes 1 second to go from 0% to 100% opac: */
    opacity: 0;
    transition: opacity 1s;
  }
  
  .item .tooltip::after {
    content: "";
    position: absolute;
    top: 15px;
    right: 100%;
    margin-top: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: transparent #7C2BE7 transparent transparent;
  }
  
  .info:hover .tooltip {
    visibility: visible;
    /*transition-delay: 2s;*/
    opacity: 1;
  }
  
  .item:hover .info {
    /*visibility: visible;
    opacity: 1;*/
  }

  .collapsible {
    background-color: #777;
    color: white;
    /*cursor: pointer;*/
    /*padding: 10px;*/
    margin-top: -1px;
    margin-left: 10px;
    width: 10px;
    height: 10px;
    border: none;
    outline: none;
    font-size: 15px;
    line-height: 0.1;
  }
  
  .active, .collapsible:hover {
    background-color: #555;
  }
  
  .collapsible:after {
    content: '\002B';
    color: white;
      font-weight: bold;
    /*float: right;*/
    margin-left: -4px;
  }
  
  .active:after {
    content: "\2212";
    white-space: pre;
  }
  
  .content {
    display:block;
    padding: 0 18px;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
    background-color: #f1f1f1;
    margin-bottom: 0;
  }
  
  /*.content:before {
    content:"\000A";
    white-space: pre;
  }*/
    </style>
  </head>
  <body onload="setContactDate('both')">
    <div class="testbox">
      <form id="clientForm" action="/">
        <div class="banner">
          <h1>Client Contact</h1>
        </div>
        <h4>Frontline Employment Enablers</h4>
        <div class="btn-block">
          <button id="buttonReset" type="button" onclick="resetInputs('clientForm')">Reset</button>
        </div>
        <div class="item">
          <label><input type="checkbox" id="uncontactable" onchange="textChanged(this);"/>Unable to contact client</label> <div class="info"><div class="question">?</div><div class="tooltip">When you call the client and can't get through, or a no-show</div></div>
        </div>
        <div class="item" id="clientCommentsLabel">
          <p>Comments <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">Enter your notes. This could be an email copied and pasted</div></div></p>
          <textarea class="mandatory" rows="6" id="clientComments" oninput="textChanged(this);"></textarea>
        </div>
        <div class="item">
          <p>Contact Type <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">The method used to contact the client</div></div></p>
          <select class="mandatory" id="contactType" oninput="textChanged(this);">
            <option value=""></option>
            <option value="1">Phone</option>
            <option value="2">Face to face</option>
            <option value="3">Email</option>
            <option value="4">Text</option>
          </select>
        </div>
        <div class="item" id="clientContactDateLabel">
          <p>Contact date (if different from today's date) <div class="info"><div class="question">?</div><div class="tooltip">Today's date will be recorded, unless you select another date</div></div></p>
          <input type="date" id="clientContactDate" oninput="textChanged(this);" />
          <i class="fas fa-calendar-alt"></i>
        </div>
        <div class="item" id="workReadyLabel">
          <p>Work ready (including part-time and casual) <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">Records whether the client is currently work ready</div></div></p>
          <select class="mandatory" id="workReady" oninput="textChanged(this);">
            <option value=""></option>
            <option value="1">Yes</option>
            <option value="2">No</option>
          </select>
        </div>
        <div class="item" id="workHoursLabel">
          <p>Number of hours the client is ready to work <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">Records the type of work a client is ready for (e.g. full-time, part-time)</div></div></p>
          <select class="mandatory" id="workHours" oninput="textChanged(this);">
            <option value=""></option>
            <option value="1">Less than 15</option>
            <option value="2">15 to 29</option>
            <option value="3">30+</option>
          </select>
        </div>
        <div class="item" id="reasonClientNotWorkReadyLabel" disabled style="display: none">
          <p>Reason(s) client not work ready <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">Hold down CTRL and click to select multiple reasons</div></div></p>
          <select id="reasonClientNotWorkReady" size="15"disabled style="overflow: hidden; display: none" multiple oninput="textChanged(this);">
            <option value="1">No transport</option>
            <option value="2">Child care arrangements</option>
            <option value="3">Health and mental wellbeing</option>
            <option value="4">Physical fitness</option>
            <option value="5">Age</option>
            <option value="6">Licence and qualifications</option>
            <option value="7">Experience</option>
            <option value="8">Convictions (including pending charges)</option>
            <option value="9">Unable to pass drug test</option>
            <option value="10">Location</option>
            <option value="11">Cultural/religious reasons</option>
            <option value="12">Lack of motivation, attitude and confidence</option>
            <option value="13">Hours of availability</option>
            <option value="14">CV Support</option>
            <option value="15">Other</option>
          </select>
        </div>
        <div class="item" id="referredByCMLabel">
          <p>Referred by staff (Staff name) <div class="info"><div class="question">?</div><div class="tooltip">The name of the staff member who referred this client to you</div></div></p>
          <input type="text" id="referredByCM" oninput="textChanged(this);"/>
        </div>
        <div class="item" id="outcomeGroupLabel">
          <p>Outcome Group <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">Select the Outcome Group, and then the relevant Outcome</div></p>
          </div><button type="button" class="collapsible"></button>
          <div class="content">
            <p><span style="font-weight: bold">Employment related:</span> e.g. screening, profiling, employer interview<br>
               <span style="font-weight: bold">Work related:</span> About a specific job, e.g. job placement, 5K to Work<br>
               <span style="font-weight: bold">Referrals:</span> Referral to provider, SFI, HCID or Case Manager
               </p>
          </div>
          <select class="mandatory" id="outcomeGroup" oninput="textChanged(this);">
            <option value=""></option>
            <option value="1">Employment related (e.g. screening, profiling, employer interview)</option>
            <option value="2">Work related (e.g. job placement, 5K to Work)</option>
            <option value="3">Referrals</option>
          </select>
        </div>
        <div class="item" id="outcomeLabel">
          <p>Outcome <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip" id="outcomeTooltip">The Outcome Group must be selected first</div></p>
          </div><button type="button" class="collapsible"></button>
          <div class="content">
            <p id="outcomeInfo">The Outcome Group must be selected first</p>
          </div>
          <select class="mandatory" id="outcome" oninput="textChanged(this);">
            <option value=""></option>
          </select>
        </div>
        <div class="item" id="outcomeDateContainer">
          <p id="outcomeDateLabel">Outcome date (leave blank if not applicable) <div class="info"><div class="question">?</div><div class="tooltip">The date of the outcome, if applicable</div></div></p>
          <input type="date" id="outcomeDate" oninput="textChanged(this);" />
          <i class="fas fa-calendar-alt"></i>
        </div>
        <div class="item" id="clientOpportunityNumberContainer">
          <p id="clientOpportunityNumberLabel">Opportunity number (leave blank if not applicable) <div class="info"><div class="question">?</div><div class="tooltip">The Opportunity id from CMS</div></div></p>
          <input type="number" class="noSpin" id="clientOpportunityNumber" oninput="textChanged(this);"/>
        </div>
        <div class="item">
          <p id=clientFurtherActionsLabel>Comments/Further actions <div class="info"><div class="question">?</div><div class="tooltip">Records the next steps from here</div></div></p>
          <textarea rows="4" id="clientFurtherActions" oninput="textChanged(this);"></textarea>
        </div>
        <div class="item" id="preferredIndustryLabel">
          <p>Preferred industry <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">Hold down CTRL and click to select multiple industries</div></div></p>
          <select class="mandatory" id="preferredIndustry" size="19" style="overflow: hidden" multiple oninput="textChanged(this);">
            <option value="1">Accommodation and Food Services</option>
            <option value="2">Administrative and Support Services</option>
            <option value="3">Agriculture, Forestry and Fishing</option>
            <option value="4">Arts and Recreation Services</option>
            <option value="5">Construction</option>
            <option value="6">Education and Training</option>
            <option value="7">Electricity, Gas, Water and Waste Services</option>
            <option value="8">Financial and Insurance Services</option>
            <option value="9">Health Care and Social Assistance</option>
            <option value="10">Horticulture</option>
            <option value="11">Information Media and Telecommunications</option>
            <option value="12">Manufacturing</option>
            <option value="13">Personal Services</option>
            <option value="14">Professional, Scientific and Technical Services</option>
            <option value="15">Public Administration and Safety</option>
            <option value="16">Rental, Hiring and Real Estate Services</option>
            <option value="17">Retail Trade</option>
            <option value="18">Transport, Postal and Warehousing</option>
            <option value="19">Wholesale Trade</option>
          </select>
        </div>
        <div class="item" id="declinedTemplateToCMLabel">
          <p>Declined template submitted to Case Manager (Northland)</span> <div class="info"><div class="question">?</div><div class="tooltip">Records whether the Northland declined template was sent</div></div></p>
          <select id="declinedTemplateToCM" oninput="textChanged(this);">
            <option value=""></option>
            <option value="1">Yes</option>
            <option value="2">No</option>
          </select>
        </div>
        <div class="btn-block">
          <button id="buttonCopy" type="button" onclick="copyClientToClipboard()">Copy to clipboard</button>
        </div>
      </form>

      <form id="employerForm" action="/">
        <div class="banner">
          <h1>Employer Activity</h1>
        </div>
        <h4>Frontline Employment Enablers</h4>
        <div class="btn-block">
          <button id="buttonReset" type="button" onclick="resetInputs('employerForm')">Reset</button>
        </div>
        <div class="item">
          <p>Comments <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">Enter your notes. This could be an email copied and pasted</div></div></p>
          <textarea class="mandatory" rows="6" id="employerComments" oninput="textChanged(this);"></textarea>
        </div>
        <div class="item">
          <p>New/existing employer <div class="info"><div class="question">?</div><div class="tooltip">Whether we've had contact in the last 12 months</div></div></p>
          <select id="newExisting" oninput="textChanged(this);">
            <option value=""></option>
            <option value="1">New</option>
            <option value="2">Existing</option>
          </select>
        </div> <!-- https://stackoverflow.com/questions/30232146/dynamically-populating-drop-down-list-from-selection-of-another-drop-down-value -->
        
        <div class="item">
          <p>Activity Group <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">Select the Activity Group, and then the relevant Activity Type</div></p>
          </div><button type="button" class="collapsible"></button>
          <div class="content">
            <p><span style="font-weight: bold">Recruitment support:</span> e.g. profiling, interviews, IWS, FW, MiM, SFI<br>
               <span style="font-weight: bold">Networking and intelligence:</span> e.g. events, gathering info<br>
               <span style="font-weight: bold">Phone call:</span> including cold calls and marketing calls<br>
               <span style="font-weight: bold">Employer visit:</span> including cold calls and marketing meetings<br>
               <span style="font-weight: bold">Email:</span> email sent to employer
               </p>
          </div>
          <select class="mandatory" id="activityGroup" oninput="textChanged(this);">
            <option value=""></option>
            <option value="1">Recruitment support</option>
            <option value="2">Networking and intelligence</option>
            <option value="3">Employer visit</option>
            <option value="4">Other (Phone call)</option>
            <option value="5">Other (Email)</option>
          </select>
        </div>
        <div class="item" id="activityTypeLabel">
          <p>Activity Type <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip" id="activityTooltip">The Activity Group must be selected first</div></p>
          </div><button type="button" class="collapsible"></button>
          <div class="content">
            <p id="activityTypeInfo">The Activity Group must be selected first</p>
          </div>
          <select class="mandatory" id="activityType" oninput="textChanged(this);">
            <option value=""></option>
          </select>
        </div>
        <div class="item">
          <p>Contact date (if not today) <div class="info"><div class="question">?</div><div class="tooltip">Today's date will be recorded, unless you select another date</div></div></p>
          <input type="date" id="employerContactDate" oninput="textChanged(this);" />
          <i class="fas fa-calendar-alt"></i>
        </div>
        <div class="item">
          <p>Vacancy listed <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">Current vacancy means there's an Opportunity in CMS</div></div></p>
          <select class="mandatory" id="vacancyListed" oninput="textChanged(this);">
            <option value=""></option>
            <option value="1">Yes, current vacancy</option>
            <option value="2">Yes, future vacancy</option>
            <option value="3">No</option>
          </select>
        </div>
        <div class="item" id="employerOpportunityNumberLabel" disabled style="display: none">
          <p>Opportunity number(s) <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">The Opportunity id(s) from CMS</div></div></p>
          <input type="number" class="noSpin opportunityInput" id="employerOpportunityNumber1" disabled style="display: none" oninput="inputChanged(1);"/>
        </div>
        <div class="item" id="reminderDateLabel" disabled style="display: none">
          <p>Reminder date <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">The follow-up date for this vacancy</div></div></p>
          <input type="date" id="reminderDate" oninput="textChanged(this);" />
          <i class="fas fa-calendar-alt"></i>
        </div>
        <div class="item" id="numberOfPositionsLabel" disabled style="display: none">
          <p>Number of positions <div class="info"><div class="question">?</div><div class="tooltip">If known, the number of positions for this vacancy</div></div></p>
          <input type="number" id="numberOfPositions" min="1" disabled style="display: none" oninput="textChanged(this);"/>
        </div>
        <div class="item" id="roleTitlesLabel" disabled style="display: none">
          <p>Role titles/info <div class="info"><div class="question">?</div><div class="tooltip">Other info known about this vacancy</div></div></p>
          <textarea rows="4" id="roleTitles" oninput="textChanged(this);"></textarea>
        </div>
        <div class="item" id="drugScreeningLabel">
          <p>Drug screening requirement <span style="color: red">*</span> <div class="info"><div class="question">?</div><div class="tooltip">Drug screening required for the employer or vacancy</div></div></p>
          <select class="mandatory" id="drugScreening" oninput="textChanged(this);">
            <option value=""></option>
            <option value="1">Initial screen only</option>
            <option value="2">No initial screen. Random testing while employed</option>
            <option value="3">Both initial screen and random testing</option>
            <option value="4">No drug screenings</option>
            <option value="5">Unknown</option>
          </select>
        </div>
        <div class="item">
          <p>Vaccination site <div class="info"><div class="question">?</div><div class="tooltip">Vaccination required for the employer or vacancy</div></div></p>
          <select id="vaccinationSite" oninput="textChanged(this);">
            <option value=""></option>
            <option value="1">Yes</option>
            <option value="2">No</option>
            <option value="3">Unknown</option>
          </select>
        </div>
        <div class="item">
          <p>Further actions</span> <div class="info"><div class="question">?</div><div class="tooltip">Any further actions to do with the employer or vacancy</div></div></p>
          <textarea rows="4" id="employerFurtherActions" oninput="textChanged(this);"></textarea>
        </div>
        <div class="btn-block">
          <button id="buttonCopy" type="button" onclick="copyEmployerToClipboard()">Copy to clipboard</button>
        </div>
      </form>

    <div id="snackbarCopy">Text has been copied</div>
    <div id="snackbarError">Please complete all mandatory fields</div>
    </div>
    <!--Shamelessly poached from this template https://www.w3docs.com/tools/editor/5943-->
    
    
    <script>
    var automatingElements = false;
    
    function setContactDate(formName) {
      var date = new Date();
      var dateString = date.getFullYear().toString() + '-' + (date.getMonth() + 1).toString().padStart(2, 0) + '-' + date.getDate().toString().padStart(2, 0);
      if (formName != "employerForm") {
        document.getElementById("clientContactDate").value = dateString;
      }
      if (formName != "clientForm") {
        document.getElementById("employerContactDate").value = dateString;
      }
    }
    
    function resetInputs(formName) {
      var formToReset = document.getElementById(formName);
      var mandatoryElements = formToReset.getElementsByClassName("mandatory");
      for (var i = 0; i < mandatoryElements.length; i++) {
        mandatoryElements[i].classList.remove("error-input");
      }
      document.getElementById(formName).reset();
      resetLayout(formName);
      setContactDate(formName);
    }
    
    function resetLayout(formName) {
      if (formName == "clientForm") {
        clientComments.disabled = false;
        clientComments.style.display = "";
        clientComments.classList.add("mandatory");
        clientCommentsLabel.style.display = "";
        
        workReady.disabled = false;
        workReady.style.display = "";
        workReady.classList.add("mandatory");
        workReadyLabel.style.display = "";
        
        if (document.getElementById("workReady").value == "No") {
          reasonClientNotWorkReady.disabled = false;
          reasonClientNotWorkReady.style.display = "";
          reasonClientNotWorkReady.classList.add("mandatory");
          reasonClientNotWorkReadyLabel.style.display = "";
        }
        
        referredByCM.disabled = false;
        referredByCM.style.display = "";
        referredByCMLabel.style.display = "";
        
        outcomeGroup.disabled = false;
        outcomeGroup.style.display = "";
        outcomeGroup.classList.add("mandatory");
        outcomeGroupLabel.style.display = "";
        
        outcome.disabled = false;
        outcome.style.display = "";
        outcome.classList.add("mandatory");
        outcomeLabel.style.display = "";
        
        outcomeDate.disabled = false;
        outcomeDate.style.display = "";
        outcomeDateLabel.style.display = "";
        
        //clientOpportunityNumber.disabled = true;
        //clientOpportunityNumber.style.display = "none";
        //clientOpportunityNumber.classList.remove("mandatory");
        //clientOpportunityNumberContainer.style.display = "none";
        
        preferredIndustry.disabled = false;
        preferredIndustry.style.display = "";
        preferredIndustry.classList.add("mandatory");
        preferredIndustryLabel.style.display = "";
        
        declinedTemplateToCM.disabled = false;
        declinedTemplateToCM.style.display = "";
        declinedTemplateToCMLabel.style.display = "";
        
        clientFurtherActions.classList.remove("mandatory");
        clientFurtherActionsLabel.innerHTML = "Further actions";
        
        toggleOppMandatory(document.getElementById("outcome").options[document.getElementById("outcome").selectedIndex].text);
        toggleNotWorkReadyReasons("");
        
        //Ensure that tooltips for activity type reset
        changeOutcomeCat("");
      }
      else if (formName == "employerForm") {
        resetOpportunityNumbers();
        
        reminderDate.disabled = true;
        reminderDate.style.display = "none";
        reminderDate.classList.remove("mandatory");
        reminderDateLabel.style.display = "none";
        
        numberOfPositions.disabled = true;
        numberOfPositions.style.display = "none";
        numberOfPositionsLabel.style.display = "none";
        
        roleTitles.disabled = true;
        roleTitles.style.display = "none";
        roleTitlesLabel.style.display = "none";
        
        drugScreening.disabled = false;
        drugScreening.style.display = "";
        drugScreening.classList.add("mandatory");
        drugScreeningLabel.style.display = "";
        
        //Ensure that tooltips for activity type reset
        changeActivityCat("");
      }
    }
    
    function resetOpportunityNumbers() {
      var opportunityInputs = document.getElementsByClassName("opportunityInput");
      for (var i = opportunityInputs.length; i > 1; i--) {
        document.getElementById("employerOpportunityNumber" + i).remove();
      }
      
      employerOpportunityNumber1.value = "";
      employerOpportunityNumber1.disabled = true;
      employerOpportunityNumber1.style.display = "none";
      employerOpportunityNumber1.classList.remove("mandatory");
      employerOpportunityNumberLabel.style.display = "none";
    }
    
    function copyClientToClipboard() {
      /* Test that the mandatory fields have been completed */
      /* https://sarahholleydesign.com/pure-css-custom-error-messaging-for-default-form-elements/ */
      var mandatoryComplete = true;
      var clientForm = document.getElementById("clientForm");
      var mandatoryElements = clientForm.getElementsByClassName("mandatory");
      for (var i = 0; i < mandatoryElements.length; i++) {
        if (mandatoryElements[i].value.length == 0) {
          mandatoryElements[i].classList.add("error-input");
          mandatoryComplete = false;
        }
      }
      
      
      /* https://www.w3schools.com/howto/howto_js_snackbar.asp */
      if (mandatoryComplete == false) {
        navigator.clipboard.writeText("");
        var x = document.getElementById("snackbarError");
        var rect = clientForm.getBoundingClientRect();
        x.style.left = (rect.left + (rect.width / 2)) + "px";
        x.className = "show";
        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
      }
      else {
        /* Get the text from the input elements */
        var comments = "";
        var contactType = document.getElementById("contactType").options[document.getElementById("contactType").selectedIndex].text;
        var contactDate = formatDate(document.getElementById("clientContactDate").value);
        var workReady = "";
        var workHours = "";
        var reasonClientNotWorkReady = "";
        var referredByCM = "";
        var outcome = "";
        var outcomeDate = "";
        var interviewDate = "";
        var opportunityNumber = document.getElementById("clientOpportunityNumber").value;
        var furtherActions = document.getElementById("clientFurtherActions").value;
        var preferredIndustry = "";
        var declinedTemplateToCM = "";
        
        if (uncontactable.checked == true) {
          outcome = "Uncontactable";
          comments = furtherActions;
        }
        else {
          comments = document.getElementById("clientComments").value;
          contactType = document.getElementById("contactType").options[document.getElementById("contactType").selectedIndex].text;
          workReady = document.getElementById("workReady").options[document.getElementById("workReady").selectedIndex].text;
          if (workReady == "Yes") {
            workHours = document.getElementById("workHours").options[document.getElementById("workHours").selectedIndex].text;
          }
          else {
            reasonClientNotWorkReady = getSelectValues(document.getElementById("reasonClientNotWorkReady"));
          }
          referredByCM = document.getElementById("referredByCM").value;
          outcome = document.getElementById("outcome").options[document.getElementById("outcome").selectedIndex].text;
          if (outcome == "Employer interview") {
            interviewDate = formatDate(document.getElementById("outcomeDate").value);
          }
          else {
            outcomeDate = formatDate(document.getElementById("outcomeDate").value);
          }
          opportunityNumber = document.getElementById("clientOpportunityNumber").value;
          furtherActions = document.getElementById("clientFurtherActions").value;
          preferredIndustry = getSelectValues(document.getElementById("preferredIndustry"));
          declinedTemplateToCM = document.getElementById("declinedTemplateToCM").options[document.getElementById("declinedTemplateToCM").selectedIndex].text;
          
        }
        
        if (contactDate == "") {
          var date = new Date();
          contactDate = formatDate(new Date(date.getFullYear().toString() + '/' + (date.getMonth() + 1).toString().padStart(2, 0) + '/' + date.getDate().toString().padStart(2, 0)));
        }
        
        
        /* Format the text fields ready for copying */
        var copyText = "--- #v4 Client Contact\n"
          + "Comments: " + comments + "\n"
          + "Contact type: " + contactType + "\n"
          + "Contact date: " + contactDate + "\n"
          + "Work ready: " + workReady + "\n"
          + "Number of hours ready to work: " + workHours + "\n"
          + "Reason client not work ready: " + reasonClientNotWorkReady + "\n"
          + "Referred by CM: " + referredByCM + "\n"
          + "Outcome: " + outcome + "\n"
          + "Outcome date: " + outcomeDate + "\n"
          + "Interview date: " + interviewDate + "\n"
          + "Opportunity no: " + opportunityNumber + "\n"
          + "Further actions: " + furtherActions + "\n"
          + "Preferred industry: " + preferredIndustry + "\n"
          + "Declined template submitted to CM: " + declinedTemplateToCM + "\n"
          + "--- # Template end";
        
        /* Copy the text onto the clipboard */
        navigator.clipboard.writeText(copyText);
        /* alert("Copied the text: " + copyText); */

        
        var x = document.getElementById("snackbarCopy");
        var rect = clientForm.getBoundingClientRect();
        x.style.left = (rect.left + (rect.width / 2)) + "px";
        x.className = "show";
        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
      }
    }
    
    function copyEmployerToClipboard() {
      /* Test that the mandatory fields have been completed */
      /* https://sarahholleydesign.com/pure-css-custom-error-messaging-for-default-form-elements/ */
      var mandatoryComplete = true;
      var employerForm = document.getElementById("employerForm");
      var mandatoryElements = employerForm.getElementsByClassName("mandatory");
      for (var i = 0; i < mandatoryElements.length; i++) {
        if (mandatoryElements[i].value.length == 0) {
          mandatoryElements[i].classList.add("error-input");
          mandatoryComplete = false;
        }
      }
      
      
      /* https://www.w3schools.com/howto/howto_js_snackbar.asp */
      if (mandatoryComplete == false) {
        navigator.clipboard.writeText("");
        var x = document.getElementById("snackbarError");
        var rect = employerForm.getBoundingClientRect();
        x.style.left = (rect.left + (rect.width / 2)) + "px";
        x.className = "show";
        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
      }
      else {
        /* Get the text from the input elements */
        var comments = document.getElementById("employerComments").value;
        var newExisting = document.getElementById("newExisting").options[document.getElementById("newExisting").selectedIndex].text;
        var activityType = "";
        if (document.getElementById("activityType").options.length > 0) {
          activityType = document.getElementById("activityType").options[document.getElementById("activityType").selectedIndex].text;
        }
        else {
          activityType = document.getElementById("activityGroup").options[document.getElementById("activityGroup").selectedIndex].text;
          if (activityType == "Other (Email)") {
            activityType = "Email";
          }
        }
        var contactDate = formatDate(document.getElementById("employerContactDate").value);
        if (contactDate == "") {
          var date = new Date();
          contactDate = formatDate(new Date(date.getFullYear().toString() + '/' + (date.getMonth() + 1).toString().padStart(2, 0) + '/' + date.getDate().toString().padStart(2, 0)));
        }
        var vacancyListed = document.getElementById("vacancyListed").options[document.getElementById("vacancyListed").selectedIndex].text;
        var drugScreening = "";
        var opportunityNumbers = "";
        var reminderDate = "";
        var numberOfPositions = "";
        var roleTitles = "";
        if (vacancyListed == "Yes, current vacancy") {
          //opportunityNumber = document.getElementById("employerOpportunityNumber").value;
          var opportunityInputs = document.getElementsByClassName("opportunityInput");
          for (var i = 1; i <= opportunityInputs.length; i++) {
            var opportunityInput = document.getElementById("employerOpportunityNumber" + i).value;
            if (opportunityInput != "") {
              if (opportunityNumbers == "") {
                opportunityNumbers = opportunityInput;
              }
              else {
                opportunityNumbers = opportunityNumbers.concat(" # ", opportunityInput);
              }
            }
          }
        }
        else if (vacancyListed == "Yes, future vacancy") {
          reminderDate = formatDate(document.getElementById("reminderDate").value);
          numberOfPositions = document.getElementById("numberOfPositions").value;
          roleTitles = document.getElementById("roleTitles").value;
          drugScreening = document.getElementById("drugScreening").options[document.getElementById("drugScreening").selectedIndex].text;
        }
        else {
          drugScreening = document.getElementById("drugScreening").options[document.getElementById("drugScreening").selectedIndex].text;
        }
        var vaccinationSite = document.getElementById("vaccinationSite").options[document.getElementById("vaccinationSite").selectedIndex].text;
        var furtherActions = document.getElementById("employerFurtherActions").value;
      
        /* Format the text fields ready for copying */
        var copyText = "--- #v3 Employer Activity\n"
          + "Comments: " + comments + "\n"
          + "New/existing employer: " + newExisting + "\n"
          + "Activity type: " + activityType + "\n"
          + "Contact date: " + contactDate + "\n"
          + "Vacancy listed: " + vacancyListed + "\n"
          + "Drug screening requirement: " + drugScreening + "\n"
          + "Opportunity number: " + opportunityNumbers + "\n"
          + "Reminder date: " + reminderDate + "\n"
          + "Number of positions: " + numberOfPositions + "\n"
          + "Role titles: " + roleTitles + "\n"
          + "Vaccination site: " + vaccinationSite + "\n"
          + "Further actions: " + furtherActions + "\n"
          + "--- # Template end";
        
        /* Copy the text onto the clipboard */
        navigator.clipboard.writeText(copyText);
        /* alert("Copied the text: " + copyText); */

        
        var x = document.getElementById("snackbarCopy");
        var rect = employerForm.getBoundingClientRect();
        x.style.left = (rect.left + (rect.width / 2)) + "px";
        x.className = "show";
        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
      }
    }
    
    function formatDate(dateString) {
      var myDate = new Date(dateString);
      var yyyy = myDate.getFullYear();
      var mm = myDate.getMonth() + 1; // Months start at 0!
      var dd = myDate.getDate();
      
      if (isNaN(dd) || isNaN(mm) || isNaN(yyyy)) {
        return "";
      }
      
      if (dd < 10) dd = '0' + dd;
      if (mm < 10) mm = '0' + mm;
      
      myDate = dd + '/' + mm + '/' + yyyy;
      
      return myDate;
    }
    
    function inputChanged(rowNumber) {
      if (automatingElements == true) {
        return;
      }
      
      var opportunityInputs = document.getElementsByClassName("opportunityInput");
      var lastRow = opportunityInputs.length;
      if (rowNumber == lastRow || rowNumber == lastRow - 1) {
        //change happened on one of the bottom two rows
        if (document.getElementById("employerOpportunityNumber" + lastRow).value != "") {
          //bottom opportunity is populated
          createNewOpportunity(lastRow + 1);
        }
        else if (lastRow > 1) {
          if (document.getElementById("employerOpportunityNumber" + (lastRow - 1)).value == "") {
            //both of the bottom two opportunity numbers are empty
            document.getElementById("employerOpportunityNumber" + lastRow).remove();
            inputChanged(lastRow - 1);
          }
        }
      }
      textChanged(opportunityInputs[0]);
    }
    
    function createNewOpportunity(newRowNumber) {
      automatingElements = true;
      
      //Create new input element
      var input = document.createElement("input");
      input.type = "number";
      input.className = "noSpin opportunityInput subsequentOpportunity";
      input.id = "employerOpportunityNumber" + newRowNumber;
      
      //Insert new input element into the HTML
      var lastInput = document.getElementById("employerOpportunityNumber" + (newRowNumber - 1));
      lastInput.parentNode.insertBefore(input, lastInput.nextSibling);
      
      //Add event handler for "oninput"
      input.addEventListener("input", function(){
          inputChanged(newRowNumber);
        }, false);
      automatingElements = false;
    }
    
    function getSelectValues(select) {
      var result = "";
      var options = select && select.options;
      var opt;
      
      for (var i=0, iLen=options.length; i<iLen; i++) {
        opt = options[i];
        
        if (opt.selected) {
          //result.push(opt.text);
          if (result == "") {
            result = opt.text;
          }
          else {
            result = result + " # " + opt.text;
          }
        }
      }
      return result;
    }
    
    function textChanged(el) {
      if (el.value.length != 0) {
        el.classList.remove("error-input");
      }
      if (el.id == "outcomeGroup") {
        changeOutcomeCat(el.options[el.selectedIndex].text);
      }
      if (el.id == "outcome") {
        toggleOppMandatory(el.options[el.selectedIndex].text);
      }
      if (el.id == "workReady") {
        toggleNotWorkReadyReasons(el.options[el.selectedIndex].text);
      }
      if (el.id == "uncontactable") {
        if (el.checked == true) {
          clientComments.disabled = true;
          clientComments.style.display = "none";
          clientComments.classList.remove("mandatory");
          clientCommentsLabel.style.display = "none";
          
          workReady.disabled = true;
          workReady.style.display = "none";
          workReady.classList.remove("mandatory");
          workReadyLabel.style.display = "none";
          
          reasonClientNotWorkReady.disabled = true;
          reasonClientNotWorkReady.style.display = "none";
          reasonClientNotWorkReady.classList.remove("mandatory");
          reasonClientNotWorkReadyLabel.style.display = "none";
          
          workHours.disabled = true;
          workHours.style.display = "none";
          workHours.classList.remove("mandatory");
          workHoursLabel.style.display = "none";
          
          referredByCM.disabled = true;
          referredByCM.style.display = "none";
          referredByCMLabel.style.display = "none";
          
          outcomeGroup.disabled = true;
          outcomeGroup.style.display = "none";
          outcomeGroup.classList.remove("mandatory");
          outcomeGroupLabel.style.display = "none";
          
          outcome.disabled = true;
          outcome.style.display = "none";
          outcome.classList.remove("mandatory");
          outcomeLabel.style.display = "none";
          
          outcomeDate.disabled = true;
          outcomeDate.style.display = "none";
          outcomeDateContainer.style.display = "none";
        
          toggleOppMandatory("");
          
          preferredIndustry.disabled = true;
          preferredIndustry.style.display = "none";
          preferredIndustry.classList.remove("mandatory");
          preferredIndustryLabel.style.display = "none";
          
          declinedTemplateToCM.disabled = true;
          declinedTemplateToCM.style.display = "none";
          declinedTemplateToCMLabel.style.display = "none";
          
          clientFurtherActions.classList.add("mandatory");
          clientFurtherActionsLabel.innerHTML = "Comments/Further actions <span style='color: red'>*</span>";
        }
        else {
          resetLayout("clientForm");
        }
      }
      
      if (el.id == "activityGroup") {
        changeActivityCat(el.options[el.selectedIndex].text);
      }
      if (el.id == "vacancyListed") {
        toggleOppDetails(el.options[el.selectedIndex].text);
      }
      
      if (el.id == "numberOfPositions") {
        if(el.value != ""){
          if(parseInt(el.value) < parseInt(el.min)){
            el.value = el.min;
          }
        }
      }
    }
    
    var outcomesByGroup = {
      Employment_related_: ["", "WB interviewed/screened", "Empex Screened (Northland)", "Profiled to employer", "Employer interview", "Employer Engagement Initiative (TaiTokerau)"],
      Work_related_: ["", "Job placement", "Job exit", "Client declined job", "5K to Work", "In-work Support", "Work related engagement"],
      Referrals: ["", "Referred to provider", "Referred to SFI", "HCID referral", "Referred to CM"]
    }
    
    var outcomesInfoByGroup = {
      Employment_related_: "<span style='font-weight: bold'>WB interviewed/screened:</span> Client has been screened<br><span style='font-weight: bold'>Empex Screened (Northland):</span> Northland only<br><span style='font-weight: bold'>Profiled to employer:</span> Client has been profiled to employer<br><span style='font-weight: bold'>Employer interview:</span> Client has an interview date set<br><span style='font-weight: bold'>Employer Engagement Initiative (TaiTokerau):</span> Northland only",
      Work_related_: "<span style='font-weight: bold'>Job placement:</span> Client has been placed in a job<br><span style='font-weight: bold'>Job exit:</span> e.g. client's benefit to be cancelled<br><span style='font-weight: bold'>Client declined job:</span> The client declined the job<br><span style='font-weight: bold'>5K to Work:</span> The conversation was about 5K to Work<br><span style='font-weight: bold'>In-work Support:</span> The conversation was In-work Support<br><span style='font-weight: bold'>Work related engagement:</span> To do with employment",
      Referrals: "<span style='font-weight: bold'>Referred to provider:</span> Client has been referred to a provider<br><span style='font-weight: bold'>Referred to SFI:</span> Client referred to Skills for Industry<br><span style='font-weight: bold'>HCID referral:</span> Client referred to HCID<br><span style='font-weight: bold'>Referred to CM:</span> Client referred to a Case Manager"
    }
    
    function changeOutcomeCat(value) {
      myValue = value.substr(0, value.indexOf('e.g.')).replace(" ", "_").replace(" ", "_").replace("and ", "").replace("(", "").replace(")", "");
      if (myValue == "") myValue = value.replace(" ", "_").replace(" ", "_").replace("and ", "").replace("(", "").replace(")", "");
      var outcomeTooltip = document.getElementById("outcomeTooltip");
      var outcomeInfo = document.getElementById("outcomeInfo");
      if (myValue.length == 0) {
        document.getElementById("outcomeGroup").value = "";
        document.getElementById("outcome").innerHTML = "<option value=''></option>";
        outcomeTooltip.innerHTML = "The Outcome Group must be selected first";
        outcomeInfo.innerHTML = "The Outcome Group must be selected first";
          
        toggleOppMandatory("");
      }
      else {
        var catOptions = "";
        for (categoryId in outcomesByGroup[myValue]) {
          catOptions += "<option>" + outcomesByGroup[myValue][categoryId] + "</option>";
        }
        
        document.getElementById("outcome").innerHTML = catOptions;
        
        outcomeTooltip.innerHTML = "Click the + for more info";
        outcomeInfo.innerHTML = outcomesInfoByGroup[myValue];
      }
    }
    
    var activitiesByGroup = {
      Recruitment_support: ["", "Job vacancy template discussion", "Client profiled", "Interview follow up", "Flexi-wage", "Mana in Mahi", "In-work Support", "Investment support (AB, SFI)", "Vacancy management"],
      Networking_intelligence: ["", "Networking connection", "Regional promotion", "Labour market intelligence", "Employer Engagement Initiative (TaiTokerau)"],
      Employer_visit: ["", "Cold call (face to face)", "Marketing meeting"],
      Other_Phone_call: ["", "Cold call", "Marketing call", "General call"],
      Other_Email: []
    }
    
    var activitiesInfoByGroup = {
      Recruitment_support: "<span style='font-weight: bold'>Job vacancy template discussion:</span> Job vacancy template used<br><span style='font-weight: bold'>Client profiled:</span> Client profiled to an employer<br><span style='font-weight: bold'>Interview follow up:</span> Discussion with employer after an interview<br><span style='font-weight: bold'>Flexi-wage:</span> Discussion about Flexi-wage<br><span style='font-weight: bold'>Mana in Mahi:</span> Discussion about Mana in Mahi<br><span style='font-weight: bold'>In-work support:</span> The conversation was In-work support<br><span style='font-weight: bold'>Investment support:</span> Appreticeship Boost or Skills for Industry<br><span style='font-weight: bold'>Vacancy management:</span> Discussion with employer about a vacancy",
      Networking_intelligence: "<span style='font-weight: bold'>Networking connection:</span> Could be an event, for example<br><span style='font-weight: bold'>Regional promotion:</span> A regional initiative, promoting to employers<br><span style='font-weight: bold'>Labour market intelligence:</span> Gathering info from an employer<br><span style='font-weight: bold'>Employer Engagement Initiative (TaiTokerau):</span> Northland only",
      Employer_visit: "<span style='font-weight: bold'>Cold call (face to face):</span> You don't already know the employer<br><span style='font-weight: bold'>Marketing meeting:</span> You're marketing to the employer",
      Other_Phone_call: "<span style='font-weight: bold'>Cold call:</span> You don't already know the employer<br><span style='font-weight: bold'>Marketing call:</span> You're marketing to the employer<br><span style='font-weight: bold'>General call:</span> Other phone calls",
      Other_Email: ""
    }
    
    function changeActivityCat(value) {
      myValue = value.replace(" ", "_").replace(" ", "_").replace("and ", "").replace("(", "").replace(")", "");
      var activityTooltip = document.getElementById("activityTooltip");
      var activityInfo = document.getElementById("activityTypeInfo");
      if (myValue.length == 0) {
        document.getElementById("activityType").innerHTML = "<option value=''></option>";
        activityTooltip.innerHTML = "The Activity Group must be selected first";
        activityInfo.innerHTML = "The Activity Group must be selected first";
      }
      else {
        var catOptions = "";
        for (categoryId in activitiesByGroup[myValue]) {
          catOptions += "<option>" + activitiesByGroup[myValue][categoryId] + "</option>";
        }
        activityTooltip.innerHTML = "Click the + for more info";
        activityInfo.innerHTML = activitiesInfoByGroup[myValue];
        
        var activityType = document.getElementById("activityType");
        var activityTypeLabel = document.getElementById("activityTypeLabel");
        activityType.innerHTML = catOptions;
        
        if (catOptions == "") {
          activityType.disabled = true;
          activityType.style.display = "none";
          activityType.classList.remove("mandatory");
          activityTypeLabel.style.display = "none";
        }
        else {
          activityType.disabled = false;
          activityType.style.display = "";
          activityType.classList.add("mandatory");
          activityTypeLabel.style.display = "";
        }
      }
    }
    
    function toggleNotWorkReadyReasons(value) {
      if (value == "No") {
        reasonClientNotWorkReady.disabled = false;
        reasonClientNotWorkReady.style.display = "";
        reasonClientNotWorkReady.classList.add("mandatory");
        reasonClientNotWorkReadyLabel.style.display = "";
        
        workHours.disabled = true;
        workHours.style.display = "none";
        workHours.classList.remove("mandatory");
        workHoursLabel.style.display = "none";
      }
      else {
        reasonClientNotWorkReady.disabled = true;
        reasonClientNotWorkReady.style.display = "none";
        reasonClientNotWorkReady.classList.remove("mandatory");
        reasonClientNotWorkReadyLabel.style.display = "none";
        
        workHours.disabled = false;
        workHours.style.display = "";
        workHours.classList.add("mandatory");
        workHoursLabel.style.display = "";
      }
    }
    
    function toggleOppMandatory(value) {
      var opportunityNumber = document.getElementById("clientOpportunityNumber");
      var opportunityNumberLabel = document.getElementById("clientOpportunityNumberLabel");
      var outcomeDate = document.getElementById("outcomeDate");
      var outcomeDateLabel = document.getElementById("outcomeDateLabel");
      var outcomeDateContainer = document.getElementById("outcomeDateContainer");
      var uncontactable = document.getElementById("uncontactable");
      
      if (uncontactable.checked == true) {
        outcomeDate.disabled = true;
        outcomeDate.style.display = "none";
        outcomeDateContainer.style.display = "none";
        outcomeDate.classList.remove("mandatory");
        outcomeDateLabel.innerHTML = "Outcome date (leave blank if not applicable)";
        
        clientOpportunityNumber.disabled = true;
        clientOpportunityNumber.style.display = "none";
        clientOpportunityNumber.classList.remove("mandatory");
        clientOpportunityNumberContainer.style.display = "none";
        clientOpportunityNumberLabel.innerHTML = "Opportunity number (leave blank if not applicable)";
      }
      else if (value == "Job placement") {
        outcomeDate.disabled = true;
        outcomeDate.style.display = "none";
        outcomeDateContainer.style.display = "none";
        outcomeDate.classList.remove("mandatory");
        outcomeDateLabel.innerHTML = "Outcome date (leave blank if not applicable)";
        
        clientOpportunityNumber.disabled = false;
        clientOpportunityNumber.style.display = "";
        clientOpportunityNumber.classList.add("mandatory");
        clientOpportunityNumberContainer.style.display = "";
        clientOpportunityNumberLabel.innerHTML = "Opportunity number <span style='color: red'>*</span>";
      }
      else if (value == "Employer interview") {
        clientOpportunityNumber.disabled = false;
        clientOpportunityNumber.style.display = "";
        clientOpportunityNumber.classList.remove("mandatory");
        clientOpportunityNumberContainer.style.display = "";
        clientOpportunityNumberLabel.innerHTML = "Opportunity number (leave blank if not applicable)";
        
        outcomeDate.disabled = false;
        outcomeDate.style.display = "";
        outcomeDateContainer.style.display = "";
        outcomeDate.classList.add("mandatory");
        outcomeDateLabel.innerHTML = "Interview date <span style='color: red'>*</span>";
      }
      else {
        clientOpportunityNumber.disabled = false;
        clientOpportunityNumber.style.display = "";
        clientOpportunityNumber.classList.remove("mandatory");
        clientOpportunityNumberContainer.style.display = "";
        clientOpportunityNumberLabel.innerHTML = "Opportunity number (leave blank if not applicable)";
        
        outcomeDate.disabled = false;
        outcomeDate.style.display = "";
        outcomeDateContainer.style.display = "";
        outcomeDate.classList.remove("mandatory");
        outcomeDateLabel.innerHTML = "Outcome date (leave blank if not applicable)";
      }
    }
    
    function toggleOppDetails(value) {
      var opportunityNumber = document.getElementById("employerOpportunityNumber1");
      var opportunityNumberLabel = document.getElementById("employerOpportunityNumberLabel");
      var reminderDate = document.getElementById("reminderDate");
      var reminderDateLabel = document.getElementById("reminderDateLabel");
      var numberOfPositions = document.getElementById("numberOfPositions");
      var numberOfPositionsLabel = document.getElementById("numberOfPositionsLabel");
      var roleTitles = document.getElementById("roleTitles");
      var roleTitlesLabel = document.getElementById("roleTitlesLabel");
      var drugScreening = document.getElementById("drugScreening");
      var drugScreeningLabel = document.getElementById("drugScreeningLabel")
      
      if (value == "Yes, current vacancy") {
        drugScreening.disabled = true;
        drugScreening.style.display = "none";
        drugScreening.classList.remove("mandatory");
        drugScreeningLabel.style.display = "none";
        
        reminderDate.disabled = true;
        reminderDate.style.display = "none";
        reminderDate.classList.remove("mandatory");
        reminderDateLabel.style.display = "none";
        
        numberOfPositions.disabled = true;
        numberOfPositions.style.display = "none";
        numberOfPositionsLabel.style.display = "none";
        
        roleTitles.disabled = true;
        roleTitles.style.display = "none";
        roleTitlesLabel.style.display = "none";
        
        opportunityNumber.disabled = false;
        opportunityNumber.style.display = "";
        opportunityNumber.classList.add("mandatory");
        opportunityNumberLabel.style.display = "";
      }
      else if (value == "Yes, future vacancy") {
        drugScreening.disabled = false;
        drugScreening.style.display = "";
        drugScreening.classList.add("mandatory");
        drugScreeningLabel.style.display = "";
        
        reminderDate.disabled = false;
        reminderDate.style.display = "";
        reminderDate.classList.add("mandatory");
        reminderDateLabel.style.display = "";
        
        numberOfPositions.disabled = false;
        numberOfPositions.style.display = "";
        numberOfPositionsLabel.style.display = "";
        
        roleTitles.disabled = false;
        roleTitles.style.display = "";
        roleTitlesLabel.style.display = "";
        
        resetOpportunityNumbers();
      }
      else {
        drugScreening.disabled = false;
        drugScreening.style.display = "";
        drugScreening.classList.add("mandatory");
        drugScreeningLabel.style.display = "";
        
        reminderDate.disabled = true;
        reminderDate.style.display = "none";
        reminderDate.classList.remove("mandatory");
        reminderDateLabel.style.display = "none";
        
        numberOfPositions.disabled = true;
        numberOfPositions.style.display = "none";
        numberOfPositionsLabel.style.display = "none";
        
        roleTitles.disabled = true;
        roleTitles.style.display = "none";
        roleTitlesLabel.style.display = "none";
        
        resetOpportunityNumbers();
      }
    }

var coll = document.getElementsByClassName("collapsible");
var cont = document.getElementsByClassName("content");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
      content.style.marginBottom = "0px";
    } else {
      content.style.maxHeight = "1000px";
      content.style.marginBottom = "25px";
    } 
  });
}
    </script>
  </body>
</html>

```

### LATEST
```HTML
<!DOCTYPE html>
<html>

<!--  --------------------  HEADER TEXT FORMATTING--------------------  --> 

<!-- HEADER --> 

  <body>
    <div class="testbox">
      <form action="/">

<!-- BANNER TEXT --> 

        <div class="banner">
          <h1>  </h1>
        </div>
        <div class="item">

<!--  --------------------  GENERAL FORMATTING--------------------  --> 

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
      color: #bbb;
      line-height: 22px;
      }

      p { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 16px;
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

      .btn-block  {
      margin-top: 10px;

      display: flex;
      justify-content: center;
      }

      button {
      width: 150px;
      height: 75px;
      margin: 10px;
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

      .item {
      position: relative;
      margin: 10px 0;
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

document.querySelector("#someButtonTab").onclick = function() {
  let child = spawnDocument(`<html>
  	<head><title></title></head>
  	<body><p>Text result here</p></body>
  </html>`);
}

  </style>
  </head>



  <!--    --------------------------------------------------QUESTION TYPES------------------------------------------------- --> 

 <form method="post">

          <p>Q1 Where are you currently living?</p>

            <select multiple size ="15">
              <option value="1">Living in a car</option>
              <option value="2">Living in a tent</option>
              <option value="3">In a public place</option>
              <option value="4">Couch surfing</option>
              <option value="5">Marae</option>
              <option value="6">Cabin</option>
              <option value="7">Caravan</option>
              <option value="8">Camp Ground</option>
              <option value="9">Other (e.g. Garage)</option>
              <option value="10">Boarding</option>
              <option value="11">Staying with friends/family</option>
              <option value="12">Private rental</option>
              <option value="13">Own home</option>
              <option value="14">Hospital</option>
              <option value="15">Prison</option>
            </select>
          </div>
        <div class="item">

          <p>Q2 Why are you needing help?</p>

            <select multiple size ="12">
              <option value="1">Financial stress</option>
              <option value="2">Employment reasons</option>
              <option value="3">Medical</option>
              <option value="4">Public Transport</option>
              <option value="5">Tenancy ending</option>
              <option value="6">Tenancy eviction</option>
              <option value="7">Current accommodation is unhealthy</option>
              <option value="8">Family reasons</option>
              <option value="9">Personal Safety</option>
              <option value="10">Children</option>
              <option value="11">Gang Affiliation or concern</option>
              <option value="12">Other (please add comments below)</option>
            </select>
          </div>
        <div class="item">

          <p>Q2b If other selected above, please add further comments </p>

          <input type="text"> 
          </div>
          <div class="item">

          <p>Q3 How long have you been in your current accommodation?</p>

            <select>
              <option value="">*Please select*</option>
              <option value="1">less then 1 month</option>
              <option value="2">less then 3 months</option>
              <option value="3">less then 6 months</option>
              <option value="4">less then 1 year</option>
              <option value="5">less then 2 years</option>
              <option value="6">less then 3 years</option>
              <option value="7">less then 4 years</option>
              <option value="8">less then 5 years</option>
              <option value="9">more then 5 years</option>
            </select>
          </div>
        <div class="item">


          <p>Q4a If we could provide some support could you stay where you are?</p>
            <select>
              <option value="">*Please select*</option>
              <option value="1">Yes</option>
              <option value="2">No</option>
            </select>
          </div>
        <div class="item">

          <p>Q4b Do you have children?</p>
            <select>
              <option value="">*Please select*</option>
              <option value="1">Yes</option>
              <option value="2">No</option>
            </select>
          </div>
        <div class="item">

          <p>Q4c When do you need to move?</p>
            <select>
              <option value="">*Please select*</option>
              <option value="1">Immediately</option>
              <option value="2">7 days or less</option>
              <option value="3">8-60 days</option>
              <option value="4">61-91 days</option>
            </select>
          </div>
        <div class="item">

          <p>Q5 Who needs assistance in your household</p>


<p> Who needs assistance in your household</p>
          <div class="city-item">
            <select>
              <option value="">Number of Adults</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>

            <select>
              <option value="">Number of Children</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>
          </div>
        </div>
        <div class="item">

          <p>Q6a What other housing options have you been looking at and applying for?</p>
               <select multiple size ="6">
              <option value="1">Searched for houses/accommodation online</option>
              <option value="2">Talked to family or friends</option>
              <option value="3">Applied for houses/accommodation</option>
              <option value="4">Registered with real estate agents</option>
              <option value="5">Found a place</option>
              <option value="6">Have not begun looking</option>
            </select>
          </div>
        <div class="item">

          <p>6B What is making it hard for you to find suitable housing?</p>
            <select>
            <option value="">*Please select*</option>
            <option value="1">Age</option>
            <option value="2">Cost</option>
            <option value="3">Size</option>
            <option value="4">Health</option>
            <option value="5">Disability</option>
            <option value="6">Credit</option>
            <option value="7">Gang</option>
            <option value="8">Behind in rent</option>
            <option value="9">No rental history</option>
            <option value="10">Tennancy Tribunal</option>
            </select>
          </div>
        <div class="item">

          <p>Q7 What region are you living in?</p>
            <select>
            <option value="1">Auckland</option>
            <option value="2">Bay of Plenty</option>
            <option value="3">Canterbury</option>
            <option value="4">Central</option>
            <option value="5">East Coast</option>
            <option value="6">Northland</option>
            <option value="7">Taranaki</option>
            <option value="8">Nelson</option>
            <option value="9">Southern</option>
            <option value="10">Wellington</option>
            <option value="11">Waikato</option>
            </select>
          </div>
        <div class="item">

          <p>Q8a Is anyone or any service helping you with your housing?</p>
            <select>
              <option value="">*Please select*</option>
              <option value="1">Yes</option>
              <option value="2">No</option>
            </select>
          </div>
        <div class="item">

          <p>Q8b If yes, please answer select below</p>
              <select multiple size ="4">
              <option value="1">Corrections</option>
              <option value="2">Kainga Ora</option>
              <option value="3">Applied for houses/accommodation</option>
              <option value="4">Other</option>
            </select>
          </div>
        <div class="item">

          <p>Q8c If other please type below</p>

          <input type="text" name="freetext" id="FreeText">
          </div>
          <div class="item">

<!-- BUTTON --> 

   <div class="btn-block">

    <button type="button" onclick="myFunction()">COPY TO CLIPBOARD </button>

    <button type="button" id="someButtonTab" >OPEN WINDOW </button>

    <button type="button" id="NewButtonTab" >NEW BUTTON </button>
    
     </div>
 
 <script>

function myFunction() {
var ExportText = 

'--- #v1 Client Needs Assessment \n'+
'Q1: Where are you currently living?'+document.getElementById("FreeText").value+';'+
'\nQ2: Why are you needing help?'+
'\nQ3: How long have you been in your current accommodation?'+
'\n--- #';

navigator.clipboard.writeText(ExportText);
alert('Text copied to clipboard\n\n' + ExportText)
}

document.querySelector("#someButtonTab").onclick = function() {
  let child = spawnDocument(`
<html>
  	<head><title>Needs Assessment Tool</title></head>
  	<body><p>Hello World</p></body>
  </html>`);
}

document.querySelector("#NewButtonTab").onclick = function() {
  let child = spawnDocument(` add here `)

}

function spawnDocument(content, options) {
  let opt = {
    window: "",
    closeChild: true,
    childId: "_blank",
  };

  Object.assign(opt, options);
  // minimal error checking
  if (content && typeof content.toString == "function" && content.toString().length) {
    let child = window.open("", opt.childId, opt.window);
    child.document.write(content.toString());
    if (opt.closeChild)
      child.document.close();
    return child;
  }
}

</script>
</body>
</html>










<!--    
NOTES 

<a href="../html-link.htm" target="_blank">Open page in new window</a>

    <button type="button"  href="" target="_blank" >OTHER</button>

    <button type="button"  onclick=href="" target="_blank">TEST</button>

    <button type="button" onclick= <a href="https://www.GOOGLE.COM" target="_blank" </a>LINK</button>

    <button  type="button" onclick="window.location.href='WWW.GOOGLE.CO.NZ';"target="_blank"> LINK </button>

 BASE OPTIONS TEMPLATE

          <p> NAME OF OPTION </p>
            <select>
            <option value="1"></option>
            <option value="2"></option>
            <option value="3"></option>
            <option value="4"></option>
            <option value="5"></option>
            <option value="6"></option>
            <option value="7"></option>
            <option value="8"></option>
            <option value="9"></option>
            <option value="10"></option>
            <option value="11"></option>
            <option value="12"></option>
            <option value="13"></option>
            <option value="14"></option>
            <option value="15"></option>
            <option value="16"></option>
            <option value="17"></option>
            <option value="18"></option>
            <option value="19"></option>
             <option value="19"></option>
            </select>
          </div>
        <div class="item">


'--- #v1 Client Needs Assessment \n'+
'Q1: Where are you currently living?'+document.getElementById("FreeText").value+';'+
'\nQ2: Why are you needing help?'+
'\nQ3: How long have you been in your current accommodation?'+
'\nQ4a: If we could provide some support could you stay where you are?'+
'\nQ4b: Do you have children?'+
'\nQ4c: When do you need to move?'+
'\nQ5: Who is in your household and who is needing housing assistance?'+
'\nQ6a: What other housing options have you been looking at and applying for?'+
'\nQ6b: What is making it hard for you to find suitable housing?'+
'\nQ: '+
'\nQ: '+
'\nQ: '+
'\nQ: '+
'--- #';

--> 

```


