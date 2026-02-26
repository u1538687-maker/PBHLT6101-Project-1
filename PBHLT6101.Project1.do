**PBHLT6101
**Project 1 - ANSUR
**Jesse Evans
**February 19, 2026


*QUESTIONS - I put the question number on the line below that is corresponds with.
**1.for suspect and unreasonable values - ethnicity - do I need to destring them so that the missing value actually registers in stata as a missing value?? (line 52)
**2. Is this the way to handle the under 18 thing? (line 58)
**3. What are other ways I should be looking at duplicates?? (line 65)
**4. Which variables does this apply to? Like do I have to create categorical variables for all the measurements? (line 69)
**5. What does this mean? How do I do this? (line 85)
**6. How do I calculate continuous bmi using the other variables? (line 88)
**7. Do I need to combine gender and prefhand somehow into one variable? (line 126)
**8. Do I need to tab and look at suspect values for all the measurements? Is there are more efficient way to do this then tab - like if I can look at all values outside a certain range? (line 84)
**9. Does it need to be more than this? BMI combines weight and height and then I made different categories for gender


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

**DODRace
tab dodrace // to inspect the variables
replace dodrace = .x if dodrace == 7 //suspicious/unreasonable value
replace dodrace = .x if dodrace < 1 //suspicious/unreasonable value
replace dodrace = .x if dodrace > 8 //suspicious/unreasonable value

**Ethnicity
tab ethnicity
replace ethnicity = ".x" if ethnicity == "" // QUESTION 1

**Gender // no suspect values

**Age
tab age // to inspect values
replace age = .d if age <18 // QUESTION 2. This is to indicate anyone who is under 18 years of age without getting rid of the data.

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

//QUESTION 8



***DUPLICATES
duplicates list // "duplicates in terms of all variables - 0 observations are duplicates" // QUESTION 3
duplicates examples // "0 observations are duplicates"



***LABEL ALL VARIABLES AND VALUES OF CATEGORICAL VARIABLES
//QUESTION 4



**CONVERT FROM MM TO CM
foreach var in thumbtipreach span footlength kneeheightmidpatella waistheightomphalion functionalleglength cervicaleheight trochanterionheight stature waistcircumference chestcircumference bicristalbreadth hipbreadth hipbreadthsitting {

    gen `var'_cm = `var'
	replace `var'_cm = `var' / 10
}



***NEW VARIABLES

**a) a unique key // QUESTION 5

**b) Continuous BMI Variable // QUESTION 6
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
tab gender // understand the values 
tab writingpreference // understand the values

encode gender, gen(gender_cat) 
codebook gender //Male = 2, Female = 1

encode writingpreference, gen(prefhand_cat) 
codebook prefhand_cat // Either = 1, Left = 2, Right = 3
//QUESTION 7 

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
//QUESTION 9 













