# CODE-LIBRARY

HTML FORM - https://www.w3docs.com/tools/editor/5943

 * [TEMPLATE](#TEMPLATE)
 * [TEMPLATE26](#TEMPLATE26)
 * [NEW](#NEW)
 * [FUNCTION SAVE TO FILE](#SAVE-TO-FILE)
 * [FUNCTION TAB](#TAB)
 * [FUNCTION SELECT THREE](#FUNCTION-TOP3)
 * [FUNCTION CASCADING ANSWERS](#FUNCTION-CASCADING-ANSWERS)
 * [FUNCTION SELECTABLE TABLE](#FUNCTION-SELECTABLE-TABLE)
 * [FUNCTION CASCADING SIMPLE](#FUNCTION-CASCADING-SIMPLE)
 * [FUNCTION VARIABLE SEARCH TO SCREEN](FUNCTION-VARIABLE-SEARCH-TO-SCREEN)
 
--------------------------------------------------------------------------------------------------------

###   TEMPLATE
####  ALL OPTION TYPES
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

--------------------------------------------------------------------------------------------------------

####  TEMPLATE26

``` html
<!DOCTYPE html>
<html>

<script
id="insert"
type="text/javascript"
src="//code.jquery.com/jquery-1.11.0.js">
</script>

<!--  --------------------  FORMATTING--------------------  -->

<head>

<style>

/* Ads space at bottom so that expandable questions do not move form upwards  */
html{
margin-bottom: 500px;
}

/* Sets page size, position, margin and shadow */
body {
background: #fff;
box-shadow: 0px 0px 30px 0px #a82877;
max-width: 675px;
min-width: 175px;
margin: auto;
margin-top: 10px;
margin-bottom: 10px;
border-radius: 7px;
}

mandatory {
background-color: #fce4e4;
border: 1px solid #cc0033;
outline: none;
}

/* Sets textarea format, needed as default value differet then select */
textarea {
width: calc(100% - 17px);
font-family: Roboto, Arial;
font-size: 14px;
color: #666;
border-radius: 7px;
outline: none;
margin: 5px;
}

/* Pulls logo from MSD and formats banner otherwise default values duplicate and stretch pic */
.banner {
min-height: 125px;
background-size: contain;
background-image: url(https://www.msd.govt.nz/webadmin/images/msd-logo-blue.svg);
background-repeat: no-repeat;
background-color: rgba(0, 0, 0, 0.5);
width: calc(100% - 12px);
margin: 5px 5px 12px 5px;
border-radius: 7px;
outline: none;
}

/* Sets margin for header, can't use the main format below as it will change the font and bold */
h3 {
text-align:center;
}

/* Main formating of boxs */
form, item, button, p, input, select, h3 {
margin: 5px 5px 5px 5px;
width: calc(100% - 10px);
font-family: Roboto, Arial;
font-size: 14px;
color: #666;
border-radius: 7px;
outline: none;
}

/* Sets gray border, can't be added above as this will create border on borders */
item, button, textarea, input, select {
border: 1px solid #ccc;
}

/* As with textarea, specific formating due to different default values + colour changed */
button {
color: #fff;
background: #3D3C3A;
border: none;
height: 35px;
margin-top: 17px;
margin-bottom: 12px;
}

select[multiple], select, city-item, item {
overflow-y: auto;
}

/* Sets specific formatting to allow side by side boxs that moves them below when the page is shrunk */
@media (min-width: 568px) {
.city-item {
display: flex;
flex-wrap: wrap;
justify-content: space-between;
}

/* Sets specific formatting to allow side by side boxs that moves them below when the page is shrunk */
@media (min-width: 568px) {
.quarter-item {
display: flex;
flex-wrap: wrap;
justify-content: space-between;
}

/* As above */
.city-item input {
width: calc (50% - 10px);
}

/* As above */
.city-item select {
width: calc(50% - 10px);
}

/* As above */
.quarter-item input {
width: calc (25% - 10px);
}

/* As above */
.quarter-item select {
width: calc(25% - 10px);
}

/* Adds shadow on hover */
.item:hover p,  .city-item:hover p  {
color: #a82877;
}

/* Adds shadow on hover, needed as no border on <p> element */
textarea:hover, select:hover {
color: #a82877;
border: 1px solid transparent;
box-shadow: 0 0 6px 0 #a82877;
}

.error-input {
background-color: #fce4e4;
border: 1px solid #cc0033;
outline: none;
}

</style>
<title>Needs Assessment Tool v26 </title>
</head>

<!-- ----------------------------------------------------------- BODY ----------------------------------------------------------- -->

<body>

<form id="myForm" action="/">

<button type="button" onclick="Reset()"> RESET ALL</button>

<div class="banner"></div>

<H3>Needs Assessment Tool v26 </H3>

<H1 style="text-align: center; margin-bottom:2px; "> PATHWAY TO HOUSING TOOL</H1>

<H3 style="margin-bottom:10px;  background-color:#a82877; color:white; padding: 10px 0px"> GENERAL QUESTIONS </H3>   

<!-- ---------------- SECTION 1 [GENERAL] ---------------- -->

<div class="item"> 
<p>Q1a Is this a referral from: [Staff Only]   </p>
<select size ="4"  id="Question1a" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Corrections">Department of Corrections</option>
<option value="Oranga Tamariki">Oranga Tamariki</option>
<option value="Te Whatu Ora’">Te Whatu Ora</option>
<option value="N/A">N/A</option>
</select>
</div>

<div class="item"> <p>Q2a Tell me about your housing situation (why does the client need help)
<br>[NB: Hold CTRL to select multiple options]</p>
<select size="12" multiple style="overflow:hidden" id="Question2a" onchange="HelpOther(this)" oninput="textChanged(this);" name="mandatory">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Asked to leave boarding situation">Asked to leave boarding situation</option>
<option value="Conflict within the household">Conflict within the household</option>
<option value="Family harm">Family harm</option>
<option value="Gang activities">Gang activities</option>
<option value="Medical reasons">Medical reasons</option>
<option value="Moving for work">Moving for work</option>
<option value="Neighbourhood / safety concerns">Neighbourhood / safety concerns</option>
<option value="Separated from partner">Separated from partner</option>
<option value="Tenancy ending">Tenancy ending</option>
<option value="Tenancy eviction">Tenancy eviction</option>
<option value="Impacted by natural disasters">Impacted by natural disasters</option>
<option value="Other">Other</option>

</select>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" hidden id="Question2b"> <p>Q2b If other please type below</p>
<textarea visible placeholder="Not Selected" id="Question2bSelect" name="mandatory" oninput="textChanged(this);"></textarea>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" hidden id="Question2c"> <p>Q2c If Medical please provide detail below</p>
<textarea placeholder="Not Selected" id="Question2cSelect" name="mandatory" oninput="textChanged(this);"></textarea>
</div>

<div class="item" hidden id="Question2d">
<p> Q2d Are you currently working with a MSD or community family support person?</p>
<select size ="2"  id="Question2dSelect" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes">Yes </option>
<option value="No">No </option>
</select>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" id="Question3a"> <p>Q3a Any further details?</p>
<textarea rows="6" placeholder="Not Selected" id="Question3aSelect" oninput="textChanged(this);"></textarea>
</div>

<!-- ---------------- SECTION 2 [SITUATION] ---------------- -->

<H3 style="margin-bottom:10px;  background-color:#a82877; color:white; padding: 10px 0px"> SITUATION </H3>   


<p id="demo"></p>

<div class="item"> <p>Q4a What region are you living in?</p>
<select size = "11" font="Courier" id="Question4a" onchange="showDistrict(this)" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option id ="A1"  value="NORTHLAND">NORTHLAND</option>
<option id ="A2"  value="AUCKLAND">AUCKLAND</option>
<option id ="A3"  value="WAIKATO">WAIKATO</option>
<option id ="A4"  value="BAY OF PLENTY">BAY OF PLENTY</option>
<option id ="A5"  value="TARANAKI">TARANAKI</option>
<option id ="A6"  value="EAST COAST">EAST COAST</option>
<option id ="A7"  value="CENTRAL">CENTRAL</option>
<option id ="A8"  value="WELLINGTON">WELLINGTON</option>
<option id ="A9"  value="NELSON">NELSON</option>
<option id ="A10" value="CANTERBURY">CANTERBURY</option>
<option id ="A11" value="SOUTHERN">SOUTHERN</option>
</select>
</div>

<!-- START OF DISTRICTS -->

<div class="item" id="Question4b"> <p>Q4b What district are you living in?</p>
<select size = "11" font="Courier New" id="Question4bSelect" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>

<option id ="1D" name="ALL" tagname= "NORTHLAND"  hidden> Far North District</option>
<option id ="2D" name="ALL" tagname= "NORTHLAND"  hidden> Whangarei District</option>
<option id ="3D" name="ALL" tagname= "NORTHLAND"  hidden> Kaipara District</option>

<option id ="4D" name="ALL" tagname= "AUCKLAND"  hidden>Auckland</option>

<option id ="5D" name="ALL" tagname= "WAIKATO" hidden>Waikato District</option>
<option id ="6D" name="ALL" tagname= "WAIKATO" hidden>Thames-Coromandel District</option>
<option id ="7D" name="ALL" tagname= "WAIKATO" hidden>Hauraki District</option>
<option id ="8D" name="ALL" tagname= "WAIKATO" hidden>Matamata-Piako District</option>
<option id ="9D" name="ALL" tagname= "WAIKATO" hidden>Hamilton City</option>
<option id ="10D" name="ALL" tagname= "WAIKATO" hidden>Waipa District</option>
<option id ="11D" name="ALL" tagname= "WAIKATO" hidden>Otorohanga District</option>

<option id ="12D" name="ALL" tagname= "BAY OF PLENTY" hidden>Western Bay of Plenty District</option>
<option id ="13D" name="ALL" tagname= "BAY OF PLENTY" hidden>Tauranga District</option>
<option id ="14D" name="ALL" tagname= "BAY OF PLENTY" hidden>Rotorua District</option>
<option id ="15D" name="ALL" tagname= "BAY OF PLENTY" hidden>South Waikato District</option>
<option id ="16D" name="ALL" tagname= "BAY OF PLENTY" hidden>Kawerau District</option>
<option id ="17D" name="ALL" tagname= "BAY OF PLENTY" hidden>Ōpōtiki District</option>
<option id ="18D" name="ALL" tagname= "BAY OF PLENTY" hidden>Whakatane District</option>
<option id ="19D" name="ALL" tagname= "BAY OF PLENTY" hidden>Taupō District</option>

<option id ="20D" name="ALL" tagname= "TARANAKI" hidden>Waitomo District</option>
<option id ="21D" name="ALL" tagname= "TARANAKI" hidden>New Plymouth District</option>
<option id ="22D" name="ALL" tagname= "TARANAKI" hidden>Stratford District</option>
<option id ="23D" name="ALL" tagname= "TARANAKI" hidden>South Taranaki District</option>
<option id ="24D" name="ALL" tagname= "TARANAKI" hidden>Ruapehu District</option>
<option id ="25D" name="ALL" tagname= "TARANAKI" hidden>Whanganui District</option>
<option id ="26D" name="ALL" tagname= "TARANAKI" hidden>Rangitīkei District</option>

<option id ="27D" name="ALL" tagname= "EAST COAST" hidden>Gisborne District</option>
<option id ="28D" name="ALL" tagname= "EAST COAST" hidden>Wairoa District</option>
<option id ="29D" name="ALL" tagname= "EAST COAST" hidden>Hastings District</option>
<option id ="30D" name="ALL" tagname= "EAST COAST" hidden>Napier City</option>
<option id ="31D" name="ALL" tagname= "EAST COAST" hidden>Central Hawke’s Bay District</option>

<option id ="32D" name="ALL" tagname= "CENTRAL" hidden>Manawatu District</option>
<option id ="33D" name="ALL" tagname= "CENTRAL" hidden>Palmerston North City</option>
<option id ="34D" name="ALL" tagname= "CENTRAL" hidden>Horowhenua District</option>
<option id ="35D" name="ALL" tagname= "CENTRAL" hidden>Kāpiti Coast District</option>
<option id ="36D" name="ALL" tagname= "CENTRAL" hidden>Tararua District</option>
<option id ="37D" name="ALL" tagname= "CENTRAL" hidden>Masterton District</option>
<option id ="38D" name="ALL" tagname= "CENTRAL" hidden>Carterton District</option>
<option id ="39D" name="ALL" tagname= "CENTRAL" hidden>South Wairarapa District</option>

<option id ="40D" name="ALL" tagname= "WELLINGTON" hidden>Upper Hutt City</option>
<option id ="41D" name="ALL" tagame= "WELLINGTON" hidden>Lower Hutt City</option>
<option id ="42D" name="ALL" tagname= "WELLINGTON" hidden>Porirua City</option>
<option id ="43D" name="ALL" tagname= "WELLINGTON" hidden>Wellington City</option>

<option id ="44D" name="ALL" tagname= "NELSON" hidden>Nelson City</option>
<option id ="45D" name="ALL" tagname= "NELSON" hidden>Marlborough District</option>
<option id ="46D" name="ALL" tagname= "NELSON" hidden>Kaikoura District</option>
<option id ="47D" name="ALL" tagname= "NELSON" hidden>Tasman District</option>
<option id ="48D" name="ALL" tagname= "NELSON" hidden>Buller District</option>
<option id ="49D" name="ALL" tagname= "NELSON" hidden>Grey District</option>
<option id ="50D" name="ALL" tagname= "NELSON" hidden>Westland District</option>

<option id ="51D" name="ALL" tagname= "CANTERBURY" hidden>Hurunui District</option>
<option id ="52D" name="ALL" tagname= "CANTERBURY" hidden>Waimakariri District</option>
<option id ="53D" name="ALL" tagname= "CANTERBURY" hidden>Christchurch City</option>
<option id ="54D" name="ALL" tagname= "CANTERBURY" hidden>Selwyn District</option>
<option id ="55D" name="ALL" tagname= "CANTERBURY" hidden>Ashburton District</option>

<option id ="56D" name="ALL" tagname= "SOUTHERN" hidden>Timaru District</option>
<option id ="57D" name="ALL" tagname= "SOUTHERN" hidden>Mackenzie District</option>
<option id ="58D" name="ALL" tagname= "SOUTHERN" hidden>Waimate District</option>
<option id ="59D" name="ALL" tagname= "SOUTHERN" hidden>Waitaki District</option>
<option id ="60D" name="ALL" tagname= "SOUTHERN" hidden>Queenstown-Lakes District</option>
<option id ="61D" name="ALL" tagname= "SOUTHERN" hidden>Central Otago District</option>
<option id ="62D" name="ALL" tagname= "SOUTHERN" hidden>Dunedin District</option>
<option id ="63D" name="ALL" tagname= "SOUTHERN" hidden>Clutha District</option>
<option id ="64D" name="ALL" tagname= "SOUTHERN" hidden>Gore District</option>
<option id ="65D" name="ALL" tagname= "SOUTHERN" hidden>Invercargill City</option>
<option id ="66D" name="ALL" tagname= "SOUTHERN" hidden>Southland District</option>

</select>
</div>

<!-- END OF DISTRICTS -->

<div class="city-item"> <p>Q5a Where are you currently staying?</p>
<select size ="16" id="Question5a" onchange="AccType(this)" name="mandatory" oninput="textChanged(this);">

<optgroup label="ACCOMMODATION">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Boarding">Boarding</option>
<option value="Cabin">Cabin</option>
<option value="Caravan">Caravan</option>
<option value="Own home">Own home</option>
<option value="Renting">Renting</option>
<option value="Staying with friends/family">Staying with friends/family</option>
<option value="Other">Other (e.g. Garage)</option>
</optgroup>


<optgroup label="TEMPORARY ACCOMMODATION">
<option value="Couch surfing">Couch surfing</option>
<option value="Hospital">Hospital</option>
<option value="Living in a car">Living in a car</option>
<option value="Living in a tent">Living in a tent</option>
<option value="Marae">Marae</option>
<option value="Street / public place">Street / public place</option>
<option value="Squatting">Squatting</option>
</optgroup>
</select>

<select class="item" size ="15" id="Question5b" name="mandatory" oninput="textChanged(this);">
<optgroup label="LOCATION OF ACCOMMODATION">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Campground">Campground</option>
<option value="Family">Family property</option>
<option value="Friends">Friends property</option>
<option value="Kinga Ora">K&#257;inga Ora property </option>
<option value="Private property">Private property</option>
<option value="Public place">Public place</option>
</optgroup>
</select>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" hidden id="Question5c"> <p>Q5c If other please type below</p>
<textarea placeholder="Not Selected" id="Question5cSelect" name="mandatory" oninput="textChanged(this);"></textarea>
</div>

<div class="item"> <p>Q6a How long have you been in your current living situation? </p>
<select size ="6" id="Question6a"  name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="0 to 3 months">0m  - 3 months</option>
<option value="3 to 6 months">3m  - 6 months</option>
<option value="0.5 to 1 year">6m - 1 year</option>
<option value="1 to 3 years">1y - 3 years</option>
<option value="3 to 5 years">3y - 5 years</option>
<option value="Long term">5y+</option>
</select>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" hidden id="Question6b">
<p>Q6b If we could provide some financial support, could you stay where you are or could we help you move to somewhere safe?</p>
<select size ="2"  id="Question6bSelect" onchange="SupportYes(this)" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes">Yes </option>
<option value="No">No </option>
</select>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" hidden id="SupportNote" >
<textarea  disabled  style="background-color:#157DEC; color:white; text-align-center;" name="mandatory" oninput="textChanged(this);">Financial support options include; helping with rent, cost to move rental or a food grant to contribute to a boarding situation</textarea>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" hidden id="Question6c"> <p>Q6c Who can you stay with?</p>
<select size ="4" id="Question6cSelect" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Family">Family</option>
<option value="Friends">Friends</option>
<option value="Private Arrangement">Private Arrangement</option>
<option value="Where you are">Where you are</option>
</select>
</div>

<!-- ---------------- SECTION 3 [SITUATION] ---------------- -->

<div id="Section2" hidden>

<H3 style="margin-bottom:10px;  background-color:#a82877; color:white; padding: 10px 0px"> MOVING </H3>   

<div class="item"> <p>Q7a When do you need to move?</p>
<select size ="6" id="Question7a" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Immediately">Immediately</option>
<option value="7 days or less">7 days or less</option>
<option value="8-30 days">8-30 days</option>
<option value="31-60 days">31-60 days</option>
<option value="61-90 days">61-90 days</option>
<option value="91+">91+ days</option>
</select>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" id="Question8a" >
<p>Q8a Is there a specific area you need to stay in?</p>
<textarea id="Question8aSelect" placeholder="Not Selected" oninput="textChanged(this);"></textarea>
</div>

<div class="city-item">
<p>Q9a What is making it hard for you to find a home? &nbsp; &nbsp; [NB: Hold CTRL to select multiple options]</p>
<select size = "14" id="Question9a" name="mandatory" oninput="textChanged(this);">
<optgroup label="PRIMARY REASON SELECT ONE">
<option value="Not selected" hidden selected>Not selected</option>
<option value="02">Accessibility</option>
<option value="03">Behind in rent</option>
<option value="04">Cost of rental</option>
<option value="05">Corrections history</option>
<option value="06">Credit history</option>
<option value="07">Disability</option>
<option value="08">Discrimination</option>
<option value="09">Gang affiliation</option>
<option value="10">Health</option>
<option value="11">No rental history</option>
<option value="12">Pets</option>
<option value="13">Size of household</option>
<option value="14">Trouble understanding rental process</option>
</optgroup>
</select>

<select multiple size = "12" id="Question9b" onchange="maxThree(this)" name="mandatory" oninput="textChanged(this);">
<optgroup label="SECONDARY REASON MAX THREE ">
<option value="Not selected" hidden selected>Not selected</option>
<option value="02">Accessibility</option>
<option value="03">Behind in rent</option>
<option value="04">Cost of rental</option>
<option value="05">Corrections history</option>
<option value="06">Credit history</option>
<option value="07">Disability</option>
<option value="08">Discrimination</option>
<option value="09">Gang affiliation</option>
<option value="10">Health</option>
<option value="11">No rental history</option>
<option value="12">Pets</option>
<option value="13">Size of household</option>
<option value="14">Trouble understanding rental process</option>
</optgroup>
</select>
</div>

<!-- HIDDEN ALERT -->
<div class="textalert"  id="MaxAlert" hidden>
<textarea  disabled  style="text-align:center; font-size:120%; background-color:red; color:white; height:20px;"
>Please select a max of three options</textarea>
</div>

<div class="item" id="Question10a">
<p> Q10a Are there any factors that impact what suitable housing you could go to i.e. Physical or social factors or gang association?</p>
<select size = "2" id=Question10aSelect  onclick="mobilityIssues(this)" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" hidden id="Question10b">
<p>Q10b Please expand below</p>
<textarea  id="Question10bSelect" placeholder="Not Selected" name="mandatory" oninput="textChanged(this);"></textarea>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" id="Question11a">
<p>Q11a If you have pets and are unable to take these with you is there someone that can look after them for you?</p>
<select size = "3"  id="Question11aSelect" onclick="petIssues(this)"  name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
<option value="N/A">N/A</option>
</select>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" hidden id="PetNote" >
<textarea  disabled  style="background-color:#157DEC; color:white; text-align: center;">You can also take a registered service animal into Emergency Housing</textarea>
</div>
</div>
</div>

<!-- ---------------- SECTION 3 [FAMILY] ---------------- -->

<H3 style="margin-bottom:5px;  background-color:#a82877; color:white; padding: 10px 0px"> FAMILY </H3>    

<div class="city-item"> 
<p>Q12a Who needs assistance in your household?</p>
<select size = "12" id="Question12a" name="mandatory" oninput="textChanged(this);">
<optgroup label="NUMBER OF ADULTS">
<option value="Not selected" hidden selected>Not selected</option>
<option disabled value="0">-</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
</optgroup>
</select>

<select size="12" id="Question12b" onchange="childrenYes(this)" name="mandatory" oninput="textChanged(this);">
<optgroup label="NUMBER OF CHILDREN">
<option value="Not selected" hidden selected>Not selected</option>
<option value="0">0</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
</optgroup>
</select>
</div>

<div class="item" id="Question13a">
<p>Q13a When you leave temporary housing, are these all the people you would like to live with? <br>
(are there extended family who want to live together?)</p>
<select size ="2" id="Question13aSelect" name="mandatory" oninput="textChanged(this);" onchange="liveWith(this)">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</div>

<div class="item" id="Question13b" hidden>
<p>Q13b If no, how many adults and children will you be living with?</p>
<textarea rows="6" placeholder="Not Selected" id="Question13bSelect" oninput="textChanged(this);"></textarea>
</div>

<div class="item"  id="Children" hidden>
<div class="item"  id="FlexiNote" >
<textarea  disabled  style="background-color:#157DEC; color:white; text-align: center;">Did you know when in emergency housing, flexifunding can help with travel, school holiday programmes, after school care, and extra curricular activities for your kids?</textarea>
</div>


<div class="item"  id="Question14a">
<p>Q14a Do you have any children under 1, if so would you like some financial support for a Pēpi-pod or baby bed?</p>
<select size="2"  id="Question14aSelect" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes">Yes</option>
<option value="No">No, my child already has their own safe and suitable bed</option>
</select>
</div>


<div class="item"  id="Question14b" >
<p>Q14b Are your children enrolled AND attending school</p>
<select size="3"  id="Question14bSelect" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes – enrolled and attending ">Yes – enrolled and attending</option>
<option value="Yes – enrolled and not currently attending">Yes – enrolled and not currently attending</option>
<option value="Not enrolled or currently attending">Not enrolled or currently attending</option>
</select>
</div>

<div class="item"  id="Question14c" >
<p>Q14c If attending, what school do they go to?</p>
<textarea rows="2" placeholder="Not Selected" id="Question14cSelect" oninput="textChanged(this);"></textarea>
</div>

<div class="item"  id="Question14d" >
<p>Q14d The Ministry of Education has a service to support school age children with attendance or enrolment.  Would you like us to pass on your contact details?</p>
<select size="3"  id="Question14dSelect" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
<option value="N/A">N/A children are attending</option>
</select>
</div>

<div class="item"  id="Question14e" >
<p>Q14e If you have children between the age of 16-18  that are not enrolled in school would you like some support to help your child with employment and training.</p>
<select size="3"  id="Question14eSelect" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
<option value="N/A">N/A children 16 and above enrolled in school</option>
</select>
</div>

</div>
</div>

<!-- 
<p>This is a &nbsp; regular space.</p>
<p>This is a &ensp; two spaces gap.</p>
<p>This is a &emsp; four spaces gap.</p>
-->

<!-- ---------------- SECTION 4 [EXTERNAL] ---------------- -->
  
<H3 style="margin-bottom:10px;  background-color:#a82877; color:white; padding: 10px 0px"> EXTERNAL SERVICES </H3>   

<div class="item">
<p>Q15a Are you currently being supported by anyone or any service? </p>
<select size="2" id="Question15a" name="mandatory" oninput="textChanged(this);" onclick="support(this)">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" id="Question15b" hidden>
<p>Q15b If yes, please answer select below [NB: Hold CTRL to select multiple options]</p>
<select multiple size ="13" id="Question15bSelect" onchange="serviceOther(this)" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="1">City Mission</option>
<option value="2">Department of Corrections</option>
<option value="3">Emerge</option>
<option value="4">Kainga Ora</option>
<option value="5">Lifewise</option>
<option value="6">Ministry of Health</option>
<option value="7">Navigator services</option>
<option value="8">Oranga Tamariki</option>
<option value="9">Salvation Army</option>
<option value="10">Transitional housing provider</option>
<option value="11">Vision West</option>
<option value="12">Youth services</option>
<option value="13">Other</option>
</select>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" id="Question15c" hidden>
<p>Q15c If Transitional housing provider / other, please type below</p>
<textarea placeholder="Not Selected" id="Question15cSelect" name="mandatory" oninput="textChanged(this);"></textarea>
</div>

<!-- HIDDEN QUESTION -->
<div class="item" id="Question16a"  >
<p>Q16a Are you on the public housing register?</p>
<select size="3"  id="Question16aSelect" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes unchanged">Yes, circumstances unchanged</option>
<option value="Yes changed">Yes, circumstances changed</option>
<option value="No">No</option>
</select>
</div>

<!-- ---------------- SECTION 5 [EMPLOYMENT] ---------------- -->

<H3 style="margin-bottom:10px;  background-color:#a82877; color:white; padding: 10px 0px"> EMPLOYMENT </H3>   

<div class="item" id="Question17a">
<p>Q17a  Will anyone in your household be looking for employment?</p>
<select size ="2" id="Question17aSelect" onchange="employment(this)" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</div>

<div class="item" hidden id="Question17b">
<p>Q17b If yes, who? [NB: Hold CTRL to select multiple options] </p>
<select multiple size ="3" id="Question17bSelect" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Client">Client</option>
<option value="Partner">Partner</option>
<option value="Child over 16">Child over 16</option>
</select>
</div>

<div class="item" hidden id="Question18a">
<p>Q18a Are you currently working with a work broker?</p>
<select size ="2" id="Question18aSelect" onchange="serviceOther(this)" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
</div>

<button class="block" type="button" onclick="ShowSupport()" > CLICK TO SHOW SUPPORT OPTIONS (OR UPDATE) </button>

<!-- ---------------- SECTION 6 [SUPPORT] ---------------- -->

<div hidden id="Section4">
<div class="item" id="Options">
<p>Select Options you would like to go ahead with [NB: Hold CTRL to select multiple options] </p>

<select multiple size=29, id="OptionsSelect" onclick="OptionsEH(this)" name="mandatory" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<optgroup label="HOUSING OPTIONS">
<option id ="OPT1"   hidden>    HSP - Bond Grant</option>
<option id ="OPT2"   hidden>    HSP - Rent-in-Advance</option>
<option id ="OPT3"   hidden>    HSP - Rent Arrears</option>
<option id ="OPT4"   hidden>    HSP - Moving Assistance</option>
<option id ="OPT5"   hidden>    HSP - Tenancy Cost Cover Letter</option>
<option id ="OPT6"   hidden>    Transitional Housing Referral</option>
<option id ="OPT7"   hidden>     Contracted Emergency Housing</option>
<option id ="OPT8"   hidden>    Emergency Housing</option>
<option id ="OPT9"   hidden>    Public Housing Assessment</option>
</optgroup>

<optgroup label="FINANCIAL OPTIONS">
<option id ="OPT10"  hidden>    Accommodation Supplement</option>
<option id ="OPT11"  hidden>   Temporary Additional Support</option>
<option id ="OPT12"  hidden>   Recoverable Assistance Payments</option>
<option id ="OPT13"   	   >   SNG - Food Grant</option>
<option id ="OPT14"        >   SNG - Other</option>
<option id ="OPT15"  hidden>   House Modification Funding via MOH</option>
<option id ="OPT16"  hidden>   Disability Allowance</option>
<option id ="OPT17"  hidden>   Child Disability Allowance</option>
<option id ="OPT18"  hidden>   Transition to Work</option>
</optgroup>

<optgroup label="SUPPORT OPTIONS">
<option id ="OPT19"  hidden>   Ready to Rent Programme</option>
<option id ="OPT20"  hidden>   Flexible Funding Assistance</option>
<option id ="OPT21"  hidden>   Building Financial Capability products and services</option>
<option id ="OPT22"  hidden>   Refer to Housing Broker</option>
<option id ="OPT23"  hidden>   Refer to Work Broker</option>
<option id ="OPT24"  hidden>   Refer to Programme Coordinator</option>
<option id ="OPT25"  hidden>   Refer to Family Violence Coordinator</option>
<option id ="OPT26"  hidden>   Refer to Navigators</option>
</optgroup>
</select>
</div>

<!-- HIDDEN QUESTION -->

<div class="item" id="Question19a" visible>
<p>Q19a Any further brief comments?</p>
<textarea id="Question19aSelect" style="height:200px"  placeholder="Not Selected" oninput="textChanged(this);"></textarea>
</div>

<button min-height="100%" type="button" id="FileNoteButton" onclick="GenerateFileNote()" oninput="textChanged(this);">CREATE OR UPDATE FILE NOTE</button>
</div>

<!-- ---------------- SECTION 7 [PROVIDERS] ---------------- -->


<div hidden id="Section5">
<h> Providers list [NB: Hold CTRL to select multiple options] </h>

<textarea id="Area2"> </textarea>
<div class="item" id="Providers">
<p>Select from list of results</p>
<select multiple size ="4" oninput="textChanged(this);">
<option value="Not selected" hidden selected>Not selected</option>
<option value="1">Hotel1</option>
<option value="2">Hotel2</option>
</select>
</div>

<button class="block" type="button" onclick="GenerateProviders()" id="GenerateProvidersButton" oninput="textChanged(this);"> CLICK TO SHOW SUPPLIERS </button>
</div>

<!-- ---------------- SECTION 8 [FILE NOTE] ---------------- -->

<div hidden id="Section6">
<p> Copy of file note </p>
<textarea id="Area3"></textarea>
</div>

</form>
<script>

<!--   [FUNCTIONS]  -->


<!-- ---------- HELP OTHER [GENERAL] ---------- -->

function HelpOther(select){

// true false code allows an option to be unselected without resetting all of the dependencies

var text	= getSelectValues(document.getElementById("Question2a"));
var other 	= text.includes("Other");
var medical = text.includes("Medical");
var Harm 	= text.includes("harm");

if(other==true){
document.getElementById("Question2b").removeAttribute("hidden", "hidden");
}

if(medical==true){
document.getElementById("Question2c").removeAttribute("hidden", "hidden");
}

if(Harm==true){
document.getElementById("Question2d").removeAttribute("hidden", "hidden");
}

if(other==false){
document.getElementById("Question2bSelect").value = "";
document.getElementById("Question2b").setAttribute("hidden", "hidden");
document.getElementById("Question2bSelect").classList.add("error-input"); 
}

if(medical==false){
document.getElementById("Question2cSelect").value = "";
document.getElementById("Question2c").setAttribute("hidden", "hidden");
document.getElementById("Question2cSelect").classList.add("error-input"); 
}

if(Harm==false){
document.getElementById("Question2dSelect").value = "";
document.getElementById("Question2d").setAttribute("hidden", "hidden");
document.getElementById("Question2dSelect").classList.add("error-input"); 
}
}

<!-- ---------- SHOW DISTRICT [SITUATION] ---------- -->

function showDistrict(select){

document.getElementById("Question4bSelect").value = "Not selected";
document.getElementById("Question4bSelect").classList.add("error-input"); 

document.getElementById("1D").setAttribute("hidden", "hidden");
document.getElementById("2D").setAttribute("hidden", "hidden");
document.getElementById("3D").setAttribute("hidden", "hidden");
document.getElementById("4D").setAttribute("hidden", "hidden");
document.getElementById("5D").setAttribute("hidden", "hidden");
document.getElementById("6D").setAttribute("hidden", "hidden");
document.getElementById("7D").setAttribute("hidden", "hidden");
document.getElementById("8D").setAttribute("hidden", "hidden");
document.getElementById("9D").setAttribute("hidden", "hidden");
document.getElementById("10D").setAttribute("hidden", "hidden"); 
document.getElementById("11D").setAttribute("hidden", "hidden"); 
document.getElementById("12D").setAttribute("hidden", "hidden");
document.getElementById("13D").setAttribute("hidden", "hidden");
document.getElementById("14D").setAttribute("hidden", "hidden");
document.getElementById("15D").setAttribute("hidden", "hidden");
document.getElementById("16D").setAttribute("hidden", "hidden");
document.getElementById("17D").setAttribute("hidden", "hidden"); 
document.getElementById("18D").setAttribute("hidden", "hidden");
document.getElementById("19D").setAttribute("hidden", "hidden"); 
document.getElementById("20D").setAttribute("hidden", "hidden");
document.getElementById("21D").setAttribute("hidden", "hidden");
document.getElementById("22D").setAttribute("hidden", "hidden");
document.getElementById("23D").setAttribute("hidden", "hidden");
document.getElementById("24D").setAttribute("hidden", "hidden");
document.getElementById("25D").setAttribute("hidden", "hidden"); 
document.getElementById("26D").setAttribute("hidden", "hidden"); 
document.getElementById("27D").setAttribute("hidden", "hidden");
document.getElementById("28D").setAttribute("hidden", "hidden");
document.getElementById("29D").setAttribute("hidden", "hidden");
document.getElementById("30D").setAttribute("hidden", "hidden");
document.getElementById("31D").setAttribute("hidden", "hidden");
document.getElementById("32D").setAttribute("hidden", "hidden");
document.getElementById("33D").setAttribute("hidden", "hidden");
document.getElementById("34D").setAttribute("hidden", "hidden");
document.getElementById("35D").setAttribute("hidden", "hidden");
document.getElementById("36D").setAttribute("hidden", "hidden");
document.getElementById("37D").setAttribute("hidden", "hidden");
document.getElementById("38D").setAttribute("hidden", "hidden");
document.getElementById("39D").setAttribute("hidden", "hidden");
document.getElementById("40D").setAttribute("hidden", "hidden");
document.getElementById("41D").setAttribute("hidden", "hidden");
document.getElementById("42D").setAttribute("hidden", "hidden");
document.getElementById("43D").setAttribute("hidden", "hidden");
document.getElementById("44D").setAttribute("hidden", "hidden");
document.getElementById("45D").setAttribute("hidden", "hidden");
document.getElementById("46D").setAttribute("hidden", "hidden");
document.getElementById("47D").setAttribute("hidden", "hidden");
document.getElementById("48D").setAttribute("hidden", "hidden");
document.getElementById("49D").setAttribute("hidden", "hidden");
document.getElementById("50D").setAttribute("hidden", "hidden");
document.getElementById("51D").setAttribute("hidden", "hidden");
document.getElementById("52D").setAttribute("hidden", "hidden");
document.getElementById("53D").setAttribute("hidden", "hidden");
document.getElementById("54D").setAttribute("hidden", "hidden");
document.getElementById("55D").setAttribute("hidden", "hidden");
document.getElementById("56D").setAttribute("hidden", "hidden");
document.getElementById("57D").setAttribute("hidden", "hidden");
document.getElementById("58D").setAttribute("hidden", "hidden");
document.getElementById("59D").setAttribute("hidden", "hidden");
document.getElementById("60D").setAttribute("hidden", "hidden");
document.getElementById("61D").setAttribute("hidden", "hidden");
document.getElementById("62D").setAttribute("hidden", "hidden");
document.getElementById("63D").setAttribute("hidden", "hidden");
document.getElementById("64D").setAttribute("hidden", "hidden");
document.getElementById("65D").setAttribute("hidden", "hidden");
document.getElementById("66D").setAttribute("hidden", "hidden");

if(select.value=="NORTHLAND")
{
document.getElementById("1D").removeAttribute("hidden", "hidden");
document.getElementById("2D").removeAttribute("hidden", "hidden");
document.getElementById("3D").removeAttribute("hidden", "hidden");
}
if(select.value=="AUCKLAND")
{
document.getElementById("4D").removeAttribute("hidden", "hidden");
}
if(select.value=="WAIKATO")
{
document.getElementById("5D").removeAttribute("hidden", "hidden");
document.getElementById("6D").removeAttribute("hidden", "hidden");
document.getElementById("7D").removeAttribute("hidden", "hidden");
document.getElementById("8D").removeAttribute("hidden", "hidden");
document.getElementById("9D").removeAttribute("hidden", "hidden");
document.getElementById("10D").removeAttribute("hidden", "hidden"); 
document.getElementById("11D").removeAttribute("hidden", "hidden"); 
}
if(select.value=="BAY OF PLENTY")
{
document.getElementById("12D").removeAttribute("hidden", "hidden");
document.getElementById("13D").removeAttribute("hidden", "hidden");
document.getElementById("14D").removeAttribute("hidden", "hidden");
document.getElementById("15D").removeAttribute("hidden", "hidden");
document.getElementById("16D").removeAttribute("hidden", "hidden");
document.getElementById("17D").removeAttribute("hidden", "hidden"); 
document.getElementById("18D").removeAttribute("hidden", "hidden");
document.getElementById("19D").removeAttribute("hidden", "hidden"); 
}
if(select.value=="TARANAKI")
{
document.getElementById("20D").removeAttribute("hidden", "hidden");
document.getElementById("21D").removeAttribute("hidden", "hidden");
document.getElementById("22D").removeAttribute("hidden", "hidden");
document.getElementById("23D").removeAttribute("hidden", "hidden");
document.getElementById("24D").removeAttribute("hidden", "hidden");
document.getElementById("25D").removeAttribute("hidden", "hidden"); 
document.getElementById("26D").removeAttribute("hidden", "hidden"); 
}
if(select.value=="EAST COAST")
{
document.getElementById("27D").removeAttribute("hidden", "hidden");
document.getElementById("28D").removeAttribute("hidden", "hidden");
document.getElementById("29D").removeAttribute("hidden", "hidden");
document.getElementById("30D").removeAttribute("hidden", "hidden");
document.getElementById("31D").removeAttribute("hidden", "hidden");
}
if(select.value=="CENTRAL")
{
document.getElementById("32D").removeAttribute("hidden", "hidden");
document.getElementById("33D").removeAttribute("hidden", "hidden");
document.getElementById("34D").removeAttribute("hidden", "hidden");
document.getElementById("35D").removeAttribute("hidden", "hidden");
document.getElementById("36D").removeAttribute("hidden", "hidden");
document.getElementById("37D").removeAttribute("hidden", "hidden");
document.getElementById("38D").removeAttribute("hidden", "hidden");
document.getElementById("39D").removeAttribute("hidden", "hidden");
}
if(select.value=="WELLINGTON")
{
document.getElementById("40D").removeAttribute("hidden", "hidden");
document.getElementById("41D").removeAttribute("hidden", "hidden");
document.getElementById("42D").removeAttribute("hidden", "hidden");
document.getElementById("43D").removeAttribute("hidden", "hidden");
}
if(select.value=="NELSON")
{
document.getElementById("44D").removeAttribute("hidden", "hidden");
document.getElementById("45D").removeAttribute("hidden", "hidden");
document.getElementById("46D").removeAttribute("hidden", "hidden");
document.getElementById("47D").removeAttribute("hidden", "hidden");
document.getElementById("48D").removeAttribute("hidden", "hidden");
document.getElementById("49D").removeAttribute("hidden", "hidden");
document.getElementById("50D").removeAttribute("hidden", "hidden");
}
if(select.value=="CANTERBURY")
{
document.getElementById("51D").removeAttribute("hidden", "hidden");
document.getElementById("52D").removeAttribute("hidden", "hidden");
document.getElementById("53D").removeAttribute("hidden", "hidden");
document.getElementById("54D").removeAttribute("hidden", "hidden");
document.getElementById("55D").removeAttribute("hidden", "hidden");
}
if(select.value=="SOUTHERN")
{
document.getElementById("56D").removeAttribute("hidden", "hidden");
document.getElementById("57D").removeAttribute("hidden", "hidden");
document.getElementById("58D").removeAttribute("hidden", "hidden");
document.getElementById("59D").removeAttribute("hidden", "hidden");
document.getElementById("60D").removeAttribute("hidden", "hidden");
document.getElementById("61D").removeAttribute("hidden", "hidden");
document.getElementById("62D").removeAttribute("hidden", "hidden");
document.getElementById("63D").removeAttribute("hidden", "hidden");
document.getElementById("64D").removeAttribute("hidden", "hidden");
document.getElementById("65D").removeAttribute("hidden", "hidden");
document.getElementById("66D").removeAttribute("hidden", "hidden");
}

}

<!-- ---------- ACCOMMODATION TYPE [SITUATION] ---------- -->

function AccType(select){

// from questions 5a
// note first block clears dependencies in case temporary acc option selected
// wont work with an else as expected 

document.getElementById("SupportNote").setAttribute("hidden", "hidden"); 

document.getElementById("Question5b").value = "Not selected";
document.getElementById("Question5b").classList.add("error-input"); 

document.getElementById("Question5c").setAttribute("hidden", "hidden");
document.getElementById("Question5cSelect").value = "";
document.getElementById("Question5cSelect").classList.add("error-input");

document.getElementById("Question6b").setAttribute("hidden", "hidden");
document.getElementById("Question6bSelect").value = "Not selected";
document.getElementById("Question6bSelect").classList.add("error-input");

document.getElementById("Question6c").setAttribute("hidden", "hidden");
document.getElementById("Question6cSelect").value = "Not selected";
document.getElementById("Question6cSelect").classList.add("error-input");

if(select.value=="Other")
{
document.getElementById("Question5c").removeAttribute("hidden", "hidden");
document.getElementById("Question6b").removeAttribute("hidden", "hidden");
document.getElementById("SupportNote").setAttribute("hidden", "hidden"); 

document.getElementById("Question5b").value = "Not selected";
document.getElementById("Question5b").classList.add("error-input"); 

document.getElementById("Question5cSelect").value = "";
document.getElementById("Question5cSelect").classList.add("error-input");

document.getElementById("Question6aSelect").value = "Not selected";
document.getElementById("Question6aSelect").classList.add("error-input");

document.getElementById("Question6bSelect").value = "Not selected";
document.getElementById("Question6bSelect").classList.add("error-input");

document.getElementById("Question6cSelect").value = "Not selected";
document.getElementById("Question6cSelect").classList.add("error-input");

}
else if(
select.value=="Boarding" 	||
select.value=="Cabin" 		||
select.value=="Caravan" 	||
select.value=="Own home" 	||
select.value=="Renting" 	||
select.value=="Staying with friends/family")
{
document.getElementById("Question5b").value = "Not selected";
document.getElementById("Question5b").classList.add("error-input"); 

document.getElementById("Question5c").setAttribute("hidden", "hidden");
document.getElementById("Question5cSelect").value = "";
document.getElementById("Question5cSelect").classList.add("error-input");

document.getElementById("Question6b").removeAttribute("hidden", "hidden");
document.getElementById("Question6bSelect").value = "Not selected";
document.getElementById("Question6bSelect").classList.add("error-input");

document.getElementById("Question6cSelect").value = "Not selected";
document.getElementById("Question6cSelect").classList.add("error-input");
}
}

<!-- ---------- SUPPORT YES [SITUATION] ---------- -->

function SupportYes(select)

// with boolean if clicking yes clears all, no need to repeat on no
{
if(select.value=="Yes")
{
document.getElementById("Section2").setAttribute("hidden", "hidden");
document.getElementById("SupportNote").setAttribute("hidden", "hidden"); 
document.getElementById("PetNote").setAttribute("hidden", "hidden"); 
document.getElementById("Question10b").setAttribute("hidden", "hidden"); 

document.getElementById("Question6c").removeAttribute("hidden", "hidden");
document.getElementById("Question6cSelect").value = "Not selected";
document.getElementById("Question6cSelect").classList.add("error-input");

document.getElementById("Question7a").value = "Not selected";
document.getElementById("Question7a").classList.add("error-input");

document.getElementById("Question8aSelect").value = "";
document.getElementById("Question8aSelect").classList.add("error-input");

document.getElementById("Question9a").value = "Not selected";
document.getElementById("Question9a").classList.add("error-input");

document.getElementById("Question9b").value = "Not selected";
document.getElementById("Question9b").classList.add("error-input");

document.getElementById("Question10aSelect").value = "Not selected";
document.getElementById("Question10aSelect").classList.add("error-input");

document.getElementById("Question10bSelect").value = "";
document.getElementById("Question10bSelect").classList.add("error-input");

document.getElementById("Question11aSelect").value = "Not selected";
document.getElementById("Question11aSelect").classList.add("error-input");

}

if(select.value=="No")
{
document.getElementById("Section2").removeAttribute("hidden", "hidden");
document.getElementById("SupportNote").removeAttribute("hidden", "hidden"); 
}
}

<!-- ---------- SECONDARY REASON [MOVING] ---------- -->

function maxThree(select)

// Statistical from Question9b

{
var Count = document.getElementById("Question9b").selectedOptions.length;
if (Count > 3) {
document.getElementById("MaxAlert").removeAttribute("hidden");
setTimeout(function()
{ 
document.getElementById("Question9b").value = "Not selected";
document.getElementById("Question9b").classList.add("error-input");
}, 500);

setTimeout(function()
{ 
document.getElementById("MaxAlert").setAttribute("hidden", "hidden");
}, 3500);
} else  {
document.getElementById("MaxAlert").setAttribute("hidden", "hidden");
}
}

<!-- ---------- MOBILITY ISSUES [MOVING] ---------- -->

function mobilityIssues(select){

// from question 10a

if(select.value=="Yes" )

{ document.getElementById("Question10b").removeAttribute("hidden");}

if(select.value=="No" ) {
document.getElementById("Question10b").setAttribute("hidden", "hidden");
document.getElementById("Question10bSelect").value = "";
document.getElementById("Question10bSelect").classList.add("error-input");
}
}

<!-- ---------- PET ISSUES [MOVING]---------- -->

function petIssues(select){

// from question 11a

if(select.value=="Yes" )
{
document.getElementById("PetNote").setAttribute("hidden", "hidden");
}
if(select.value=="No" )
{
document.getElementById("PetNote").removeAttribute("hidden");
}
}


<!-- ---------- LIVEWITH [FAMILY] ---------- -->

function liveWith(select){

// from question 13a

if(select.value=="No" )
{
document.getElementById("Question13b").removeAttribute("hidden");
document.getElementById("Question13bSelect").classList.add("error-input");
}
if(select.value=="Yes" )
{
document.getElementById("Question13b").setAttribute("hidden", "hidden");
document.getElementById("Question13bSelect").value = "";
}
}

<!-- ---------- CHILDREN [FAMILY] ---------- -->

function childrenYes(select){

// First section resets children group on any change in Q12b.
// this is because the answers are likely invalid in the case of a change.
// false section not needed in the case of yes/no questions

var children = document.getElementById("Question12b").value > 0;

document.getElementById("Question14aSelect").value = "Not selected";
document.getElementById("Question14aSelect").classList.add("error-input");

document.getElementById("Question14bSelect").value = "Not selected";
document.getElementById("Question14bSelect").classList.add("error-input");

document.getElementById("Question14cSelect").value = "";
document.getElementById("Question14cSelect").placeholder = "Not selected";
document.getElementById("Question14cSelect").classList.add("error-input");

document.getElementById("Question14dSelect").value = "Not selected";
document.getElementById("Question14dSelect").classList.add("error-input");

document.getElementById("Question14eSelect").value = "Not selected";
document.getElementById("Question14eSelect").classList.add("error-input");

if(children==true) 
{
document.getElementById("Children").removeAttribute("hidden", "hidden");
}

if(children==false) 
{
document.getElementById("Children").setAttribute("hidden", "hidden");

document.getElementById("Question14aSelect").value = "Not selected";
document.getElementById("Question14aSelect").classList.add("error-input");

document.getElementById("Question14bSelect").value = "Not selected";
document.getElementById("Question14bSelect").classList.add("error-input");

document.getElementById("Question14cSelect").value = "";
document.getElementById("Question14cSelect").placeholder = "Not selected";
document.getElementById("Question14cSelect").classList.add("error-input");

document.getElementById("Question14dSelect").value = "Not selected";
document.getElementById("Question14dSelect").classList.add("error-input");

document.getElementById("Question14eSelect").value = "Not selected";
document.getElementById("Question14eSelect").classList.add("error-input");
}
}

<!-- ---------- SUPPORT [EXTERNAL SERVICES] ---------- -->

function support(select){

// From question 16a

if(select.value=="Yes")
{
document.getElementById("Question15b").removeAttribute("hidden");
}
if(select.value=="No")
{
document.getElementById("Question15b").setAttribute("hidden", "hidden");
document.getElementById("Question15bSelect").value = "Not selected";
document.getElementById("Question15bSelect").classList.add("error-input");

document.getElementById("Question15c").setAttribute("hidden", "hidden");
document.getElementById("Question15cSelect").value = "";
document.getElementById("Question15cSelect").classList.add("error-input");
}
}

<!-- ---------- SERVICEOTHER [EXTERNAL SERVICES] ---------- -->

function serviceOther(select){

// From question 16b

var text 		= getSelectValues(document.getElementById("Question15bSelect"));

if (text.includes("Other")==true){
document.getElementById("Question15c").removeAttribute("hidden");

}else{
document.getElementById("Question15c").setAttribute("hidden", "hidden");
document.getElementById("Question15cSelect").value = "";
document.getElementById("Question15cSelect").classList.add("error-input");
}
}

<!-- ---------- [EMPLOYMENT] ---------- -->

function employment(select){

// From question 18a

if(select.value=="Yes"){
document.getElementById("Question17b").removeAttribute("hidden");
document.getElementById("Question18a").removeAttribute("hidden");
}
if(select.value=="No"){
document.getElementById("Question17b").setAttribute("hidden", "hidden");
document.getElementById("Question17bSelect").value = "Not selected";
document.getElementById("Question17bSelect").classList.add("error-input");

document.getElementById("Question18a").setAttribute("hidden", "hidden");
document.getElementById("Question18aSelect").value = "Not selected";
document.getElementById("Question18aSelect").classList.add("error-input");
}
}

<!-- ---------- SHOW SUPPORT ---------- -->

function ShowSupport() {

// Support button, section 4 = option list, further note, file note button.
document.getElementById("Section4").removeAttribute("hidden");

// Opt 13/14 default values always available.
document.getElementById("OPT13").removeAttribute("hidden");
document.getElementById("OPT14").removeAttribute("hidden");

// why do you need help.
if(
document.getElementById("Question2a").value =="Asked to leave boarding situation" 	|| 
document.getElementById("Question2a").value =="Conflict within the household")
{
document.getElementById("OPT10").removeAttribute("hidden");
document.getElementById("OPT11").removeAttribute("hidden");
document.getElementById("OPT12").removeAttribute("hidden");
document.getElementById("OPT13").removeAttribute("hidden");
document.getElementById("OPT14").removeAttribute("hidden");

document.getElementById("OPT19").removeAttribute("hidden");
document.getElementById("OPT21").removeAttribute("hidden");
}

if(document.getElementById("Question2a").value =="Family Harm")
{ 
document.getElementById("OPT22").removeAttribute("hidden");
document.getElementById("violence??").removeAttribute("hidden");
}

if(document.getElementById("Question2a").value =="Gang Activities")
{ 
document.getElementById("OPT22").removeAttribute("hidden");
}

if(document.getElementById("Question2a").value =="Medical Reasons")
{
document.getElementById("OPT10").removeAttribute("hidden"); 
document.getElementById("OPT11").removeAttribute("hidden"); 
document.getElementById("OPT12").removeAttribute("hidden"); 
document.getElementById("OPT15").removeAttribute("hidden"); 
document.getElementById("OPT17").removeAttribute("hidden"); 
document.getElementById("OPT18").removeAttribute("hidden"); 
}

if(document.getElementById("Question2a").value =="Moving for work")
{
document.getElementById("OPT12").removeAttribute("hidden");
document.getElementById("OPT16").removeAttribute("hidden");
document.getElementById("OPT22").removeAttribute("hidden");
}

if(document.getElementById("Question2a").value =="Neighbourhood safety issues")
{
document.getElementById("OPT22").removeAttribute("hidden");
}

if(document.getElementById("Question2a").value =="Separated from partner")
{
document.getElementById("OPT22").removeAttribute("hidden");
}

if(document.getElementById("Question2a").value =="Tenancy Ending")
{
document.getElementById("OPT22").removeAttribute("hidden");
}

if(document.getElementById("Question2a").value =="Tenancy Eviction")
{
document.getElementById("OPT2").removeAttribute("hidden");
document.getElementById("OPT19").removeAttribute("hidden");
document.getElementById("OPT21").removeAttribute("hidden");
}

if(document.getElementById("Question2a").value =="Impacted by natural disasters")
{
document.getElementById("OPT12").removeAttribute("hidden");
document.getElementById("OPT22").removeAttribute("hidden");
}

// MSD or a community family support person.
if(document.getElementById("Question2d").value =="No")
{
document.getElementById("OPT25").removeAttribute("hidden");
}

// District for transitional
if(document.getElementById("Question4b").value =="Rotorua District")
{
document.getElementById("OPT7").removeAttribute("hidden");
}

// Stay with support
if(document.getElementById("Question6b").value =="Yes")
{
document.getElementById("OPT1").removeAttribute("hidden");
document.getElementById("OPT2").removeAttribute("hidden");
document.getElementById("OPT3").removeAttribute("hidden");
document.getElementById("OPT4").removeAttribute("hidden");
document.getElementById("OPT5").removeAttribute("hidden");
document.getElementById("OPT10").removeAttribute("hidden");
document.getElementById("OPT11").removeAttribute("hidden");
document.getElementById("OPT12").removeAttribute("hidden");
document.getElementById("OPT15").removeAttribute("hidden");
}

// when do you need to move.
if(
document.getElementById("Question7a").value =="8-30 days" 	|| 
document.getElementById("Question7a").value =="31-60 days" 	|| 
document.getElementById("Question7a").value =="61-90 days"  ||
document.getElementById("Question7a").value =="91+ days")
{
document.getElementById("OPT1").removeAttribute("hidden");
document.getElementById("OPT2").removeAttribute("hidden");
document.getElementById("OPT3").removeAttribute("hidden");
document.getElementById("OPT4").removeAttribute("hidden");
document.getElementById("OPT6").removeAttribute("hidden");
// FINANCIAL SECTION
document.getElementById("OPT10").removeAttribute("hidden");
document.getElementById("OPT11").removeAttribute("hidden");
document.getElementById("OPT16").removeAttribute("hidden");
// SUPPORT SECTION
document.getElementById("OPT19").removeAttribute("hidden");
document.getElementById("OPT22").removeAttribute("hidden");
document.getElementById("OPT23").removeAttribute("hidden");
}
if(
document.getElementById("Question7a").value =="Immediately"  ||
document.getElementById("Question7a").value =="7 days or less")
{
document.getElementById("OPT6").removeAttribute("hidden", "hidden");
document.getElementById("OPT8").removeAttribute("hidden", "hidden");
}



}



<!-- ---------- RESET ---------- -->

function Reset() {
document.getElementById("myForm").reset();

document.getElementById("SupportNote").setAttribute("hidden", "hidden");
document.getElementById("ChildNote").setAttribute("hidden", "hidden");
document.getElementById("FlexiNote").setAttribute("hidden", "hidden");
document.getElementById("PetNote").setAttribute("hidden", "hidden");
document.getElementById("MoeNote").setAttribute("hidden", "hidden");
 
for (var i = 0; i < document.getElementsByName("mandatory").length; i++) {
mandatoryElements[i].classList.add("error-input");
}
document.getElementById("Question6b").setAttribute("hidden", "hidden");
document.getElementById("Question6c").setAttribute("hidden", "hidden");
}

<!-- ---------- GENERATE PROVIDERS ---------- -->

function GenerateProviders() {
document.getElementById("Section5").removeAttribute("hidden");
}

<!-- ---------- TEXT CHANGED ---------- -->

function textChanged(el) {

if (el.value.length != 0) 
{ el.classList.remove("error-input"); }

else
{ el.classList.add("error-input"); }
}

/* https://sarahholleydesign.com/pure-css-custom-error-messaging-for-default-form-elements/ */

var mandatoryComplete = true;
var mandatoryElements = document.getElementsByName("mandatory");
for (var i = 0; i < mandatoryElements.length; i++) {

if (mandatoryElements[i].value.length == 0 ) {
/* Test that the mandatory fields have been completed */
mandatoryElements[i].classList.add("error-input");
mandatoryComplete = false;
}

if (mandatoryElements[i].value == "Not selected") {
mandatoryElements[i].classList.add("error-input");
mandatoryComplete = false;
}
}

/* https://www.w3schools.com/howto/howto_js_snackbar.asp */
if (mandatoryComplete == false) {
className = "show";
}

<!-- ---------- FILE NOTE ---------- -->

function GenerateFileNote() {
document.getElementById("Section6").removeAttribute("hidden");
document.querySelector("#Area3").style.height = "1400px";

var Question2a  		= getSelectValues(document.getElementById("Question2a"));

if (document.getElementById("Question2bSelect").value == "") {var Question2b = "Not Selected";}
else {var Question2b = document.getElementById("Question2bSelect").value;}

var Question5			= document.getElementById("Question5").value;

var Question4a			= document.getElementById("Question4a").value;

var Question4b			= document.getElementById("Question4b").value;

if (document.getElementById("Question5cSelect").value == "") {var Question5c = "Not Selected";}
else {var Question5c = document.getElementById("Question5cSelect").value;}

var Question6b			= document.getElementById("Question6bSelect").value;

var Question6c			= document.getElementById("Question6cSelect").value;

var Question9a			= document.getElementById("Question9a").value;

var Question9b			= getSelectValues(document.getElementById("Question9b"));

var Question12a			= document.getElementById("Question12a").value;

var Question12b			= document.getElementById("Question12b").value;

var Question7a			= document.getElementById("Question7a").value;

var Question9b			= document.getElementById("Question9b").value;

var Question9c			= document.getElementById("Question9cSelect").value;

var Question15a			= document.getElementById("Question15a").value;

var Question15b			= getSelectValues(document.getElementById("Question15bSelect"));

if (document.getElementById("Question15cSelect").value == "") {var Question15c = "Not Selected";}
else {var Question15c = document.getElementById("Question15cSelect").value;}

if (document.getElementById("Questionz11dSelect").value == "") {var Questionz11d = "Not Selected";}
else {var Questionz11d = document.getElementById("Questionz11dSelect").value;}

var Question17aa			= document.getElementById("Question17aSelect").value;

var Question14a			= document.getElementById("Question14aSelect").value;

if (document.getElementById("Question10aSelect").value == "") {var Question10a = "Not Selected";}
else {var Question10a = document.getElementById("Question10aSelect").value;}

var Question10a			= document.getElementById("Question10aSelect").value;

if (document.getElementById("Question11aSelect").value == "") {var Question11a = "Not Selected";}
else {var Question11a = document.getElementById("Question11aSelect").value;}

if (document.getElementById("Question19aSelect").value == "") {var Question19a = "Not Selected";}
else {var Question19a = document.getElementById("Question19aSelect").value;}

var copyText =

'--- #v1 Client Needs Assessment \n'+

'\nQ1a WHAT ARE YOU NEEDING HELP WITH?:'						 	 							+ Question2a			+ '\n'	+
'\nQ1b IF OTHER SELECTED ABOVE PLEASE ADD FURTHER COMMENTS?:\n'									+ Question2b			+';\n'	+
'\nQ2 HOW LONG HAVE YOU BEEN IN YOUR CURRENT ACCOMMODATION?:\n'									+ Question5  			+';\n'	+
'\nQ3a WHERE ARE YOU CURRENTLY LIVING TYPE?:\n'													+ Question4a  			+';\n'	+
'\nQ3b WHERE ARE YOU CURRENTLY LIVING LOCATION?:\n'												+ Question4b 			+';\n'	+
'\nQ3c WHERE ARE YOU CURRENTLY LIVING OTHER?:\n'												+ Question5c 			+';\n'	+
'\nQ4a IF WE COULD PROVIDE FINANCIAL SUPPORT, COULD YOU STAY IN YOUR CURRENT RESIDENCE?:\n'		+ Question6b			+';\n'	+
'\nQ4b WHO CAN YOU STAY WITH?:\n'																+ Question6c			+';\n'	+
'\nQ5a WHAT IS MAKING IT HARD FOR YOU TO FIND SUITABLE HOUSING? PRIMARY?:\n'					+ Question9a			+';\n'	+
'\nQ5b WHAT IS MAKING IT HARD FOR YOU TO FIND SUITABLE HOUSING? SECONDARY?:'					+ Question9b			+'\n'	+
'\nQ6a WHO NEEDS ASSISTANCE IN YOUR HOUSEHOLD ADULT?:\n'										+ Question12a			+';\n'	+
'\nQ6b WHO NEEDS ASSISTANCE IN YOUR HOUSEHOLD CHILD?:\n'										+ Question12b			+';\n'	+
'\nQ7a WHEN DO YOU NEED TO MOVE?:\n'															+ Question7a			+';\n'	+
'\nQ7b WHAT REGION ARE YOU LIVING IN?:\n'														+ Question9b			+';\n'	+
'\nQ7c DO YOU LIVE IN ROTORUA?:\n'																+ Question9c			+';\n'	+
'\nQ8a ARE YOU CURRENTLY BEING SUPPORTED BY ANYONE OR ANY SERVICE WITH YOUR HOUSING?:\n'		+ Question15a			+';\n'	+
'\nQ8b IF YES, PLEASE SELECT ANSWER BELOW:'														+ Question15b			+'\n'	+
'\nQ8c IF OTHER PLEASE TYPE BELOW:\n'															+ Question15c			+';\n'	+
'\nQ8d IF TRANSITIONAL HOUSING PROVIDER PLEASE TYPE BELOW:\n'									+ Question11d			+';\n'	+
'\nQ9 WILL ANYONE IN YOUR HOUSEHOLD BE LOOKING FOR EMPLOYMENT?:\n'								+ Question17a			+';\n'	+
'\nQ10a ARE YOUR KIDS ENROLLED OR ATTENDING SCHOOL, DAYCARE OR KOHANGA?:\n'						+ Question14a			+';\n'	+
'\nQ12a IS THERE A SPECIFIC AREA YOU NEED TO STAY IN?:\n'										+ Question10a		    +';\n'	+
'\nQ13a DOES ANYONE IN YOUR HOUSE HAVE MOBILITY ISSUES?:\n'										+ Question10a		    +';\n'	+
'\nQ14a PLEASE EXPAND BELOW?:\n'																+ Question11a		    +';\n'	+
'\nQ15a ANY FURTHER BRIEF COMMENTS?:\n'															+ Question19a		    +';\n'	+

'\n--- # Template End';

navigator.clipboard.writeText(copyText);

document.querySelector("#Area3").value = copyText;
}

<!-- ---------- LOOP THROUGH MULTISELECT ---------- -->

// '\nQ?:\n'+ Question4C + '\n' +

function getSelectValues(select) {
var result = "";
var options = select && select.options;
var opt;

for (var i=0, iLen=options.length; i<iLen; i++) {
opt = options[i];

if (opt.selected) {

if (result == "") {
result = "\n" + opt.text + ";" ;
}
else {
result =  "\n" + opt.text + " # " + result ;
}
}
}
return result;
}

</script>
</body>
</html>

```


### NEW
```html

<!DOCTYPE html>
<html>

  <script
    id="insert"
    type="text/javascript"
    src="//code.jquery.com/jquery-1.11.0.js">
  </script>

<!--  --------------------  HEADER TEXT FORMATTING--------------------  --> 

  <head>

    <title>x </title>
    <link href=https://fonts.googleapis.com/css?family=Roboto:300,400,500,700 rel="stylesheet">
    <link rel="stylesheet" href=https://use.fontawesome.com/releases/v5.5.0/css/all.css integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<style>
      html, body {
      min-height: 100%;
      }
      
      textarea { 
      margin-top: 5px;
      min-height: 100px;
      max-width:100%;
	  max-height: 100%
      }
      
      th {
      text-align: left;
      }
	  
      form {
	  margin: 0;
      }
      
      table{
	  padding: 0px 0 15px;
	  }

      caption {
      padding: 15px 0 0px;
      font-size: 20px;
      }

      body, div, form, input, select, p { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 14px;
      color: #666;
      line-height: 22px;
      }
  
      .testbox {
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: inherit;
      padding: 10px;
     }

      form {
      width: 100%;
	  min-width: 375px;
      padding: 15px;
      border-radius: 6px;
      background: #fff;
      box-shadow: 0 0 20px 0 #a82877; 
      }

      .block {
      margin-left: 0px;
      width: 100%;
      height: 25px;
      border: none;
      display: flex;
      opacity: 100;
      display: flex;
      justify-content: center;
      align-items: center;
      }
      
      .hidden-block {
      margin-left: 0px;
      width: 100%;
      height: 25px;
      border: none;
      display: flex;
      opacity: 100;
      display: flex;
      justify-content: center;
      align-items: center;
  	  display: none;
      }
     
      .banner {
      padding: 30px;
	  margin-top: 10px;
      margin-bottom: 12px;
      position: relative;
      min-height: 75px;
      max-height: auto;
      height: auto;
      background-size: contain;
      display: flex;
      background-image: url(https://www.msd.govt.nz/webadmin/images/msd-logo-blue.svg);      
      background-repeat: no-repeat;
      background-color: rgba(0, 0, 0, 0.5); 
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
      margin-top: 5px;
     }

      .name-item input, .city-item input {
      width: calc (50% - 20px);
      margin-top: 5px;
      }

      .city-item select {
      width: calc(50% - 8px);
	  margin-top: 5px;
      }

      .item {
      position: relative;
      margin-top: 5px;
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

  <body>

  
    <div class="testbox">
       <form id="myForm" action="/">
    
     <button class="block" type="button" onclick="Reset()" > RESET ALL</button>
         
   <div class="header" id="myHeader"> </div>
  
        <div class="banner"> </div>
      
          <p>Where are you currently staying?</p>

            <div class="item">
            <select size ="15" id="Question1" >
              <option value="0" hidden selected>Not selected</option>
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
       

          <p>What are you needing help with?</p>
			
            <div class="item">
            <select multiple size ="12" id="Question2a">
			  <option value="01" hidden selected>Not selected</option>
              <option value="02">Children</option>
              <option value="03">Current accommodation is unhealthy</option>
              <option value="04">Employment reasons</option>
              <option value="05">Family reasons</option>
              <option value="06">Financial stress</option>
 			  <option value="07">Gang Affiliation or concern</option>
              <option value="08">Medical</option>
              <option value="09">Personal Safety</option>
              <option value="10">Public Transport</option>
              <option value="11">Tenancy ending</option>
              <option value="12">Tenancy eviction</option>
              <option value="13">Other (please add comments below)</option>
            </select>
          </div>
       

         <p>If other selected above, please add further comments </p>
          
          <div class="item">
          <input type="text" id="Question2b" placeholder="Not Selected" >
          
          </div>
         
          <p>How long have you been in your current living situation? </p>
		  
			<div class="item">
            <select  size ="9" id="Question3" >
              <option value="0" hidden selected>Not selected</option>
              <option value="2">less then 1 month</option>
              <option value="3">less then 3 months</option>
              <option value="4">less then 6 months</option>
              <option value="5">less then 1 year</option>
              <option value="6">less then 2 years</option>
              <option value="7">less then 3 years</option>
              <option value="8">less then 4 years</option>
              <option value="9">less then 5 years</option>
              <option value="10">more then 5 years</option>
            </select>
          </div>
        


          <p>If we could provide some support could you stay where you are?</p>

		  <div class="item">
            <select  size ="2" id="Question4a">
  		      <option value="Not selected" hidden selected>Not selected</option> 
              <option value="Yes">Yes </option>
              <option value="No">No </option>
            </select>
          </div>
        

          <p>Do you have children?</p>
           
			<div class="item">
			<select size ="2" id="Question4b"> 
              <option value="Not selected" hidden selected>Not selected</option> 
              <option value="Yes">Yes</option>
              <option value="No">No</option>
            </select>
          </div>
        

          <p>When do you need to move?</p>
          
           <div class="item">
           <select size ="4" id="Question4c">
              <option value="Not selected" hidden selected>Not selected</option> 
   
              <option value="Immediately">Immediately</option>
              <option value="7 days or less">7 days or less</option>
              <option value="8-60 days">8-60 days</option>
              <option value="61-91 days">61-91 days</option>
            </select>
          </div>
       

          <p>Who needs assistance in your household</p>

          <div class="city-item">
            <select size = "6" id="Question5a">
              <option value="0" selected>Number of Adults</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>

            <select size = "6" id="Question5b">
              <option value="0" selected>Number of Children</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
            </select>
          </div>


        
          <p>Why is it hard for you to find suitable housing? </p>
          
          <div class="city-item">
            <select size = "13" id="Question6">
            <option value="Not selected" hidden selected>Not selected</option> 
            <option value="00">PRIMARY REASON SELECT ONE</option>
			<option value="01">Age</option>
 		    <option value="02">Behind in rent</option>
            <option value="03">Cost of rental</option>
            <option value="04">Cost of rental</option>
            <option value="05">Criminal history</option>
            <option value="06">Credit history</option>
            <option value="07">Disability</option>
	        <option value="08">Gang affiliation</option>
            <option value="09">Health</option> 
            <option value="10">No rental history</option>
            <option value="11">Pets</option>
            <option value="12">Size of household</option>
            </select>
     
            <select multiple size = "13" id="Question6b">
            <option value="Not selected" hidden selected>Not selected</option> 
            <option value="00">SECONDARY REASON SELECT UP TO THREE</option>
			<option value="01">Age</option>
 		    <option value="02">Behind in rent</option>
            <option value="03">Cost of rental</option>
            <option value="04">Cost of rental</option>
            <option value="05">Criminal history</option>
            <option value="06">Credit history</option>
            <option value="07">Disability</option>
	        <option value="08">Gang affiliation</option>
            <option value="09">Health</option> 
            <option value="10">No rental history</option>
            <option value="11">Pets</option>
            <option value="12">Size of household</option>
            </select>
          </div>
        

          <p>What region are you living in?</p>
          
          <div class="item">
            <select size = "13" id="Question7">
            <option value="Not selected" hidden selected>Not selected</option>   
            <option value="01">Auckland Central-East</option>
            <option value="02">Auckland North-West</option>
            <option value="03">Auckland South</option>
            <option value="04">Bay of Plenty</option>
            <option value="05">Canterbury</option>
            <option value="06">Central</option>
            <option value="07">East Coast</option>
			<option value="08">Nelson</option>
            <option value="09">Northland</option>
            <option value="10">Southern</option>
            <option value="11">Taranaki</option>
            <option value="12">Waikato</option>
			<option value="13">Wellington</option>
            </select>
          </div>
        
                  <p>Do you live in Rotorua?</p>
          
          <div class="item">
            <select size = "2" id="Question7a">
            <option value="Not selected" hidden selected>Not selected</option> 
            <option value="Yes">Yes</option>
            <option value="No">No</option>
 
            </select>
          </div>

          <p>Is anyone or any service helping you with your housing?</p>
          
           <div class="item">
            <select size="2" id="Question8a">
              <option value="Not selected" hidden selected>Not selected</option> 
              <option value="Yes">Yes</option>
              <option value="No">No</option>
            </select>
          </div>

          <p>If yes, please answer select below</p>
          
           <div class="item">
              <select multiple size ="4" id="Question8b">
              <option value="Not selected" hidden selected>Not selected</option>
			  <option value="1">Corrections</option>
              <option value="2">Kainga Ora</option>
              <option value="3">Salvation Army</option>
              <option value="4">Other</option>
            </select>
          </div>
       
          <p>If other please type below</p>
		 <div class="item">
          <input type="text" name="freetext" id="Question8c" placeholder="Not Selected" >
          </div>

<!-- BUTTON -->

<button class="block" type="button" onclick="FinaliseAnswers()" > FINALISE ANSWERS </button>

     
<table> 
<table hidden style="width:100%; align-items: left; background-color: #E5E4E2; color:black; margin-bottom: 20px;" id="Table" class="tb" > 

<thead>
<tr>
<th bgcolor="gray"  >NO</th>  
<th bgcolor="gray"  >TYPE</th>
<th bgcolor="gray"  >BENEFITS</th>
<tr>
</thead>

<tbody>
<tr id=01 hidden><td>01</td>     <td>HOUSING</td>       <td>Emergency Housing</td>     										</tr>
<tr id=02 hidden><td>02</td>     <td>HOUSING</td>       <td>Transition Housing Referral</td>     							</tr>
<tr id=03 hidden><td>03</td>     <td>HOUSING</td>       <td>Public Housing Assessment</td>     								</tr>
<tr id=04 hidden><td>04</td>     <td>FINANCIAL</td>     <td>HSP - Bond Grant</td>     										</tr>
<tr id=05 hidden><td>05</td>     <td>FINANCIAL</td>     <td>HSP - Rent-in-Advance</td>     									</tr>
<tr id=06 hidden><td>06</td>     <td>FINANCIAL</td>     <td>HSP - Rent Arrears</td>     									</tr>
<tr id=07 hidden><td>07</td>     <td>FINANCIAL</td>     <td>HSP - Moving Assistance</td>     								</tr>
<tr id=08 hidden><td>08</td>     <td>WELLBEING</td>     <td>HSP - Tenancy Cost Cover Letter</td>    						</tr>

<tr id=10 hidden><td>10</td>     <td>FINANCIAL</td>     <td>Accommodation Supplement</td>     								</tr>
<tr id=11 hidden><td>11</td>     <td>FINANCIAL</td>     <td>Temporary Additional Support</td>     							</tr>

<tr id=14 hidden><td>14</td>     <td>FINANCIAL</td>     <td>House Modification Funding via MOH</td>     					</tr>
<tr id=15 hidden><td>15</td>     <td>WELLBEING</td>     <td>Ready to Rent Programme</td>     								</tr>
<tr id=16 hidden><td>16</td>     <td>FINANCIAL</td>     <td>SNG - Food Grant</td>     										</tr>
<tr id=17 hidden><td>17</td>     <td>HOUSING</td>       <td>Contracted Emergency Housing</td>     							</tr>
<tr id=18 hidden><td>18</td>     <td>FINANCIAL</td>     <td>SNG - Other</td>     											</tr>
<tr id=19 hidden><td>19</td>     <td>FINANCIAL</td>     <td>Disability Allowance</td>     									</tr>

<tr id=22 hidden><td>22</td>     <td>WELLBEING</td>     <td>Better Off Calculation</td>     								</tr>
<tr id=23 hidden><td>23</td>     <td>WELLBEING</td>     <td>Refer to Housing Broker</td>     								</tr>
<tr id=24 hidden><td>24</td>     <td>FINANCIAL</td>     <td>Youth Payment</td>     											</tr>
<tr id=25 hidden><td>25</td>     <td>FINANCIAL</td>     <td>Youth Parent Payment</td>     									</tr>
<tr id=26 hidden><td>26</td>     <td>FINANCIAL</td>     <td>Child Disability Allowance</td>     							</tr>
<tr id=27 hidden><td>27</td>     <td>WELLBEING</td>     <td>Building Financial Capability products and services</td>     	</tr>
<tr id=28 hidden><td>28</td>     <td>FINANCIAL</td>     <td>Recoverable Assistance Payments</td>     						</tr>
<tr id=29 hidden><td>29</td>     <td>FINANCIAL</td>     <td>TTW</td>     													</tr>
<tr id=30 hidden><td>30</td>     <td>WELLBEING</td>     <td>Employment and Work Readiness Assistance Programme</td>     	</tr>
<tr id=31 hidden><td>31</td>     <td>WELLBEING</td>     <td>Job Connect</td>     											</tr>

<!-- REMOVED AS OUT OF SCOPE OF PILOT
<tr id=09 hidden><td>09</td>     <td>FINANCIAL</td>     <td>HSP - Transition to Alternative Housing Grant</td>     			</tr>
<tr id=12 hidden><td>12</td>     <td>FINANCIAL</td>     <td>Income Related Rent</td>     									</tr>
<tr id=13 hidden><td>13</td>     <td>FINANCIAL</td>     <td>Flexible Funding Assistance (Emergency Housing)</td>  		 	</tr>
<tr id=20 hidden><td>20</td>     <td>WELLBEING</td>     <td>Family Violence Intervention Programme</td>     				</tr>
<tr id=21 hidden><td>21</td>     <td>WELLBEING</td>     <td>Domestic Violence Programme</td>     							</tr>
-->   

</tbody>

<caption margin:=20px style="caption-side:bottom"> Select support options then click next </caption>

</table>    

           <div class="item">
              <select hidden multiple size ="4" id="Results">
              <option value="Not selected" hidden selected>Not selected</option>
			  <option value="1">A</option>
              <option value="2">B</option>
              <option value="3">C</option>
              <option value="4">D</option>
            </select>
          </div>
     


<button style="display:none" class="block" type="button" onclick="toggle(this)"> TOGGLE</button>

<button style="display:none" class="block" type="button"  id="GenerateProviders"> GENERATE PROVIDERS </button>
        
     
  <p> Providers </p>
  <textarea id="Area2"> </textarea> 
  
  <button style="display:none" class="block" type="button" onclick="FileNote()" id="GenerateNote"> GENERATE FILE NOTE </button>

  <p> Copy of file note</p>
  <textarea id="Area3"> </textarea>
  
 </form>
      
<script>
 
 
 

<!-- ---------- HEADER ---------- -->        
    
window.onscroll = function() {myFunction()};

var header = document.getElementById("myHeader");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  }
}    
    
<!-- ---------- RESET ---------- -->      
           
function Reset() {

document.getElementById("myForm").reset();

document.getElementById("Table").setAttribute("hidden", "hidden");
document.getElementById("Results").setAttribute("hidden", "hidden");

// GenerateNote.setAttribute("display", "none");
  
document.getElementById("16").setAttribute("hidden", "hidden"); 
document.getElementById("18").setAttribute("hidden", "hidden");
document.getElementById("28").setAttribute("hidden", "hidden");

document.getElementById("01").setAttribute("hidden", "hidden");
document.getElementById("02").setAttribute("hidden", "hidden");
document.getElementById("03").setAttribute("hidden", "hidden");
document.getElementById("04").setAttribute("hidden", "hidden");
document.getElementById("05").setAttribute("hidden", "hidden");
document.getElementById("06").setAttribute("hidden", "hidden");
document.getElementById("07").setAttribute("hidden", "hidden");
document.getElementById("08").setAttribute("hidden", "hidden");
document.getElementById("09").setAttribute("hidden", "hidden");
document.getElementById("10").setAttribute("hidden", "hidden");
document.getElementById("11").setAttribute("hidden", "hidden");
document.getElementById("12").setAttribute("hidden", "hidden");
document.getElementById("13").setAttribute("hidden", "hidden");    
document.getElementById("14").setAttribute("hidden", "hidden");
document.getElementById("15").setAttribute("hidden", "hidden"); 

document.getElementById("17").setAttribute("hidden", "hidden"); 

document.getElementById("19").setAttribute("hidden", "hidden"); 
document.getElementById("20").setAttribute("hidden", "hidden"); 
document.getElementById("21").setAttribute("hidden", "hidden"); 
document.getElementById("22").setAttribute("hidden", "hidden"); 
document.getElementById("23").setAttribute("hidden", "hidden"); 
document.getElementById("24").setAttribute("hidden", "hidden"); 
document.getElementById("25").setAttribute("hidden", "hidden"); 
document.getElementById("26").setAttribute("hidden", "hidden"); 
document.getElementById("27").setAttribute("hidden", "hidden"); 

document.getElementById("29").setAttribute("hidden", "hidden"); 
document.getElementById("30").setAttribute("hidden", "hidden"); 
document.getElementById("31").setAttribute("hidden", "hidden"); 

}


  <!-- ---------- FinaliseAnswers ---------- -->   
   
  function FinaliseAnswers() {           

    document.getElementById("Table").removeAttribute("hidden");  // Public Housing Assessment
    document.getElementById("Results").removeAttribute("hidden");  // Public Housing Assessment

    // ALL
    document.getElementById("16").removeAttribute("hidden");  // SNG - Food Grant
    document.getElementById("18").removeAttribute("hidden");  // SNG - Other

    // ANY 4C 
    document.getElementById("03").removeAttribute("hidden");  // Public Housing Assessment

    // STAY WITH SUPPORT YES
    document.getElementById("01").removeAttribute("hidden");  // Emergency Housing
    document.getElementById("02").removeAttribute("hidden");  // Transition Housing Referral 

    // ANY Q1
    document.getElementById("28").removeAttribute("hidden");  // Recoverable Assistance Payments

    GenerateNote.removeAttribute("style"); 
    GenerateProviders.removeAttribute("style"); 
    
 } 

           
<!-- ---------- FILE NOTE ---------- --> 
           
    function FileNote() {

    var Question1   = getSelectValues(document.getElementById("Question1"));

    var Question2a   = getSelectValues(document.getElementById("Question2a"));

    if (document.getElementById("Question2b").value == "") { 
      var Question2b = "Not Selected";
    }
    else { 
      var Question2b =document.getElementById("Question2b").value; 
    }

    var Question3   = getSelectValues(document.getElementById("Question3"));

    var Question4a   = document.getElementById("Question4a").value;      

    var Question4b   = document.getElementById("Question4b").value;	    

    var Question4c   = document.getElementById("Question4c").value;      

    var Question5a   = document.getElementById("Question5a").value;

    var Question5b   = document.getElementById("Question5b").value;

    var Question6  = getSelectValues(document.getElementById("Question6"));

    var Question7  = getSelectValues(document.getElementById("Question7"));
getSelectValues(document.getElementById("Question6"));

    var Question8a  = document.getElementById("Question8a").value;

    var Question8b  = getSelectValues(document.getElementById("Question8b"));

    if (document.getElementById("Question8c").value == "") { 
      var Question8c = "Not Selected";
    }
    else { 
      var Question8c =document.getElementById("Question8c").value; 
    }

    var copyText =   

        '--- #v1 Client Needs Assessment \n'+

        '\nQ1 WHERE ARE YOU CURRENTLY LIVING?:'+ Question1 + '\n' +
        '\nQ2a WHY ARE YOU NEEDING HELP?:'+ Question2a + '\n' +
        '\nQ2b IF OTHER SELECTED ABOVE PLEASE ADD FURTHER COMMENTS?:\n'+ Question2b + ';\n' +
        '\nQ3 HOW LONG HAVE YOU BEEN IN YOUR CURRENT ACCOMMODATION?:'+ Question3 + '\n' +
        '\nQ4a IF WE COULD PROVIDE SOME SUPPORT COULD YOU STAY WHERE YOU ARE?: \n'+ Question4a + ';\n' +
        '\nQ4b DO YOU HAVE CHILDREN?: \n'+ Question4b + ';\n' +
        '\nQ4c WHEN DO YOU NEED TO MOVE?: \n'+ Question4c + ';\n' + 
        '\nQ5 WHO NEEDS ASSISTANCE IN YOUR HOUSEHOLD?: \n' + Question5a + ' Adult ' + Question5b + ' Child' + ';\n' +
        '\nQ6 WHAT IS MAKING IT HARD FOR YOU TO FIND SUITABLE HOUSING?:'+ Question6 + '\n' +
        '\nQ7 WHAT REGION ARE YOU LIVING IN?:'+ Question7 + '\n' +
        '\nQ8a IS ANYONE OR ANY SERVICE HELPING YOU WITH YOUR HOUSING?: \n'+ Question8a + ';\n' +
        '\nQ8b IF YES, PLEASE ANSWER SELECT BELOW:'+ Question8b + '\n' +
        '\nQ8c IF OTHER PLEASE TYPE BELOW: \n'+ Question8c + ';\n' + 

        '\n--- # Template End';

    navigator.clipboard.writeText(copyText);

    document.querySelector("#Area3").value = copyText;
    
    // document.querySelector("#Area3").style.height = "700px";
    
    document.querySelector("#Area3").style.height = "100%";

   // alert('OK');   
    }                
  
<!-- ---------- LOOP THROUGH MULTISELECT ---------- -->        

      //      '\nQ?:\n'+ Question4C + '\n' +

    function getSelectValues(select) {
      var result = "";
      var options = select && select.options;
      var opt;
      
      for (var i=0, iLen=options.length; i<iLen; i++) {
        opt = options[i];
        
        if (opt.selected) {
    
          if (result == "") {
            result = "\n" + opt.text + ";" ;
          }
          else {
            result =  "\n" + opt.text + " # " + result ;
          }
        }
      }
      return result;
    }
    
      <!-- ---------- TOGGLE ---------- -->  
      
                   let toggle = button => {
    let element = document.getElementById("01");
    let hidden = element.getAttribute("hidden");

    if (hidden) {
       element.removeAttribute("hidden");
       button.innerText = "SHOW FILTERED OPTIONS";
    } else {
       element.setAttribute("hidden", "hidden");
       button.innerText = "SHOW ALL OPTIONS";
    }
  }
    
</script>

  <script type="text/javascript">

$(document).ready(function() {

          var last_valid_selection = null;

          $('#Question6b').change(function(event) {

            if ($(this).val().length > 3) {

              $(this).val(null);
            } else {
              last_valid_selection = $(this).val();
            }
          });
        });

      let allLines = []

      window.addEventListener("message", (message) => {
        if (message.data.console){
          let insert = document.querySelector("#insert")
          allLines.push(message.data.console.payload)
          insert.innerHTML = allLines.join(";\r")

          let result = eval.call(null, message.data.console.payload)
          if (result !== undefined){
            console.log(result)
          }
        }
      })

</script>
</body>
</html>


```
--------------------------------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------------------------------

###   FUNCTION-TOP3

```HTML


<!DOCTYPE html>
<html>
<head>

  <script
    id="insert"
    type="text/javascript"
    src="//code.jquery.com/jquery-1.11.0.js">
  </script>

</head>
<body>
    <select size="31"id="TOP3"  class="multiselect form-control" multiple="multiple">
    <option value="2">Bungee Jumping</option>
    <option value="3">Camping</option>
    <option value="5">Mountain Biking</option>
    <option value="6">Rappelling</option>
    <option value="7">Rock Climbing / Bouldering</option>
    <option value="8">Skiing</option>
    <option value="10">Wild Life (Safari)</option>
    <option value="11">Canoeing &amp; Kayaking</option>
    <option value="12">Rafting</option>
    <option value="13">Sailing</option>
    <option value="14">Scuba Diving</option>
    <option value="15">Snorkeling</option>
    <option value="16">Surfing</option>
    <option value="18">Hang Gliding</option>
    <option value="19">Hot-air Ballooning</option>
    <option value="20">Micro-light Aircrafts</option>
    <option value="21">Paragliding</option>
    <option value="22">Paramotoring</option>
    <option value="23">Parasailing</option>
    <option value="24">Skydiving / Parachuting</option>
    <option value="25">Zip-line / Flying Fox</option>
    <option value="26">Caving</option>
    <option value="27">Cycling</option>
    <option value="28">Fishing &amp; Angling</option>
    <option value="29">Motorbike trips</option>
    <option value="30">Nature Walks</option>
    <option value="31">Road Trips</option>
    <option value="32">Zorbing</option>
    <option value="33">Trekking Hiking and Mountaineering</option>
    <option value="34">Backpacking</option>
    <option value="61">Water</option>
</select>

<script type="text/javascript">

$(document).ready(function() {
          var last_valid_selection = null;
          $('#TOP3').change(function(event) {
            if ($(this).val().length > 3) {
              $(this).val(last_valid_selection);   /* can relace with $(this).val(null) to remove all */
 
            } else {
              last_valid_selection = $(this).val();
            }
          });
        });

     let allLines = []

      window.addEventListener("message", (message) => {
        if (message.data.console){
          let insert = document.querySelector("#insert")
          allLines.push(message.data.console.payload)
          insert.innerHTML = allLines.join(";\r")

          let result = eval.call(null, message.data.console.payload)
          if (result !== undefined){
            console.log(result)
          }
        }
      })

</script>
</body>
</html>
```

--------------------------------------------------------------------------------------------------------

###   FUNCTION-CASCADING ANSWERS

```HTML
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
var subjectObject = {
  "Front-end": {
    "HTML": ["Links", "Images", "Tables", "Lists"],
    "CSS": ["Borders", "Margins", "Backgrounds", "Float"],
    "JavaScript": ["Variables", "Operators", "Functions", "Conditions"]    
  },
  "Back-end": {
    "PHP": ["Variables", "Strings", "Arrays"],
    "SQL": ["SELECT", "UPDATE", "DELETE"]
  }
}
window.onload = function() {
  var subjectSel = document.getElementById("subject");
  var topicSel = document.getElementById("topic");
  var chapterSel = document.getElementById("chapter");
  for (var x in subjectObject) {
    subjectSel.options[subjectSel.options.length] = new Option(x, x);
  }
  subjectSel.onchange = function() {
    //empty Chapters- and Topics- dropdowns
    chapterSel.length = 1;
    topicSel.length = 1;
    //display correct values
    for (var y in subjectObject[this.value]) {
      topicSel.options[topicSel.options.length] = new Option(y, y);
    }
  }
  topicSel.onchange = function() {
    //empty Chapters dropdown
    chapterSel.length = 1;
    //display correct values
    var z = subjectObject[subjectSel.value][this.value];
    for (var i = 0; i < z.length; i++) {
      chapterSel.options[chapterSel.options.length] = new Option(z[i], z[i]);
    }
  }
}
</script>
</head>   
<body>

<h1>Cascading Dropdown Example</h1>

<form name="form1" id="form1" action="/action_page.php">
Subjects: <select name="subject" id="subject">
    <option value="" selected="selected">Select subject</option>
  </select>
  <br><br>
Topics: <select name="topic" id="topic">
    <option value="" selected="selected">Please select subject first</option>
  </select>
  <br><br>
Chapters: <select name="chapter" id="chapter">
    <option value="" selected="selected">Please select topic first</option>
  </select>
  <br><br>
  <input type="submit" value="Submit">  
</form>

</body>
</html>
```

--------------------------------------------------------------------------------------------------------

# FUNCTION SELECTABLE TABLE

```HTML


<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
	
    <style type="text/css" class="init"> </style>

	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>

	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>

	<script type="text/javascript" class="init"> 
	
$(document).ready(function () {
	var table = $('#example').DataTable();

	$('#example tbody').on('click', 'tr', function () {
		$(this).toggleClass('selected');
	});

	$('#button').click(function () {
		alert(table.rows('.selected').data().length + ' row(s) selected');
	});
});

</script>
</head>
            
				<div class="demo-html">
					<table id="example" class="display" >
						<thead>
							<tr>
								<th>Name</th>
								<th>Position</th>
								<th>Office</th>
								<th>Age</th>
								<th>Start date</th>
								<th>Salary</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Tiger Nixon</td>
								<td>System Architect</td>
								<td>Edinburgh</td>
								<td>61</td>
								<td>2011-04-25</td>
								<td>$320,800</td>
							</tr>
							<tr>
								<td>Garrett Winters</td>
								<td>Accountant</td>
								<td>Tokyo</td>
								<td>63</td>
								<td>2011-07-25</td>
								<td>$170,750</td>
							</tr>
							<tr>
								<td>Ashton Cox</td>
								<td>Junior Technical Author</td>
								<td>San Francisco</td>
								<td>66</td>
								<td>2009-01-12</td>
								<td>$86,000</td>
							</tr>
							<tr>
								<td>Cedric Kelly</td>
								<td>Senior Javascript Developer</td>
								<td>Edinburgh</td>
								<td>22</td>
								<td>2012-03-29</td>
								<td>$433,060</td>
							</tr>
							<tr>
								<td>Airi Satou</td>
								<td>Accountant</td>
								<td>Tokyo</td>
								<td>33</td>
								<td>2008-11-28</td>
								<td>$162,700</td>
							</tr>
							<tr>
								<td>Brielle Williamson</td>
								<td>Integration Specialist</td>
								<td>New York</td>
								<td>61</td>
								<td>2012-12-02</td>
								<td>$372,000</td>
							</tr>
							<tr>
								<td>Herrod Chandler</td>
								<td>Sales Assistant</td>
								<td>San Francisco</td>
								<td>59</td>
								<td>2012-08-06</td>
								<td>$137,500</td>
							</tr>
							<tr>
								<td>Rhona Davidson</td>
								<td>Integration Specialist</td>
								<td>Tokyo</td>
								<td>55</td>
								<td>2010-10-14</td>
								<td>$327,900</td>
							</tr>
							<tr>
								<td>Colleen Hurst</td>
								<td>Javascript Developer</td>
								<td>San Francisco</td>
								<td>39</td>
								<td>2009-09-15</td>
								<td>$205,500</td>
							</tr>
							<tr>
								<td>Sonya Frost</td>
								<td>Software Engineer</td>
								<td>Edinburgh</td>
								<td>23</td>
								<td>2008-12-13</td>
								<td>$103,600</td>
							</tr>
							<tr>
								<td>Jena Gaines</td>
								<td>Office Manager</td>
								<td>London</td>
								<td>30</td>
								<td>2008-12-19</td>
								<td>$90,560</td>
							</tr>
							<tr>
								<td>Quinn Flynn</td>
								<td>Support Lead</td>
								<td>Edinburgh</td>
								<td>22</td>
								<td>2013-03-03</td>
								<td>$342,000</td>
							</tr>
							<tr>
								<td>Charde Marshall</td>
								<td>Regional Director</td>
								<td>San Francisco</td>
								<td>36</td>
								<td>2008-10-16</td>
								<td>$470,600</td>
							</tr>
							<tr>
								<td>Haley Kennedy</td>
								<td>Senior Marketing Designer</td>
								<td>London</td>
								<td>43</td>
								<td>2012-12-18</td>
								<td>$313,500</td>
							</tr>
							<tr>
								<td>Tatyana Fitzpatrick</td>
								<td>Regional Director</td>
								<td>London</td>
								<td>19</td>
								<td>2010-03-17</td>
								<td>$385,750</td>
							</tr>
							<tr>
								<td>Michael Silva</td>
								<td>Marketing Designer</td>
								<td>London</td>
								<td>66</td>
								<td>2012-11-27</td>
								<td>$198,500</td>
							</tr>
							<tr>
								<td>Paul Byrd</td>
								<td>Chief Financial Officer (CFO)</td>
								<td>New York</td>
								<td>64</td>
								<td>2010-06-09</td>
								<td>$725,000</td>
							</tr>
							<tr>
								<td>Gloria Little</td>
								<td>Systems Administrator</td>
								<td>New York</td>
								<td>59</td>
								<td>2009-04-10</td>
								<td>$237,500</td>
							</tr>
							<tr>
								<td>Bradley Greer</td>
								<td>Software Engineer</td>
								<td>London</td>
								<td>41</td>
								<td>2012-10-13</td>
								<td>$132,000</td>
							</tr>
							<tr>
								<td>Dai Rios</td>
								<td>Personnel Lead</td>
								<td>Edinburgh</td>
								<td>35</td>
								<td>2012-09-26</td>
								<td>$217,500</td>
							</tr>
							<tr>
								<td>Jenette Caldwell</td>
								<td>Development Lead</td>
								<td>New York</td>
								<td>30</td>
								<td>2011-09-03</td>
								<td>$345,000</td>
							</tr>
							<tr>
								<td>Yuri Berry</td>
								<td>Chief Marketing Officer (CMO)</td>
								<td>New York</td>
								<td>40</td>
								<td>2009-06-25</td>
								<td>$675,000</td>
							</tr>
							<tr>
								<td>Caesar Vance</td>
								<td>Pre-Sales Support</td>
								<td>New York</td>
								<td>21</td>
								<td>2011-12-12</td>
								<td>$106,450</td>
							</tr>
							<tr>
								<td>Doris Wilder</td>
								<td>Sales Assistant</td>
								<td>Sydney</td>
								<td>23</td>
								<td>2010-09-20</td>
								<td>$85,600</td>
							</tr>
							<tr>
								<td>Angelica Ramos</td>
								<td>Chief Executive Officer (CEO)</td>
								<td>London</td>
								<td>47</td>
								<td>2009-10-09</td>
								<td>$1,200,000</td>
							</tr>
							<tr>
								<td>Gavin Joyce</td>
								<td>Developer</td>
								<td>Edinburgh</td>
								<td>42</td>
								<td>2010-12-22</td>
								<td>$92,575</td>
							</tr>
							<tr>
								<td>Jennifer Chang</td>
								<td>Regional Director</td>
								<td>Singapore</td>
								<td>28</td>
								<td>2010-11-14</td>
								<td>$357,650</td>
							</tr>
							<tr>
								<td>Brenden Wagner</td>
								<td>Software Engineer</td>
								<td>San Francisco</td>
								<td>28</td>
								<td>2011-06-07</td>
								<td>$206,850</td>
							</tr>
							<tr>
								<td>Fiona Green</td>
								<td>Chief Operating Officer (COO)</td>
								<td>San Francisco</td>
								<td>48</td>
								<td>2010-03-11</td>
								<td>$850,000</td>
							</tr>
							<tr>
								<td>Shou Itou</td>
								<td>Regional Marketing</td>
								<td>Tokyo</td>
								<td>20</td>
								<td>2011-08-14</td>
								<td>$163,000</td>
							</tr>
							<tr>
								<td>Michelle House</td>
								<td>Integration Specialist</td>
								<td>Sydney</td>
								<td>37</td>
								<td>2011-06-02</td>
								<td>$95,400</td>
							</tr>
							<tr>
								<td>Suki Burks</td>
								<td>Developer</td>
								<td>London</td>
								<td>53</td>
								<td>2009-10-22</td>
								<td>$114,500</td>
							</tr>
							<tr>
								<td>Prescott Bartlett</td>
								<td>Technical Author</td>
								<td>London</td>
								<td>27</td>
								<td>2011-05-07</td>
								<td>$145,000</td>
							</tr>
							<tr>
								<td>Gavin Cortez</td>
								<td>Team Leader</td>
								<td>San Francisco</td>
								<td>22</td>
								<td>2008-10-26</td>
								<td>$235,500</td>
							</tr>
							<tr>
								<td>Martena Mccray</td>
								<td>Post-Sales support</td>
								<td>Edinburgh</td>
								<td>46</td>
								<td>2011-03-09</td>
								<td>$324,050</td>
							</tr>
							<tr>
								<td>Unity Butler</td>
								<td>Marketing Designer</td>
								<td>San Francisco</td>
								<td>47</td>
								<td>2009-12-09</td>
								<td>$85,675</td>
							</tr>
							<tr>
								<td>Howard Hatfield</td>
								<td>Office Manager</td>
								<td>San Francisco</td>
								<td>51</td>
								<td>2008-12-16</td>
								<td>$164,500</td>
							</tr>
							<tr>
								<td>Hope Fuentes</td>
								<td>Secretary</td>
								<td>San Francisco</td>
								<td>41</td>
								<td>2010-02-12</td>
								<td>$109,850</td>
							</tr>
							<tr>
								<td>Vivian Harrell</td>
								<td>Financial Controller</td>
								<td>San Francisco</td>
								<td>62</td>
								<td>2009-02-14</td>
								<td>$452,500</td>
							</tr>
							<tr>
								<td>Timothy Mooney</td>
								<td>Office Manager</td>
								<td>London</td>
								<td>37</td>
								<td>2008-12-11</td>
								<td>$136,200</td>
							</tr>
							<tr>
								<td>Jackson Bradshaw</td>
								<td>Director</td>
								<td>New York</td>
								<td>65</td>
								<td>2008-09-26</td>
								<td>$645,750</td>
							</tr>
							<tr>
								<td>Olivia Liang</td>
								<td>Support Engineer</td>
								<td>Singapore</td>
								<td>64</td>
								<td>2011-02-03</td>
								<td>$234,500</td>
							</tr>
							<tr>
								<td>Bruno Nash</td>
								<td>Software Engineer</td>
								<td>London</td>
								<td>38</td>
								<td>2011-05-03</td>
								<td>$163,500</td>
							</tr>
							<tr>
								<td>Sakura Yamamoto</td>
								<td>Support Engineer</td>
								<td>Tokyo</td>
								<td>37</td>
								<td>2009-08-19</td>
								<td>$139,575</td>
							</tr>
							<tr>
								<td>Thor Walton</td>
								<td>Developer</td>
								<td>New York</td>
								<td>61</td>
								<td>2013-08-11</td>
								<td>$98,540</td>
							</tr>
							<tr>
								<td>Finn Camacho</td>
								<td>Support Engineer</td>
								<td>San Francisco</td>
								<td>47</td>
								<td>2009-07-07</td>
								<td>$87,500</td>
							</tr>
							<tr>
								<td>Serge Baldwin</td>
								<td>Data Coordinator</td>
								<td>Singapore</td>
								<td>64</td>
								<td>2012-04-09</td>
								<td>$138,575</td>
							</tr>
							<tr>
								<td>Zenaida Frank</td>
								<td>Software Engineer</td>
								<td>New York</td>
								<td>63</td>
								<td>2010-01-04</td>
								<td>$125,250</td>
							</tr>
							<tr>
								<td>Zorita Serrano</td>
								<td>Software Engineer</td>
								<td>San Francisco</td>
								<td>56</td>
								<td>2012-06-01</td>
								<td>$115,000</td>
							</tr>
							<tr>
								<td>Jennifer Acosta</td>
								<td>Junior Javascript Developer</td>
								<td>Edinburgh</td>
								<td>43</td>
								<td>2013-02-01</td>
								<td>$75,650</td>
							</tr>
							<tr>
								<td>Cara Stevens</td>
								<td>Sales Assistant</td>
								<td>New York</td>
								<td>46</td>
								<td>2011-12-06</td>
								<td>$145,600</td>
							</tr>
							<tr>
								<td>Hermione Butler</td>
								<td>Regional Director</td>
								<td>London</td>
								<td>47</td>
								<td>2011-03-21</td>
								<td>$356,250</td>
							</tr>
							<tr>
								<td>Lael Greer</td>
								<td>Systems Administrator</td>
								<td>London</td>
								<td>21</td>
								<td>2009-02-27</td>
								<td>$103,500</td>
							</tr>
							<tr>
								<td>Jonas Alexander</td>
								<td>Developer</td>
								<td>San Francisco</td>
								<td>30</td>
								<td>2010-07-14</td>
								<td>$86,500</td>
							</tr>
							<tr>
								<td>Shad Decker</td>
								<td>Regional Director</td>
								<td>Edinburgh</td>
								<td>51</td>
								<td>2008-11-13</td>
								<td>$183,000</td>
							</tr>
							<tr>
								<td>Michael Bruce</td>
								<td>Javascript Developer</td>
								<td>Singapore</td>
								<td>29</td>
								<td>2011-06-27</td>
								<td>$183,000</td>
							</tr>
							<tr>
								<td>Donna Snider</td>
								<td>Customer Support</td>
								<td>New York</td>
								<td>27</td>
								<td>2011-01-25</td>
								<td>$112,000</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th>Name</th>
								<th>Position</th>
								<th>Office</th>
								<th>Age</th>
								<th>Start date</th>
								<th>Salary</th>
							</tr>
						</tfoot>
					</table>
				</div>
				
</body>
</html>
```

--------------------------------------------------------------------------------------------------------
### FUNCTION CASCADING SIMPLE
```HTML
<!DOCTYPE html>
<html>
<head>
<style> 

</style>
</head>
<body>

 

<div class="item">
<div id="Test">
<p> QUESTION</p>
<select size="3" style="display" onchange="showDiv(this)">
<option value="Maybe">Maybe </option>
<option value="Yes">Yes </option>
<option value="No">No </option>
</select>
</div>

<div class="item">
<div id="Result" style="display:none;">
<p>RESULT</p> 
<select size="3" >
   <option value="0">Next</option>
   <option value="1">Option</option>
   <option value="2">Available</option>
</select>   
</div>

<script>
function showDiv(select){
   if(select.value=="No"){	
    document.getElementById("Result").style.display = "list-item";
   } else{
    document.getElementById("Result").style.display = "none";
   }
} 

</script>
</body>
</html>

```

--------------------------------------------------------------------------------------------------------
### FUNCTION VARIABLE SEARCH TO SCREEN

```HTML
<!DOCTYPE html>
<html>
<body>
           <div class="item">
              <select multiple size ="4" id="Question1">
              <option value="1">Corrections</option>
              <option value="2">Kainga Ora</option>
              <option value="3">Salvation Army</option>
              <option value="4">Other</option>
              <option value=test>var </option>
            </select>
          </div>

<p>  </p>


<button  id="test" onclick="buttonclick()"> TEST </button>

<p>  </p>

<textarea id="Area3" rows="5"> </textarea>

<p id="demo"> </p>

<script>

var test = 1 + 3;
document.getElementById("demo").innerHTML = test;



function buttonclick(){
var copyText =  getSelectValues(document.getElementById("Question1")); 
navigator.clipboard.writeText(copyText);
var result = copyText.includes("Other");

document.querySelector("#Area3").value = copyText + '\n\n' + result;

document.getElementById("demo").innerHTML = result;



// alert(result)


}

function getSelectValues(select) {
var result = "";
var options = select && select.options;
var opt;

for (var i=0, iLen=options.length; i<iLen; i++) {
opt = options[i];

if (opt.selected) {

if (result == "") {
result = "\n" + opt.text + ";" ;
}
else {
result =  "\n" + opt.text + " # " + result ;
}
}
}
return result;
}      

</script>
</body>
</html>

```

--------------------------------------------------------------------------------------------------------

# MSD FORMS
###   TEMPLATE
