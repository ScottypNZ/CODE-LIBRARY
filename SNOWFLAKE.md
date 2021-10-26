#### CREATE REF TABLE  

```
"MIQ_DW_SBX"."DATAUPLOADS"."CHARGE_LIABILITY"create or replace file format BHR_format
  type = csv
  field_delimiter = ','
  skip_header = 1
  null_if = ('NULL', 'null')
  empty_field_as_null = true
  compression = gzip;"MIQ_DW_SBX"."DATAUPLOADS"."CHARGE_LIABILITY"
```

#### CREATE BHR TABLE  

```
CREATE TABLE DATAUPLOADS.CHARGE_LIABILITY (Person_Profile TEXT,  
Border_Health_Record TEXT,  
First_Name TEXT,  
Last_Name TEXT, 
Passport TEXT,
Flight TEXT,
Date_of_Birth TEXT,
Email TEXT,
Phone TEXT,
MIQ_Period_Start TEXT,
Facility_Name TEXT,
Community TEXT,
City TEXT,
Room_Number TEXT,
MIQ_Period_End TEXT,
Facility_Planned_Departure TEXT,
Destination_Details TEXT,
Destination_Town TEXT,
New_Zealand_OR_Australian_Citizen_OR_Resident TEXT,
Staying_in_NZ_for_less_than_90_OR_180_days TEXT,
Left_NZ_after_11_August_2020 TEXT,
Are_you_a_temporary_visa_holder TEXT,
Ordinarily_resident_on_19_March_2020 TEXT,
Left_NZ_on_or_before_19_March_2020 TEXT,
Entering_NZ_on_a_border_exception TEXT,
Charge_Exempt_Reason TEXT,
Charge_Liability_Completed TEXT,
Border_Event TEXT,
Bubble TEXT,
Management_Plan_Type TEXT,
Closed_Status TEXT,
Arrival_Port TEXT
);
```
