**PBHLT6101
**Project 1 - ANSUR
**Jesse Evans
**February 19, 2026

**ANSUR II Dataset - Anthropometric Data for US Army members

********************************************************************************

***PART 1: IMPORT DATA***

*Set working directory 
cd "/Users/jesseevans/Documents/Stata/Project 1"

clear
use "/Users/jesseevans/Downloads/ansur2allV2.dta"


********************************************************************************
 
***PART 2 - DATA PREPARATION*** 

***MISSING VALUES
foreach var in subjectnumericrace dodrace age weightlbs heightin thumbtipreach span footlength kneeheightmidpatella waistheightomphalion functionalleglength cervicaleheight trochanterionheight stature waistcircumference chestcircumference bicristalbreadth hipbreadth hipbreadthsitting weightkg{

	replace `var' = .a if `var' == -77 //not recorded
	replace `var' = .b if `var' == -88 //refused measurement
	replace `var' = .c if `var' == -99 //unknown missing
}


***SUSPECT AND UNREASONABLE VALUES

**SubjectNumericRace
tab subjectnumericrace // to inspect the variables
tostring subjectnumericrace, replace
gen race_white = strpos(subjectnumericrace, "1") > 0
gen race_black = strpos(subjectnumericrace, "2") > 0
gen race_hispanic = strpos(subjectnumericrace, "3") > 0
gen race_asian = strpos(subjectnumericrace, "4") > 0
gen race_nativeamerican = strpos(subjectnumericrace, "5") > 0
gen race_pacificislander = strpos(subjectnumericrace, "6") > 0
gen race_other = strpos(subjectnumericrace, "8") > 0

**DoDRace
tab dodrace // to inspect the variables
replace dodrace = .x if dodrace == 7 //suspicious/unreasonable value
replace dodrace = .x if dodrace < 1 //suspicious/unreasonable value
replace dodrace = .x if dodrace > 8 //suspicious/unreasonable value

**Ethnicity
tab ethnicity
replace ethnicity = ".x" if ethnicity == ""

**Gender // no suspect values

**Age
tab age // to inspect values
drop if age < 18 // QUESTION 2. This is to indicate anyone who is under 18 years of age without getting rid of the data.

**Component 
tab component // values look normal - no suspect or unreasonable

**Branch 
tab branch // values look normal - no suspect or unreasonable

**Writing Preferred Hand
replace writingpreference = "Either hand (No preference)" if writingpreference == "Either han" // edited this to replace values that were mistyped 

**Installation 
tab installation // values look normal - no suspect or unreasonable. All are "Fort" or "Camp"

**Test Date
tab test_date // values look normal - no suspect or unreasonable

**Weight lbs
tab weightlbs
replace weightlbs = .x if weightlbs == 0 // a person cannot be 0 lbs

**Height (Inches)
tab heightin // potentially some suspect values of 57-58 and 94 but they are not suspect enough for me to want to do anything with them yet.


summ thumbtipreach span footlength kneeheightmidpatella waistheightomphalion functionalleglength cervicaleheight trochanterionheight stature waistcircumference chestcircumference bicristalbreadth hipbreadth hipbreadthsitting weightkg date

**Thumb Tip Reach (mm)
tab thumbtipreach
replace thumbtipreach = .x if thumbtipreach > 999 // the reasonable range for thumb tip range for half arm span is 600-900 so the data above 998 at 7000-9500mm are unreasonable.

**Span (mm)
tab span // all seem reasonable. For span, a typical range is 1300-2200mm which all values fall within.

**Foot Length (mm)
tab footlength // all seem reasonable. For footlength, a typical range is 200-320mm which the values either fall within or are close enough to not want to take out.

**Knee Height, Midpatella (mm)
summ kneeheightmidpatella
tab kneeheightmidpatella // all seem reasonable. A typical range is 400-650mm which the values either fall within or are close enough to not want to take out.

**Trochanterion Height (mm)
summ trochanterionheight
tab trochanterionheight // all seem reasonable. A typical range is 650-1100mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

**Waist Height (Omphalion) (mm)
summ waistheightomphalion
tab waistheightomphalion // all seem reasonable. A typical range is 800-1200mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

**Functional Leg Length (mm)
summ functionalleglength
tab functionalleglength // all seem reasonable. A typical range is 700-1150mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

**Cervial Height (mm)
summ cervicaleheight
tab cervicaleheight // all seem reasonable. A typical range is 1100-1750mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

**Stature (mm)
summ stature
tab stature // all seem reasonable. A typical range is 1350-2100mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

**Waist Circumference (mm)
summ waistcircumference
tab waistcircumference // all seem reasonable. A typical range is 500-1500mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

**Chest Circumference (mm)
summ chestcircumference
tab chestcircumference // all seem reasonable. A typical range is 700-1400mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

**Bicristal Breadth (mm)
summ bicristalbreadth
tab bicristalbreadth // all seem reasonable. A typical range is 200-380mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

**Hip Breadth (mm)
summ hipbreadth
tab hipbreadth // all seem reasonable. A typical range is 250-450mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

**Hip Breadth, Sitting (mm)
summ hipbreadthsitting
tab hipbreadthsitting // all seem reasonable. A typical range is 250-500mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

**Weight in kg
summ weightkg
tab weightkg 
replace weightkg = weightkg/10 if weightkg > 500 // these values did not have a decimal, while almost all the others did. These were also extremely high but made sense if they were just missing the decimal point so I made the assumptions that I could change them. A typical range is 35-200kg.


***DUPLICATES
duplicates list // "duplicates in terms of all variables - 0 observations are duplicates" // QUESTION 3
duplicates examples // "0 observations are duplicates"



***LABEL ALL VARIABLES AND VALUES OF CATEGORICAL VARIABLES

**label all variables
label variable subjectnumericrace "Subject Numeric Race"
label variable dodrace "Department of Defense Race"
label variable ethnicity "Ethnicity"
label variable gender "Gender"
label variable age "Age"
label variable component "Component"
label variable branch "Branch"
label variable writingpreference "Writing Preference"
label variable installation "U.S. Army Installation"
label variable test_date "Test Date"
label variable weightlbs "Weight in Pounds (lbs)"
label variable heightin "Height in Inches"
label variable thumbtipreach "Thumbtip Reach"
label variable span "Span"
label variable footlength "Foot Length"
label variable kneeheightmidpatella "Knee Height, Midpatella"
label variable waistheightomphalion "Waist Height (Omphalion)"
label variable functionalleglength "Functional Leg Length"
label variable cervicaleheight "Cervical Height"
label variable trochanterionheight "Trochanterion Height"
label variable stature "Stature"
label variable waistcircumference "Waist Circumference (Omphalion)"
label variable chestcircumference "Chest Circumference"
label variable bicristalbreadth "Bicristal Breadth"
label variable hipbreadth "Hip Breadth"
label variable hipbreadthsitting "Hip Breadth, Sitting"
label variable weightkg "Weight in Kilograms (kgs)"
label variable date "Date of Measurement"
label variable strdate "String Date"
label variable race_white "Race - White"
label variable race_black "Race - Black"
label variable race_hispanic "Race - Hispanic"
label variable race_asian "Race - Asian"
label variable race_nativeamerican "Race - Native American"
label variable race_pacificislander "Race - Pacific Islander"
label variable race_other "Race - Other"


**CONVERT FROM MM TO CM
foreach var in thumbtipreach span footlength kneeheightmidpatella waistheightomphalion functionalleglength cervicaleheight trochanterionheight stature waistcircumference chestcircumference bicristalbreadth hipbreadth hipbreadthsitting {

    gen `var'_cm = `var'
	replace `var'_cm = `var' / 10
}

label variable thumbtipreach_cm "Thumbtip Reach (cm)"
label variable span_cm "Span (cm)"
label variable footlength_cm "Foot Length (cm)"
label variable kneeheightmidpatella_cm "Knee Height, Midpatella (cm)"
label variable waistheightomphalion_cm "Waist Height (Omphalion) (cm)"
label variable functionalleglength_cm "Funcational Leg Length (cm)"
label variable cervicaleheight_cm "Cervical Height (cm)"
label variable trochanterionheight_cm "Trochanterion Height (cm)"
label variable stature_cm "Stature (cm)"
label variable waistcircumference_cm "Waist Circumference (cm)"
label variable chestcircumference_cm "Chest Circumference (cm)"
label variable bicristalbreadth_cm "Bicristal Breadth (cm)"
label variable hipbreadth_cm "Hip Breadth (cm)"
label variable hipbreadthsitting_cm "Hip Breadth Sitting (cm)"

***NEW VARIABLES

**b) Continuous BMI Variable
gen bmi_cont = (weightlbs*703) / (heightin * heightin) //this is the formula for calculating bmi

gen bmi_cat = .
replace bmi_cat = .x if bmi_cont == 0
replace bmi_cat = 1 if bmi_cont > 0 & bmi_cont < 18.5
replace bmi_cat = 2 if bmi_cont >= 18.5 & bmi_cont <25
replace bmi_cat = 3 if bmi_cont >= 25 & bmi_cont < 30
replace bmi_cat = 4 if bmi_cont >= 30 

label variable bmi_cat "BMI Category"
label define bmi_labels .x "Out of Range/Suspicious" 1 "Underweight" 2 "Normal Weight" 3 "Overweight" 4 "Obese"
label values bmi_cat bmi_labels

**c)Variable for Season
gen month = month(date)

gen season = .
replace season = 1 if inlist(month, 11, 12, 1, 2)
replace season = 2 if inlist(month, 3, 4, 5)
replace season = 3 if inlist(month, 6, 7, 8)
replace season = 4 if inlist(month, 9, 10)

label variable season "Season"
label define season_labels 1 "Winter" 2 "Spring" 3 "Summer" 4 "Fall"
label values season season_labels

**d) Numerical Categorical Variable for Gender and Preferred Hand
tab gender // this is to understand the values 
tab writingpreference // this is to understand the values

encode gender, gen(gender_cat) 
codebook gender //Male = 2, Female = 1

encode writingpreference, gen(prefhand_cat) 
codebook prefhand_cat // Either = 1, Left = 2, Right = 3

label variable bmi_cont "BMI (Continuous)"
label variable month "Month"
label variable gender_cat "Gender (Category)"
label variable prefhand_cat "Preferred Hand (Category)"

**e)BODY TYPES
gen body_type = .
replace body_type = 1 if gender_cat == 1 & bmi_cat == 1
replace body_type = 2 if gender_cat == 1 & bmi_cat == 2
replace body_type = 3 if gender_cat == 1 & bmi_cat == 3
replace body_type = 4 if gender_cat == 1 & bmi_cat == 4
replace body_type = 5 if gender_cat == 2 & bmi_cat == 1
replace body_type = 6 if gender_cat == 2 & bmi_cat == 2
replace body_type = 7 if gender_cat == 2 & bmi_cat == 3
replace body_type = 2 if gender_cat == 2 & bmi_cat == 4

label variable body_type "Body Type"
label define bodytype_labels 1 "Female - Lean" 2 "Female - Moderate Build" 3 "Female - Heavy Build" 4 "Female - Very Heavy Build" 5 "Male - Lean" 6 "Male - Moderate Build" 7 "Male - Heavy Build" 8 "Male - Very Heavy Build"
label values body_type bodytype_labels 

********************************************************************************

***PART 3: SAMPLE CHARACTERISTICS***

**3.1 Anthropometric characteristics

**a)
tabstat weightlbs heightin thumbtipreach span footlength kneeheightmidpatella waistheightomphalion functionalleglength cervicaleheight trochanterionheight stature waistcircumference chestcircumference bicristalbreadth hipbreadth hipbreadthsitting weightkg, statistics(mean sd n) columns(statistics)

misstable summarize weightlbs heightin thumbtipreach span footlength kneeheightmidpatella waistheightomphalion functionalleglength cervicaleheight trochanterionheight stature waistcircumference chestcircumference bicristalbreadth hipbreadth hipbreadthsitting weightkg

**b)
gen height_hip_ratio = ((trochanterionheight_cm/2.54) / heightin) * 100
label variable height_hip_ratio "% of Total Height Attributable to Hip Height"

tabstat height_hip_ratio, by(gender) stat(mean sd n)

graph box height_hip_ratio, over(gender)

*graph bar (mean) height_hip_ratio, over(gender) // other option

*graph bar (height_hip_ratio), over(gender) //showing "invalid stat"


********************************************************************************

***PART 4: RELATIONSHIPS BETWEEN ANTHROPOMETRIC MEASURES***

**4.1 Relationship between measures of stature
**a)

pwcorr stature_cm kneeheightmidpatella_cm cervicaleheight_cm trochanterionheight_cm waistheightomphalion_cm functionalleglength_cm footlength_cm thumbtipreach_cm span_cm

twoway (scatter stature_cm cervicaleheight_cm) // these two had the highest correlation at 0.9911. Edited the graph titles, color, etc. through the graph editor.

**b)

by gender, sort: pwcorr stature kneeheightmidpatella_cm cervicaleheight_cm trochanterionheight_cm waistheightomphalion_cm functionalleglength_cm footlength_cm thumbtipreach_cm span_cm

**4.2 Relationship between actual and reported height and weight 
**a)  

gen selfrep_weight = weightlbs / 2.205
label variable selfrep_weight "Self-Reported Weight (kg)"
graph box selfrep_weight weightkg // made edits in the graph editor

**b)
gen weight_diff = selfrep_weight - weightkg
label variable weight_diff "Difference in Self-Reported Weight and Measured Weight"
summ weight_diff, detail

histogram weight_diff, percent width(2) by(gender) ///
    title("Distribution of Weight Difference by Gender") ///
    xtitle("Self - Measured Weight (kg)") // Made edits inthe graph editor

**c)
gen selfrep_height = heightin * 25.4
label variable selfrep_height "Self-Reported Height (mm)"
graph box selfrep_height stature // made edits in the graph editor.
	
tabstat weightkg bmi_cont, by(body_type) statistics(mean sd n)
tab body_type bmi_cat, row

**end of code 
