          . cd "/Users/jesseevans/Documents/Stata/Project 1"
          /Users/jesseevans/Documents/Stata/Project 1

          . clear

          . use "/Users/jesseevans/Downloads/ansur2allV2.dta"

          . foreach var in subjectnumericrace dodrace age weightlbs heightin thumbtipreach span footlength kneeheightmidpatella waistheightomphalion functionalleglength cervicaleheight trochanterionheight stature waistcircumference chestcircumference bicristalbreadth hipbreadth hipbreadthsitting weightkg{
          .         replace `var' = .a if `var' == -77 //not recorded
          .         replace `var' = .b if `var' == -88 //refused measurement
          .         replace `var' = .c if `var' == -99 //unknown missing
          . }
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)
          (0 real changes made)
          (0 real changes made)
          (1 real change made, 1 to missing)

          . tab subjectnumericrace // to inspect the variables

          subjectnume |
              ricrace |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                    1 |      4,142       58.91       58.91
                    2 |      1,167       16.60       75.51
                    3 |        636        9.05       84.55
                    4 |        118        1.68       86.23
                    5 |         21        0.30       86.53
                    6 |         64        0.91       87.44
                    8 |        135        1.92       89.36
                   18 |         26        0.37       89.73
                   21 |         71        1.01       90.74
                   23 |         35        0.50       91.24
                   25 |         17        0.24       91.48
                   28 |         29        0.41       91.89
                   31 |        199        2.83       94.72
                   35 |         10        0.14       94.87
                   38 |         10        0.14       95.01
                   41 |         52        0.74       95.75
                   42 |          7        0.10       95.85
                   43 |          6        0.09       95.93
                   48 |          1        0.01       95.95
                   51 |        149        2.12       98.07
                   61 |         37        0.53       98.59
                   62 |          8        0.11       98.71
                   63 |          8        0.11       98.82
                   64 |         10        0.14       98.96
                  218 |          3        0.04       99.00
                  231 |          8        0.11       99.12
                  235 |          4        0.06       99.18
                  238 |          1        0.01       99.19
                  251 |         21        0.30       99.49
                  318 |          3        0.04       99.53
                  351 |         11        0.16       99.69
                  358 |          1        0.01       99.70
                  423 |          3        0.04       99.74
                  425 |          1        0.01       99.76
                  428 |          1        0.01       99.77
                  431 |          2        0.03       99.80
                  451 |          2        0.03       99.83
                  631 |          1        0.01       99.84
                  641 |          3        0.04       99.89
                  651 |          2        0.03       99.91
                 2351 |          2        0.03       99.94
                 2518 |          2        0.03       99.97
                 4251 |          1        0.01       99.99
                42351 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,031      100.00

          . tostring subjectnumericrace, replace
          subjectnumericrace was long now str5

          . gen race_white = strpos(subjectnumericrace, "1") > 0

          . gen race_black = strpos(subjectnumericrace, "2") > 0

          . gen race_hispanic = strpos(subjectnumericrace, "3") > 0

          . gen race_asian = strpos(subjectnumericrace, "4") > 0

          . gen race_nativeamerican = strpos(subjectnumericrace, "5") > 0

          . gen race_pacificislander = strpos(subjectnumericrace, "6") > 0

          . gen race_other = strpos(subjectnumericrace, "8") > 0

          . tab dodrace // to inspect the variables

              dodrace |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                    1 |      4,405       62.65       62.65
                    2 |      1,472       20.94       83.59
                    3 |        801       11.39       94.98
                    4 |        206        2.93       97.91
                    5 |         57        0.81       98.72
                    6 |         67        0.95       99.67
                    7 |         18        0.26       99.93
                    8 |          5        0.07      100.00
          ------------+-----------------------------------
                Total |      7,031      100.00

          . replace dodrace = .x if dodrace == 7 //suspicious/unreasonable value
          (18 real changes made, 18 to missing)

          . replace dodrace = .x if dodrace < 1 //suspicious/unreasonable value
          (0 real changes made)

          . replace dodrace = .x if dodrace > 8 //suspicious/unreasonable value
          (0 real changes made)

          . tab ethnicity

                   ethnicity |      Freq.     Percent        Cum.
          -------------------+-----------------------------------
               Aboriginal Gu |          2        0.12        0.12
          Algonquin Navajo P |          2        0.12        0.24
                      Apache |          3        0.18        0.42
               Apache Blackf |          2        0.12        0.55
          Apache Blackfoot C |          1        0.06        0.61
               Apache Cherok |          2        0.12        0.73
             Apache Cherokee |          4        0.24        0.97
                Apache Kiowa |          1        0.06        1.03
               Apache Mexica |          1        0.06        1.09
               Arab or Middl |         15        0.91        2.00
          Arab or Middle Eas |         12        0.73        2.73
                   Argentine |          2        0.12        2.85
               Argentine Bra |          1        0.06        2.91
               Argentine Mex |          2        0.12        3.03
                    Armenian |          1        0.06        3.09
                     Azorean |          2        0.12        3.21
               Aztec Mexican |          1        0.06        3.27
                    Belizean |          3        0.18        3.45
          Belizean Dominican |          2        0.12        3.57
                   Blackfoot |          7        0.42        4.00
               Blackfoot Car |          1        0.06        4.06
               Blackfoot Che |          5        0.30        4.36
          Blackfoot Cherokee |          4        0.24        4.60
               Blackfoot Cho |          1        0.06        4.66
               Blackfoot Mex |          1        0.06        4.72
          Blackfoot Puerto R |          1        0.06        4.78
               Blackfoot Sha |          1        0.06        4.85
                    Bolivian |          2        0.12        4.97
                   Brazilian |          2        0.12        5.09
                     Burmese |          3        0.18        5.27
          Caddo Cheyenne Mex |          1        0.06        5.33
                   Cambodian |          5        0.30        5.63
               Cambodian Vie |          1        0.06        5.69
                Cape Verdean |          1        0.06        5.75
               Caribbean Isl |         89        5.39       11.14
          Caribbean Islander |         67        4.06       15.20
          Carolinian Guamani |          1        0.06       15.26
                      Cheraw |          1        0.06       15.32
                    Cherokee |         73        4.42       19.75
               Cherokee Choc |          1        0.06       19.81
            Cherokee Choctaw |          1        0.06       19.87
          Cherokee Choctaw M |          1        0.06       19.93
               Cherokee Coma |          2        0.12       20.05
           Cherokee Hawaiian |          1        0.06       20.11
               Cherokee Iroq |          2        0.12       20.23
               Cherokee Japa |          2        0.12       20.35
               Cherokee Kore |          1        0.06       20.41
               Cherokee Mexi |          3        0.18       20.59
            Cherokee Mexican |          1        0.06       20.65
               Cherokee Osag |          1        0.06       20.71
               Cherokee Puer |          2        0.12       20.84
          Cherokee Puerto Ri |          2        0.12       20.96
              Cherokee Sioux |          1        0.06       21.02
              Cherokee Yaqui |          1        0.06       21.08
                    Cheyenne |          1        0.06       21.14
               Cheyenne Rive |          1        0.06       21.20
                   Chickasaw |          2        0.12       21.32
               Chickasaw Cho |          1        0.06       21.38
                     Chilean |          1        0.06       21.44
               Chilean Mexic |          2        0.12       21.56
             Chilean Mexican |          2        0.12       21.68
                     Chinese |         26        1.57       23.26
               Chinese Filip |          3        0.18       23.44
            Chinese Filipino |          2        0.12       23.56
               Chinese Hawai |          1        0.06       23.62
               Chinese Hmong |          1        0.06       23.68
               Chinese Japan |          2        0.12       23.80
               Chinese Korea |          1        0.06       23.86
               Chinese Mexic |          1        0.06       23.92
          Chinese Puerto Ric |          1        0.06       23.99
                Chinese Thai |          2        0.12       24.11
               Chinese Vietn |          2        0.12       24.23
          Chinese Vietnamese |          1        0.06       24.29
                     Chinook |          1        0.06       24.35
                    Chippewa |          7        0.42       24.77
               Chippewa Mexi |          1        0.06       24.83
          Chippewa Narragans |          1        0.06       24.89
                     Choctaw |          9        0.55       25.44
            Choctaw Cherokee |          1        0.06       25.50
               Choctaw Creek |          1        0.06       25.56
               Choctaw Sioux |          1        0.06       25.62
               Choctaw Vietn |          1        0.06       25.68
              Choinumni Mono |          1        0.06       25.74
          Cochiti Pueblo Mex |          2        0.12       25.86
                   Colombian |         19        1.15       27.01
               Colombian Cub |          1        0.06       27.07
               Colombian Ecu |          2        0.12       27.20
               Colombian Pue |          1        0.06       27.26
                    Comanche |          4        0.24       27.50
                 Costa Rican |          1        0.06       27.56
               Costa Rican C |          1        0.06       27.62
               Costa Rican S |          2        0.12       27.74
                        Cree |          4        0.24       27.98
                       Creek |          5        0.30       28.29
                Creek Samoan |          1        0.06       28.35
              Creek Seminole |          1        0.06       28.41
                       Cuban |         22        1.33       29.74
               Cuban Laotian |          1        0.06       29.80
               Cuban Mexican |          3        0.18       29.98
                Cuban Puerto |          3        0.18       30.16
          Cuban Puerto Rican |          1        0.06       30.22
               Cuban Salvado |          1        0.06       30.28
               Cuban Unreada |          1        0.06       30.35
            Cuban Venezuelan |          1        0.06       30.41
                   Dominican |         35        2.12       32.53
               Dominican Ecu |          1        0.06       32.59
               Dominican Guy |          1        0.06       32.65
               Dominican Kor |          1        0.06       32.71
               Dominican Pue |          6        0.36       33.07
          Dominican Puerto R |          2        0.12       33.19
               Dominican Sal |          1        0.06       33.25
               East/Asian In |          9        0.55       33.80
           East/Asian Indian |          6        0.36       34.16
                  Ecuadorian |         10        0.61       34.77
               Ecuadorian Pu |          1        0.06       34.83
           Ecuadorian Puerto |          1        0.06       34.89
                      Eskimo |          2        0.12       35.01
                      Fijian |          1        0.06       35.07
                    Filipino |         73        4.42       39.49
               Filipino Guam |          1        0.06       39.55
          Filipino Guamanian |          1        0.06       39.61
               Filipino Hawa |          2        0.12       39.73
           Filipino Hawaiian |          1        0.06       39.79
               Filipino Japa |          1        0.06       39.85
               Filipino Kore |          1        0.06       39.92
               Filipino Mexi |          4        0.24       40.16
            Filipino Mexican |          2        0.12       40.28
          Filipino Puerto Ri |          1        0.06       40.34
               Filipino Viet |          2        0.12       40.46
          Filipino Vietnames |          1        0.06       40.52
               Guamanian/Cha |          3        0.18       40.70
          Guamanian/Chamorro |          1        0.06       40.76
                  Guatemalan |          6        0.36       41.13
               Guatemalan Ho |          2        0.12       41.25
               Guatemalan Me |          2        0.12       41.37
          Guatemalan Mexican |          2        0.12       41.49
               Guatemalan Pu |          1        0.06       41.55
               Guatemalan Sa |          1        0.06       41.61
                    Hawaiian |          3        0.18       41.79
               Hawaiian Poly |          1        0.06       41.85
          Hawaiian Polynesia |          1        0.06       41.91
                       Hmong |          6        0.36       42.28
                    Honduran |         11        0.67       42.94
               Honduran Nica |          3        0.18       43.13
          Honduran Panamania |          1        0.06       43.19
                       Houma |          2        0.12       43.31
               Hunkpapa Lako |          1        0.06       43.37
               Indonesian Pu |          1        0.06       43.43
                    Japanese |         26        1.57       45.00
               Japanese Kore |          2        0.12       45.12
               Japanese Mexi |          5        0.30       45.43
            Japanese Mexican |          2        0.12       45.55
             Japanese Samoan |          1        0.06       45.61
                       Kiowa |          2        0.12       45.73
                      Korean |         59        3.57       49.30
               Laguna Pueblo |          1        0.06       49.36
                Lakota Sioux |          1        0.06       49.42
          Lakota Sioux Oglal |          2        0.12       49.55
                     Laotian |         11        0.67       50.21
          Lenape Puerto Rica |          1        0.06       50.27
                      Lumbee |          5        0.30       50.58
                   Malaysian |          2        0.12       50.70
               Mescalero Apa |          4        0.24       50.94
                     Mexican |        431       26.11       77.04
               Mexican Nicar |          1        0.06       77.10
               Mexican Panam |          1        0.06       77.17
                Mexican Pima |          2        0.12       77.29
                Mexican Pomo |          1        0.06       77.35
               Mexican Puert |          8        0.48       77.83
          Mexican Puerto Ric |          3        0.18       78.01
               Mexican Salva |          3        0.18       78.20
          Mexican Salvadoran |          1        0.06       78.26
               Mexican Turki |          2        0.12       78.38
          Mexican Venezuelan |          1        0.06       78.44
               Mexican Yaqui |          1        0.06       78.50
                Mexican Zuni |          1        0.06       78.56
                       Miami |          1        0.06       78.62
                 Micronesian |          5        0.30       78.92
                    Muscogee |          1        0.06       78.98
                Métis Creole |          1        0.06       79.04
                      Navajo |          6        0.36       79.41
                Navajo Sioux |          1        0.06       79.47
                      Nepali |          2        0.12       79.59
                  Nicaraguan |          8        0.48       80.07
               Nicaraguan Sa |          1        0.06       80.13
                      Ojibwe |          3        0.18       80.31
                       Omaha |          1        0.06       80.38
                      Oneida |          2        0.12       80.50
                       Osage |          1        0.06       80.56
                     Palauan |          1        0.06       80.62
                  Panamanian |          9        0.55       81.16
               Panamanian Pu |          2        0.12       81.28
                  Paraguayan |          1        0.06       81.34
                    Peruvian |         10        0.61       81.95
          Peruvian Salvadora |          1        0.06       82.01
           Polynesian Samoan |          3        0.18       82.19
                  Potawatomi |          5        0.30       82.50
                Puerto Rican |        214       12.96       95.46
          Puerto Rican Senec |          1        0.06       95.52
          Puerto Rican Vietn |          1        0.06       95.58
                  Salvadoran |         17        1.03       96.61
               Salvadoran Ve |          2        0.12       96.73
                      Samoan |         11        0.67       97.40
                    Seminole |          2        0.12       97.52
                     Shawnee |          3        0.18       97.70
                       Sioux |          1        0.06       97.76
                  Sri Lankan |          1        0.06       97.82
                   Taiwanese |          1        0.06       97.88
                        Thai |          7        0.42       98.30
                   Tsimshian |          2        0.12       98.43
                     Turkish |          2        0.12       98.55
          Undisclosed Native |          1        0.06       98.61
                         Ute |          1        0.06       98.67
                  Vietnamese |         21        1.27       99.94
               Western Chero |          1        0.06      100.00
          -------------------+-----------------------------------
                       Total |      1,651      100.00

          . replace ethnicity = ".x" if ethnicity == ""
          (5,380 real changes made)

          . tab age // to inspect values

                  age |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                   17 |          2        0.03        0.03
                   18 |        123        1.75        1.78
                   19 |        277        3.94        5.72
                   20 |        377        5.36       11.08
                   21 |        436        6.20       17.28
                   22 |        414        5.89       23.17
                   23 |        390        5.55       28.72
                   24 |        382        5.43       34.15
                   25 |        341        4.85       39.00
                   26 |        350        4.98       43.98
                   27 |        311        4.42       48.40
                   28 |        314        4.47       52.87
                   29 |        263        3.74       56.61
                   30 |        244        3.47       60.08
                   31 |        268        3.81       63.89
                   32 |        178        2.53       66.42
                   33 |        178        2.53       68.95
                   34 |        132        1.88       70.83
                   35 |        145        2.06       72.89
                   36 |        138        1.96       74.85
                   37 |        149        2.12       76.97
                   38 |        162        2.30       79.28
                   39 |        160        2.28       81.55
                   40 |        172        2.45       84.00
                   41 |        183        2.60       86.60
                   42 |        168        2.39       88.99
                   43 |        105        1.49       90.48
                   44 |        128        1.82       92.31
                   45 |        101        1.44       93.74
                   46 |         73        1.04       94.78
                   47 |         70        1.00       95.78
                   48 |         66        0.94       96.71
                   49 |         51        0.73       97.44
                   50 |         48        0.68       98.12
                   51 |         37        0.53       98.65
                   52 |         19        0.27       98.92
                   53 |         28        0.40       99.32
                   54 |         14        0.20       99.52
                   55 |          9        0.13       99.64
                   56 |         14        0.20       99.84
                   57 |          5        0.07       99.91
                   58 |          6        0.09      100.00
          ------------+-----------------------------------
                Total |      7,031      100.00

          . drop if age < 18 // QUESTION 2. This is to indicate anyone who is under 18 years of age without getting rid of the data.
          (2 observations deleted)

          . tab component // values look normal - no suspect or unreasonable

             component |      Freq.     Percent        Cum.
          -------------+-----------------------------------
          Army Nationa |      2,901       41.27       41.27
          Army Reserve |        308        4.38       45.65
          Regular Army |      3,820       54.35      100.00
          -------------+-----------------------------------
                 Total |      7,029      100.00

          . tab branch // values look normal - no suspect or unreasonable

                          branch |      Freq.     Percent        Cum.
          -----------------------+-----------------------------------
                     Combat Arms |      1,949       27.73       27.73
          Combat Service Support |      3,582       50.96       78.69
                  Combat Support |      1,498       21.31      100.00
          -----------------------+-----------------------------------
                           Total |      7,029      100.00

          . replace writingpreference = "Either hand (No preference)" if writingpreference == "Either han" // edited this to replace values that were mistyped 
          (25 real changes made)

          . tab installation // values look normal - no suspect or unreasonable. All are "Fort" or "Camp"

          installatio |
                    n |      Freq.     Percent        Cum.
          ------------+-----------------------------------
            Camp Atte |        441        6.27        6.27
            Camp Shel |      1,160       16.50       22.78
            Fort Blis |      1,926       27.40       50.18
            Fort Brag |        397        5.65       55.83
            Fort Drum |        391        5.56       61.39
            Fort Gord |        667        9.49       70.88
            Fort Hood |        439        6.25       77.12
            Fort Huac |        436        6.20       83.33
             Fort Lee |        380        5.41       88.73
            Fort McCo |        452        6.43       95.16
            Fort Ruck |          1        0.01       95.18
            Fort Stew |        339        4.82      100.00
          ------------+-----------------------------------
                Total |      7,029      100.00

          . tab test_date // values look normal - no suspect or unreasonable

                     test_date |      Freq.     Percent        Cum.
          ---------------------+-----------------------------------
          Tested on  01aug2011 |         20        0.28        0.28
          Tested on  01dec2010 |         54        0.77        1.05
          Tested on  01dec2011 |         23        0.33        1.38
          Tested on  01feb2012 |         28        0.40        1.78
          Tested on  01jun2011 |         28        0.40        2.18
          Tested on  01mar2012 |         38        0.54        2.72
          Tested on  02apr2012 |         12        0.17        2.89
          Tested on  02aug2011 |         15        0.21        3.10
          Tested on  02dec2010 |         56        0.80        3.90
          Tested on  02dec2011 |         20        0.28        4.18
          Tested on  02feb2012 |         30        0.43        4.61
          Tested on  02jun2011 |         41        0.58        5.19
          Tested on  02mar2012 |         36        0.51        5.70
          Tested on  02may2011 |         26        0.37        6.07
          Tested on  02nov2010 |         21        0.30        6.37
          Tested on  03apr2012 |         40        0.57        6.94
          Tested on  03aug2011 |         19        0.27        7.21
          Tested on  03dec2010 |         40        0.57        7.78
          Tested on  03feb2012 |         27        0.38        8.17
          Tested on  03jun2011 |         30        0.43        8.59
          Tested on  03may2011 |         25        0.36        8.95
          Tested on  03nov2010 |         16        0.23        9.18
          Tested on  03nov2011 |         25        0.36        9.53
          Tested on  03oct2011 |         20        0.28        9.82
          Tested on  04apr2012 |         17        0.24       10.06
          Tested on  04aug2011 |         19        0.27       10.33
          Tested on  04feb2012 |         20        0.28       10.61
          Tested on  04may2011 |          9        0.13       10.74
          Tested on  04nov2010 |         25        0.36       11.10
          Tested on  04nov2011 |         25        0.36       11.45
          Tested on  04oct2010 |          3        0.04       11.50
          Tested on  04oct2011 |         25        0.36       11.85
          Tested on  05apr2012 |         44        0.63       12.48
          Tested on  05aug2011 |         12        0.17       12.65
          Tested on  05dec2011 |         29        0.41       13.06
          Tested on  05jan2011 |         34        0.48       13.54
          Tested on  05jul2011 |         26        0.37       13.91
          Tested on  05mar2012 |         43        0.61       14.53
          Tested on  05oct2010 |         20        0.28       14.81
          Tested on  05oct2011 |         30        0.43       15.24
          Tested on  06dec2010 |         36        0.51       15.75
          Tested on  06dec2011 |         29        0.41       16.16
          Tested on  06jul2011 |         21        0.30       16.46
          Tested on  06jun2011 |         26        0.37       16.83
          Tested on  06mar2012 |         41        0.58       17.41
          Tested on  06oct2010 |         15        0.21       17.63
          Tested on  06oct2011 |         15        0.21       17.84
          Tested on  07apr2011 |          2        0.03       17.87
          Tested on  07dec2010 |         28        0.40       18.27
          Tested on  07dec2011 |         29        0.41       18.68
          Tested on  07feb2011 |         52        0.74       19.42
          Tested on  07jan2011 |         42        0.60       20.02
          Tested on  07jul2011 |         30        0.43       20.44
          Tested on  07jun2011 |         32        0.46       20.90
          Tested on  07mar2012 |         36        0.51       21.41
          Tested on  07nov2011 |         31        0.44       21.85
          Tested on  07oct2010 |         20        0.28       22.14
          Tested on  07sep2011 |          1        0.01       22.15
          Tested on  08apr2011 |         23        0.33       22.48
          Tested on  08aug2011 |         19        0.27       22.75
          Tested on  08dec2010 |         76        1.08       23.83
          Tested on  08dec2011 |         31        0.44       24.27
          Tested on  08feb2011 |         50        0.71       24.98
          Tested on  08jul2011 |         20        0.28       25.27
          Tested on  08jun2011 |         33        0.47       25.74
          Tested on  08mar2012 |         32        0.46       26.19
          Tested on  08nov2011 |         21        0.30       26.49
          Tested on  09aug2011 |         20        0.28       26.77
          Tested on  09dec2010 |         16        0.23       27.00
          Tested on  09dec2011 |         26        0.37       27.37
          Tested on  09feb2011 |         36        0.51       27.88
          Tested on  09jun2011 |         17        0.24       28.13
          Tested on  09mar2011 |         19        0.27       28.40
          Tested on  09mar2012 |         29        0.41       28.81
          Tested on  09nov2011 |         17        0.24       29.05
          Tested on  10aug2011 |         19        0.27       29.32
          Tested on  10dec2010 |         52        0.74       30.06
          Tested on  10feb2011 |         28        0.40       30.46
          Tested on  10jan2011 |         54        0.77       31.23
          Tested on  10mar2011 |         15        0.21       31.44
          Tested on  10nov2011 |         25        0.36       31.80
          Tested on  11apr2011 |         36        0.51       32.31
          Tested on  11aug2011 |          9        0.13       32.44
          Tested on  11feb2011 |          6        0.09       32.52
          Tested on  11jan2011 |         52        0.74       33.26
          Tested on  11jul2011 |         22        0.31       33.58
          Tested on  11mar2011 |         24        0.34       33.92
          Tested on  11oct2011 |         17        0.24       34.16
          Tested on  12apr2011 |         18        0.26       34.41
          Tested on  12aug2011 |         13        0.18       34.60
          Tested on  12dec2011 |         31        0.44       35.04
          Tested on  12jan2011 |         52        0.74       35.78
          Tested on  12jan2012 |         21        0.30       36.08
          Tested on  12jul2011 |         28        0.40       36.48
          Tested on  12mar2012 |         14        0.20       36.68
          Tested on  12oct2010 |         21        0.30       36.98
          Tested on  12oct2011 |         28        0.40       37.37
          Tested on  13apr2011 |         25        0.36       37.73
          Tested on  13dec2010 |         42        0.60       38.33
          Tested on  13dec2011 |         27        0.38       38.71
          Tested on  13jan2011 |         48        0.68       39.39
          Tested on  13jul2011 |         16        0.23       39.62
          Tested on  13mar2012 |         39        0.55       40.18
          Tested on  13oct2010 |         21        0.30       40.48
          Tested on  13oct2011 |         26        0.37       40.85
          Tested on  14apr2011 |         26        0.37       41.21
          Tested on  14dec2010 |         38        0.54       41.76
          Tested on  14dec2011 |         29        0.41       42.17
          Tested on  14jul2011 |         15        0.21       42.38
          Tested on  14mar2011 |         29        0.41       42.79
          Tested on  14mar2012 |         28        0.40       43.19
          Tested on  14nov2011 |         17        0.24       43.43
          Tested on  14oct2010 |         28        0.40       43.83
          Tested on  14oct2011 |         12        0.17       44.00
          Tested on  15aug2011 |         33        0.47       44.47
          Tested on  15dec2010 |         28        0.40       44.87
          Tested on  15dec2011 |         27        0.38       45.26
          Tested on  15feb2011 |         34        0.48       45.74
          Tested on  15feb2012 |         28        0.40       46.14
          Tested on  15jul2011 |         19        0.27       46.41
          Tested on  15mar2011 |         39        0.55       46.96
          Tested on  15mar2012 |         29        0.41       47.38
          Tested on  15nov2011 |         15        0.21       47.59
          Tested on  15oct2010 |         28        0.40       47.99
          Tested on  16aug2011 |         32        0.46       48.44
          Tested on  16dec2010 |         20        0.28       48.73
          Tested on  16feb2011 |         48        0.68       49.41
          Tested on  16feb2012 |         29        0.41       49.82
          Tested on  16mar2011 |         21        0.30       50.12
          Tested on  16mar2012 |         34        0.48       50.60
          Tested on  16nov2010 |          2        0.03       50.63
          Tested on  16nov2011 |         16        0.23       50.86
          Tested on  17feb2011 |         38        0.54       51.40
          Tested on  17feb2012 |         29        0.41       51.81
          Tested on  17jan2012 |         24        0.34       52.16
          Tested on  17mar2011 |         31        0.44       52.60
          Tested on  17may2011 |         22        0.31       52.91
          Tested on  17nov2010 |         36        0.51       53.42
          Tested on  17nov2011 |         26        0.37       53.79
          Tested on  17oct2011 |         26        0.37       54.16
          Tested on  18apr2011 |         26        0.37       54.53
          Tested on  18jan2011 |         58        0.83       55.36
          Tested on  18jan2012 |         18        0.26       55.61
          Tested on  18jul2011 |         22        0.31       55.93
          Tested on  18mar2011 |         35        0.50       56.42
          Tested on  18nov2010 |         42        0.60       57.02
          Tested on  18nov2011 |         28        0.40       57.42
          Tested on  18oct2010 |         26        0.37       57.79
          Tested on  18oct2011 |         28        0.40       58.19
          Tested on  19apr2011 |         19        0.27       58.46
          Tested on  19jan2011 |         54        0.77       59.23
          Tested on  19jan2012 |         31        0.44       59.67
          Tested on  19mar2012 |         32        0.46       60.12
          Tested on  19may2011 |         26        0.37       60.49
          Tested on  19nov2010 |         44        0.63       61.12
          Tested on  19oct2010 |         19        0.27       61.39
          Tested on  19oct2011 |         27        0.38       61.77
          Tested on  20apr2011 |         26        0.37       62.14
          Tested on  20jan2011 |         62        0.88       63.02
          Tested on  20jan2012 |         25        0.36       63.38
          Tested on  20jun2011 |         21        0.30       63.68
          Tested on  20mar2012 |         37        0.53       64.21
          Tested on  20may2011 |         25        0.36       64.56
          Tested on  20oct2010 |         18        0.26       64.82
          Tested on  20oct2011 |         28        0.40       65.22
          Tested on  21apr2011 |         17        0.24       65.46
          Tested on  21feb2012 |         43        0.61       66.07
          Tested on  21jan2011 |         34        0.48       66.55
          Tested on  21jan2012 |         19        0.27       66.82
          Tested on  21jun2011 |          9        0.13       66.95
          Tested on  21mar2011 |         36        0.51       67.46
          Tested on  21mar2012 |         36        0.51       67.98
          Tested on  21may2011 |         28        0.40       68.37
          Tested on  21nov2011 |         19        0.27       68.64
          Tested on  21oct2010 |         27        0.38       69.03
          Tested on  21oct2011 |         22        0.31       69.34
          Tested on  22apr2011 |          6        0.09       69.43
          Tested on  22feb2011 |         56        0.80       70.22
          Tested on  22feb2012 |         25        0.36       70.58
          Tested on  22jun2011 |         25        0.36       70.93
          Tested on  22mar2011 |         19        0.27       71.21
          Tested on  22mar2012 |         29        0.41       71.62
          Tested on  22nov2010 |         58        0.83       72.44
          Tested on  22nov2011 |         23        0.33       72.77
          Tested on  22oct2010 |         24        0.34       73.11
          Tested on  23feb2012 |         39        0.55       73.67
          Tested on  23jun2011 |         19        0.27       73.94
          Tested on  23nov2010 |         60        0.85       74.79
          Tested on  23nov2011 |         13        0.18       74.98
          Tested on  24feb2011 |         50        0.71       75.69
          Tested on  24feb2012 |         34        0.48       76.17
          Tested on  24jan2012 |         36        0.51       76.68
          Tested on  24jun2011 |         12        0.17       76.85
          Tested on  24mar2011 |         14        0.20       77.05
          Tested on  24mar2012 |         30        0.43       77.48
          Tested on  24may2011 |         12        0.17       77.65
          Tested on  24oct2011 |         23        0.33       77.98
          Tested on  25apr2011 |         22        0.31       78.29
          Tested on  25feb2011 |         50        0.71       79.00
          Tested on  25jan2012 |         35        0.50       79.50
          Tested on  25jul2011 |         26        0.37       79.87
          Tested on  25mar2011 |         33        0.47       80.34
          Tested on  25mar2012 |         33        0.47       80.81
          Tested on  25may2011 |          2        0.03       80.84
          Tested on  25oct2010 |         18        0.26       81.09
          Tested on  25oct2011 |         23        0.33       81.42
          Tested on  26apr2011 |         22        0.31       81.73
          Tested on  26jan2012 |         28        0.40       82.13
          Tested on  26jul2011 |         21        0.30       82.43
          Tested on  26mar2011 |         32        0.46       82.89
          Tested on  26mar2012 |         40        0.57       83.45
          Tested on  26may2011 |         40        0.57       84.02
          Tested on  26oct2010 |         28        0.40       84.42
          Tested on  26oct2011 |         25        0.36       84.78
          Tested on  27apr2011 |         39        0.55       85.33
          Tested on  27feb2012 |         45        0.64       85.97
          Tested on  27jan2011 |         42        0.60       86.57
          Tested on  27jan2012 |         31        0.44       87.01
          Tested on  27jul2011 |         16        0.23       87.24
          Tested on  27jun2011 |         15        0.21       87.45
          Tested on  27mar2011 |         13        0.18       87.64
          Tested on  27mar2012 |         19        0.27       87.91
          Tested on  27may2011 |         33        0.47       88.38
          Tested on  27oct2010 |         18        0.26       88.63
          Tested on  27oct2011 |         22        0.31       88.95
          Tested on  28apr2011 |         16        0.23       89.17
          Tested on  28feb2012 |         43        0.61       89.79
          Tested on  28jan2011 |         22        0.31       90.10
          Tested on  28jan2012 |         33        0.47       90.57
          Tested on  28jul2011 |         23        0.33       90.89
          Tested on  28jun2011 |         20        0.28       91.18
          Tested on  28mar2012 |         20        0.28       91.46
          Tested on  28may2011 |         37        0.53       91.99
          Tested on  28nov2011 |         21        0.30       92.29
          Tested on  28oct2010 |         25        0.36       92.64
          Tested on  29apr2011 |          8        0.11       92.76
          Tested on  29feb2012 |         39        0.55       93.31
          Tested on  29jul2011 |         23        0.33       93.64
          Tested on  29jun2011 |         20        0.28       93.93
          Tested on  29mar2011 |         11        0.16       94.08
          Tested on  29mar2012 |         18        0.26       94.34
          Tested on  29nov2010 |         52        0.74       95.08
          Tested on  29nov2011 |         27        0.38       95.46
          Tested on  29oct2010 |         18        0.26       95.72
          Tested on  30jan2011 |         66        0.94       96.66
          Tested on  30jun2011 |         20        0.28       96.94
          Tested on  30mar2011 |         39        0.55       97.50
          Tested on  30nov2010 |         38        0.54       98.04
          Tested on  30nov2011 |         17        0.24       98.28
          Tested on  31jan2011 |         40        0.57       98.85
          Tested on  31jan2012 |         30        0.43       99.27
          Tested on  31mar2011 |         31        0.44       99.72
          Tested on  31may2011 |         20        0.28      100.00
          ---------------------+-----------------------------------
                         Total |      7,029      100.00

          . tab weightlbs

            weightlbs |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                    0 |          2        0.03        0.03
                   86 |          1        0.01        0.04
                   88 |          2        0.03        0.07
                   90 |          1        0.01        0.09
                   95 |          3        0.04        0.13
                   96 |          1        0.01        0.14
                   98 |          1        0.01        0.16
                  100 |          7        0.10        0.26
                  101 |          1        0.01        0.27
                  102 |          4        0.06        0.33
                  103 |          8        0.11        0.44
                  104 |          3        0.04        0.48
                  105 |         13        0.18        0.67
                  106 |          4        0.06        0.73
                  107 |          2        0.03        0.75
                  108 |          7        0.10        0.85
                  109 |          3        0.04        0.90
                  110 |         27        0.38        1.28
                  111 |          5        0.07        1.35
                  112 |          7        0.10        1.45
                  113 |          4        0.06        1.51
                  114 |          8        0.11        1.62
                  115 |         28        0.40        2.02
                  116 |         18        0.26        2.28
                  117 |          9        0.13        2.40
                  118 |         22        0.31        2.72
                  119 |          9        0.13        2.85
                  120 |         60        0.85        3.70
                  121 |          6        0.09        3.78
                  122 |         17        0.24        4.03
                  123 |         14        0.20        4.23
                  124 |         24        0.34        4.57
                  125 |         66        0.94        5.51
                  126 |         21        0.30        5.80
                  127 |         41        0.58        6.39
                  128 |         44        0.63        7.01
                  129 |         13        0.18        7.20
                  130 |        117        1.66        8.86
                  131 |         13        0.18        9.05
                  132 |         33        0.47        9.52
                  133 |         24        0.34        9.86
                  134 |         16        0.23       10.09
                  135 |        138        1.96       12.05
                  136 |         25        0.36       12.41
                  137 |         41        0.58       12.99
                  138 |         49        0.70       13.69
                  139 |         19        0.27       13.96
                  140 |        173        2.46       16.42
                  141 |         26        0.37       16.79
                  142 |         33        0.47       17.26
                  143 |         36        0.51       17.77
                  144 |         19        0.27       18.04
                  145 |        173        2.46       20.50
                  146 |         16        0.23       20.73
                  147 |         44        0.63       21.35
                  148 |         66        0.94       22.29
                  149 |         23        0.33       22.62
                  150 |        260        3.70       26.32
                  151 |          8        0.11       26.43
                  152 |         34        0.48       26.92
                  153 |         46        0.65       27.57
                  154 |         33        0.47       28.04
                  155 |        185        2.63       30.67
                  156 |         38        0.54       31.21
                  157 |         35        0.50       31.71
                  158 |         56        0.80       32.51
                  159 |         17        0.24       32.75
                  160 |        241        3.43       36.18
                  161 |         25        0.36       36.53
                  162 |         43        0.61       37.15
                  163 |         31        0.44       37.59
                  164 |         25        0.36       37.94
                  165 |        231        3.29       41.23
                  166 |         24        0.34       41.57
                  167 |         43        0.61       42.18
                  168 |         66        0.94       43.12
                  169 |         36        0.51       43.63
                  170 |        266        3.78       47.42
                  171 |         25        0.36       47.77
                  172 |         41        0.58       48.36
                  173 |         37        0.53       48.88
                  174 |         40        0.57       49.45
                  175 |        253        3.60       53.05
                  176 |         30        0.43       53.48
                  177 |         34        0.48       53.96
                  178 |         65        0.92       54.89
                  179 |         21        0.30       55.19
                  180 |        285        4.05       59.24
                  181 |         32        0.46       59.70
                  182 |         37        0.53       60.22
                  183 |         33        0.47       60.69
                  184 |         35        0.50       61.19
                  185 |        247        3.51       64.70
                  186 |         26        0.37       65.07
                  187 |         56        0.80       65.87
                  188 |         39        0.55       66.42
                  189 |         26        0.37       66.79
                  190 |        232        3.30       70.10
                  191 |         14        0.20       70.29
                  192 |         31        0.44       70.74
                  193 |         31        0.44       71.18
                  194 |         35        0.50       71.67
                  195 |        184        2.62       74.29
                  196 |         35        0.50       74.79
                  197 |         30        0.43       75.22
                  198 |         47        0.67       75.89
                  199 |          8        0.11       76.00
                  200 |        206        2.93       78.93
                  201 |         15        0.21       79.14
                  202 |         15        0.21       79.36
                  203 |         26        0.37       79.73
                  204 |         22        0.31       80.04
                  205 |        123        1.75       81.79
                  206 |         23        0.33       82.12
                  207 |         26        0.37       82.49
                  208 |         21        0.30       82.79
                  209 |         19        0.27       83.06
                  210 |        181        2.58       85.63
                  211 |         12        0.17       85.80
                  212 |         25        0.36       86.16
                  213 |         22        0.31       86.47
                  214 |         15        0.21       86.68
                  215 |        129        1.84       88.52
                  216 |          3        0.04       88.56
                  217 |         10        0.14       88.70
                  218 |         24        0.34       89.05
                  219 |          8        0.11       89.16
                  220 |        136        1.93       91.09
                  221 |          9        0.13       91.22
                  222 |         12        0.17       91.39
                  223 |         11        0.16       91.55
                  224 |         11        0.16       91.71
                  225 |         92        1.31       93.01
                  226 |         10        0.14       93.16
                  227 |          8        0.11       93.27
                  228 |         10        0.14       93.41
                  229 |          5        0.07       93.48
                  230 |         82        1.17       94.65
                  231 |          3        0.04       94.69
                  232 |          4        0.06       94.75
                  233 |          4        0.06       94.81
                  234 |          4        0.06       94.86
                  235 |         54        0.77       95.63
                  236 |          6        0.09       95.72
                  237 |          4        0.06       95.77
                  238 |          9        0.13       95.90
                  239 |          7        0.10       96.00
                  240 |         60        0.85       96.86
                  241 |          5        0.07       96.93
                  242 |         11        0.16       97.08
                  243 |          1        0.01       97.10
                  244 |          4        0.06       97.15
                  245 |         26        0.37       97.52
                  246 |          3        0.04       97.57
                  247 |          8        0.11       97.68
                  248 |          6        0.09       97.77
                  249 |          2        0.03       97.79
                  250 |         39        0.55       98.35
                  251 |          1        0.01       98.36
                  252 |          1        0.01       98.38
                  253 |          4        0.06       98.44
                  254 |          2        0.03       98.46
                  255 |         18        0.26       98.72
                  256 |          1        0.01       98.73
                  257 |          3        0.04       98.78
                  258 |          1        0.01       98.79
                  259 |          1        0.01       98.80
                  260 |         23        0.33       99.13
                  265 |         11        0.16       99.29
                  267 |          1        0.01       99.30
                  268 |          1        0.01       99.32
                  270 |         10        0.14       99.46
                  272 |          1        0.01       99.47
                  274 |          2        0.03       99.50
                  275 |          6        0.09       99.59
                  276 |          2        0.03       99.62
                  279 |          2        0.03       99.64
                  280 |          7        0.10       99.74
                  283 |          1        0.01       99.76
                  285 |          5        0.07       99.83
                  290 |          1        0.01       99.84
                  292 |          1        0.01       99.86
                  293 |          2        0.03       99.89
                  295 |          1        0.01       99.90
                  300 |          3        0.04       99.94
                  310 |          2        0.03       99.97
                  315 |          1        0.01       99.99
                  321 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,029      100.00

          . replace weightlbs = .x if weightlbs == 0 // a person cannot be 0 lbs
          (2 real changes made, 2 to missing)

          . tab heightin // potentially some suspect values of 57-58 and 94 but they are not suspect enough for me to want to do anything with them yet.

             heightin |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                   56 |          3        0.04        0.04
                   57 |          6        0.09        0.13
                   58 |          5        0.07        0.20
                   59 |         39        0.55        0.75
                   60 |         95        1.35        2.11
                   61 |        114        1.62        3.73
                   62 |        254        3.61        7.34
                   63 |        301        4.28       11.62
                   64 |        434        6.17       17.80
                   65 |        366        5.21       23.00
                   66 |        625        8.89       31.90
                   67 |        588        8.37       40.26
                   68 |        630        8.96       49.22
                   69 |        740       10.53       59.75
                   70 |        682        9.70       69.46
                   71 |        668        9.50       78.96
                   72 |        556        7.91       86.87
                   73 |        342        4.87       91.73
                   74 |        282        4.01       95.75
                   75 |        135        1.92       97.67
                   76 |         83        1.18       98.85
                   77 |         42        0.60       99.45
                   78 |         18        0.26       99.70
                   79 |          6        0.09       99.79
                   80 |          8        0.11       99.90
                   81 |          2        0.03       99.93
                   86 |          2        0.03       99.96
                   87 |          1        0.01       99.97
                   94 |          2        0.03      100.00
          ------------+-----------------------------------
                Total |      7,029      100.00

          . summ thumbtipreach span footlength kneeheightmidpatella waistheightomphalion functionalleglength cervicaleheight trochanterionheight stature waistcircumference chestcircumference bicristalbreadth hipbreadth hipbreadthsitting weightkg date

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
          thumbtipre~h |      7,028    802.7625    282.6306        602       9340
                  span |      7,028    1767.855    110.4987       1323       2121
            footlength |      7,028    263.4262    17.32096        198        323
          kneeheight~a |      7,028    475.3203    32.89078        346        612
          waistheigh~n |      7,028    1032.598    62.54826        805       1245
          -------------+---------------------------------------------------------
          functional~h |      7,028    1104.306    68.08699        835       1316
          cervicaleh~t |      7,028    1479.787    84.06564       1184       1738
          trochanter~t |      7,028    882.7624     54.0014        660       1095
               stature |      7,028    1716.589     89.6767       1409       1993
          waistcircu~e |      7,028    916.9048     113.946        611       1379
          -------------+---------------------------------------------------------
          chestcircu~e |      7,028    1024.891    100.1932        695       1469
          bicristalb~h |      7,028    274.5435    19.07584        197        362
            hipbreadth |      7,028    348.4102    24.99114        264        473
          hipbreadth~g |      7,028     385.892    32.03365        280        541
              weightkg |      7,028    84.12565    58.08255       35.8       1099
          -------------+---------------------------------------------------------
                  date |      6,066    18836.86    170.0968      18539      19088

          . tab thumbtipreach

          thumbtiprea |
                   ch |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                  602 |          1        0.01        0.01
                  607 |          1        0.01        0.03
                  614 |          1        0.01        0.04
                  625 |          1        0.01        0.06
                  632 |          1        0.01        0.07
                  637 |          2        0.03        0.10
                  638 |          1        0.01        0.11
                  639 |          1        0.01        0.13
                  641 |          1        0.01        0.14
                  642 |          2        0.03        0.17
                  645 |          1        0.01        0.18
                  646 |          2        0.03        0.21
                  648 |          1        0.01        0.23
                  649 |          1        0.01        0.24
                  650 |          1        0.01        0.26
                  651 |          6        0.09        0.34
                  652 |          3        0.04        0.38
                  654 |          2        0.03        0.41
                  655 |          1        0.01        0.43
                  656 |          1        0.01        0.44
                  657 |          1        0.01        0.46
                  658 |          3        0.04        0.50
                  659 |          2        0.03        0.53
                  660 |          2        0.03        0.55
                  661 |          3        0.04        0.60
                  662 |          2        0.03        0.63
                  663 |          3        0.04        0.67
                  664 |          3        0.04        0.71
                  665 |          9        0.13        0.84
                  666 |          1        0.01        0.85
                  667 |          6        0.09        0.94
                  668 |          1        0.01        0.95
                  669 |          9        0.13        1.08
                  670 |          5        0.07        1.15
                  671 |          3        0.04        1.20
                  672 |          9        0.13        1.32
                  673 |          7        0.10        1.42
                  674 |          3        0.04        1.47
                  675 |          4        0.06        1.52
                  676 |          9        0.13        1.65
                  677 |          3        0.04        1.69
                  678 |          7        0.10        1.79
                  679 |          5        0.07        1.86
                  680 |          6        0.09        1.95
                  681 |          8        0.11        2.06
                  682 |          8        0.11        2.18
                  683 |          8        0.11        2.29
                  684 |          6        0.09        2.38
                  685 |          5        0.07        2.45
                  686 |          5        0.07        2.52
                  687 |          8        0.11        2.63
                  688 |          7        0.10        2.73
                  689 |          6        0.09        2.82
                  690 |          7        0.10        2.92
                  691 |         10        0.14        3.06
                  692 |          8        0.11        3.17
                  693 |         14        0.20        3.37
                  694 |         15        0.21        3.59
                  695 |          8        0.11        3.70
                  696 |         16        0.23        3.93
                  697 |          3        0.04        3.97
                  698 |         12        0.17        4.14
                  699 |          5        0.07        4.21
                  700 |         17        0.24        4.45
                  701 |          9        0.13        4.58
                  702 |         10        0.14        4.72
                  703 |         15        0.21        4.94
                  704 |         13        0.18        5.12
                  705 |         11        0.16        5.28
                  706 |         14        0.20        5.48
                  707 |         23        0.33        5.81
                  708 |         17        0.24        6.05
                  709 |         25        0.36        6.40
                  710 |         15        0.21        6.62
                  711 |         15        0.21        6.83
                  712 |         26        0.37        7.20
                  713 |         29        0.41        7.61
                  714 |         16        0.23        7.84
                  715 |         17        0.24        8.08
                  716 |         22        0.31        8.39
                  717 |         20        0.28        8.68
                  718 |         28        0.40        9.08
                  719 |         29        0.41        9.49
                  720 |         14        0.20        9.69
                  721 |         23        0.33       10.02
                  722 |         32        0.46       10.47
                  723 |         23        0.33       10.80
                  724 |         22        0.31       11.11
                  725 |         19        0.27       11.38
                  726 |         29        0.41       11.80
                  727 |         33        0.47       12.27
                  728 |         37        0.53       12.79
                  729 |         29        0.41       13.20
                  730 |         29        0.41       13.62
                  731 |         20        0.28       13.90
                  732 |         28        0.40       14.30
                  733 |         29        0.41       14.71
                  734 |         34        0.48       15.20
                  735 |         26        0.37       15.57
                  736 |         39        0.55       16.12
                  737 |         26        0.37       16.49
                  738 |         33        0.47       16.96
                  739 |         25        0.36       17.32
                  740 |         32        0.46       17.77
                  741 |         28        0.40       18.17
                  742 |         41        0.58       18.75
                  743 |         32        0.46       19.21
                  744 |         27        0.38       19.59
                  745 |         24        0.34       19.93
                  746 |         23        0.33       20.26
                  747 |         30        0.43       20.69
                  748 |         33        0.47       21.16
                  749 |         34        0.48       21.64
                  750 |         44        0.63       22.27
                  751 |         17        0.24       22.51
                  752 |         33        0.47       22.98
                  753 |         47        0.67       23.65
                  754 |         47        0.67       24.32
                  755 |         26        0.37       24.69
                  756 |         45        0.64       25.33
                  757 |         32        0.46       25.78
                  758 |         38        0.54       26.32
                  759 |         41        0.58       26.91
                  760 |         43        0.61       27.52
                  761 |         27        0.38       27.90
                  762 |         40        0.57       28.47
                  763 |         40        0.57       29.04
                  764 |         54        0.77       29.81
                  765 |         30        0.43       30.24
                  766 |         50        0.71       30.95
                  767 |         39        0.55       31.50
                  768 |         37        0.53       32.03
                  769 |         46        0.65       32.68
                  770 |         48        0.68       33.37
                  771 |         35        0.50       33.86
                  772 |         41        0.58       34.45
                  773 |         51        0.73       35.17
                  774 |         54        0.77       35.94
                  775 |         34        0.48       36.43
                  776 |         59        0.84       37.27
                  777 |         41        0.58       37.85
                  778 |         54        0.77       38.62
                  779 |         39        0.55       39.17
                  780 |         48        0.68       39.85
                  781 |         31        0.44       40.30
                  782 |         63        0.90       41.19
                  783 |         38        0.54       41.73
                  784 |         59        0.84       42.57
                  785 |         45        0.64       43.21
                  786 |         62        0.88       44.10
                  787 |         50        0.71       44.81
                  788 |         43        0.61       45.42
                  789 |         54        0.77       46.19
                  790 |         65        0.92       47.11
                  791 |         30        0.43       47.54
                  792 |         58        0.83       48.36
                  793 |         57        0.81       49.17
                  794 |         46        0.65       49.83
                  795 |         30        0.43       50.26
                  796 |         64        0.91       51.17
                  797 |         56        0.80       51.96
                  798 |         60        0.85       52.82
                  799 |         66        0.94       53.76
                  800 |         59        0.84       54.60
                  801 |         42        0.60       55.19
                  802 |         51        0.73       55.92
                  803 |         54        0.77       56.69
                  804 |         66        0.94       57.63
                  805 |         42        0.60       58.22
                  806 |         55        0.78       59.01
                  807 |         35        0.50       59.50
                  808 |         57        0.81       60.32
                  809 |         46        0.65       60.97
                  810 |         60        0.85       61.82
                  811 |         36        0.51       62.34
                  812 |         48        0.68       63.02
                  813 |         58        0.83       63.84
                  814 |         53        0.75       64.60
                  815 |         37        0.53       65.13
                  816 |         60        0.85       65.98
                  817 |         40        0.57       66.55
                  818 |         65        0.92       67.47
                  819 |         73        1.04       68.51
                  820 |         50        0.71       69.22
                  821 |         37        0.53       69.75
                  822 |         68        0.97       70.72
                  823 |         47        0.67       71.39
                  824 |         59        0.84       72.23
                  825 |         34        0.48       72.71
                  826 |         53        0.75       73.46
                  827 |         42        0.60       74.06
                  828 |         47        0.67       74.73
                  829 |         73        1.04       75.77
                  830 |         44        0.63       76.39
                  831 |         19        0.27       76.66
                  832 |         50        0.71       77.38
                  833 |         58        0.83       78.20
                  834 |         50        0.71       78.91
                  835 |         23        0.33       79.24
                  836 |         49        0.70       79.94
                  837 |         58        0.83       80.76
                  838 |         55        0.78       81.55
                  839 |         38        0.54       82.09
                  840 |         23        0.33       82.41
                  841 |         20        0.28       82.70
                  842 |         46        0.65       83.35
                  843 |         28        0.40       83.75
                  844 |         36        0.51       84.26
                  845 |         30        0.43       84.69
                  846 |         26        0.37       85.06
                  847 |         24        0.34       85.40
                  848 |         37        0.53       85.93
                  849 |         28        0.40       86.33
                  850 |         35        0.50       86.82
                  851 |         20        0.28       87.11
                  852 |         32        0.46       87.56
                  853 |         30        0.43       87.99
                  854 |         32        0.46       88.45
                  855 |         17        0.24       88.69
                  856 |         26        0.37       89.06
                  857 |         16        0.23       89.29
                  858 |         17        0.24       89.53
                  859 |         29        0.41       89.94
                  860 |         26        0.37       90.31
                  861 |         18        0.26       90.57
                  862 |         23        0.33       90.89
                  863 |         35        0.50       91.39
                  864 |         15        0.21       91.61
                  865 |         14        0.20       91.80
                  866 |         26        0.37       92.17
                  867 |         13        0.18       92.36
                  868 |         26        0.37       92.73
                  869 |         23        0.33       93.06
                  870 |         21        0.30       93.36
                  871 |         13        0.18       93.54
                  872 |         12        0.17       93.71
                  873 |         11        0.16       93.87
                  874 |         21        0.30       94.17
                  875 |         13        0.18       94.35
                  876 |         16        0.23       94.58
                  877 |         14        0.20       94.78
                  878 |         10        0.14       94.92
                  879 |          8        0.11       95.03
                  880 |         11        0.16       95.19
                  881 |         13        0.18       95.38
                  882 |         11        0.16       95.53
                  883 |         19        0.27       95.80
                  884 |         11        0.16       95.96
                  885 |         13        0.18       96.14
                  886 |         18        0.26       96.40
                  887 |         15        0.21       96.61
                  888 |         10        0.14       96.76
                  889 |          9        0.13       96.88
                  890 |         10        0.14       97.03
                  891 |          6        0.09       97.11
                  892 |          9        0.13       97.24
                  893 |          5        0.07       97.31
                  894 |          9        0.13       97.44
                  895 |          9        0.13       97.57
                  896 |         10        0.14       97.71
                  897 |          8        0.11       97.82
                  898 |         10        0.14       97.97
                  899 |          5        0.07       98.04
                  900 |          2        0.03       98.06
                  901 |          3        0.04       98.11
                  902 |          5        0.07       98.18
                  903 |          3        0.04       98.22
                  904 |          2        0.03       98.25
                  905 |          4        0.06       98.31
                  906 |          7        0.10       98.41
                  907 |          1        0.01       98.42
                  908 |          4        0.06       98.48
                  909 |          1        0.01       98.49
                  910 |          5        0.07       98.56
                  911 |          4        0.06       98.62
                  912 |          6        0.09       98.71
                  913 |          4        0.06       98.76
                  914 |          6        0.09       98.85
                  915 |          7        0.10       98.95
                  916 |          4        0.06       99.00
                  917 |          1        0.01       99.02
                  918 |          1        0.01       99.03
                  919 |          5        0.07       99.10
                  920 |          3        0.04       99.15
                  922 |          3        0.04       99.19
                  923 |          2        0.03       99.22
                  925 |          2        0.03       99.25
                  926 |          3        0.04       99.29
                  927 |          3        0.04       99.33
                  928 |          2        0.03       99.36
                  929 |          4        0.06       99.42
                  931 |          2        0.03       99.45
                  932 |          2        0.03       99.47
                  934 |          2        0.03       99.50
                  936 |          2        0.03       99.53
                  937 |          2        0.03       99.56
                  938 |          2        0.03       99.59
                  941 |          1        0.01       99.60
                  943 |          1        0.01       99.62
                  944 |          1        0.01       99.63
                  945 |          1        0.01       99.64
                  946 |          2        0.03       99.67
                  948 |          1        0.01       99.69
                  950 |          1        0.01       99.70
                  953 |          1        0.01       99.72
                  955 |          1        0.01       99.73
                  958 |          1        0.01       99.74
                  962 |          1        0.01       99.76
                  963 |          1        0.01       99.77
                  964 |          1        0.01       99.79
                  967 |          1        0.01       99.80
                  977 |          2        0.03       99.83
                  979 |          1        0.01       99.84
                  998 |          1        0.01       99.86
                 7600 |          2        0.03       99.89
                 7650 |          1        0.01       99.90
                 7720 |          1        0.01       99.91
                 7730 |          1        0.01       99.93
                 7790 |          1        0.01       99.94
                 8280 |          1        0.01       99.96
                 8440 |          1        0.01       99.97
                 9140 |          1        0.01       99.99
                 9340 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . replace thumbtipreach = .x if thumbtipreach > 999 // the reasonable range for thumb tip range for half arm span is 600-900 so the data above 998 at 7000-9500mm are unreasonable.
          (11 real changes made, 11 to missing)

          . tab span // all seem reasonable. For span, a typical range is 1300-2200mm which all values fall within.

                 span |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                 1323 |          1        0.01        0.01
                 1408 |          1        0.01        0.03
                 1414 |          1        0.01        0.04
                 1424 |          1        0.01        0.06
                 1425 |          1        0.01        0.07
                 1429 |          1        0.01        0.09
                 1431 |          1        0.01        0.10
                 1434 |          1        0.01        0.11
                 1438 |          1        0.01        0.13
                 1446 |          1        0.01        0.14
                 1451 |          1        0.01        0.16
                 1454 |          1        0.01        0.17
                 1455 |          1        0.01        0.18
                 1458 |          1        0.01        0.20
                 1463 |          1        0.01        0.21
                 1465 |          1        0.01        0.23
                 1475 |          1        0.01        0.24
                 1476 |          2        0.03        0.27
                 1480 |          1        0.01        0.28
                 1482 |          2        0.03        0.31
                 1486 |          1        0.01        0.33
                 1489 |          2        0.03        0.36
                 1493 |          2        0.03        0.38
                 1495 |          2        0.03        0.41
                 1496 |          3        0.04        0.46
                 1497 |          1        0.01        0.47
                 1498 |          2        0.03        0.50
                 1499 |          3        0.04        0.54
                 1500 |          2        0.03        0.57
                 1501 |          1        0.01        0.58
                 1502 |          1        0.01        0.60
                 1503 |          1        0.01        0.61
                 1504 |          1        0.01        0.63
                 1505 |          2        0.03        0.65
                 1507 |          2        0.03        0.68
                 1508 |          3        0.04        0.73
                 1509 |          4        0.06        0.78
                 1510 |          4        0.06        0.84
                 1511 |          3        0.04        0.88
                 1512 |          1        0.01        0.90
                 1513 |          1        0.01        0.91
                 1514 |          3        0.04        0.95
                 1515 |          4        0.06        1.01
                 1516 |          4        0.06        1.07
                 1518 |          2        0.03        1.10
                 1519 |          3        0.04        1.14
                 1520 |          2        0.03        1.17
                 1521 |          2        0.03        1.20
                 1522 |          1        0.01        1.21
                 1523 |          3        0.04        1.25
                 1524 |          1        0.01        1.27
                 1525 |          3        0.04        1.31
                 1526 |          4        0.06        1.37
                 1527 |          5        0.07        1.44
                 1528 |          3        0.04        1.48
                 1529 |          9        0.13        1.61
                 1530 |          3        0.04        1.65
                 1531 |          5        0.07        1.72
                 1532 |          6        0.09        1.81
                 1533 |          5        0.07        1.88
                 1534 |          6        0.09        1.96
                 1535 |          5        0.07        2.03
                 1536 |          1        0.01        2.05
                 1537 |          4        0.06        2.11
                 1538 |          4        0.06        2.16
                 1539 |          2        0.03        2.19
                 1540 |          5        0.07        2.26
                 1541 |          2        0.03        2.29
                 1542 |          1        0.01        2.31
                 1543 |          4        0.06        2.36
                 1544 |          3        0.04        2.40
                 1545 |          2        0.03        2.43
                 1546 |          3        0.04        2.48
                 1547 |          3        0.04        2.52
                 1548 |          5        0.07        2.59
                 1549 |          3        0.04        2.63
                 1550 |          5        0.07        2.70
                 1551 |         10        0.14        2.85
                 1552 |          5        0.07        2.92
                 1553 |          6        0.09        3.00
                 1554 |          4        0.06        3.06
                 1555 |          3        0.04        3.10
                 1556 |          3        0.04        3.14
                 1557 |          6        0.09        3.23
                 1558 |          6        0.09        3.32
                 1559 |          5        0.07        3.39
                 1560 |          2        0.03        3.41
                 1561 |          4        0.06        3.47
                 1562 |          5        0.07        3.54
                 1563 |          6        0.09        3.63
                 1564 |          2        0.03        3.66
                 1565 |          3        0.04        3.70
                 1566 |          6        0.09        3.78
                 1567 |          3        0.04        3.83
                 1568 |          1        0.01        3.84
                 1569 |          7        0.10        3.94
                 1570 |          8        0.11        4.06
                 1571 |          5        0.07        4.13
                 1572 |         10        0.14        4.27
                 1573 |          5        0.07        4.34
                 1574 |          8        0.11        4.45
                 1575 |          3        0.04        4.50
                 1576 |          6        0.09        4.58
                 1577 |         10        0.14        4.72
                 1578 |         10        0.14        4.87
                 1579 |          5        0.07        4.94
                 1580 |          6        0.09        5.02
                 1581 |          2        0.03        5.05
                 1582 |          3        0.04        5.09
                 1583 |         16        0.23        5.32
                 1584 |          7        0.10        5.42
                 1585 |         11        0.16        5.58
                 1586 |         15        0.21        5.79
                 1587 |          6        0.09        5.88
                 1588 |         12        0.17        6.05
                 1589 |          4        0.06        6.10
                 1590 |         14        0.20        6.30
                 1591 |          7        0.10        6.40
                 1592 |          8        0.11        6.52
                 1593 |          7        0.10        6.62
                 1594 |          6        0.09        6.70
                 1595 |          8        0.11        6.82
                 1596 |          4        0.06        6.87
                 1597 |          3        0.04        6.92
                 1598 |          2        0.03        6.94
                 1599 |         13        0.18        7.13
                 1600 |          8        0.11        7.24
                 1601 |          6        0.09        7.33
                 1602 |         12        0.17        7.50
                 1603 |         14        0.20        7.70
                 1604 |         14        0.20        7.90
                 1605 |          6        0.09        7.98
                 1606 |          7        0.10        8.08
                 1607 |          9        0.13        8.21
                 1608 |         16        0.23        8.44
                 1609 |         11        0.16        8.59
                 1610 |         11        0.16        8.75
                 1611 |          6        0.09        8.84
                 1612 |         20        0.28        9.12
                 1613 |         15        0.21        9.33
                 1614 |          7        0.10        9.43
                 1615 |          5        0.07        9.50
                 1616 |         10        0.14        9.65
                 1617 |          5        0.07        9.72
                 1618 |         14        0.20        9.92
                 1619 |         16        0.23       10.15
                 1620 |         11        0.16       10.30
                 1621 |         17        0.24       10.54
                 1622 |         13        0.18       10.73
                 1623 |          8        0.11       10.84
                 1624 |         12        0.17       11.01
                 1625 |         15        0.21       11.23
                 1626 |         16        0.23       11.45
                 1627 |          7        0.10       11.55
                 1628 |         20        0.28       11.84
                 1629 |         23        0.33       12.17
                 1630 |         18        0.26       12.42
                 1631 |          9        0.13       12.55
                 1632 |          7        0.10       12.65
                 1633 |         13        0.18       12.83
                 1634 |         13        0.18       13.02
                 1635 |         11        0.16       13.18
                 1636 |         12        0.17       13.35
                 1637 |         14        0.20       13.55
                 1638 |         11        0.16       13.70
                 1639 |         12        0.17       13.87
                 1640 |         11        0.16       14.03
                 1641 |         14        0.20       14.23
                 1642 |          9        0.13       14.36
                 1643 |         11        0.16       14.51
                 1644 |         22        0.31       14.83
                 1645 |         11        0.16       14.98
                 1646 |         12        0.17       15.15
                 1647 |          9        0.13       15.28
                 1648 |         17        0.24       15.52
                 1649 |         19        0.27       15.79
                 1650 |         17        0.24       16.04
                 1651 |         12        0.17       16.21
                 1652 |         15        0.21       16.42
                 1653 |         11        0.16       16.58
                 1654 |         15        0.21       16.79
                 1655 |         10        0.14       16.93
                 1656 |         10        0.14       17.07
                 1657 |         11        0.16       17.23
                 1658 |         10        0.14       17.37
                 1659 |         12        0.17       17.54
                 1660 |         14        0.20       17.74
                 1661 |         19        0.27       18.01
                 1662 |         16        0.23       18.24
                 1663 |         16        0.23       18.47
                 1664 |         17        0.24       18.71
                 1665 |         19        0.27       18.98
                 1666 |          4        0.06       19.04
                 1667 |         24        0.34       19.38
                 1668 |         10        0.14       19.52
                 1669 |         14        0.20       19.72
                 1670 |         10        0.14       19.86
                 1671 |         13        0.18       20.05
                 1672 |         17        0.24       20.29
                 1673 |         18        0.26       20.55
                 1674 |         23        0.33       20.87
                 1675 |          7        0.10       20.97
                 1676 |         22        0.31       21.29
                 1677 |         22        0.31       21.60
                 1678 |         18        0.26       21.86
                 1679 |         12        0.17       22.03
                 1680 |         23        0.33       22.35
                 1681 |         11        0.16       22.51
                 1682 |         18        0.26       22.77
                 1683 |         21        0.30       23.06
                 1684 |         18        0.26       23.32
                 1685 |         12        0.17       23.49
                 1686 |         18        0.26       23.75
                 1687 |         31        0.44       24.19
                 1688 |         20        0.28       24.47
                 1689 |         14        0.20       24.67
                 1690 |         19        0.27       24.94
                 1691 |         15        0.21       25.16
                 1692 |         12        0.17       25.33
                 1693 |         27        0.38       25.71
                 1694 |         18        0.26       25.97
                 1695 |         12        0.17       26.14
                 1696 |         24        0.34       26.48
                 1697 |         21        0.30       26.78
                 1698 |         15        0.21       26.99
                 1699 |         14        0.20       27.19
                 1700 |         17        0.24       27.43
                 1701 |         18        0.26       27.69
                 1702 |         20        0.28       27.97
                 1703 |         15        0.21       28.19
                 1704 |         21        0.30       28.49
                 1705 |         15        0.21       28.70
                 1706 |         24        0.34       29.04
                 1707 |         21        0.30       29.34
                 1708 |         31        0.44       29.78
                 1709 |         24        0.34       30.12
                 1710 |         21        0.30       30.42
                 1711 |         20        0.28       30.71
                 1712 |         14        0.20       30.90
                 1713 |         26        0.37       31.27
                 1714 |         17        0.24       31.52
                 1715 |         12        0.17       31.69
                 1716 |         14        0.20       31.89
                 1717 |         10        0.14       32.03
                 1718 |         14        0.20       32.23
                 1719 |         31        0.44       32.67
                 1720 |         12        0.17       32.84
                 1721 |         24        0.34       33.18
                 1722 |         27        0.38       33.57
                 1723 |         14        0.20       33.76
                 1724 |         27        0.38       34.15
                 1725 |         13        0.18       34.33
                 1726 |         21        0.30       34.63
                 1727 |         15        0.21       34.85
                 1728 |         23        0.33       35.17
                 1729 |         15        0.21       35.39
                 1730 |         30        0.43       35.81
                 1731 |         19        0.27       36.08
                 1732 |         18        0.26       36.34
                 1733 |         12        0.17       36.51
                 1734 |         25        0.36       36.87
                 1735 |         14        0.20       37.07
                 1736 |         23        0.33       37.39
                 1737 |         25        0.36       37.75
                 1738 |         22        0.31       38.06
                 1739 |         31        0.44       38.50
                 1740 |         20        0.28       38.79
                 1741 |         11        0.16       38.94
                 1742 |         20        0.28       39.23
                 1743 |         20        0.28       39.51
                 1744 |         24        0.34       39.85
                 1745 |         21        0.30       40.15
                 1746 |         32        0.46       40.61
                 1747 |         10        0.14       40.75
                 1748 |         21        0.30       41.05
                 1749 |         32        0.46       41.51
                 1750 |         20        0.28       41.79
                 1751 |         19        0.27       42.06
                 1752 |         27        0.38       42.44
                 1753 |         21        0.30       42.74
                 1754 |         24        0.34       43.08
                 1755 |          9        0.13       43.21
                 1756 |         28        0.40       43.61
                 1757 |         27        0.38       44.00
                 1758 |         18        0.26       44.25
                 1759 |         31        0.44       44.69
                 1760 |         20        0.28       44.98
                 1761 |         12        0.17       45.15
                 1762 |         19        0.27       45.42
                 1763 |         27        0.38       45.80
                 1764 |         32        0.46       46.26
                 1765 |         18        0.26       46.51
                 1766 |         29        0.41       46.93
                 1767 |         24        0.34       47.27
                 1768 |         15        0.21       47.48
                 1769 |         28        0.40       47.88
                 1770 |         22        0.31       48.19
                 1771 |         15        0.21       48.41
                 1772 |         27        0.38       48.79
                 1773 |         34        0.48       49.27
                 1774 |         26        0.37       49.64
                 1775 |         15        0.21       49.86
                 1776 |         40        0.57       50.43
                 1777 |         24        0.34       50.77
                 1778 |         24        0.34       51.11
                 1779 |         30        0.43       51.54
                 1780 |         30        0.43       51.96
                 1781 |         14        0.20       52.16
                 1782 |         32        0.46       52.62
                 1783 |         29        0.41       53.03
                 1784 |         21        0.30       53.33
                 1785 |         17        0.24       53.57
                 1786 |         39        0.55       54.13
                 1787 |         20        0.28       54.41
                 1788 |         23        0.33       54.74
                 1789 |         19        0.27       55.01
                 1790 |         29        0.41       55.42
                 1791 |         19        0.27       55.69
                 1792 |         20        0.28       55.98
                 1793 |         22        0.31       56.29
                 1794 |         31        0.44       56.73
                 1795 |         21        0.30       57.03
                 1796 |         52        0.74       57.77
                 1797 |         24        0.34       58.11
                 1798 |         43        0.61       58.72
                 1799 |         39        0.55       59.28
                 1800 |         27        0.38       59.66
                 1801 |         17        0.24       59.90
                 1802 |         40        0.57       60.47
                 1803 |         29        0.41       60.89
                 1804 |         13        0.18       61.07
                 1805 |         13        0.18       61.25
                 1806 |         21        0.30       61.55
                 1807 |         18        0.26       61.81
                 1808 |         21        0.30       62.11
                 1809 |         42        0.60       62.71
                 1810 |         25        0.36       63.06
                 1811 |         26        0.37       63.43
                 1812 |         27        0.38       63.82
                 1813 |         36        0.51       64.33
                 1814 |         27        0.38       64.71
                 1815 |         21        0.30       65.01
                 1816 |         30        0.43       65.44
                 1817 |         30        0.43       65.87
                 1818 |         23        0.33       66.19
                 1819 |         32        0.46       66.65
                 1820 |         11        0.16       66.80
                 1821 |         22        0.31       67.12
                 1822 |         31        0.44       67.56
                 1823 |         26        0.37       67.93
                 1824 |         27        0.38       68.31
                 1825 |         15        0.21       68.53
                 1826 |         32        0.46       68.98
                 1827 |         23        0.33       69.31
                 1828 |         29        0.41       69.72
                 1829 |         30        0.43       70.15
                 1830 |         21        0.30       70.45
                 1831 |         25        0.36       70.80
                 1832 |         27        0.38       71.19
                 1833 |         18        0.26       71.44
                 1834 |         14        0.20       71.64
                 1835 |         15        0.21       71.86
                 1836 |         38        0.54       72.40
                 1837 |         31        0.44       72.84
                 1838 |         24        0.34       73.18
                 1839 |         26        0.37       73.55
                 1840 |         19        0.27       73.82
                 1841 |         11        0.16       73.98
                 1842 |         20        0.28       74.26
                 1843 |         28        0.40       74.66
                 1844 |         19        0.27       74.93
                 1845 |          9        0.13       75.06
                 1846 |         20        0.28       75.34
                 1847 |         26        0.37       75.71
                 1848 |         19        0.27       75.98
                 1849 |         18        0.26       76.24
                 1850 |         22        0.31       76.55
                 1851 |         25        0.36       76.91
                 1852 |         26        0.37       77.28
                 1853 |         25        0.36       77.63
                 1854 |         23        0.33       77.96
                 1855 |         24        0.34       78.30
                 1856 |         23        0.33       78.63
                 1857 |         15        0.21       78.84
                 1858 |         25        0.36       79.20
                 1859 |         33        0.47       79.67
                 1860 |         18        0.26       79.92
                 1861 |         13        0.18       80.11
                 1862 |         20        0.28       80.39
                 1863 |         24        0.34       80.73
                 1864 |         21        0.30       81.03
                 1865 |         25        0.36       81.39
                 1866 |         14        0.20       81.59
                 1867 |         18        0.26       81.84
                 1868 |         25        0.36       82.20
                 1869 |         18        0.26       82.46
                 1870 |         15        0.21       82.67
                 1871 |         11        0.16       82.83
                 1872 |          9        0.13       82.95
                 1873 |         23        0.33       83.28
                 1874 |         20        0.28       83.57
                 1875 |         13        0.18       83.75
                 1876 |         24        0.34       84.09
                 1877 |         14        0.20       84.29
                 1878 |         28        0.40       84.69
                 1879 |         15        0.21       84.90
                 1880 |         15        0.21       85.12
                 1881 |         12        0.17       85.29
                 1882 |          6        0.09       85.37
                 1883 |         18        0.26       85.63
                 1884 |         15        0.21       85.84
                 1885 |         11        0.16       86.00
                 1886 |         18        0.26       86.25
                 1887 |         19        0.27       86.53
                 1888 |          8        0.11       86.64
                 1889 |         25        0.36       86.99
                 1890 |          8        0.11       87.11
                 1891 |         12        0.17       87.28
                 1892 |         17        0.24       87.52
                 1893 |         19        0.27       87.79
                 1894 |         13        0.18       87.98
                 1895 |         15        0.21       88.19
                 1896 |         24        0.34       88.53
                 1897 |         16        0.23       88.76
                 1898 |         12        0.17       88.93
                 1899 |         21        0.30       89.23
                 1900 |          8        0.11       89.34
                 1901 |         11        0.16       89.50
                 1902 |         11        0.16       89.66
                 1903 |         12        0.17       89.83
                 1904 |         18        0.26       90.08
                 1905 |         11        0.16       90.24
                 1906 |         17        0.24       90.48
                 1907 |         12        0.17       90.65
                 1908 |         16        0.23       90.88
                 1909 |         15        0.21       91.09
                 1910 |          4        0.06       91.15
                 1911 |          8        0.11       91.26
                 1912 |         10        0.14       91.41
                 1913 |          8        0.11       91.52
                 1914 |          9        0.13       91.65
                 1915 |          6        0.09       91.73
                 1916 |         14        0.20       91.93
                 1917 |         16        0.23       92.16
                 1918 |          9        0.13       92.29
                 1919 |          6        0.09       92.37
                 1920 |          7        0.10       92.47
                 1921 |          3        0.04       92.52
                 1922 |         14        0.20       92.71
                 1923 |          6        0.09       92.80
                 1924 |         14        0.20       93.00
                 1925 |          1        0.01       93.01
                 1926 |          8        0.11       93.13
                 1927 |          3        0.04       93.17
                 1928 |          6        0.09       93.26
                 1929 |         12        0.17       93.43
                 1930 |         13        0.18       93.61
                 1931 |          7        0.10       93.71
                 1932 |         16        0.23       93.94
                 1933 |         17        0.24       94.18
                 1934 |          8        0.11       94.29
                 1935 |          4        0.06       94.35
                 1936 |          6        0.09       94.44
                 1937 |         10        0.14       94.58
                 1938 |          5        0.07       94.65
                 1939 |          8        0.11       94.76
                 1940 |          3        0.04       94.81
                 1941 |         10        0.14       94.95
                 1942 |          8        0.11       95.06
                 1943 |          3        0.04       95.11
                 1944 |          3        0.04       95.15
                 1945 |          2        0.03       95.18
                 1946 |          9        0.13       95.30
                 1947 |          6        0.09       95.39
                 1948 |         11        0.16       95.55
                 1949 |          5        0.07       95.62
                 1950 |         10        0.14       95.76
                 1951 |          6        0.09       95.85
                 1952 |          8        0.11       95.96
                 1953 |          7        0.10       96.06
                 1954 |          9        0.13       96.19
                 1956 |         11        0.16       96.34
                 1957 |         10        0.14       96.49
                 1958 |          1        0.01       96.50
                 1959 |          2        0.03       96.53
                 1960 |          7        0.10       96.63
                 1961 |          6        0.09       96.71
                 1962 |          6        0.09       96.80
                 1963 |          5        0.07       96.87
                 1964 |          3        0.04       96.91
                 1965 |          2        0.03       96.94
                 1966 |          2        0.03       96.97
                 1967 |          2        0.03       97.00
                 1968 |          3        0.04       97.04
                 1969 |          2        0.03       97.07
                 1970 |          7        0.10       97.17
                 1971 |          5        0.07       97.24
                 1972 |          3        0.04       97.28
                 1973 |          7        0.10       97.38
                 1974 |          5        0.07       97.45
                 1975 |          1        0.01       97.47
                 1976 |          3        0.04       97.51
                 1977 |          8        0.11       97.62
                 1978 |          2        0.03       97.65
                 1979 |          4        0.06       97.71
                 1980 |          3        0.04       97.75
                 1981 |          4        0.06       97.81
                 1982 |          4        0.06       97.87
                 1983 |          3        0.04       97.91
                 1984 |          7        0.10       98.01
                 1985 |          3        0.04       98.05
                 1986 |          5        0.07       98.12
                 1987 |          4        0.06       98.18
                 1989 |          4        0.06       98.24
                 1990 |          8        0.11       98.35
                 1993 |          2        0.03       98.38
                 1994 |          1        0.01       98.39
                 1995 |          2        0.03       98.42
                 1996 |          7        0.10       98.52
                 1997 |          4        0.06       98.58
                 1998 |          1        0.01       98.59
                 1999 |          2        0.03       98.62
                 2000 |          4        0.06       98.68
                 2001 |          3        0.04       98.72
                 2003 |          2        0.03       98.75
                 2004 |          5        0.07       98.82
                 2005 |          4        0.06       98.88
                 2006 |          4        0.06       98.93
                 2007 |          1        0.01       98.95
                 2008 |          2        0.03       98.98
                 2009 |          1        0.01       98.99
                 2010 |          1        0.01       99.00
                 2012 |          4        0.06       99.06
                 2014 |          1        0.01       99.08
                 2015 |          1        0.01       99.09
                 2022 |          2        0.03       99.12
                 2023 |          3        0.04       99.16
                 2024 |          3        0.04       99.20
                 2026 |          1        0.01       99.22
                 2028 |          1        0.01       99.23
                 2032 |          4        0.06       99.29
                 2033 |          7        0.10       99.39
                 2034 |          2        0.03       99.42
                 2035 |          3        0.04       99.46
                 2036 |          2        0.03       99.49
                 2037 |          3        0.04       99.53
                 2039 |          2        0.03       99.56
                 2042 |          1        0.01       99.57
                 2043 |          1        0.01       99.59
                 2044 |          1        0.01       99.60
                 2047 |          2        0.03       99.63
                 2048 |          1        0.01       99.64
                 2052 |          1        0.01       99.66
                 2055 |          2        0.03       99.69
                 2058 |          1        0.01       99.70
                 2059 |          4        0.06       99.76
                 2066 |          1        0.01       99.77
                 2069 |          1        0.01       99.79
                 2072 |          1        0.01       99.80
                 2073 |          1        0.01       99.82
                 2076 |          2        0.03       99.84
                 2084 |          1        0.01       99.86
                 2089 |          1        0.01       99.87
                 2091 |          3        0.04       99.91
                 2104 |          1        0.01       99.93
                 2107 |          2        0.03       99.96
                 2109 |          1        0.01       99.97
                 2111 |          1        0.01       99.99
                 2121 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . tab footlength // all seem reasonable. For footlength, a typical range is 200-320mm which the values either fall within or are close enough to not want to take out.

           footlength |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                  198 |          1        0.01        0.01
                  210 |          1        0.01        0.03
                  212 |          1        0.01        0.04
                  213 |          1        0.01        0.06
                  214 |          2        0.03        0.09
                  215 |          3        0.04        0.13
                  216 |          4        0.06        0.18
                  217 |          9        0.13        0.31
                  219 |          8        0.11        0.43
                  220 |          5        0.07        0.50
                  221 |          3        0.04        0.54
                  222 |         13        0.18        0.73
                  223 |         14        0.20        0.92
                  224 |         13        0.18        1.11
                  225 |         21        0.30        1.41
                  226 |         25        0.36        1.76
                  227 |         23        0.33        2.09
                  228 |         30        0.43        2.52
                  229 |         35        0.50        3.02
                  230 |         31        0.44        3.46
                  231 |         18        0.26        3.71
                  232 |         31        0.44        4.15
                  233 |         53        0.75        4.91
                  234 |         57        0.81        5.72
                  235 |         50        0.71        6.43
                  236 |         42        0.60        7.03
                  237 |         76        1.08        8.11
                  238 |         72        1.02        9.13
                  239 |         63        0.90       10.03
                  240 |         63        0.90       10.93
                  241 |         55        0.78       11.71
                  242 |         79        1.12       12.83
                  243 |        101        1.44       14.27
                  244 |        103        1.47       15.74
                  245 |         72        1.02       16.76
                  246 |         76        1.08       17.84
                  247 |        112        1.59       19.44
                  248 |         79        1.12       20.56
                  249 |         99        1.41       21.97
                  250 |        114        1.62       23.59
                  251 |         80        1.14       24.73
                  252 |        131        1.86       26.59
                  253 |        142        2.02       28.61
                  254 |        133        1.89       30.51
                  255 |        120        1.71       32.21
                  256 |        125        1.78       33.99
                  257 |        145        2.06       36.06
                  258 |        131        1.86       37.92
                  259 |        140        1.99       39.91
                  260 |        119        1.69       41.61
                  261 |        107        1.52       43.13
                  262 |        113        1.61       44.74
                  263 |        158        2.25       46.98
                  264 |        186        2.65       49.63
                  265 |        155        2.21       51.84
                  266 |        141        2.01       53.84
                  267 |        168        2.39       56.23
                  268 |        172        2.45       58.68
                  269 |        176        2.50       61.18
                  270 |        159        2.26       63.45
                  271 |        101        1.44       64.88
                  272 |        165        2.35       67.23
                  273 |        161        2.29       69.52
                  274 |        204        2.90       72.42
                  275 |        144        2.05       74.47
                  276 |        121        1.72       76.20
                  277 |        160        2.28       78.47
                  278 |        144        2.05       80.52
                  279 |         99        1.41       81.93
                  280 |        138        1.96       83.89
                  281 |         98        1.39       85.29
                  282 |         93        1.32       86.61
                  283 |         83        1.18       87.79
                  284 |        123        1.75       89.54
                  285 |         83        1.18       90.72
                  286 |         70        1.00       91.72
                  287 |         82        1.17       92.89
                  288 |         71        1.01       93.90
                  289 |         52        0.74       94.64
                  290 |         45        0.64       95.28
                  291 |         33        0.47       95.75
                  292 |         37        0.53       96.27
                  293 |         39        0.55       96.83
                  294 |         40        0.57       97.40
                  295 |         24        0.34       97.74
                  296 |         22        0.31       98.05
                  297 |         27        0.38       98.43
                  298 |         16        0.23       98.66
                  299 |         14        0.20       98.86
                  300 |         18        0.26       99.12
                  301 |         10        0.14       99.26
                  302 |         10        0.14       99.40
                  303 |          7        0.10       99.50
                  304 |          4        0.06       99.56
                  305 |          4        0.06       99.62
                  306 |          5        0.07       99.69
                  307 |          3        0.04       99.73
                  308 |          2        0.03       99.76
                  309 |          6        0.09       99.84
                  310 |          3        0.04       99.89
                  311 |          1        0.01       99.90
                  312 |          2        0.03       99.93
                  313 |          2        0.03       99.96
                  316 |          1        0.01       99.97
                  318 |          1        0.01       99.99
                  323 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . summ kneeheightmidpatella

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
          kneeheight~a |      7,028    475.3203    32.89078        346        612

          . tab kneeheightmidpatella // all seem reasonable. A typical range is 400-650mm which the values either fall within or are close enough to not want to take out.

          kneeheightm |
            idpatella |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                  346 |          1        0.01        0.01
                  350 |          1        0.01        0.03
                  356 |          1        0.01        0.04
                  360 |          1        0.01        0.06
                  366 |          1        0.01        0.07
                  374 |          2        0.03        0.10
                  377 |          1        0.01        0.11
                  381 |          1        0.01        0.13
                  382 |          2        0.03        0.16
                  383 |          4        0.06        0.21
                  385 |          2        0.03        0.24
                  386 |          1        0.01        0.26
                  387 |          1        0.01        0.27
                  388 |          3        0.04        0.31
                  389 |          1        0.01        0.33
                  390 |          4        0.06        0.38
                  391 |          1        0.01        0.40
                  392 |          4        0.06        0.46
                  393 |          6        0.09        0.54
                  394 |          3        0.04        0.58
                  395 |          4        0.06        0.64
                  396 |          3        0.04        0.68
                  397 |          4        0.06        0.74
                  398 |          2        0.03        0.77
                  399 |          4        0.06        0.83
                  400 |         10        0.14        0.97
                  401 |          3        0.04        1.01
                  402 |          6        0.09        1.10
                  403 |          4        0.06        1.15
                  404 |          7        0.10        1.25
                  405 |         10        0.14        1.39
                  406 |          8        0.11        1.51
                  407 |          9        0.13        1.64
                  408 |         12        0.17        1.81
                  409 |         17        0.24        2.05
                  410 |         20        0.28        2.33
                  411 |          6        0.09        2.42
                  412 |          9        0.13        2.55
                  413 |         10        0.14        2.69
                  414 |         18        0.26        2.95
                  415 |         25        0.36        3.30
                  416 |         14        0.20        3.50
                  417 |         19        0.27        3.77
                  418 |         20        0.28        4.06
                  419 |         19        0.27        4.33
                  420 |         24        0.34        4.67
                  421 |         17        0.24        4.91
                  422 |         17        0.24        5.15
                  423 |         16        0.23        5.38
                  424 |         24        0.34        5.72
                  425 |         29        0.41        6.13
                  426 |         24        0.34        6.47
                  427 |         25        0.36        6.83
                  428 |         37        0.53        7.36
                  429 |         31        0.44        7.80
                  430 |         41        0.58        8.38
                  431 |         39        0.55        8.94
                  432 |         32        0.46        9.39
                  433 |         44        0.63       10.02
                  434 |         60        0.85       10.87
                  435 |         56        0.80       11.67
                  436 |         51        0.73       12.39
                  437 |         46        0.65       13.05
                  438 |         42        0.60       13.65
                  439 |         46        0.65       14.30
                  440 |         50        0.71       15.01
                  441 |         51        0.73       15.74
                  442 |         67        0.95       16.69
                  443 |         50        0.71       17.40
                  444 |         60        0.85       18.26
                  445 |         66        0.94       19.19
                  446 |         47        0.67       19.86
                  447 |         69        0.98       20.85
                  448 |         60        0.85       21.70
                  449 |         63        0.90       22.60
                  450 |         71        1.01       23.61
                  451 |         63        0.90       24.50
                  452 |         61        0.87       25.37
                  453 |         70        1.00       26.37
                  454 |         53        0.75       27.12
                  455 |         72        1.02       28.14
                  456 |         68        0.97       29.11
                  457 |         58        0.83       29.94
                  458 |         69        0.98       30.92
                  459 |         78        1.11       32.03
                  460 |         80        1.14       33.17
                  461 |         68        0.97       34.13
                  462 |         63        0.90       35.03
                  463 |         65        0.92       35.96
                  464 |         60        0.85       36.81
                  465 |         83        1.18       37.99
                  466 |         88        1.25       39.24
                  467 |         64        0.91       40.15
                  468 |        108        1.54       41.69
                  469 |         69        0.98       42.67
                  470 |         89        1.27       43.94
                  471 |         98        1.39       45.33
                  472 |         74        1.05       46.39
                  473 |         80        1.14       47.52
                  474 |         76        1.08       48.61
                  475 |         83        1.18       49.79
                  476 |         82        1.17       50.95
                  477 |         82        1.17       52.12
                  478 |         86        1.22       53.34
                  479 |         78        1.11       54.45
                  480 |        105        1.49       55.95
                  481 |         76        1.08       57.03
                  482 |        117        1.66       58.69
                  483 |         69        0.98       59.68
                  484 |         80        1.14       60.81
                  485 |         81        1.15       61.97
                  486 |         87        1.24       63.20
                  487 |         96        1.37       64.57
                  488 |         64        0.91       65.48
                  489 |         53        0.75       66.24
                  490 |         69        0.98       67.22
                  491 |         80        1.14       68.36
                  492 |         85        1.21       69.56
                  493 |         91        1.29       70.86
                  494 |         61        0.87       71.73
                  495 |        102        1.45       73.18
                  496 |         93        1.32       74.50
                  497 |         69        0.98       75.48
                  498 |         54        0.77       76.25
                  499 |         51        0.73       76.98
                  500 |         60        0.85       77.83
                  501 |         72        1.02       78.86
                  502 |         65        0.92       79.78
                  503 |         60        0.85       80.63
                  504 |         51        0.73       81.36
                  505 |         43        0.61       81.97
                  506 |         57        0.81       82.78
                  507 |         44        0.63       83.41
                  508 |         62        0.88       84.29
                  509 |         62        0.88       85.17
                  510 |         34        0.48       85.66
                  511 |         54        0.77       86.43
                  512 |         45        0.64       87.07
                  513 |         48        0.68       87.75
                  514 |         45        0.64       88.39
                  515 |         43        0.61       89.00
                  516 |         46        0.65       89.66
                  517 |         34        0.48       90.14
                  518 |         26        0.37       90.51
                  519 |         34        0.48       90.99
                  520 |         38        0.54       91.53
                  521 |         33        0.47       92.00
                  522 |         32        0.46       92.46
                  523 |         30        0.43       92.89
                  524 |         26        0.37       93.26
                  525 |         27        0.38       93.64
                  526 |         30        0.43       94.07
                  527 |         25        0.36       94.42
                  528 |         23        0.33       94.75
                  529 |         34        0.48       95.23
                  530 |         10        0.14       95.38
                  531 |         18        0.26       95.63
                  532 |         16        0.23       95.86
                  533 |         20        0.28       96.14
                  534 |         17        0.24       96.39
                  535 |         17        0.24       96.63
                  536 |         14        0.20       96.83
                  537 |         11        0.16       96.98
                  538 |          6        0.09       97.07
                  539 |         13        0.18       97.25
                  540 |         17        0.24       97.50
                  541 |         17        0.24       97.74
                  542 |         13        0.18       97.92
                  543 |          5        0.07       97.99
                  544 |          7        0.10       98.09
                  545 |          9        0.13       98.22
                  546 |          5        0.07       98.29
                  547 |         10        0.14       98.43
                  548 |          8        0.11       98.55
                  549 |          5        0.07       98.62
                  550 |          7        0.10       98.72
                  551 |          9        0.13       98.85
                  552 |          6        0.09       98.93
                  553 |          6        0.09       99.02
                  554 |         10        0.14       99.16
                  555 |          6        0.09       99.25
                  556 |          6        0.09       99.33
                  557 |          1        0.01       99.35
                  559 |         11        0.16       99.50
                  560 |          3        0.04       99.54
                  561 |          2        0.03       99.57
                  562 |          1        0.01       99.59
                  563 |          4        0.06       99.64
                  564 |          2        0.03       99.67
                  565 |          2        0.03       99.70
                  566 |          5        0.07       99.77
                  567 |          2        0.03       99.80
                  568 |          3        0.04       99.84
                  570 |          1        0.01       99.86
                  572 |          1        0.01       99.87
                  574 |          1        0.01       99.89
                  576 |          1        0.01       99.90
                  577 |          1        0.01       99.91
                  587 |          1        0.01       99.93
                  588 |          1        0.01       99.94
                  590 |          1        0.01       99.96
                  594 |          1        0.01       99.97
                  596 |          1        0.01       99.99
                  612 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . summ trochanterionheight

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
          trochanter~t |      7,028    882.7624     54.0014        660       1095

          . tab trochanterionheight // all seem reasonable. A typical range is 650-1100mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

          trochanteri |
             onheight |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                  660 |          1        0.01        0.01
                  677 |          1        0.01        0.03
                  696 |          1        0.01        0.04
                  698 |          1        0.01        0.06
                  714 |          3        0.04        0.10
                  724 |          1        0.01        0.11
                  725 |          1        0.01        0.13
                  730 |          3        0.04        0.17
                  731 |          2        0.03        0.20
                  733 |          2        0.03        0.23
                  735 |          1        0.01        0.24
                  738 |          3        0.04        0.28
                  739 |          3        0.04        0.33
                  741 |          1        0.01        0.34
                  743 |          1        0.01        0.36
                  745 |          1        0.01        0.37
                  746 |          2        0.03        0.40
                  747 |          3        0.04        0.44
                  748 |          1        0.01        0.46
                  749 |          2        0.03        0.48
                  751 |          5        0.07        0.55
                  752 |          3        0.04        0.60
                  753 |          2        0.03        0.63
                  754 |          2        0.03        0.65
                  755 |          2        0.03        0.68
                  756 |          3        0.04        0.73
                  757 |          2        0.03        0.75
                  758 |          2        0.03        0.78
                  759 |          4        0.06        0.84
                  760 |          2        0.03        0.87
                  761 |          2        0.03        0.90
                  762 |          3        0.04        0.94
                  763 |          6        0.09        1.02
                  764 |          5        0.07        1.10
                  765 |          1        0.01        1.11
                  766 |          1        0.01        1.12
                  767 |          9        0.13        1.25
                  768 |          3        0.04        1.29
                  769 |          3        0.04        1.34
                  770 |         12        0.17        1.51
                  771 |         10        0.14        1.65
                  772 |          4        0.06        1.71
                  773 |          6        0.09        1.79
                  774 |          2        0.03        1.82
                  775 |          8        0.11        1.94
                  776 |          8        0.11        2.05
                  777 |          6        0.09        2.13
                  778 |          3        0.04        2.18
                  779 |          9        0.13        2.31
                  780 |          8        0.11        2.42
                  781 |         10        0.14        2.56
                  782 |          5        0.07        2.63
                  783 |          6        0.09        2.72
                  784 |          8        0.11        2.83
                  785 |         10        0.14        2.97
                  786 |          8        0.11        3.09
                  787 |          7        0.10        3.19
                  788 |          9        0.13        3.32
                  789 |         16        0.23        3.54
                  790 |         14        0.20        3.74
                  791 |         12        0.17        3.91
                  792 |         25        0.36        4.27
                  793 |         16        0.23        4.50
                  794 |         14        0.20        4.70
                  795 |         17        0.24        4.94
                  796 |          8        0.11        5.05
                  797 |         11        0.16        5.21
                  798 |         19        0.27        5.48
                  799 |         26        0.37        5.85
                  800 |         18        0.26        6.10
                  801 |         13        0.18        6.29
                  802 |         15        0.21        6.50
                  803 |         22        0.31        6.82
                  804 |         21        0.30        7.11
                  805 |         18        0.26        7.37
                  806 |         20        0.28        7.66
                  807 |         19        0.27        7.93
                  808 |         15        0.21        8.14
                  809 |         23        0.33        8.47
                  810 |         15        0.21        8.68
                  811 |         18        0.26        8.94
                  812 |         11        0.16        9.09
                  813 |         24        0.34        9.43
                  814 |         20        0.28        9.72
                  815 |         30        0.43       10.15
                  816 |         21        0.30       10.44
                  817 |         20        0.28       10.73
                  818 |         24        0.34       11.07
                  819 |         29        0.41       11.48
                  820 |         32        0.46       11.94
                  821 |         31        0.44       12.38
                  822 |         36        0.51       12.89
                  823 |         38        0.54       13.43
                  824 |         30        0.43       13.86
                  825 |         37        0.53       14.39
                  826 |         20        0.28       14.67
                  827 |         30        0.43       15.10
                  828 |         24        0.34       15.44
                  829 |         40        0.57       16.01
                  830 |         22        0.31       16.32
                  831 |         38        0.54       16.86
                  832 |         42        0.60       17.46
                  833 |         44        0.63       18.08
                  834 |         36        0.51       18.60
                  835 |         35        0.50       19.10
                  836 |         44        0.63       19.72
                  837 |         41        0.58       20.30
                  838 |         39        0.55       20.86
                  839 |         39        0.55       21.41
                  840 |         38        0.54       21.96
                  841 |         50        0.71       22.67
                  842 |         43        0.61       23.28
                  843 |         36        0.51       23.79
                  844 |         36        0.51       24.30
                  845 |         47        0.67       24.97
                  846 |         57        0.81       25.78
                  847 |         52        0.74       26.52
                  848 |         40        0.57       27.09
                  849 |         38        0.54       27.63
                  850 |         43        0.61       28.24
                  851 |         39        0.55       28.80
                  852 |         38        0.54       29.34
                  853 |         48        0.68       30.02
                  854 |         48        0.68       30.71
                  855 |         55        0.78       31.49
                  856 |         48        0.68       32.17
                  857 |         45        0.64       32.81
                  858 |         50        0.71       33.52
                  859 |         30        0.43       33.95
                  860 |         49        0.70       34.65
                  861 |         38        0.54       35.19
                  862 |         62        0.88       36.07
                  863 |         42        0.60       36.67
                  864 |         49        0.70       37.36
                  865 |         51        0.73       38.09
                  866 |         67        0.95       39.04
                  867 |         46        0.65       39.70
                  868 |         66        0.94       40.64
                  869 |         37        0.53       41.16
                  870 |         59        0.84       42.00
                  871 |         49        0.70       42.70
                  872 |         49        0.70       43.40
                  873 |         58        0.83       44.22
                  874 |         45        0.64       44.86
                  875 |         44        0.63       45.49
                  876 |         72        1.02       46.51
                  877 |         42        0.60       47.11
                  878 |         46        0.65       47.77
                  879 |         42        0.60       48.36
                  880 |         43        0.61       48.98
                  881 |         51        0.73       49.70
                  882 |         48        0.68       50.38
                  883 |         58        0.83       51.21
                  884 |         31        0.44       51.65
                  885 |         42        0.60       52.25
                  886 |         74        1.05       53.30
                  887 |         60        0.85       54.15
                  888 |         41        0.58       54.74
                  889 |         53        0.75       55.49
                  890 |         47        0.67       56.16
                  891 |         69        0.98       57.14
                  892 |         52        0.74       57.88
                  893 |         54        0.77       58.65
                  894 |         54        0.77       59.42
                  895 |         30        0.43       59.85
                  896 |         62        0.88       60.73
                  897 |         50        0.71       61.44
                  898 |         56        0.80       62.24
                  899 |         56        0.80       63.03
                  900 |         50        0.71       63.75
                  901 |         48        0.68       64.43
                  902 |         39        0.55       64.98
                  903 |         33        0.47       65.45
                  904 |         45        0.64       66.09
                  905 |         41        0.58       66.68
                  906 |         44        0.63       67.30
                  907 |         41        0.58       67.89
                  908 |         59        0.84       68.73
                  909 |         53        0.75       69.48
                  910 |         58        0.83       70.30
                  911 |         36        0.51       70.82
                  912 |         40        0.57       71.39
                  913 |         53        0.75       72.14
                  914 |         38        0.54       72.68
                  915 |         50        0.71       73.39
                  916 |         54        0.77       74.16
                  917 |         32        0.46       74.62
                  918 |         39        0.55       75.17
                  919 |         34        0.48       75.65
                  920 |         39        0.55       76.21
                  921 |         48        0.68       76.89
                  922 |         42        0.60       77.49
                  923 |         47        0.67       78.16
                  924 |         38        0.54       78.70
                  925 |         30        0.43       79.13
                  926 |         40        0.57       79.70
                  927 |         39        0.55       80.25
                  928 |         28        0.40       80.65
                  929 |         26        0.37       81.02
                  930 |         29        0.41       81.43
                  931 |         54        0.77       82.20
                  932 |         30        0.43       82.63
                  933 |         27        0.38       83.01
                  934 |         29        0.41       83.42
                  935 |         30        0.43       83.85
                  936 |         42        0.60       84.45
                  937 |         27        0.38       84.83
                  938 |         25        0.36       85.19
                  939 |         34        0.48       85.67
                  940 |         33        0.47       86.14
                  941 |         28        0.40       86.54
                  942 |         24        0.34       86.88
                  943 |         23        0.33       87.21
                  944 |         21        0.30       87.51
                  945 |         27        0.38       87.89
                  946 |         24        0.34       88.23
                  947 |         24        0.34       88.57
                  948 |         22        0.31       88.89
                  949 |         18        0.26       89.14
                  950 |         22        0.31       89.46
                  951 |         22        0.31       89.77
                  952 |         27        0.38       90.15
                  953 |         31        0.44       90.59
                  954 |         19        0.27       90.87
                  955 |         26        0.37       91.24
                  956 |         19        0.27       91.51
                  957 |         13        0.18       91.69
                  958 |         22        0.31       92.00
                  959 |         18        0.26       92.26
                  960 |         17        0.24       92.50
                  961 |         13        0.18       92.69
                  962 |         18        0.26       92.94
                  963 |         14        0.20       93.14
                  964 |         16        0.23       93.37
                  965 |         17        0.24       93.61
                  966 |         15        0.21       93.82
                  967 |          9        0.13       93.95
                  968 |         15        0.21       94.17
                  969 |          7        0.10       94.27
                  970 |         17        0.24       94.51
                  971 |         10        0.14       94.65
                  972 |         16        0.23       94.88
                  973 |          6        0.09       94.96
                  974 |          9        0.13       95.09
                  975 |         12        0.17       95.26
                  976 |          9        0.13       95.39
                  977 |          7        0.10       95.49
                  978 |          9        0.13       95.62
                  979 |         10        0.14       95.76
                  980 |         13        0.18       95.94
                  981 |          7        0.10       96.04
                  982 |          7        0.10       96.14
                  983 |         10        0.14       96.29
                  984 |         12        0.17       96.46
                  985 |         12        0.17       96.63
                  986 |          8        0.11       96.74
                  987 |          8        0.11       96.86
                  988 |          8        0.11       96.97
                  989 |          5        0.07       97.04
                  990 |          6        0.09       97.13
                  991 |          5        0.07       97.20
                  992 |          4        0.06       97.25
                  993 |          7        0.10       97.35
                  994 |          8        0.11       97.47
                  995 |          8        0.11       97.58
                  996 |          5        0.07       97.65
                  997 |          5        0.07       97.72
                  998 |          8        0.11       97.84
                  999 |          7        0.10       97.94
                 1000 |          6        0.09       98.02
                 1001 |          9        0.13       98.15
                 1002 |          3        0.04       98.19
                 1003 |          2        0.03       98.22
                 1004 |          4        0.06       98.28
                 1005 |          7        0.10       98.38
                 1006 |          5        0.07       98.45
                 1007 |          1        0.01       98.46
                 1008 |          5        0.07       98.53
                 1009 |          7        0.10       98.63
                 1010 |          2        0.03       98.66
                 1011 |          6        0.09       98.75
                 1012 |          5        0.07       98.82
                 1013 |          3        0.04       98.86
                 1014 |          4        0.06       98.92
                 1015 |          4        0.06       98.98
                 1016 |          3        0.04       99.02
                 1017 |          2        0.03       99.05
                 1018 |          8        0.11       99.16
                 1019 |          4        0.06       99.22
                 1020 |          5        0.07       99.29
                 1021 |          5        0.07       99.36
                 1022 |          4        0.06       99.42
                 1024 |          2        0.03       99.45
                 1025 |          2        0.03       99.47
                 1026 |          2        0.03       99.50
                 1028 |          1        0.01       99.52
                 1029 |          3        0.04       99.56
                 1030 |          3        0.04       99.60
                 1031 |          1        0.01       99.62
                 1032 |          1        0.01       99.63
                 1034 |          1        0.01       99.64
                 1035 |          2        0.03       99.67
                 1036 |          3        0.04       99.72
                 1038 |          1        0.01       99.73
                 1039 |          1        0.01       99.74
                 1045 |          1        0.01       99.76
                 1047 |          1        0.01       99.77
                 1049 |          1        0.01       99.79
                 1051 |          1        0.01       99.80
                 1052 |          1        0.01       99.82
                 1054 |          3        0.04       99.86
                 1055 |          1        0.01       99.87
                 1056 |          1        0.01       99.89
                 1057 |          1        0.01       99.90
                 1061 |          1        0.01       99.91
                 1063 |          1        0.01       99.93
                 1077 |          1        0.01       99.94
                 1081 |          1        0.01       99.96
                 1083 |          1        0.01       99.97
                 1090 |          1        0.01       99.99
                 1095 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . summ waistheightomphalion

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
          waistheigh~n |      7,028    1032.598    62.54826        805       1245

          . tab waistheightomphalion // all seem reasonable. A typical range is 800-1200mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

          waistheight |
            omphalion |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                  805 |          2        0.03        0.03
                  808 |          1        0.01        0.04
                  819 |          1        0.01        0.06
                  828 |          1        0.01        0.07
                  837 |          1        0.01        0.09
                  839 |          1        0.01        0.10
                  840 |          1        0.01        0.11
                  852 |          2        0.03        0.14
                  856 |          1        0.01        0.16
                  857 |          4        0.06        0.21
                  861 |          1        0.01        0.23
                  862 |          1        0.01        0.24
                  864 |          1        0.01        0.26
                  865 |          2        0.03        0.28
                  867 |          2        0.03        0.31
                  869 |          1        0.01        0.33
                  870 |          1        0.01        0.34
                  871 |          6        0.09        0.43
                  873 |          3        0.04        0.47
                  874 |          1        0.01        0.48
                  875 |          2        0.03        0.51
                  876 |          3        0.04        0.55
                  877 |          2        0.03        0.58
                  878 |          3        0.04        0.63
                  879 |          2        0.03        0.65
                  880 |          4        0.06        0.71
                  881 |          3        0.04        0.75
                  882 |          1        0.01        0.77
                  883 |          4        0.06        0.83
                  884 |          3        0.04        0.87
                  885 |          4        0.06        0.92
                  886 |          1        0.01        0.94
                  887 |          2        0.03        0.97
                  888 |          2        0.03        1.00
                  889 |          4        0.06        1.05
                  890 |          4        0.06        1.11
                  891 |          2        0.03        1.14
                  892 |          1        0.01        1.15
                  893 |          4        0.06        1.21
                  894 |          3        0.04        1.25
                  895 |          3        0.04        1.29
                  896 |          5        0.07        1.37
                  897 |          3        0.04        1.41
                  898 |          8        0.11        1.52
                  899 |          8        0.11        1.64
                  900 |          6        0.09        1.72
                  901 |          4        0.06        1.78
                  902 |          5        0.07        1.85
                  903 |          7        0.10        1.95
                  904 |          6        0.09        2.03
                  905 |          3        0.04        2.08
                  906 |          4        0.06        2.13
                  907 |          4        0.06        2.19
                  908 |          7        0.10        2.29
                  909 |          6        0.09        2.38
                  910 |         10        0.14        2.52
                  911 |          5        0.07        2.59
                  912 |          9        0.13        2.72
                  913 |         11        0.16        2.87
                  914 |          7        0.10        2.97
                  915 |          4        0.06        3.03
                  916 |          5        0.07        3.10
                  917 |          8        0.11        3.22
                  918 |         12        0.17        3.39
                  919 |         11        0.16        3.54
                  920 |         11        0.16        3.70
                  921 |          7        0.10        3.80
                  922 |          9        0.13        3.93
                  923 |          8        0.11        4.04
                  924 |         12        0.17        4.21
                  925 |          9        0.13        4.34
                  926 |         16        0.23        4.57
                  927 |          9        0.13        4.70
                  928 |         13        0.18        4.88
                  929 |         10        0.14        5.02
                  930 |         21        0.30        5.32
                  931 |         10        0.14        5.46
                  932 |         16        0.23        5.69
                  933 |         15        0.21        5.90
                  934 |          9        0.13        6.03
                  935 |         12        0.17        6.20
                  936 |         17        0.24        6.45
                  937 |         10        0.14        6.59
                  938 |         19        0.27        6.86
                  939 |         12        0.17        7.03
                  940 |         19        0.27        7.30
                  941 |         15        0.21        7.51
                  942 |         14        0.20        7.71
                  943 |         17        0.24        7.95
                  944 |         15        0.21        8.17
                  945 |         14        0.20        8.37
                  946 |         24        0.34        8.71
                  947 |         18        0.26        8.96
                  948 |         28        0.40        9.36
                  949 |         27        0.38        9.75
                  950 |         17        0.24        9.99
                  951 |         18        0.26       10.24
                  952 |         21        0.30       10.54
                  953 |         28        0.40       10.94
                  954 |         19        0.27       11.21
                  955 |         27        0.38       11.60
                  956 |         10        0.14       11.74
                  957 |         24        0.34       12.08
                  958 |         24        0.34       12.42
                  959 |         18        0.26       12.68
                  960 |         31        0.44       13.12
                  961 |         23        0.33       13.45
                  962 |         25        0.36       13.80
                  963 |         36        0.51       14.31
                  964 |         30        0.43       14.74
                  965 |         28        0.40       15.14
                  966 |         29        0.41       15.55
                  967 |         25        0.36       15.91
                  968 |         31        0.44       16.35
                  969 |         11        0.16       16.51
                  970 |         28        0.40       16.90
                  971 |         35        0.50       17.40
                  972 |         33        0.47       17.87
                  973 |         25        0.36       18.23
                  974 |         24        0.34       18.57
                  975 |         42        0.60       19.17
                  976 |         23        0.33       19.49
                  977 |         30        0.43       19.92
                  978 |         36        0.51       20.43
                  979 |         25        0.36       20.79
                  980 |         30        0.43       21.22
                  981 |         22        0.31       21.53
                  982 |         27        0.38       21.91
                  983 |         41        0.58       22.50
                  984 |         27        0.38       22.88
                  985 |         20        0.28       23.16
                  986 |         41        0.58       23.75
                  987 |         26        0.37       24.12
                  988 |         41        0.58       24.70
                  989 |         31        0.44       25.14
                  990 |         35        0.50       25.64
                  991 |         30        0.43       26.07
                  992 |         26        0.37       26.44
                  993 |         39        0.55       26.99
                  994 |         34        0.48       27.48
                  995 |         40        0.57       28.04
                  996 |         29        0.41       28.46
                  997 |         37        0.53       28.98
                  998 |         45        0.64       29.62
                  999 |         38        0.54       30.17
                 1000 |         38        0.54       30.71
                 1001 |         33        0.47       31.18
                 1002 |         29        0.41       31.59
                 1003 |         42        0.60       32.19
                 1004 |         35        0.50       32.68
                 1005 |         46        0.65       33.34
                 1006 |         28        0.40       33.74
                 1007 |         45        0.64       34.38
                 1008 |         38        0.54       34.92
                 1009 |         17        0.24       35.16
                 1010 |         31        0.44       35.60
                 1011 |         37        0.53       36.13
                 1012 |         49        0.70       36.82
                 1013 |         64        0.91       37.73
                 1014 |         42        0.60       38.33
                 1015 |         37        0.53       38.86
                 1016 |         39        0.55       39.41
                 1017 |         41        0.58       40.00
                 1018 |         44        0.63       40.62
                 1019 |         41        0.58       41.21
                 1020 |         48        0.68       41.89
                 1021 |         36        0.51       42.40
                 1022 |         46        0.65       43.06
                 1023 |         32        0.46       43.51
                 1024 |         35        0.50       44.01
                 1025 |         43        0.61       44.62
                 1026 |         39        0.55       45.18
                 1027 |         29        0.41       45.59
                 1028 |         39        0.55       46.14
                 1029 |         46        0.65       46.80
                 1030 |         48        0.68       47.48
                 1031 |         35        0.50       47.98
                 1032 |         45        0.64       48.62
                 1033 |         47        0.67       49.29
                 1034 |         35        0.50       49.79
                 1035 |         64        0.91       50.70
                 1036 |         42        0.60       51.29
                 1037 |         55        0.78       52.08
                 1038 |         44        0.63       52.70
                 1039 |         23        0.33       53.03
                 1040 |         57        0.81       53.84
                 1041 |         40        0.57       54.41
                 1042 |         41        0.58       54.99
                 1043 |         52        0.74       55.73
                 1044 |         46        0.65       56.39
                 1045 |         45        0.64       57.03
                 1046 |         45        0.64       57.67
                 1047 |         41        0.58       58.25
                 1048 |         54        0.77       59.02
                 1049 |         44        0.63       59.65
                 1050 |         47        0.67       60.32
                 1051 |         35        0.50       60.81
                 1052 |         51        0.73       61.54
                 1053 |         52        0.74       62.28
                 1054 |         54        0.77       63.05
                 1055 |         44        0.63       63.67
                 1056 |         31        0.44       64.11
                 1057 |         45        0.64       64.76
                 1058 |         49        0.70       65.45
                 1059 |         37        0.53       65.98
                 1060 |         39        0.55       66.53
                 1061 |         35        0.50       67.03
                 1062 |         32        0.46       67.49
                 1063 |         47        0.67       68.16
                 1064 |         46        0.65       68.81
                 1065 |         32        0.46       69.27
                 1066 |         37        0.53       69.79
                 1067 |         33        0.47       70.26
                 1068 |         35        0.50       70.76
                 1069 |         33        0.47       71.23
                 1070 |         42        0.60       71.83
                 1071 |         32        0.46       72.28
                 1072 |         38        0.54       72.82
                 1073 |         41        0.58       73.41
                 1074 |         34        0.48       73.89
                 1075 |         40        0.57       74.46
                 1076 |         28        0.40       74.86
                 1077 |         34        0.48       75.34
                 1078 |         54        0.77       76.11
                 1079 |         38        0.54       76.65
                 1080 |         36        0.51       77.16
                 1081 |         32        0.46       77.62
                 1082 |         36        0.51       78.13
                 1083 |         52        0.74       78.87
                 1084 |         35        0.50       79.37
                 1085 |         49        0.70       80.07
                 1086 |         32        0.46       80.52
                 1087 |         31        0.44       80.96
                 1088 |         35        0.50       81.46
                 1089 |         42        0.60       82.06
                 1090 |         27        0.38       82.44
                 1091 |         32        0.46       82.90
                 1092 |         22        0.31       83.21
                 1093 |         25        0.36       83.57
                 1094 |         32        0.46       84.02
                 1095 |         27        0.38       84.41
                 1096 |         32        0.46       84.86
                 1097 |         38        0.54       85.40
                 1098 |         30        0.43       85.83
                 1099 |         26        0.37       86.20
                 1100 |         27        0.38       86.58
                 1101 |         26        0.37       86.95
                 1102 |         19        0.27       87.22
                 1103 |         24        0.34       87.56
                 1104 |         19        0.27       87.83
                 1105 |         19        0.27       88.10
                 1106 |         14        0.20       88.30
                 1107 |         20        0.28       88.59
                 1108 |         25        0.36       88.94
                 1109 |         21        0.30       89.24
                 1110 |         22        0.31       89.56
                 1111 |         22        0.31       89.87
                 1112 |         18        0.26       90.13
                 1113 |         25        0.36       90.48
                 1114 |         30        0.43       90.91
                 1115 |         25        0.36       91.26
                 1116 |         26        0.37       91.63
                 1117 |          5        0.07       91.70
                 1118 |         33        0.47       92.17
                 1119 |         20        0.28       92.46
                 1120 |         12        0.17       92.63
                 1121 |         11        0.16       92.79
                 1122 |          8        0.11       92.90
                 1123 |         15        0.21       93.11
                 1124 |         11        0.16       93.27
                 1125 |         20        0.28       93.55
                 1126 |         16        0.23       93.78
                 1127 |         17        0.24       94.02
                 1128 |         16        0.23       94.25
                 1129 |         11        0.16       94.41
                 1130 |         16        0.23       94.64
                 1131 |          6        0.09       94.72
                 1132 |         14        0.20       94.92
                 1133 |         16        0.23       95.15
                 1134 |         11        0.16       95.30
                 1135 |         17        0.24       95.55
                 1136 |          5        0.07       95.62
                 1137 |         10        0.14       95.76
                 1138 |          5        0.07       95.83
                 1139 |          9        0.13       95.96
                 1140 |         10        0.14       96.10
                 1141 |         12        0.17       96.27
                 1142 |          7        0.10       96.37
                 1143 |          7        0.10       96.47
                 1144 |          5        0.07       96.54
                 1145 |         11        0.16       96.70
                 1146 |          6        0.09       96.78
                 1147 |         17        0.24       97.03
                 1148 |         14        0.20       97.23
                 1149 |          3        0.04       97.27
                 1150 |          8        0.11       97.38
                 1151 |         10        0.14       97.52
                 1152 |          8        0.11       97.64
                 1153 |          7        0.10       97.74
                 1154 |          9        0.13       97.87
                 1155 |          5        0.07       97.94
                 1156 |          4        0.06       97.99
                 1157 |          1        0.01       98.01
                 1158 |          8        0.11       98.12
                 1159 |          3        0.04       98.16
                 1162 |          2        0.03       98.19
                 1163 |          5        0.07       98.26
                 1164 |          2        0.03       98.29
                 1165 |          5        0.07       98.36
                 1166 |          2        0.03       98.39
                 1167 |          4        0.06       98.45
                 1168 |          2        0.03       98.48
                 1169 |          5        0.07       98.55
                 1170 |          1        0.01       98.56
                 1171 |          4        0.06       98.62
                 1173 |          7        0.10       98.72
                 1174 |          3        0.04       98.76
                 1175 |         11        0.16       98.92
                 1178 |          2        0.03       98.95
                 1179 |          5        0.07       99.02
                 1180 |          4        0.06       99.08
                 1181 |          3        0.04       99.12
                 1182 |          5        0.07       99.19
                 1183 |          1        0.01       99.20
                 1184 |          1        0.01       99.22
                 1186 |          4        0.06       99.27
                 1188 |          1        0.01       99.29
                 1190 |          2        0.03       99.32
                 1191 |          3        0.04       99.36
                 1192 |          4        0.06       99.42
                 1193 |          3        0.04       99.46
                 1194 |          3        0.04       99.50
                 1195 |          1        0.01       99.52
                 1196 |          2        0.03       99.54
                 1197 |          3        0.04       99.59
                 1198 |          2        0.03       99.62
                 1199 |          5        0.07       99.69
                 1200 |          3        0.04       99.73
                 1201 |          3        0.04       99.77
                 1202 |          1        0.01       99.79
                 1203 |          2        0.03       99.82
                 1205 |          2        0.03       99.84
                 1210 |          1        0.01       99.86
                 1211 |          1        0.01       99.87
                 1214 |          2        0.03       99.90
                 1222 |          1        0.01       99.91
                 1223 |          1        0.01       99.93
                 1225 |          3        0.04       99.97
                 1242 |          1        0.01       99.99
                 1245 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . summ functionalleglength

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
          functional~h |      7,028    1104.306    68.08699        835       1316

          . tab functionalleglength // all seem reasonable. A typical range is 700-1150mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

          functionall |
             eglength |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                  835 |          1        0.01        0.01
                  846 |          1        0.01        0.03
                  868 |          1        0.01        0.04
                  884 |          1        0.01        0.06
                  894 |          1        0.01        0.07
                  896 |          1        0.01        0.09
                  901 |          1        0.01        0.10
                  902 |          1        0.01        0.11
                  903 |          2        0.03        0.14
                  907 |          1        0.01        0.16
                  909 |          1        0.01        0.17
                  910 |          1        0.01        0.18
                  912 |          3        0.04        0.23
                  914 |          1        0.01        0.24
                  915 |          1        0.01        0.26
                  917 |          1        0.01        0.27
                  918 |          1        0.01        0.28
                  922 |          2        0.03        0.31
                  923 |          1        0.01        0.33
                  924 |          1        0.01        0.34
                  927 |          3        0.04        0.38
                  928 |          1        0.01        0.40
                  929 |          4        0.06        0.46
                  930 |          3        0.04        0.50
                  931 |          2        0.03        0.53
                  933 |          2        0.03        0.55
                  934 |          2        0.03        0.58
                  935 |          1        0.01        0.60
                  936 |          1        0.01        0.61
                  937 |          1        0.01        0.63
                  939 |          1        0.01        0.64
                  940 |          1        0.01        0.65
                  941 |          4        0.06        0.71
                  943 |          4        0.06        0.77
                  944 |          2        0.03        0.80
                  945 |          2        0.03        0.83
                  946 |          1        0.01        0.84
                  947 |          2        0.03        0.87
                  948 |          4        0.06        0.92
                  949 |          4        0.06        0.98
                  950 |          3        0.04        1.02
                  951 |          3        0.04        1.07
                  952 |          4        0.06        1.12
                  953 |          6        0.09        1.21
                  954 |          2        0.03        1.24
                  955 |          5        0.07        1.31
                  956 |          4        0.06        1.37
                  957 |          3        0.04        1.41
                  958 |          6        0.09        1.49
                  959 |          3        0.04        1.54
                  960 |          4        0.06        1.59
                  961 |          4        0.06        1.65
                  962 |          7        0.10        1.75
                  963 |          8        0.11        1.86
                  964 |          5        0.07        1.94
                  965 |          7        0.10        2.03
                  966 |          5        0.07        2.11
                  967 |          5        0.07        2.18
                  968 |          7        0.10        2.28
                  969 |          9        0.13        2.40
                  970 |          6        0.09        2.49
                  971 |          3        0.04        2.53
                  972 |          8        0.11        2.65
                  973 |         11        0.16        2.80
                  974 |          8        0.11        2.92
                  975 |         10        0.14        3.06
                  976 |         11        0.16        3.22
                  977 |         14        0.20        3.41
                  978 |         11        0.16        3.57
                  979 |          1        0.01        3.59
                  980 |         13        0.18        3.77
                  981 |          4        0.06        3.83
                  982 |         10        0.14        3.97
                  983 |          9        0.13        4.10
                  984 |         15        0.21        4.31
                  985 |          9        0.13        4.44
                  986 |         13        0.18        4.62
                  987 |          6        0.09        4.71
                  988 |          8        0.11        4.82
                  989 |         11        0.16        4.98
                  990 |         19        0.27        5.25
                  991 |         11        0.16        5.41
                  992 |         14        0.20        5.61
                  993 |         10        0.14        5.75
                  994 |         15        0.21        5.96
                  995 |         13        0.18        6.15
                  996 |          6        0.09        6.23
                  997 |         17        0.24        6.47
                  998 |         14        0.20        6.67
                  999 |         11        0.16        6.83
                 1000 |         13        0.18        7.01
                 1001 |          5        0.07        7.09
                 1002 |         20        0.28        7.37
                 1003 |         13        0.18        7.56
                 1004 |         16        0.23        7.78
                 1005 |         14        0.20        7.98
                 1006 |         10        0.14        8.12
                 1007 |         16        0.23        8.35
                 1008 |         10        0.14        8.49
                 1009 |         22        0.31        8.81
                 1010 |         21        0.30        9.11
                 1011 |          7        0.10        9.21
                 1012 |         18        0.26        9.46
                 1013 |         16        0.23        9.69
                 1014 |         19        0.27        9.96
                 1015 |         22        0.31       10.27
                 1016 |         11        0.16       10.43
                 1017 |         16        0.23       10.66
                 1018 |         12        0.17       10.83
                 1019 |         18        0.26       11.08
                 1020 |         25        0.36       11.44
                 1021 |         16        0.23       11.67
                 1022 |         24        0.34       12.01
                 1023 |         29        0.41       12.42
                 1024 |         27        0.38       12.81
                 1025 |         22        0.31       13.12
                 1026 |         28        0.40       13.52
                 1027 |         40        0.57       14.09
                 1028 |         27        0.38       14.47
                 1029 |         17        0.24       14.71
                 1030 |         13        0.18       14.90
                 1031 |          9        0.13       15.03
                 1032 |         24        0.34       15.37
                 1033 |         26        0.37       15.74
                 1034 |         26        0.37       16.11
                 1035 |         25        0.36       16.46
                 1036 |         21        0.30       16.76
                 1037 |         33        0.47       17.23
                 1038 |         27        0.38       17.62
                 1039 |         23        0.33       17.94
                 1040 |         22        0.31       18.26
                 1041 |         20        0.28       18.54
                 1042 |         23        0.33       18.87
                 1043 |         27        0.38       19.25
                 1044 |         19        0.27       19.52
                 1045 |         30        0.43       19.95
                 1046 |         20        0.28       20.23
                 1047 |         23        0.33       20.56
                 1048 |         30        0.43       20.99
                 1049 |         28        0.40       21.39
                 1050 |         29        0.41       21.80
                 1051 |         20        0.28       22.08
                 1052 |         38        0.54       22.62
                 1053 |         34        0.48       23.11
                 1054 |         37        0.53       23.63
                 1055 |         32        0.46       24.09
                 1056 |         37        0.53       24.62
                 1057 |         41        0.58       25.20
                 1058 |         25        0.36       25.55
                 1059 |         19        0.27       25.83
                 1060 |         23        0.33       26.15
                 1061 |         26        0.37       26.52
                 1062 |         32        0.46       26.98
                 1063 |         45        0.64       27.62
                 1064 |         26        0.37       27.99
                 1065 |         32        0.46       28.44
                 1066 |         38        0.54       28.98
                 1067 |         43        0.61       29.60
                 1068 |         21        0.30       29.89
                 1069 |         36        0.51       30.41
                 1070 |         41        0.58       30.99
                 1071 |         31        0.44       31.43
                 1072 |         44        0.63       32.06
                 1073 |         32        0.46       32.51
                 1074 |         46        0.65       33.17
                 1075 |         50        0.71       33.88
                 1076 |         38        0.54       34.42
                 1077 |         36        0.51       34.93
                 1078 |         31        0.44       35.37
                 1079 |         33        0.47       35.84
                 1080 |         30        0.43       36.27
                 1081 |         26        0.37       36.64
                 1082 |         48        0.68       37.32
                 1083 |         36        0.51       37.83
                 1084 |         25        0.36       38.19
                 1085 |         48        0.68       38.87
                 1086 |         33        0.47       39.34
                 1087 |         34        0.48       39.83
                 1088 |         32        0.46       40.28
                 1089 |         35        0.50       40.78
                 1090 |         52        0.74       41.52
                 1091 |         39        0.55       42.07
                 1092 |         36        0.51       42.59
                 1093 |         35        0.50       43.08
                 1094 |         41        0.58       43.67
                 1095 |         32        0.46       44.12
                 1096 |         40        0.57       44.69
                 1097 |         44        0.63       45.32
                 1098 |         49        0.70       46.02
                 1099 |         33        0.47       46.49
                 1100 |         26        0.37       46.86
                 1101 |         53        0.75       47.61
                 1102 |         34        0.48       48.09
                 1103 |         32        0.46       48.55
                 1104 |         21        0.30       48.85
                 1105 |         35        0.50       49.35
                 1106 |         36        0.51       49.86
                 1107 |         33        0.47       50.33
                 1108 |         39        0.55       50.88
                 1109 |         27        0.38       51.27
                 1110 |         47        0.67       51.94
                 1111 |         41        0.58       52.52
                 1112 |         42        0.60       53.12
                 1113 |         35        0.50       53.61
                 1114 |         40        0.57       54.18
                 1115 |         35        0.50       54.68
                 1116 |         34        0.48       55.17
                 1117 |         37        0.53       55.69
                 1118 |         39        0.55       56.25
                 1119 |         36        0.51       56.76
                 1120 |         33        0.47       57.23
                 1121 |         39        0.55       57.78
                 1122 |         56        0.80       58.58
                 1123 |         42        0.60       59.18
                 1124 |         38        0.54       59.72
                 1125 |         39        0.55       60.27
                 1126 |         40        0.57       60.84
                 1127 |         57        0.81       61.65
                 1128 |         30        0.43       62.08
                 1129 |         29        0.41       62.49
                 1130 |         42        0.60       63.09
                 1131 |         36        0.51       63.60
                 1132 |         49        0.70       64.30
                 1133 |         34        0.48       64.78
                 1134 |         40        0.57       65.35
                 1135 |         57        0.81       66.16
                 1136 |         45        0.64       66.80
                 1137 |         46        0.65       67.46
                 1138 |         32        0.46       67.91
                 1139 |         49        0.70       68.61
                 1140 |         41        0.58       69.19
                 1141 |         40        0.57       69.76
                 1142 |         40        0.57       70.33
                 1143 |         53        0.75       71.09
                 1144 |         37        0.53       71.61
                 1145 |         56        0.80       72.41
                 1146 |         46        0.65       73.06
                 1147 |         41        0.58       73.65
                 1148 |         40        0.57       74.22
                 1149 |         29        0.41       74.63
                 1150 |         39        0.55       75.18
                 1151 |         33        0.47       75.65
                 1152 |         24        0.34       76.00
                 1153 |         33        0.47       76.47
                 1154 |         36        0.51       76.98
                 1155 |         39        0.55       77.53
                 1156 |         29        0.41       77.95
                 1157 |         36        0.51       78.46
                 1158 |         30        0.43       78.88
                 1159 |         27        0.38       79.27
                 1160 |         38        0.54       79.81
                 1161 |         28        0.40       80.21
                 1162 |         32        0.46       80.66
                 1163 |         24        0.34       81.00
                 1164 |         31        0.44       81.45
                 1165 |         24        0.34       81.79
                 1166 |         25        0.36       82.14
                 1167 |         26        0.37       82.51
                 1168 |         37        0.53       83.04
                 1169 |         16        0.23       83.27
                 1170 |         28        0.40       83.67
                 1171 |         21        0.30       83.96
                 1172 |         29        0.41       84.38
                 1173 |         26        0.37       84.75
                 1174 |         23        0.33       85.07
                 1175 |         28        0.40       85.47
                 1176 |         15        0.21       85.69
                 1177 |         31        0.44       86.13
                 1178 |         30        0.43       86.55
                 1179 |         16        0.23       86.78
                 1180 |         16        0.23       87.01
                 1181 |         20        0.28       87.29
                 1182 |         21        0.30       87.59
                 1183 |         17        0.24       87.83
                 1184 |         25        0.36       88.19
                 1185 |         29        0.41       88.60
                 1186 |         19        0.27       88.87
                 1187 |         20        0.28       89.16
                 1188 |         26        0.37       89.53
                 1189 |         21        0.30       89.83
                 1190 |         19        0.27       90.10
                 1191 |         18        0.26       90.35
                 1192 |         18        0.26       90.61
                 1193 |         14        0.20       90.81
                 1194 |          8        0.11       90.92
                 1195 |         15        0.21       91.14
                 1196 |         13        0.18       91.32
                 1197 |         29        0.41       91.73
                 1198 |         18        0.26       91.99
                 1199 |         19        0.27       92.26
                 1200 |         15        0.21       92.47
                 1201 |          6        0.09       92.56
                 1202 |         15        0.21       92.77
                 1203 |         13        0.18       92.96
                 1204 |         24        0.34       93.30
                 1205 |         14        0.20       93.50
                 1206 |         10        0.14       93.64
                 1207 |         11        0.16       93.80
                 1208 |         11        0.16       93.95
                 1209 |         15        0.21       94.17
                 1210 |          8        0.11       94.28
                 1211 |         12        0.17       94.45
                 1212 |         10        0.14       94.59
                 1213 |         20        0.28       94.88
                 1214 |         13        0.18       95.06
                 1215 |         10        0.14       95.20
                 1216 |         12        0.17       95.38
                 1217 |         11        0.16       95.53
                 1218 |         12        0.17       95.70
                 1219 |         13        0.18       95.89
                 1220 |          8        0.11       96.00
                 1221 |          7        0.10       96.10
                 1222 |         12        0.17       96.27
                 1223 |          9        0.13       96.40
                 1224 |          6        0.09       96.49
                 1225 |         11        0.16       96.64
                 1226 |         11        0.16       96.80
                 1227 |         11        0.16       96.96
                 1228 |         15        0.21       97.17
                 1229 |         10        0.14       97.31
                 1230 |          4        0.06       97.37
                 1231 |          6        0.09       97.45
                 1232 |          4        0.06       97.51
                 1233 |         11        0.16       97.67
                 1234 |          3        0.04       97.71
                 1235 |          5        0.07       97.78
                 1236 |          4        0.06       97.84
                 1237 |          3        0.04       97.88
                 1238 |          3        0.04       97.92
                 1239 |          4        0.06       97.98
                 1240 |          3        0.04       98.02
                 1241 |          6        0.09       98.11
                 1242 |          8        0.11       98.22
                 1243 |          4        0.06       98.28
                 1244 |          3        0.04       98.32
                 1245 |          3        0.04       98.36
                 1246 |          4        0.06       98.42
                 1247 |          4        0.06       98.48
                 1248 |          4        0.06       98.53
                 1249 |          2        0.03       98.56
                 1250 |          4        0.06       98.62
                 1251 |          3        0.04       98.66
                 1252 |          3        0.04       98.71
                 1253 |          5        0.07       98.78
                 1254 |          3        0.04       98.82
                 1255 |          3        0.04       98.86
                 1256 |          1        0.01       98.88
                 1258 |          7        0.10       98.98
                 1259 |          3        0.04       99.02
                 1260 |          1        0.01       99.03
                 1261 |          2        0.03       99.06
                 1262 |          1        0.01       99.08
                 1263 |          4        0.06       99.13
                 1265 |          1        0.01       99.15
                 1266 |          3        0.04       99.19
                 1267 |          9        0.13       99.32
                 1268 |          3        0.04       99.36
                 1270 |          2        0.03       99.39
                 1271 |          1        0.01       99.40
                 1272 |          1        0.01       99.42
                 1273 |          1        0.01       99.43
                 1274 |          1        0.01       99.45
                 1275 |          1        0.01       99.46
                 1276 |          2        0.03       99.49
                 1277 |          1        0.01       99.50
                 1278 |          1        0.01       99.52
                 1279 |          4        0.06       99.57
                 1281 |          1        0.01       99.59
                 1282 |          3        0.04       99.63
                 1286 |          3        0.04       99.67
                 1287 |          4        0.06       99.73
                 1288 |          3        0.04       99.77
                 1290 |          3        0.04       99.82
                 1298 |          1        0.01       99.83
                 1299 |          1        0.01       99.84
                 1301 |          1        0.01       99.86
                 1303 |          1        0.01       99.87
                 1304 |          1        0.01       99.89
                 1305 |          3        0.04       99.93
                 1306 |          1        0.01       99.94
                 1308 |          1        0.01       99.96
                 1312 |          1        0.01       99.97
                 1316 |          2        0.03      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . summ cervicaleheight

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
          cervicaleh~t |      7,028    1479.787    84.06564       1184       1738

          . tab cervicaleheight // all seem reasonable. A typical range is 1100-1750mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

          cervicalehe |
                 ight |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                 1184 |          1        0.01        0.01
                 1208 |          1        0.01        0.03
                 1209 |          1        0.01        0.04
                 1218 |          1        0.01        0.06
                 1226 |          1        0.01        0.07
                 1233 |          1        0.01        0.09
                 1234 |          1        0.01        0.10
                 1236 |          1        0.01        0.11
                 1237 |          1        0.01        0.13
                 1242 |          1        0.01        0.14
                 1247 |          1        0.01        0.16
                 1248 |          1        0.01        0.17
                 1250 |          1        0.01        0.18
                 1252 |          1        0.01        0.20
                 1254 |          1        0.01        0.21
                 1257 |          1        0.01        0.23
                 1260 |          3        0.04        0.27
                 1261 |          1        0.01        0.28
                 1262 |          1        0.01        0.30
                 1263 |          2        0.03        0.33
                 1264 |          2        0.03        0.36
                 1267 |          1        0.01        0.37
                 1268 |          1        0.01        0.38
                 1269 |          2        0.03        0.41
                 1270 |          3        0.04        0.46
                 1271 |          1        0.01        0.47
                 1272 |          6        0.09        0.55
                 1273 |          1        0.01        0.57
                 1274 |          3        0.04        0.61
                 1275 |          1        0.01        0.63
                 1276 |          1        0.01        0.64
                 1277 |          1        0.01        0.65
                 1278 |          1        0.01        0.67
                 1279 |          1        0.01        0.68
                 1280 |          4        0.06        0.74
                 1281 |          2        0.03        0.77
                 1282 |          2        0.03        0.80
                 1283 |          2        0.03        0.83
                 1284 |          1        0.01        0.84
                 1285 |          2        0.03        0.87
                 1286 |          2        0.03        0.90
                 1287 |          4        0.06        0.95
                 1288 |          1        0.01        0.97
                 1289 |          2        0.03        1.00
                 1290 |          4        0.06        1.05
                 1291 |          1        0.01        1.07
                 1292 |          8        0.11        1.18
                 1293 |          3        0.04        1.22
                 1294 |          5        0.07        1.29
                 1295 |          4        0.06        1.35
                 1296 |          4        0.06        1.41
                 1297 |          3        0.04        1.45
                 1298 |          3        0.04        1.49
                 1299 |          6        0.09        1.58
                 1300 |          3        0.04        1.62
                 1301 |          4        0.06        1.68
                 1302 |          3        0.04        1.72
                 1303 |          4        0.06        1.78
                 1304 |          7        0.10        1.88
                 1305 |         12        0.17        2.05
                 1306 |          2        0.03        2.08
                 1307 |          6        0.09        2.16
                 1308 |         10        0.14        2.31
                 1309 |          5        0.07        2.38
                 1310 |          9        0.13        2.50
                 1312 |          6        0.09        2.59
                 1313 |          6        0.09        2.68
                 1314 |          1        0.01        2.69
                 1315 |          2        0.03        2.72
                 1316 |          6        0.09        2.80
                 1317 |          8        0.11        2.92
                 1318 |         15        0.21        3.13
                 1319 |          4        0.06        3.19
                 1320 |          4        0.06        3.24
                 1321 |          6        0.09        3.33
                 1322 |          7        0.10        3.43
                 1323 |          5        0.07        3.50
                 1324 |         13        0.18        3.69
                 1325 |          5        0.07        3.76
                 1326 |          9        0.13        3.88
                 1327 |          5        0.07        3.96
                 1328 |          7        0.10        4.06
                 1329 |          4        0.06        4.11
                 1330 |          6        0.09        4.20
                 1331 |          7        0.10        4.30
                 1332 |         11        0.16        4.45
                 1333 |         10        0.14        4.60
                 1334 |         14        0.20        4.80
                 1335 |          6        0.09        4.88
                 1336 |          9        0.13        5.01
                 1337 |         12        0.17        5.18
                 1338 |          7        0.10        5.28
                 1339 |         12        0.17        5.45
                 1340 |          5        0.07        5.52
                 1341 |          9        0.13        5.65
                 1342 |         16        0.23        5.88
                 1343 |          9        0.13        6.00
                 1344 |         15        0.21        6.22
                 1345 |         12        0.17        6.39
                 1346 |          5        0.07        6.46
                 1347 |         11        0.16        6.62
                 1348 |         18        0.26        6.87
                 1349 |          9        0.13        7.00
                 1350 |          9        0.13        7.13
                 1351 |         15        0.21        7.34
                 1352 |         18        0.26        7.60
                 1353 |         14        0.20        7.80
                 1354 |         14        0.20        8.00
                 1355 |         18        0.26        8.25
                 1356 |          5        0.07        8.32
                 1357 |         12        0.17        8.49
                 1358 |          9        0.13        8.62
                 1359 |          8        0.11        8.74
                 1360 |         13        0.18        8.92
                 1361 |         13        0.18        9.11
                 1362 |         20        0.28        9.39
                 1363 |         16        0.23        9.62
                 1364 |         19        0.27        9.89
                 1365 |         22        0.31       10.20
                 1366 |         11        0.16       10.36
                 1367 |         17        0.24       10.60
                 1368 |         20        0.28       10.89
                 1369 |         19        0.27       11.16
                 1370 |         13        0.18       11.34
                 1371 |         13        0.18       11.53
                 1372 |         16        0.23       11.75
                 1373 |         13        0.18       11.94
                 1374 |         17        0.24       12.18
                 1375 |         18        0.26       12.44
                 1376 |         20        0.28       12.72
                 1377 |         19        0.27       12.99
                 1378 |         19        0.27       13.26
                 1379 |         21        0.30       13.56
                 1380 |         19        0.27       13.83
                 1381 |         15        0.21       14.04
                 1382 |         19        0.27       14.31
                 1383 |         14        0.20       14.51
                 1384 |         15        0.21       14.73
                 1385 |         14        0.20       14.93
                 1386 |         14        0.20       15.13
                 1387 |         20        0.28       15.41
                 1388 |         20        0.28       15.69
                 1389 |         21        0.30       15.99
                 1390 |         25        0.36       16.35
                 1391 |         14        0.20       16.55
                 1392 |         24        0.34       16.89
                 1393 |         28        0.40       17.29
                 1394 |         20        0.28       17.57
                 1395 |         13        0.18       17.76
                 1396 |         21        0.30       18.06
                 1397 |         15        0.21       18.27
                 1398 |         18        0.26       18.53
                 1399 |         25        0.36       18.88
                 1400 |         22        0.31       19.19
                 1401 |         15        0.21       19.41
                 1402 |         18        0.26       19.66
                 1403 |         16        0.23       19.89
                 1404 |         28        0.40       20.29
                 1405 |         25        0.36       20.65
                 1406 |         12        0.17       20.82
                 1407 |         18        0.26       21.07
                 1408 |         12        0.17       21.24
                 1409 |         12        0.17       21.41
                 1410 |         27        0.38       21.80
                 1411 |         18        0.26       22.05
                 1412 |         23        0.33       22.38
                 1413 |         23        0.33       22.71
                 1414 |         14        0.20       22.91
                 1415 |         26        0.37       23.28
                 1416 |         17        0.24       23.52
                 1417 |         27        0.38       23.90
                 1418 |         19        0.27       24.17
                 1419 |         20        0.28       24.46
                 1420 |         15        0.21       24.67
                 1421 |         19        0.27       24.94
                 1422 |         31        0.44       25.38
                 1423 |         20        0.28       25.67
                 1424 |         22        0.31       25.98
                 1425 |         21        0.30       26.28
                 1426 |         33        0.47       26.75
                 1427 |         23        0.33       27.08
                 1428 |         31        0.44       27.52
                 1429 |         17        0.24       27.76
                 1430 |         28        0.40       28.16
                 1431 |         23        0.33       28.49
                 1432 |         35        0.50       28.98
                 1433 |         21        0.30       29.28
                 1434 |         29        0.41       29.70
                 1435 |         27        0.38       30.08
                 1436 |         20        0.28       30.36
                 1437 |         30        0.43       30.79
                 1438 |         33        0.47       31.26
                 1439 |         21        0.30       31.56
                 1440 |         45        0.64       32.20
                 1441 |         23        0.33       32.53
                 1442 |         30        0.43       32.95
                 1443 |         37        0.53       33.48
                 1444 |         25        0.36       33.84
                 1445 |         36        0.51       34.35
                 1446 |         27        0.38       34.73
                 1447 |         20        0.28       35.02
                 1448 |         24        0.34       35.36
                 1449 |         17        0.24       35.60
                 1450 |         24        0.34       35.94
                 1451 |         20        0.28       36.23
                 1452 |         22        0.31       36.54
                 1453 |         21        0.30       36.84
                 1454 |         31        0.44       37.28
                 1455 |         25        0.36       37.64
                 1456 |         24        0.34       37.98
                 1457 |         27        0.38       38.36
                 1458 |         17        0.24       38.60
                 1459 |         21        0.30       38.90
                 1460 |         30        0.43       39.33
                 1461 |         17        0.24       39.57
                 1462 |         24        0.34       39.91
                 1463 |         34        0.48       40.40
                 1464 |         30        0.43       40.82
                 1465 |         21        0.30       41.12
                 1466 |         19        0.27       41.39
                 1467 |         26        0.37       41.76
                 1468 |         35        0.50       42.26
                 1469 |         28        0.40       42.66
                 1470 |         25        0.36       43.01
                 1471 |         26        0.37       43.38
                 1472 |         22        0.31       43.70
                 1473 |         32        0.46       44.15
                 1474 |         28        0.40       44.55
                 1475 |         28        0.40       44.95
                 1476 |         23        0.33       45.28
                 1477 |         33        0.47       45.75
                 1478 |         44        0.63       46.37
                 1479 |         23        0.33       46.70
                 1480 |         33        0.47       47.17
                 1481 |         15        0.21       47.38
                 1482 |         39        0.55       47.94
                 1483 |         32        0.46       48.39
                 1484 |         30        0.43       48.82
                 1485 |         28        0.40       49.22
                 1486 |         27        0.38       49.60
                 1487 |         37        0.53       50.13
                 1488 |         34        0.48       50.61
                 1489 |         28        0.40       51.01
                 1490 |         45        0.64       51.65
                 1491 |         19        0.27       51.92
                 1492 |         46        0.65       52.58
                 1493 |         38        0.54       53.12
                 1494 |         45        0.64       53.76
                 1495 |         22        0.31       54.07
                 1496 |         26        0.37       54.44
                 1497 |         38        0.54       54.98
                 1498 |         54        0.77       55.75
                 1499 |         36        0.51       56.26
                 1500 |         40        0.57       56.83
                 1501 |         30        0.43       57.26
                 1502 |         45        0.64       57.90
                 1503 |         30        0.43       58.32
                 1504 |         34        0.48       58.81
                 1505 |         50        0.71       59.52
                 1506 |         30        0.43       59.95
                 1507 |         26        0.37       60.32
                 1508 |         37        0.53       60.84
                 1509 |         28        0.40       61.24
                 1510 |         28        0.40       61.64
                 1511 |         20        0.28       61.92
                 1512 |         46        0.65       62.58
                 1513 |         27        0.38       62.96
                 1514 |         20        0.28       63.25
                 1515 |         40        0.57       63.82
                 1516 |         36        0.51       64.33
                 1517 |         35        0.50       64.83
                 1518 |         41        0.58       65.41
                 1519 |         34        0.48       65.89
                 1520 |         27        0.38       66.28
                 1521 |         37        0.53       66.80
                 1522 |         36        0.51       67.32
                 1523 |         41        0.58       67.90
                 1524 |         30        0.43       68.33
                 1525 |         34        0.48       68.81
                 1526 |         33        0.47       69.28
                 1527 |         37        0.53       69.81
                 1528 |         24        0.34       70.15
                 1529 |         22        0.31       70.46
                 1530 |         35        0.50       70.96
                 1531 |         26        0.37       71.33
                 1532 |         29        0.41       71.74
                 1533 |         48        0.68       72.42
                 1534 |         36        0.51       72.94
                 1535 |         38        0.54       73.48
                 1536 |         32        0.46       73.93
                 1537 |         32        0.46       74.39
                 1538 |         32        0.46       74.84
                 1539 |         26        0.37       75.21
                 1540 |         25        0.36       75.57
                 1541 |         21        0.30       75.87
                 1542 |         22        0.31       76.18
                 1543 |         39        0.55       76.74
                 1544 |         37        0.53       77.26
                 1545 |         21        0.30       77.56
                 1546 |         22        0.31       77.87
                 1547 |         22        0.31       78.19
                 1548 |         32        0.46       78.64
                 1549 |         26        0.37       79.01
                 1550 |         25        0.36       79.37
                 1551 |         26        0.37       79.74
                 1552 |         35        0.50       80.24
                 1553 |         24        0.34       80.58
                 1554 |         23        0.33       80.90
                 1555 |         27        0.38       81.29
                 1556 |         31        0.44       81.73
                 1557 |         31        0.44       82.17
                 1558 |         35        0.50       82.67
                 1559 |         22        0.31       82.98
                 1560 |         23        0.33       83.31
                 1561 |         16        0.23       83.54
                 1562 |         25        0.36       83.89
                 1563 |         25        0.36       84.25
                 1564 |         19        0.27       84.52
                 1565 |         29        0.41       84.93
                 1566 |         21        0.30       85.23
                 1567 |         28        0.40       85.63
                 1568 |         28        0.40       86.03
                 1569 |         12        0.17       86.20
                 1570 |         27        0.38       86.58
                 1571 |         14        0.20       86.78
                 1572 |         26        0.37       87.15
                 1573 |         12        0.17       87.32
                 1574 |         25        0.36       87.68
                 1575 |         20        0.28       87.96
                 1576 |         11        0.16       88.12
                 1577 |         26        0.37       88.49
                 1578 |         16        0.23       88.72
                 1579 |         10        0.14       88.86
                 1580 |         19        0.27       89.13
                 1581 |          9        0.13       89.26
                 1582 |         18        0.26       89.51
                 1583 |         25        0.36       89.87
                 1584 |         19        0.27       90.14
                 1585 |         20        0.28       90.42
                 1586 |         16        0.23       90.65
                 1587 |         14        0.20       90.85
                 1588 |         19        0.27       91.12
                 1589 |         11        0.16       91.28
                 1590 |         14        0.20       91.48
                 1591 |         21        0.30       91.78
                 1592 |         17        0.24       92.02
                 1593 |         17        0.24       92.26
                 1594 |         16        0.23       92.49
                 1595 |         10        0.14       92.63
                 1596 |         16        0.23       92.86
                 1597 |         18        0.26       93.11
                 1598 |         16        0.23       93.34
                 1599 |         11        0.16       93.50
                 1600 |         10        0.14       93.64
                 1601 |          8        0.11       93.75
                 1602 |         11        0.16       93.91
                 1603 |         14        0.20       94.11
                 1604 |         13        0.18       94.29
                 1605 |         12        0.17       94.46
                 1606 |         15        0.21       94.68
                 1607 |          8        0.11       94.79
                 1608 |         10        0.14       94.93
                 1609 |         13        0.18       95.12
                 1610 |         12        0.17       95.29
                 1611 |          8        0.11       95.40
                 1612 |         12        0.17       95.57
                 1613 |          7        0.10       95.67
                 1614 |          8        0.11       95.79
                 1615 |          7        0.10       95.89
                 1616 |          6        0.09       95.97
                 1617 |          5        0.07       96.04
                 1618 |          8        0.11       96.16
                 1619 |          4        0.06       96.22
                 1620 |         10        0.14       96.36
                 1621 |          5        0.07       96.43
                 1622 |          4        0.06       96.49
                 1623 |          3        0.04       96.53
                 1624 |          1        0.01       96.54
                 1625 |          8        0.11       96.66
                 1626 |          2        0.03       96.68
                 1627 |         11        0.16       96.84
                 1628 |          5        0.07       96.91
                 1629 |          6        0.09       97.00
                 1630 |          6        0.09       97.08
                 1631 |          4        0.06       97.14
                 1632 |          6        0.09       97.23
                 1633 |          3        0.04       97.27
                 1634 |          5        0.07       97.34
                 1635 |          7        0.10       97.44
                 1636 |          7        0.10       97.54
                 1637 |          7        0.10       97.64
                 1638 |          8        0.11       97.75
                 1639 |          5        0.07       97.82
                 1640 |          4        0.06       97.88
                 1641 |          2        0.03       97.91
                 1642 |          3        0.04       97.95
                 1643 |          9        0.13       98.08
                 1644 |          2        0.03       98.11
                 1645 |          3        0.04       98.15
                 1646 |          2        0.03       98.18
                 1647 |          4        0.06       98.24
                 1648 |          2        0.03       98.26
                 1649 |          3        0.04       98.31
                 1650 |          1        0.01       98.32
                 1651 |          5        0.07       98.39
                 1652 |          3        0.04       98.43
                 1653 |          4        0.06       98.49
                 1654 |          7        0.10       98.59
                 1655 |          5        0.07       98.66
                 1656 |          5        0.07       98.73
                 1657 |          2        0.03       98.76
                 1658 |          3        0.04       98.80
                 1659 |          4        0.06       98.86
                 1660 |          5        0.07       98.93
                 1661 |          6        0.09       99.02
                 1663 |          2        0.03       99.05
                 1664 |          1        0.01       99.06
                 1665 |          3        0.04       99.10
                 1666 |          1        0.01       99.12
                 1668 |          2        0.03       99.15
                 1669 |          2        0.03       99.17
                 1670 |          2        0.03       99.20
                 1671 |          1        0.01       99.22
                 1673 |          1        0.01       99.23
                 1674 |          1        0.01       99.25
                 1675 |          1        0.01       99.26
                 1676 |          1        0.01       99.27
                 1677 |          1        0.01       99.29
                 1678 |          4        0.06       99.35
                 1680 |          1        0.01       99.36
                 1681 |          5        0.07       99.43
                 1682 |          1        0.01       99.45
                 1683 |          1        0.01       99.46
                 1684 |          3        0.04       99.50
                 1685 |          1        0.01       99.52
                 1687 |          2        0.03       99.54
                 1688 |          2        0.03       99.57
                 1689 |          6        0.09       99.66
                 1690 |          2        0.03       99.69
                 1691 |          3        0.04       99.73
                 1692 |          1        0.01       99.74
                 1694 |          1        0.01       99.76
                 1696 |          1        0.01       99.77
                 1698 |          1        0.01       99.79
                 1699 |          2        0.03       99.82
                 1701 |          2        0.03       99.84
                 1707 |          4        0.06       99.90
                 1711 |          1        0.01       99.91
                 1715 |          2        0.03       99.94
                 1717 |          1        0.01       99.96
                 1718 |          2        0.03       99.99
                 1738 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . summ stature

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
               stature |      7,028    1716.589     89.6767       1409       1993

          . tab stature // all seem reasonable. A typical range is 1350-2100mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

              stature |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                 1409 |          1        0.01        0.01
                 1435 |          1        0.01        0.03
                 1439 |          1        0.01        0.04
                 1442 |          1        0.01        0.06
                 1446 |          1        0.01        0.07
                 1447 |          2        0.03        0.10
                 1458 |          1        0.01        0.11
                 1462 |          1        0.01        0.13
                 1463 |          1        0.01        0.14
                 1464 |          1        0.01        0.16
                 1465 |          1        0.01        0.17
                 1468 |          1        0.01        0.18
                 1471 |          1        0.01        0.20
                 1473 |          1        0.01        0.21
                 1475 |          2        0.03        0.24
                 1479 |          1        0.01        0.26
                 1480 |          2        0.03        0.28
                 1483 |          1        0.01        0.30
                 1487 |          1        0.01        0.31
                 1490 |          2        0.03        0.34
                 1491 |          1        0.01        0.36
                 1492 |          1        0.01        0.37
                 1493 |          3        0.04        0.41
                 1494 |          1        0.01        0.43
                 1495 |          5        0.07        0.50
                 1496 |          3        0.04        0.54
                 1497 |          2        0.03        0.57
                 1498 |          4        0.06        0.63
                 1499 |          1        0.01        0.64
                 1500 |          1        0.01        0.65
                 1501 |          5        0.07        0.73
                 1502 |          2        0.03        0.75
                 1503 |          2        0.03        0.78
                 1505 |          3        0.04        0.83
                 1506 |          2        0.03        0.85
                 1507 |          3        0.04        0.90
                 1508 |          2        0.03        0.92
                 1509 |          1        0.01        0.94
                 1510 |          3        0.04        0.98
                 1511 |          1        0.01        1.00
                 1512 |          3        0.04        1.04
                 1513 |          2        0.03        1.07
                 1515 |          3        0.04        1.11
                 1516 |          4        0.06        1.17
                 1517 |          2        0.03        1.20
                 1518 |          3        0.04        1.24
                 1519 |          4        0.06        1.29
                 1520 |          4        0.06        1.35
                 1521 |          1        0.01        1.37
                 1522 |          4        0.06        1.42
                 1523 |          4        0.06        1.48
                 1524 |          3        0.04        1.52
                 1525 |          7        0.10        1.62
                 1526 |          8        0.11        1.74
                 1527 |          4        0.06        1.79
                 1528 |          5        0.07        1.86
                 1529 |          5        0.07        1.94
                 1530 |          9        0.13        2.06
                 1531 |          2        0.03        2.09
                 1532 |          2        0.03        2.12
                 1533 |          8        0.11        2.23
                 1534 |          5        0.07        2.31
                 1535 |          2        0.03        2.33
                 1536 |          6        0.09        2.42
                 1537 |          4        0.06        2.48
                 1538 |          6        0.09        2.56
                 1539 |          4        0.06        2.62
                 1540 |          5        0.07        2.69
                 1541 |          5        0.07        2.76
                 1542 |          3        0.04        2.80
                 1543 |          9        0.13        2.93
                 1544 |          1        0.01        2.95
                 1545 |          7        0.10        3.04
                 1546 |          5        0.07        3.12
                 1547 |          7        0.10        3.22
                 1548 |          8        0.11        3.33
                 1549 |          8        0.11        3.44
                 1550 |          4        0.06        3.50
                 1551 |          1        0.01        3.51
                 1552 |          6        0.09        3.60
                 1553 |          3        0.04        3.64
                 1554 |          4        0.06        3.70
                 1555 |          7        0.10        3.80
                 1556 |          5        0.07        3.87
                 1557 |          7        0.10        3.97
                 1558 |          8        0.11        4.08
                 1559 |         11        0.16        4.24
                 1560 |         16        0.23        4.47
                 1561 |         12        0.17        4.64
                 1562 |          7        0.10        4.74
                 1563 |         16        0.23        4.97
                 1564 |          4        0.06        5.02
                 1565 |          7        0.10        5.12
                 1566 |         11        0.16        5.28
                 1567 |         14        0.20        5.48
                 1568 |          7        0.10        5.58
                 1569 |          6        0.09        5.66
                 1570 |         12        0.17        5.83
                 1571 |          8        0.11        5.95
                 1572 |         12        0.17        6.12
                 1573 |         15        0.21        6.33
                 1574 |         13        0.18        6.52
                 1575 |         11        0.16        6.67
                 1576 |         13        0.18        6.86
                 1577 |          3        0.04        6.90
                 1578 |          7        0.10        7.00
                 1579 |          6        0.09        7.09
                 1580 |          7        0.10        7.19
                 1581 |          8        0.11        7.30
                 1582 |         12        0.17        7.47
                 1583 |         19        0.27        7.74
                 1584 |         12        0.17        7.91
                 1585 |         20        0.28        8.20
                 1586 |         13        0.18        8.38
                 1587 |         17        0.24        8.62
                 1588 |         12        0.17        8.79
                 1589 |         12        0.17        8.96
                 1590 |         18        0.26        9.22
                 1591 |          9        0.13        9.35
                 1592 |         12        0.17        9.52
                 1593 |          9        0.13        9.65
                 1594 |         11        0.16        9.80
                 1595 |         19        0.27       10.07
                 1596 |         15        0.21       10.29
                 1597 |         14        0.20       10.49
                 1598 |         20        0.28       10.77
                 1599 |         13        0.18       10.96
                 1600 |         25        0.36       11.31
                 1601 |          5        0.07       11.38
                 1602 |         16        0.23       11.61
                 1603 |         18        0.26       11.87
                 1604 |         20        0.28       12.15
                 1605 |          9        0.13       12.28
                 1606 |         18        0.26       12.54
                 1607 |         13        0.18       12.72
                 1608 |         16        0.23       12.95
                 1609 |         18        0.26       13.20
                 1610 |         17        0.24       13.45
                 1611 |         22        0.31       13.76
                 1612 |         15        0.21       13.97
                 1613 |         19        0.27       14.24
                 1614 |         18        0.26       14.50
                 1615 |         16        0.23       14.73
                 1616 |         16        0.23       14.95
                 1617 |         21        0.30       15.25
                 1618 |         18        0.26       15.51
                 1619 |         20        0.28       15.79
                 1620 |         23        0.33       16.12
                 1621 |         10        0.14       16.26
                 1622 |         10        0.14       16.41
                 1623 |         28        0.40       16.80
                 1624 |         13        0.18       16.99
                 1625 |         17        0.24       17.23
                 1626 |         15        0.21       17.44
                 1627 |         15        0.21       17.66
                 1628 |         19        0.27       17.93
                 1629 |         22        0.31       18.24
                 1630 |         20        0.28       18.53
                 1631 |         13        0.18       18.71
                 1632 |         13        0.18       18.90
                 1633 |         15        0.21       19.11
                 1634 |         23        0.33       19.44
                 1635 |         23        0.33       19.76
                 1636 |         18        0.26       20.02
                 1637 |         19        0.27       20.29
                 1638 |         19        0.27       20.56
                 1639 |         17        0.24       20.80
                 1640 |         24        0.34       21.14
                 1641 |         18        0.26       21.40
                 1642 |         18        0.26       21.66
                 1643 |         19        0.27       21.93
                 1644 |         15        0.21       22.14
                 1645 |         21        0.30       22.44
                 1646 |         17        0.24       22.68
                 1647 |         20        0.28       22.97
                 1648 |         19        0.27       23.24
                 1649 |         24        0.34       23.58
                 1650 |         14        0.20       23.78
                 1651 |         20        0.28       24.06
                 1652 |         16        0.23       24.29
                 1653 |         34        0.48       24.77
                 1654 |         18        0.26       25.03
                 1655 |         21        0.30       25.33
                 1656 |         18        0.26       25.58
                 1657 |         33        0.47       26.05
                 1658 |         26        0.37       26.42
                 1659 |         24        0.34       26.76
                 1660 |         24        0.34       27.11
                 1661 |         26        0.37       27.48
                 1662 |         18        0.26       27.73
                 1663 |         24        0.34       28.07
                 1664 |         29        0.41       28.49
                 1665 |         21        0.30       28.78
                 1666 |         20        0.28       29.07
                 1667 |         12        0.17       29.24
                 1668 |         23        0.33       29.57
                 1669 |         21        0.30       29.87
                 1670 |         30        0.43       30.29
                 1671 |         19        0.27       30.56
                 1672 |         24        0.34       30.90
                 1673 |         32        0.46       31.36
                 1674 |         44        0.63       31.99
                 1675 |         27        0.38       32.37
                 1676 |         21        0.30       32.67
                 1677 |         19        0.27       32.94
                 1678 |         27        0.38       33.32
                 1679 |         24        0.34       33.67
                 1680 |         25        0.36       34.02
                 1681 |         30        0.43       34.45
                 1682 |         29        0.41       34.86
                 1683 |         24        0.34       35.20
                 1684 |         25        0.36       35.56
                 1685 |         25        0.36       35.91
                 1686 |         16        0.23       36.14
                 1687 |         35        0.50       36.64
                 1688 |         38        0.54       37.18
                 1689 |         21        0.30       37.48
                 1690 |         29        0.41       37.89
                 1691 |         14        0.20       38.09
                 1692 |         15        0.21       38.30
                 1693 |         18        0.26       38.56
                 1694 |         24        0.34       38.90
                 1695 |         12        0.17       39.07
                 1696 |         19        0.27       39.34
                 1697 |         27        0.38       39.73
                 1698 |         29        0.41       40.14
                 1699 |         14        0.20       40.34
                 1700 |         38        0.54       40.88
                 1701 |         18        0.26       41.14
                 1702 |         27        0.38       41.52
                 1703 |         28        0.40       41.92
                 1704 |         28        0.40       42.32
                 1705 |         28        0.40       42.71
                 1706 |         28        0.40       43.11
                 1707 |         39        0.55       43.67
                 1708 |         33        0.47       44.14
                 1709 |         28        0.40       44.54
                 1710 |         39        0.55       45.09
                 1711 |         27        0.38       45.48
                 1712 |         24        0.34       45.82
                 1713 |         27        0.38       46.20
                 1714 |         22        0.31       46.51
                 1715 |         34        0.48       47.00
                 1716 |         24        0.34       47.34
                 1717 |         39        0.55       47.89
                 1718 |         41        0.58       48.48
                 1719 |         25        0.36       48.83
                 1720 |         31        0.44       49.27
                 1721 |         31        0.44       49.72
                 1722 |         36        0.51       50.23
                 1723 |         29        0.41       50.64
                 1724 |         27        0.38       51.02
                 1725 |         36        0.51       51.54
                 1726 |         25        0.36       51.89
                 1727 |         31        0.44       52.33
                 1728 |         35        0.50       52.83
                 1729 |         25        0.36       53.19
                 1730 |         45        0.64       53.83
                 1731 |         17        0.24       54.07
                 1732 |         23        0.33       54.40
                 1733 |         36        0.51       54.91
                 1734 |         30        0.43       55.34
                 1735 |         51        0.73       56.06
                 1736 |         35        0.50       56.56
                 1737 |         34        0.48       57.04
                 1738 |         34        0.48       57.53
                 1739 |         19        0.27       57.80
                 1740 |         53        0.75       58.55
                 1741 |         23        0.33       58.88
                 1742 |         25        0.36       59.23
                 1743 |         33        0.47       59.70
                 1744 |         39        0.55       60.26
                 1745 |         50        0.71       60.97
                 1746 |         23        0.33       61.30
                 1747 |         23        0.33       61.62
                 1748 |         30        0.43       62.05
                 1749 |         33        0.47       62.52
                 1750 |         41        0.58       63.10
                 1751 |         34        0.48       63.59
                 1752 |         19        0.27       63.86
                 1753 |         15        0.21       64.07
                 1754 |         27        0.38       64.46
                 1755 |         21        0.30       64.76
                 1756 |         25        0.36       65.11
                 1757 |         24        0.34       65.45
                 1758 |         28        0.40       65.85
                 1759 |         25        0.36       66.21
                 1760 |         35        0.50       66.70
                 1761 |         34        0.48       67.19
                 1762 |         20        0.28       67.47
                 1763 |         36        0.51       67.99
                 1764 |         28        0.40       68.38
                 1765 |         34        0.48       68.87
                 1766 |         28        0.40       69.27
                 1767 |         26        0.37       69.64
                 1768 |         34        0.48       70.12
                 1769 |         16        0.23       70.35
                 1770 |         28        0.40       70.75
                 1771 |         32        0.46       71.20
                 1772 |         32        0.46       71.66
                 1773 |         35        0.50       72.15
                 1774 |         44        0.63       72.78
                 1775 |         30        0.43       73.21
                 1776 |         18        0.26       73.46
                 1777 |         32        0.46       73.92
                 1778 |         18        0.26       74.17
                 1779 |         26        0.37       74.54
                 1780 |         34        0.48       75.03
                 1781 |         37        0.53       75.55
                 1782 |         29        0.41       75.97
                 1783 |         24        0.34       76.31
                 1784 |         32        0.46       76.76
                 1785 |         28        0.40       77.16
                 1786 |         25        0.36       77.52
                 1787 |         22        0.31       77.83
                 1788 |         33        0.47       78.30
                 1789 |         20        0.28       78.59
                 1790 |         40        0.57       79.15
                 1791 |         19        0.27       79.43
                 1792 |         23        0.33       79.75
                 1793 |         22        0.31       80.07
                 1794 |         26        0.37       80.44
                 1795 |         21        0.30       80.73
                 1796 |         16        0.23       80.96
                 1797 |         18        0.26       81.22
                 1798 |         29        0.41       81.63
                 1799 |         17        0.24       81.87
                 1800 |         36        0.51       82.38
                 1801 |         14        0.20       82.58
                 1802 |         25        0.36       82.94
                 1803 |         34        0.48       83.42
                 1804 |         18        0.26       83.68
                 1805 |         30        0.43       84.11
                 1806 |         14        0.20       84.31
                 1807 |         26        0.37       84.68
                 1808 |         21        0.30       84.97
                 1809 |         26        0.37       85.34
                 1810 |         23        0.33       85.67
                 1811 |         17        0.24       85.91
                 1812 |         12        0.17       86.08
                 1813 |          9        0.13       86.21
                 1814 |         30        0.43       86.64
                 1815 |         13        0.18       86.82
                 1816 |         16        0.23       87.05
                 1817 |         18        0.26       87.31
                 1818 |         23        0.33       87.64
                 1819 |         20        0.28       87.92
                 1820 |         14        0.20       88.12
                 1821 |         17        0.24       88.36
                 1822 |         23        0.33       88.69
                 1823 |         17        0.24       88.93
                 1824 |         10        0.14       89.07
                 1825 |         20        0.28       89.36
                 1826 |         13        0.18       89.54
                 1827 |         15        0.21       89.76
                 1828 |         17        0.24       90.00
                 1829 |         10        0.14       90.14
                 1830 |         23        0.33       90.47
                 1831 |         18        0.26       90.72
                 1832 |         11        0.16       90.88
                 1833 |         14        0.20       91.08
                 1834 |         16        0.23       91.31
                 1835 |         19        0.27       91.58
                 1836 |         22        0.31       91.89
                 1837 |          8        0.11       92.00
                 1838 |         15        0.21       92.22
                 1839 |         15        0.21       92.43
                 1840 |         11        0.16       92.59
                 1841 |          6        0.09       92.67
                 1842 |         16        0.23       92.90
                 1843 |          7        0.10       93.00
                 1844 |         10        0.14       93.14
                 1845 |         14        0.20       93.34
                 1846 |          8        0.11       93.45
                 1847 |         15        0.21       93.67
                 1848 |          6        0.09       93.75
                 1849 |         10        0.14       93.90
                 1850 |         19        0.27       94.17
                 1851 |          5        0.07       94.24
                 1852 |         13        0.18       94.42
                 1853 |         16        0.23       94.65
                 1854 |          9        0.13       94.78
                 1855 |          7        0.10       94.88
                 1856 |         11        0.16       95.03
                 1857 |          7        0.10       95.13
                 1858 |         11        0.16       95.29
                 1859 |         10        0.14       95.43
                 1860 |          6        0.09       95.52
                 1861 |         14        0.20       95.72
                 1862 |          8        0.11       95.83
                 1863 |         11        0.16       95.99
                 1864 |          7        0.10       96.09
                 1865 |          9        0.13       96.22
                 1866 |          3        0.04       96.26
                 1867 |          9        0.13       96.39
                 1868 |          6        0.09       96.47
                 1869 |          4        0.06       96.53
                 1870 |          7        0.10       96.63
                 1871 |          8        0.11       96.74
                 1872 |          5        0.07       96.81
                 1873 |          7        0.10       96.91
                 1874 |          6        0.09       97.00
                 1875 |          3        0.04       97.04
                 1876 |          2        0.03       97.07
                 1877 |          6        0.09       97.15
                 1878 |          2        0.03       97.18
                 1879 |          6        0.09       97.27
                 1880 |          7        0.10       97.37
                 1881 |          6        0.09       97.45
                 1882 |          2        0.03       97.48
                 1883 |          5        0.07       97.55
                 1884 |          1        0.01       97.57
                 1885 |          4        0.06       97.62
                 1886 |          6        0.09       97.71
                 1887 |          4        0.06       97.77
                 1888 |          2        0.03       97.79
                 1889 |          3        0.04       97.84
                 1890 |          9        0.13       97.97
                 1891 |          3        0.04       98.01
                 1892 |          1        0.01       98.02
                 1893 |          5        0.07       98.09
                 1894 |          3        0.04       98.14
                 1895 |          1        0.01       98.15
                 1896 |          2        0.03       98.18
                 1897 |          6        0.09       98.26
                 1898 |          2        0.03       98.29
                 1899 |          6        0.09       98.38
                 1900 |          6        0.09       98.46
                 1902 |          3        0.04       98.51
                 1903 |          2        0.03       98.53
                 1904 |          2        0.03       98.56
                 1905 |          5        0.07       98.63
                 1906 |          3        0.04       98.68
                 1907 |          3        0.04       98.72
                 1908 |          1        0.01       98.73
                 1909 |          2        0.03       98.76
                 1910 |          3        0.04       98.80
                 1911 |          1        0.01       98.82
                 1912 |          1        0.01       98.83
                 1913 |          2        0.03       98.86
                 1914 |          1        0.01       98.88
                 1915 |          4        0.06       98.93
                 1916 |          2        0.03       98.96
                 1917 |          1        0.01       98.98
                 1919 |          3        0.04       99.02
                 1921 |          2        0.03       99.05
                 1923 |          6        0.09       99.13
                 1924 |          5        0.07       99.20
                 1925 |          1        0.01       99.22
                 1926 |          3        0.04       99.26
                 1927 |          3        0.04       99.30
                 1928 |          4        0.06       99.36
                 1929 |          1        0.01       99.37
                 1930 |          1        0.01       99.39
                 1931 |          2        0.03       99.42
                 1934 |          2        0.03       99.45
                 1935 |          1        0.01       99.46
                 1936 |          2        0.03       99.49
                 1937 |          1        0.01       99.50
                 1938 |          1        0.01       99.52
                 1940 |          3        0.04       99.56
                 1941 |          2        0.03       99.59
                 1942 |          1        0.01       99.60
                 1944 |          1        0.01       99.62
                 1945 |          1        0.01       99.63
                 1946 |          2        0.03       99.66
                 1948 |          1        0.01       99.67
                 1950 |          2        0.03       99.70
                 1951 |          3        0.04       99.74
                 1952 |          3        0.04       99.79
                 1953 |          1        0.01       99.80
                 1955 |          2        0.03       99.83
                 1958 |          1        0.01       99.84
                 1959 |          1        0.01       99.86
                 1960 |          1        0.01       99.87
                 1966 |          3        0.04       99.91
                 1970 |          2        0.03       99.94
                 1972 |          1        0.01       99.96
                 1979 |          1        0.01       99.97
                 1980 |          1        0.01       99.99
                 1993 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . summ waistcircumference

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
          waistcircu~e |      7,028    916.9048     113.946        611       1379

          . tab waistcircumference // all seem reasonable. A typical range is 500-1500mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

          waistcircum |
              ference |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                  611 |          1        0.01        0.01
                  615 |          1        0.01        0.03
                  620 |          1        0.01        0.04
                  624 |          1        0.01        0.06
                  628 |          1        0.01        0.07
                  632 |          2        0.03        0.10
                  637 |          1        0.01        0.11
                  641 |          1        0.01        0.13
                  647 |          1        0.01        0.14
                  648 |          2        0.03        0.17
                  650 |          3        0.04        0.21
                  651 |          1        0.01        0.23
                  656 |          2        0.03        0.26
                  657 |          1        0.01        0.27
                  658 |          1        0.01        0.28
                  660 |          1        0.01        0.30
                  664 |          1        0.01        0.31
                  665 |          4        0.06        0.37
                  667 |          1        0.01        0.38
                  668 |          2        0.03        0.41
                  669 |          1        0.01        0.43
                  670 |          3        0.04        0.47
                  671 |          2        0.03        0.50
                  672 |          3        0.04        0.54
                  673 |          1        0.01        0.55
                  674 |          1        0.01        0.57
                  675 |          1        0.01        0.58
                  677 |          1        0.01        0.60
                  678 |          1        0.01        0.61
                  679 |          3        0.04        0.65
                  680 |          2        0.03        0.68
                  681 |          2        0.03        0.71
                  682 |          3        0.04        0.75
                  685 |          1        0.01        0.77
                  686 |          1        0.01        0.78
                  687 |          3        0.04        0.83
                  688 |          1        0.01        0.84
                  689 |          1        0.01        0.85
                  690 |          4        0.06        0.91
                  691 |          1        0.01        0.92
                  692 |          1        0.01        0.94
                  693 |          1        0.01        0.95
                  694 |          5        0.07        1.02
                  695 |          2        0.03        1.05
                  696 |          2        0.03        1.08
                  697 |          2        0.03        1.11
                  698 |          9        0.13        1.24
                  699 |          2        0.03        1.27
                  700 |          6        0.09        1.35
                  701 |          3        0.04        1.39
                  702 |          3        0.04        1.44
                  703 |          2        0.03        1.47
                  704 |          1        0.01        1.48
                  705 |          5        0.07        1.55
                  706 |          5        0.07        1.62
                  707 |          8        0.11        1.74
                  708 |          4        0.06        1.79
                  709 |          2        0.03        1.82
                  710 |          4        0.06        1.88
                  711 |          3        0.04        1.92
                  712 |          2        0.03        1.95
                  713 |          2        0.03        1.98
                  714 |          1        0.01        1.99
                  715 |          9        0.13        2.12
                  716 |          7        0.10        2.22
                  717 |          1        0.01        2.23
                  718 |          2        0.03        2.26
                  719 |          9        0.13        2.39
                  720 |          8        0.11        2.50
                  721 |          7        0.10        2.60
                  722 |          7        0.10        2.70
                  723 |          5        0.07        2.77
                  724 |          3        0.04        2.82
                  725 |          9        0.13        2.95
                  726 |          5        0.07        3.02
                  727 |          7        0.10        3.12
                  728 |         10        0.14        3.26
                  729 |          3        0.04        3.30
                  730 |         11        0.16        3.46
                  731 |         11        0.16        3.61
                  732 |          3        0.04        3.66
                  733 |          9        0.13        3.78
                  734 |          7        0.10        3.88
                  735 |          9        0.13        4.01
                  736 |          3        0.04        4.06
                  737 |          7        0.10        4.15
                  738 |          9        0.13        4.28
                  739 |         10        0.14        4.43
                  740 |         13        0.18        4.61
                  741 |          6        0.09        4.70
                  742 |         11        0.16        4.85
                  743 |          7        0.10        4.95
                  744 |          7        0.10        5.05
                  745 |         10        0.14        5.19
                  746 |          8        0.11        5.31
                  747 |          6        0.09        5.39
                  748 |         11        0.16        5.55
                  749 |          5        0.07        5.62
                  750 |          9        0.13        5.75
                  751 |          7        0.10        5.85
                  752 |         14        0.20        6.05
                  753 |         16        0.23        6.27
                  754 |         10        0.14        6.42
                  755 |         14        0.20        6.62
                  756 |          7        0.10        6.72
                  757 |         22        0.31        7.03
                  758 |         12        0.17        7.20
                  759 |         13        0.18        7.38
                  760 |          9        0.13        7.51
                  761 |         15        0.21        7.73
                  762 |         11        0.16        7.88
                  763 |         13        0.18        8.07
                  764 |          9        0.13        8.20
                  765 |         12        0.17        8.37
                  766 |         14        0.20        8.57
                  767 |         19        0.27        8.84
                  768 |         13        0.18        9.02
                  769 |         12        0.17        9.19
                  770 |         17        0.24        9.43
                  771 |         12        0.17        9.60
                  772 |         16        0.23        9.83
                  773 |          9        0.13        9.96
                  774 |          8        0.11       10.07
                  775 |         25        0.36       10.43
                  776 |          9        0.13       10.56
                  777 |         14        0.20       10.76
                  778 |         19        0.27       11.03
                  779 |         14        0.20       11.23
                  780 |         18        0.26       11.48
                  781 |          9        0.13       11.61
                  782 |         17        0.24       11.85
                  783 |         20        0.28       12.14
                  784 |         17        0.24       12.38
                  785 |         26        0.37       12.75
                  786 |         10        0.14       12.89
                  787 |         18        0.26       13.15
                  788 |         15        0.21       13.36
                  789 |         13        0.18       13.55
                  790 |         27        0.38       13.93
                  791 |         15        0.21       14.14
                  792 |          9        0.13       14.27
                  793 |         17        0.24       14.51
                  794 |         10        0.14       14.66
                  795 |         19        0.27       14.93
                  796 |         21        0.30       15.22
                  797 |         19        0.27       15.50
                  798 |         19        0.27       15.77
                  799 |         13        0.18       15.95
                  800 |         27        0.38       16.33
                  801 |         24        0.34       16.68
                  802 |         20        0.28       16.96
                  803 |         24        0.34       17.30
                  804 |         13        0.18       17.49
                  805 |         25        0.36       17.84
                  806 |          9        0.13       17.97
                  807 |         18        0.26       18.23
                  808 |         19        0.27       18.50
                  809 |         14        0.20       18.70
                  810 |         14        0.20       18.90
                  811 |         27        0.38       19.28
                  812 |         26        0.37       19.65
                  813 |         17        0.24       19.89
                  814 |         20        0.28       20.18
                  815 |         27        0.38       20.56
                  816 |         26        0.37       20.93
                  817 |         21        0.30       21.23
                  818 |         16        0.23       21.46
                  819 |         10        0.14       21.60
                  820 |         22        0.31       21.91
                  821 |         20        0.28       22.20
                  822 |         23        0.33       22.52
                  823 |         13        0.18       22.71
                  824 |         10        0.14       22.85
                  825 |         26        0.37       23.22
                  826 |         24        0.34       23.56
                  827 |         25        0.36       23.92
                  828 |         20        0.28       24.20
                  829 |         14        0.20       24.40
                  830 |         34        0.48       24.89
                  831 |         17        0.24       25.13
                  832 |         17        0.24       25.37
                  833 |         15        0.21       25.58
                  834 |         14        0.20       25.78
                  835 |         35        0.50       26.28
                  836 |         21        0.30       26.58
                  837 |         20        0.28       26.86
                  838 |         21        0.30       27.16
                  839 |         15        0.21       27.38
                  840 |         38        0.54       27.92
                  841 |         16        0.23       28.14
                  842 |         18        0.26       28.40
                  843 |         15        0.21       28.61
                  844 |         19        0.27       28.88
                  845 |         26        0.37       29.25
                  846 |         30        0.43       29.68
                  847 |         23        0.33       30.01
                  848 |         17        0.24       30.25
                  849 |         13        0.18       30.44
                  850 |         33        0.47       30.90
                  851 |         26        0.37       31.27
                  852 |         19        0.27       31.55
                  853 |         28        0.40       31.94
                  854 |         12        0.17       32.11
                  855 |         29        0.41       32.53
                  856 |         18        0.26       32.78
                  857 |         22        0.31       33.10
                  858 |         21        0.30       33.39
                  859 |         20        0.28       33.68
                  860 |         31        0.44       34.12
                  861 |         14        0.20       34.32
                  862 |         23        0.33       34.65
                  863 |         16        0.23       34.87
                  864 |         20        0.28       35.16
                  865 |         35        0.50       35.66
                  866 |         22        0.31       35.97
                  867 |         17        0.24       36.21
                  868 |         25        0.36       36.57
                  869 |         11        0.16       36.72
                  870 |         29        0.41       37.14
                  871 |         14        0.20       37.34
                  872 |         18        0.26       37.59
                  873 |         17        0.24       37.83
                  874 |         21        0.30       38.13
                  875 |         29        0.41       38.55
                  876 |         16        0.23       38.77
                  877 |         22        0.31       39.09
                  878 |         23        0.33       39.41
                  879 |         19        0.27       39.68
                  880 |         43        0.61       40.30
                  881 |         12        0.17       40.47
                  882 |         22        0.31       40.78
                  883 |         27        0.38       41.16
                  884 |         21        0.30       41.46
                  885 |         29        0.41       41.88
                  886 |         15        0.21       42.09
                  887 |         24        0.34       42.43
                  888 |         19        0.27       42.70
                  889 |         17        0.24       42.94
                  890 |         18        0.26       43.20
                  891 |         23        0.33       43.53
                  892 |         14        0.20       43.73
                  893 |         21        0.30       44.02
                  894 |          8        0.11       44.14
                  895 |         35        0.50       44.64
                  896 |         20        0.28       44.92
                  897 |         30        0.43       45.35
                  898 |         16        0.23       45.57
                  899 |         12        0.17       45.75
                  900 |         43        0.61       46.36
                  901 |         20        0.28       46.64
                  902 |         26        0.37       47.01
                  903 |         19        0.27       47.28
                  904 |         24        0.34       47.62
                  905 |         25        0.36       47.98
                  906 |         17        0.24       48.22
                  907 |         34        0.48       48.71
                  908 |         33        0.47       49.17
                  909 |         17        0.24       49.42
                  910 |         21        0.30       49.72
                  911 |         23        0.33       50.04
                  912 |         32        0.46       50.50
                  913 |         23        0.33       50.83
                  914 |         24        0.34       51.17
                  915 |         29        0.41       51.58
                  916 |         14        0.20       51.78
                  917 |         32        0.46       52.23
                  918 |         28        0.40       52.63
                  919 |         17        0.24       52.87
                  920 |         27        0.38       53.26
                  921 |         13        0.18       53.44
                  922 |         25        0.36       53.80
                  923 |         17        0.24       54.04
                  924 |         22        0.31       54.35
                  925 |         23        0.33       54.68
                  926 |         17        0.24       54.92
                  927 |         16        0.23       55.15
                  928 |         20        0.28       55.44
                  929 |         14        0.20       55.63
                  930 |         24        0.34       55.98
                  931 |         24        0.34       56.32
                  932 |         27        0.38       56.70
                  933 |         31        0.44       57.14
                  934 |         18        0.26       57.40
                  935 |         25        0.36       57.75
                  936 |         19        0.27       58.03
                  937 |         14        0.20       58.22
                  938 |         27        0.38       58.61
                  939 |         23        0.33       58.94
                  940 |         22        0.31       59.25
                  941 |         20        0.28       59.53
                  942 |         21        0.30       59.83
                  943 |         20        0.28       60.12
                  944 |         20        0.28       60.40
                  945 |         21        0.30       60.70
                  946 |         20        0.28       60.98
                  947 |         29        0.41       61.40
                  948 |         22        0.31       61.71
                  949 |          9        0.13       61.84
                  950 |         24        0.34       62.18
                  951 |         22        0.31       62.49
                  952 |         26        0.37       62.86
                  953 |         15        0.21       63.08
                  954 |         13        0.18       63.26
                  955 |         35        0.50       63.76
                  956 |         19        0.27       64.03
                  957 |         22        0.31       64.34
                  958 |         37        0.53       64.87
                  959 |          5        0.07       64.94
                  960 |         37        0.53       65.47
                  961 |         29        0.41       65.88
                  962 |         19        0.27       66.15
                  963 |         16        0.23       66.38
                  964 |         16        0.23       66.61
                  965 |         18        0.26       66.86
                  966 |         24        0.34       67.20
                  967 |         23        0.33       67.53
                  968 |         16        0.23       67.76
                  969 |         17        0.24       68.00
                  970 |         32        0.46       68.45
                  971 |         13        0.18       68.64
                  972 |         32        0.46       69.10
                  973 |         18        0.26       69.35
                  974 |         17        0.24       69.59
                  975 |         30        0.43       70.02
                  976 |         19        0.27       70.29
                  977 |         14        0.20       70.49
                  978 |         22        0.31       70.80
                  979 |          8        0.11       70.92
                  980 |         22        0.31       71.23
                  981 |         20        0.28       71.51
                  982 |         14        0.20       71.71
                  983 |         20        0.28       72.00
                  984 |         15        0.21       72.21
                  985 |         16        0.23       72.44
                  986 |         11        0.16       72.60
                  987 |         15        0.21       72.81
                  988 |         19        0.27       73.08
                  989 |         12        0.17       73.25
                  990 |         20        0.28       73.53
                  991 |         22        0.31       73.85
                  992 |         21        0.30       74.15
                  993 |         14        0.20       74.35
                  994 |         12        0.17       74.52
                  995 |         30        0.43       74.94
                  996 |         22        0.31       75.26
                  997 |         13        0.18       75.44
                  998 |          7        0.10       75.54
                  999 |         24        0.34       75.88
                 1000 |         27        0.38       76.27
                 1001 |         21        0.30       76.57
                 1002 |         21        0.30       76.86
                 1003 |         17        0.24       77.11
                 1004 |         22        0.31       77.42
                 1005 |         15        0.21       77.63
                 1006 |         12        0.17       77.80
                 1007 |         18        0.26       78.06
                 1008 |         13        0.18       78.24
                 1009 |         11        0.16       78.40
                 1010 |         28        0.40       78.80
                 1011 |         20        0.28       79.08
                 1012 |         25        0.36       79.44
                 1013 |         18        0.26       79.70
                 1014 |         14        0.20       79.89
                 1015 |         17        0.24       80.14
                 1016 |         17        0.24       80.38
                 1017 |         18        0.26       80.63
                 1018 |         15        0.21       80.85
                 1019 |         14        0.20       81.05
                 1020 |         17        0.24       81.29
                 1021 |         20        0.28       81.57
                 1022 |         21        0.30       81.87
                 1023 |         15        0.21       82.09
                 1024 |         11        0.16       82.24
                 1025 |         15        0.21       82.46
                 1026 |         18        0.26       82.71
                 1027 |         15        0.21       82.93
                 1028 |         14        0.20       83.12
                 1029 |         14        0.20       83.32
                 1030 |         19        0.27       83.59
                 1031 |         13        0.18       83.78
                 1032 |         21        0.30       84.08
                 1033 |          9        0.13       84.21
                 1034 |         16        0.23       84.43
                 1035 |         12        0.17       84.60
                 1036 |         15        0.21       84.82
                 1037 |         10        0.14       84.96
                 1038 |         14        0.20       85.16
                 1039 |          7        0.10       85.26
                 1040 |         11        0.16       85.42
                 1041 |         13        0.18       85.60
                 1042 |         18        0.26       85.86
                 1043 |         12        0.17       86.03
                 1044 |          9        0.13       86.16
                 1045 |         11        0.16       86.31
                 1046 |         15        0.21       86.53
                 1047 |         17        0.24       86.77
                 1048 |         13        0.18       86.95
                 1049 |         10        0.14       87.09
                 1050 |         13        0.18       87.28
                 1051 |         15        0.21       87.49
                 1052 |         11        0.16       87.65
                 1053 |          3        0.04       87.69
                 1054 |         18        0.26       87.95
                 1055 |         13        0.18       88.13
                 1056 |         12        0.17       88.30
                 1057 |          6        0.09       88.39
                 1058 |         10        0.14       88.53
                 1059 |          8        0.11       88.65
                 1060 |         17        0.24       88.89
                 1061 |         11        0.16       89.04
                 1062 |         10        0.14       89.19
                 1063 |         11        0.16       89.34
                 1064 |          6        0.09       89.43
                 1065 |         15        0.21       89.64
                 1066 |         12        0.17       89.81
                 1067 |         10        0.14       89.95
                 1068 |         14        0.20       90.15
                 1069 |          6        0.09       90.24
                 1070 |         19        0.27       90.51
                 1071 |         12        0.17       90.68
                 1072 |         10        0.14       90.82
                 1073 |         14        0.20       91.02
                 1074 |          7        0.10       91.12
                 1075 |          8        0.11       91.24
                 1076 |         15        0.21       91.45
                 1077 |         11        0.16       91.61
                 1078 |          6        0.09       91.69
                 1079 |          4        0.06       91.75
                 1080 |         19        0.27       92.02
                 1081 |          7        0.10       92.12
                 1082 |         14        0.20       92.32
                 1083 |          7        0.10       92.42
                 1084 |          6        0.09       92.50
                 1085 |          6        0.09       92.59
                 1086 |          9        0.13       92.71
                 1087 |          7        0.10       92.81
                 1088 |          7        0.10       92.91
                 1089 |          4        0.06       92.97
                 1090 |          7        0.10       93.07
                 1091 |          7        0.10       93.17
                 1092 |          2        0.03       93.20
                 1093 |          5        0.07       93.27
                 1094 |          5        0.07       93.34
                 1095 |         11        0.16       93.50
                 1096 |          6        0.09       93.58
                 1097 |          8        0.11       93.70
                 1098 |          5        0.07       93.77
                 1099 |          2        0.03       93.80
                 1100 |         15        0.21       94.01
                 1101 |          6        0.09       94.10
                 1102 |          4        0.06       94.15
                 1103 |          5        0.07       94.22
                 1104 |          6        0.09       94.31
                 1105 |          9        0.13       94.44
                 1106 |          6        0.09       94.52
                 1107 |          4        0.06       94.58
                 1108 |         10        0.14       94.72
                 1109 |          2        0.03       94.75
                 1110 |          6        0.09       94.83
                 1111 |          5        0.07       94.91
                 1112 |         10        0.14       95.05
                 1113 |         12        0.17       95.22
                 1114 |          4        0.06       95.28
                 1115 |          6        0.09       95.36
                 1116 |          8        0.11       95.48
                 1117 |          3        0.04       95.52
                 1118 |          4        0.06       95.57
                 1119 |          3        0.04       95.62
                 1120 |          6        0.09       95.70
                 1121 |          6        0.09       95.79
                 1122 |          4        0.06       95.85
                 1123 |          3        0.04       95.89
                 1124 |          8        0.11       96.00
                 1125 |          1        0.01       96.02
                 1126 |          2        0.03       96.04
                 1127 |         10        0.14       96.19
                 1128 |          5        0.07       96.26
                 1129 |          4        0.06       96.31
                 1130 |          8        0.11       96.43
                 1131 |          2        0.03       96.46
                 1132 |          4        0.06       96.51
                 1133 |          5        0.07       96.59
                 1134 |          4        0.06       96.64
                 1135 |          4        0.06       96.70
                 1136 |          8        0.11       96.81
                 1137 |          8        0.11       96.93
                 1138 |          2        0.03       96.96
                 1139 |          7        0.10       97.05
                 1140 |          4        0.06       97.11
                 1141 |          1        0.01       97.13
                 1142 |          3        0.04       97.17
                 1143 |          4        0.06       97.23
                 1144 |          4        0.06       97.28
                 1145 |          1        0.01       97.30
                 1146 |          7        0.10       97.40
                 1147 |          5        0.07       97.47
                 1148 |          2        0.03       97.50
                 1149 |          4        0.06       97.55
                 1150 |          4        0.06       97.61
                 1151 |          1        0.01       97.62
                 1152 |          3        0.04       97.67
                 1153 |          3        0.04       97.71
                 1154 |          1        0.01       97.72
                 1155 |          5        0.07       97.79
                 1156 |          5        0.07       97.87
                 1157 |          2        0.03       97.89
                 1158 |          3        0.04       97.94
                 1159 |          5        0.07       98.01
                 1160 |          2        0.03       98.04
                 1162 |          3        0.04       98.08
                 1163 |          2        0.03       98.11
                 1164 |          3        0.04       98.15
                 1165 |          4        0.06       98.21
                 1166 |          1        0.01       98.22
                 1167 |          1        0.01       98.24
                 1168 |          5        0.07       98.31
                 1170 |          3        0.04       98.35
                 1171 |          3        0.04       98.39
                 1172 |          1        0.01       98.41
                 1174 |          2        0.03       98.43
                 1175 |          4        0.06       98.49
                 1176 |          4        0.06       98.55
                 1177 |          1        0.01       98.56
                 1178 |          1        0.01       98.58
                 1179 |          2        0.03       98.61
                 1180 |          2        0.03       98.63
                 1181 |          2        0.03       98.66
                 1182 |          4        0.06       98.72
                 1183 |          2        0.03       98.75
                 1184 |          2        0.03       98.78
                 1185 |          4        0.06       98.83
                 1186 |          1        0.01       98.85
                 1187 |          2        0.03       98.88
                 1188 |          2        0.03       98.90
                 1189 |          2        0.03       98.93
                 1191 |          1        0.01       98.95
                 1192 |          3        0.04       98.99
                 1194 |          3        0.04       99.03
                 1195 |          2        0.03       99.06
                 1196 |          2        0.03       99.09
                 1197 |          1        0.01       99.10
                 1198 |          1        0.01       99.12
                 1199 |          1        0.01       99.13
                 1200 |          2        0.03       99.16
                 1206 |          2        0.03       99.19
                 1207 |          2        0.03       99.22
                 1210 |          1        0.01       99.23
                 1211 |          3        0.04       99.27
                 1214 |          4        0.06       99.33
                 1217 |          2        0.03       99.36
                 1221 |          1        0.01       99.37
                 1222 |          3        0.04       99.42
                 1223 |          1        0.01       99.43
                 1224 |          1        0.01       99.45
                 1229 |          2        0.03       99.47
                 1234 |          1        0.01       99.49
                 1235 |          1        0.01       99.50
                 1238 |          3        0.04       99.54
                 1245 |          1        0.01       99.56
                 1251 |          1        0.01       99.57
                 1254 |          2        0.03       99.60
                 1260 |          1        0.01       99.62
                 1262 |          1        0.01       99.63
                 1263 |          2        0.03       99.66
                 1265 |          1        0.01       99.67
                 1266 |          1        0.01       99.69
                 1270 |          2        0.03       99.72
                 1282 |          1        0.01       99.73
                 1287 |          3        0.04       99.77
                 1300 |          2        0.03       99.80
                 1302 |          1        0.01       99.82
                 1305 |          1        0.01       99.83
                 1306 |          1        0.01       99.84
                 1308 |          1        0.01       99.86
                 1325 |          1        0.01       99.87
                 1328 |          1        0.01       99.89
                 1330 |          1        0.01       99.90
                 1334 |          2        0.03       99.93
                 1356 |          2        0.03       99.96
                 1358 |          2        0.03       99.99
                 1379 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . summ chestcircumference

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
          chestcircu~e |      7,028    1024.891    100.1932        695       1469

          . tab chestcircumference // all seem reasonable. A typical range is 700-1400mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

          chestcircum |
              ference |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                  695 |          1        0.01        0.01
                  726 |          1        0.01        0.03
                  737 |          1        0.01        0.04
                  757 |          1        0.01        0.06
                  764 |          1        0.01        0.07
                  766 |          1        0.01        0.09
                  769 |          1        0.01        0.10
                  770 |          1        0.01        0.11
                  772 |          1        0.01        0.13
                  773 |          2        0.03        0.16
                  774 |          2        0.03        0.18
                  775 |          1        0.01        0.20
                  776 |          1        0.01        0.21
                  780 |          2        0.03        0.24
                  782 |          1        0.01        0.26
                  783 |          3        0.04        0.30
                  784 |          2        0.03        0.33
                  785 |          1        0.01        0.34
                  786 |          2        0.03        0.37
                  787 |          3        0.04        0.41
                  790 |          2        0.03        0.44
                  791 |          2        0.03        0.47
                  792 |          2        0.03        0.50
                  793 |          2        0.03        0.53
                  794 |          2        0.03        0.55
                  795 |          3        0.04        0.60
                  796 |          1        0.01        0.61
                  798 |          3        0.04        0.65
                  799 |          1        0.01        0.67
                  800 |          3        0.04        0.71
                  802 |          4        0.06        0.77
                  803 |          3        0.04        0.81
                  804 |          2        0.03        0.84
                  805 |          1        0.01        0.85
                  807 |          3        0.04        0.90
                  808 |          2        0.03        0.92
                  810 |          4        0.06        0.98
                  811 |          1        0.01        1.00
                  812 |          4        0.06        1.05
                  813 |          1        0.01        1.07
                  814 |          7        0.10        1.17
                  815 |          6        0.09        1.25
                  817 |          2        0.03        1.28
                  818 |          4        0.06        1.34
                  820 |          4        0.06        1.39
                  821 |          4        0.06        1.45
                  822 |          2        0.03        1.48
                  823 |          2        0.03        1.51
                  824 |          5        0.07        1.58
                  825 |          9        0.13        1.71
                  826 |          9        0.13        1.84
                  827 |          1        0.01        1.85
                  828 |          4        0.06        1.91
                  829 |          3        0.04        1.95
                  830 |          5        0.07        2.02
                  831 |          1        0.01        2.03
                  832 |          3        0.04        2.08
                  833 |          2        0.03        2.11
                  834 |          8        0.11        2.22
                  835 |          2        0.03        2.25
                  836 |          8        0.11        2.36
                  837 |          7        0.10        2.46
                  838 |         13        0.18        2.65
                  839 |          3        0.04        2.69
                  840 |          5        0.07        2.76
                  841 |         11        0.16        2.92
                  842 |          3        0.04        2.96
                  843 |          5        0.07        3.03
                  844 |         14        0.20        3.23
                  845 |         12        0.17        3.40
                  846 |          8        0.11        3.51
                  847 |          8        0.11        3.63
                  848 |         10        0.14        3.77
                  849 |          1        0.01        3.78
                  850 |          6        0.09        3.87
                  851 |          4        0.06        3.93
                  852 |          8        0.11        4.04
                  853 |          4        0.06        4.10
                  854 |          7        0.10        4.20
                  855 |         11        0.16        4.35
                  856 |          5        0.07        4.43
                  857 |          8        0.11        4.54
                  858 |          6        0.09        4.62
                  859 |          3        0.04        4.67
                  860 |          6        0.09        4.75
                  861 |          9        0.13        4.88
                  862 |         16        0.23        5.11
                  863 |          9        0.13        5.24
                  864 |          7        0.10        5.34
                  865 |         10        0.14        5.48
                  866 |         10        0.14        5.62
                  867 |          5        0.07        5.69
                  868 |          5        0.07        5.76
                  869 |          9        0.13        5.89
                  870 |         19        0.27        6.16
                  871 |          2        0.03        6.19
                  872 |         18        0.26        6.45
                  873 |         11        0.16        6.60
                  874 |          9        0.13        6.73
                  875 |          8        0.11        6.84
                  876 |          8        0.11        6.96
                  877 |          8        0.11        7.07
                  878 |         12        0.17        7.24
                  879 |          8        0.11        7.36
                  880 |         11        0.16        7.51
                  881 |         12        0.17        7.68
                  882 |         16        0.23        7.91
                  883 |         13        0.18        8.10
                  884 |         11        0.16        8.25
                  885 |          8        0.11        8.37
                  886 |         10        0.14        8.51
                  887 |         13        0.18        8.69
                  888 |          9        0.13        8.82
                  889 |         10        0.14        8.96
                  890 |         14        0.20        9.16
                  891 |          5        0.07        9.23
                  892 |         17        0.24        9.48
                  893 |         15        0.21        9.69
                  894 |          8        0.11        9.80
                  895 |         21        0.30       10.10
                  896 |         19        0.27       10.37
                  897 |         11        0.16       10.53
                  898 |          6        0.09       10.61
                  899 |         19        0.27       10.89
                  900 |         24        0.34       11.23
                  901 |         12        0.17       11.40
                  902 |         21        0.30       11.70
                  903 |          7        0.10       11.80
                  904 |         17        0.24       12.04
                  905 |          6        0.09       12.12
                  906 |         18        0.26       12.38
                  907 |         20        0.28       12.66
                  908 |         18        0.26       12.92
                  909 |         15        0.21       13.13
                  910 |         19        0.27       13.40
                  911 |          6        0.09       13.49
                  912 |         22        0.31       13.80
                  913 |         21        0.30       14.10
                  914 |         20        0.28       14.39
                  915 |         20        0.28       14.67
                  916 |          7        0.10       14.77
                  917 |         20        0.28       15.05
                  918 |         17        0.24       15.30
                  919 |         13        0.18       15.48
                  920 |         24        0.34       15.82
                  921 |         11        0.16       15.98
                  922 |         29        0.41       16.39
                  923 |         20        0.28       16.68
                  924 |         12        0.17       16.85
                  925 |         22        0.31       17.16
                  926 |         18        0.26       17.42
                  927 |         15        0.21       17.63
                  928 |         15        0.21       17.84
                  929 |         12        0.17       18.01
                  930 |         23        0.33       18.34
                  931 |         18        0.26       18.60
                  932 |         23        0.33       18.92
                  933 |         14        0.20       19.12
                  934 |         25        0.36       19.48
                  935 |         21        0.30       19.78
                  936 |         22        0.31       20.09
                  937 |         18        0.26       20.35
                  938 |         15        0.21       20.56
                  939 |         18        0.26       20.82
                  940 |         25        0.36       21.17
                  941 |         18        0.26       21.43
                  942 |         26        0.37       21.80
                  943 |         26        0.37       22.17
                  944 |         15        0.21       22.38
                  945 |         27        0.38       22.77
                  946 |         23        0.33       23.09
                  947 |         24        0.34       23.43
                  948 |         17        0.24       23.68
                  949 |         27        0.38       24.06
                  950 |         19        0.27       24.33
                  951 |         28        0.40       24.73
                  952 |         21        0.30       25.03
                  953 |         33        0.47       25.50
                  954 |         12        0.17       25.67
                  955 |         17        0.24       25.91
                  956 |         21        0.30       26.21
                  957 |         35        0.50       26.71
                  958 |         15        0.21       26.92
                  959 |         13        0.18       27.11
                  960 |         16        0.23       27.33
                  961 |         18        0.26       27.59
                  962 |         28        0.40       27.99
                  963 |         19        0.27       28.26
                  964 |         30        0.43       28.69
                  965 |         19        0.27       28.96
                  966 |         15        0.21       29.17
                  967 |         20        0.28       29.45
                  968 |         35        0.50       29.95
                  969 |         14        0.20       30.15
                  970 |         12        0.17       30.32
                  971 |         27        0.38       30.71
                  972 |         20        0.28       30.99
                  973 |         22        0.31       31.30
                  974 |         12        0.17       31.47
                  975 |         24        0.34       31.82
                  976 |         31        0.44       32.26
                  977 |         31        0.44       32.70
                  978 |         26        0.37       33.07
                  979 |         24        0.34       33.41
                  980 |         21        0.30       33.71
                  981 |         26        0.37       34.08
                  982 |         23        0.33       34.41
                  983 |         24        0.34       34.75
                  984 |         17        0.24       34.99
                  985 |         26        0.37       35.36
                  986 |         30        0.43       35.79
                  987 |         24        0.34       36.13
                  988 |         33        0.47       36.60
                  989 |         17        0.24       36.84
                  990 |         31        0.44       37.28
                  991 |         25        0.36       37.64
                  992 |         30        0.43       38.06
                  993 |         32        0.46       38.52
                  994 |         31        0.44       38.96
                  995 |         16        0.23       39.19
                  996 |         29        0.41       39.60
                  997 |         28        0.40       40.00
                  998 |         29        0.41       40.41
                  999 |         21        0.30       40.71
                 1000 |         23        0.33       41.04
                 1001 |         20        0.28       41.32
                 1002 |         26        0.37       41.69
                 1003 |         30        0.43       42.12
                 1004 |         27        0.38       42.50
                 1005 |         30        0.43       42.93
                 1006 |         29        0.41       43.34
                 1007 |         22        0.31       43.65
                 1008 |         36        0.51       44.17
                 1009 |         25        0.36       44.52
                 1010 |         26        0.37       44.89
                 1011 |         38        0.54       45.43
                 1012 |         33        0.47       45.90
                 1013 |         16        0.23       46.13
                 1014 |         21        0.30       46.43
                 1015 |         22        0.31       46.74
                 1016 |         28        0.40       47.14
                 1017 |         33        0.47       47.61
                 1018 |         33        0.47       48.08
                 1019 |         18        0.26       48.34
                 1020 |         22        0.31       48.65
                 1021 |         28        0.40       49.05
                 1022 |         32        0.46       49.50
                 1023 |         29        0.41       49.91
                 1024 |         28        0.40       50.31
                 1025 |         17        0.24       50.55
                 1026 |         34        0.48       51.04
                 1027 |         34        0.48       51.52
                 1028 |         27        0.38       51.91
                 1029 |         27        0.38       52.29
                 1030 |         14        0.20       52.49
                 1031 |         32        0.46       52.95
                 1032 |         34        0.48       53.43
                 1033 |         22        0.31       53.74
                 1034 |         31        0.44       54.18
                 1035 |         25        0.36       54.54
                 1036 |         25        0.36       54.89
                 1037 |         37        0.53       55.42
                 1038 |         30        0.43       55.85
                 1039 |         18        0.26       56.10
                 1040 |         14        0.20       56.30
                 1041 |         22        0.31       56.62
                 1042 |         36        0.51       57.13
                 1043 |         36        0.51       57.64
                 1044 |         33        0.47       58.11
                 1045 |         17        0.24       58.35
                 1046 |         21        0.30       58.65
                 1047 |         32        0.46       59.11
                 1048 |         31        0.44       59.55
                 1049 |         12        0.17       59.72
                 1050 |         15        0.21       59.93
                 1051 |         16        0.23       60.16
                 1052 |         28        0.40       60.56
                 1053 |         35        0.50       61.06
                 1054 |         27        0.38       61.44
                 1055 |         17        0.24       61.68
                 1056 |         28        0.40       62.08
                 1057 |         36        0.51       62.59
                 1058 |         27        0.38       62.98
                 1059 |         23        0.33       63.30
                 1060 |         15        0.21       63.52
                 1061 |         22        0.31       63.83
                 1062 |         26        0.37       64.20
                 1063 |         35        0.50       64.70
                 1064 |         25        0.36       65.05
                 1065 |         18        0.26       65.31
                 1066 |         29        0.41       65.72
                 1067 |         29        0.41       66.14
                 1068 |         31        0.44       66.58
                 1069 |         26        0.37       66.95
                 1070 |         13        0.18       67.13
                 1071 |         27        0.38       67.52
                 1072 |         34        0.48       68.00
                 1073 |         21        0.30       68.30
                 1074 |         23        0.33       68.63
                 1075 |         15        0.21       68.84
                 1076 |         33        0.47       69.31
                 1077 |         32        0.46       69.76
                 1078 |         23        0.33       70.09
                 1079 |         18        0.26       70.35
                 1080 |         17        0.24       70.59
                 1081 |         20        0.28       70.87
                 1082 |         28        0.40       71.27
                 1083 |         29        0.41       71.68
                 1084 |         23        0.33       72.01
                 1085 |         10        0.14       72.15
                 1086 |         30        0.43       72.58
                 1087 |         16        0.23       72.81
                 1088 |         23        0.33       73.14
                 1089 |         22        0.31       73.45
                 1090 |         22        0.31       73.76
                 1091 |         14        0.20       73.96
                 1092 |         25        0.36       74.32
                 1093 |         28        0.40       74.72
                 1094 |         20        0.28       75.00
                 1095 |         22        0.31       75.31
                 1096 |         20        0.28       75.60
                 1097 |         27        0.38       75.98
                 1098 |         30        0.43       76.41
                 1099 |         21        0.30       76.71
                 1100 |         21        0.30       77.01
                 1101 |         17        0.24       77.25
                 1102 |         19        0.27       77.52
                 1103 |         12        0.17       77.69
                 1104 |         17        0.24       77.93
                 1105 |         17        0.24       78.17
                 1106 |         36        0.51       78.69
                 1107 |         14        0.20       78.88
                 1108 |         20        0.28       79.17
                 1109 |         16        0.23       79.40
                 1110 |          9        0.13       79.52
                 1111 |         10        0.14       79.67
                 1112 |         24        0.34       80.01
                 1113 |         27        0.38       80.39
                 1114 |         23        0.33       80.72
                 1115 |         18        0.26       80.98
                 1116 |         21        0.30       81.27
                 1117 |         28        0.40       81.67
                 1118 |         15        0.21       81.89
                 1119 |         15        0.21       82.10
                 1120 |         12        0.17       82.27
                 1121 |         24        0.34       82.61
                 1122 |         22        0.31       82.93
                 1123 |         17        0.24       83.17
                 1124 |         12        0.17       83.34
                 1125 |         16        0.23       83.57
                 1126 |         14        0.20       83.76
                 1127 |         20        0.28       84.05
                 1128 |         15        0.21       84.26
                 1129 |         15        0.21       84.48
                 1130 |         13        0.18       84.66
                 1131 |         19        0.27       84.93
                 1132 |         13        0.18       85.12
                 1133 |         19        0.27       85.39
                 1134 |         10        0.14       85.53
                 1135 |         13        0.18       85.71
                 1136 |         11        0.16       85.87
                 1137 |         25        0.36       86.23
                 1138 |          7        0.10       86.33
                 1139 |         16        0.23       86.55
                 1140 |         12        0.17       86.72
                 1141 |         15        0.21       86.94
                 1142 |         24        0.34       87.28
                 1143 |         26        0.37       87.65
                 1144 |         18        0.26       87.91
                 1145 |         12        0.17       88.08
                 1146 |         15        0.21       88.29
                 1147 |         23        0.33       88.62
                 1148 |         11        0.16       88.77
                 1149 |          9        0.13       88.90
                 1150 |         14        0.20       89.10
                 1151 |         15        0.21       89.31
                 1152 |         17        0.24       89.56
                 1153 |         20        0.28       89.84
                 1154 |         12        0.17       90.01
                 1155 |          5        0.07       90.08
                 1156 |         10        0.14       90.22
                 1157 |         16        0.23       90.45
                 1158 |         24        0.34       90.79
                 1159 |         11        0.16       90.95
                 1160 |          7        0.10       91.05
                 1161 |         18        0.26       91.31
                 1162 |         11        0.16       91.46
                 1163 |         14        0.20       91.66
                 1164 |         10        0.14       91.80
                 1165 |         10        0.14       91.95
                 1166 |          9        0.13       92.07
                 1167 |         14        0.20       92.27
                 1168 |         13        0.18       92.46
                 1169 |          1        0.01       92.47
                 1170 |         10        0.14       92.62
                 1171 |          8        0.11       92.73
                 1172 |         16        0.23       92.96
                 1173 |          8        0.11       93.07
                 1174 |         17        0.24       93.31
                 1175 |          4        0.06       93.37
                 1176 |          9        0.13       93.50
                 1177 |          9        0.13       93.63
                 1178 |          7        0.10       93.73
                 1179 |          9        0.13       93.85
                 1180 |          5        0.07       93.92
                 1181 |         10        0.14       94.07
                 1182 |         16        0.23       94.29
                 1183 |         13        0.18       94.48
                 1184 |          7        0.10       94.58
                 1185 |          2        0.03       94.61
                 1186 |          4        0.06       94.66
                 1187 |          5        0.07       94.74
                 1188 |          5        0.07       94.81
                 1189 |          4        0.06       94.86
                 1190 |          2        0.03       94.89
                 1191 |          7        0.10       94.99
                 1192 |          7        0.10       95.09
                 1193 |          4        0.06       95.15
                 1194 |          9        0.13       95.28
                 1195 |          6        0.09       95.36
                 1196 |         10        0.14       95.50
                 1197 |          8        0.11       95.62
                 1198 |          4        0.06       95.67
                 1199 |          5        0.07       95.75
                 1200 |          4        0.06       95.80
                 1201 |          9        0.13       95.93
                 1202 |         12        0.17       96.10
                 1203 |          8        0.11       96.22
                 1204 |          3        0.04       96.26
                 1205 |          5        0.07       96.33
                 1206 |          4        0.06       96.39
                 1207 |          7        0.10       96.49
                 1208 |          7        0.10       96.59
                 1209 |          5        0.07       96.66
                 1211 |          2        0.03       96.68
                 1212 |          3        0.04       96.73
                 1213 |         22        0.31       97.04
                 1214 |          5        0.07       97.11
                 1215 |          3        0.04       97.15
                 1216 |          4        0.06       97.21
                 1217 |          8        0.11       97.32
                 1218 |          3        0.04       97.37
                 1219 |          8        0.11       97.48
                 1220 |          1        0.01       97.50
                 1221 |          1        0.01       97.51
                 1222 |          2        0.03       97.54
                 1223 |          5        0.07       97.61
                 1224 |          7        0.10       97.71
                 1225 |          1        0.01       97.72
                 1226 |          4        0.06       97.78
                 1227 |          3        0.04       97.82
                 1228 |          4        0.06       97.88
                 1231 |          2        0.03       97.91
                 1232 |          4        0.06       97.97
                 1233 |          8        0.11       98.08
                 1234 |          1        0.01       98.09
                 1235 |          1        0.01       98.11
                 1236 |          1        0.01       98.12
                 1237 |          6        0.09       98.21
                 1238 |          4        0.06       98.26
                 1239 |          1        0.01       98.28
                 1240 |          2        0.03       98.31
                 1241 |          3        0.04       98.35
                 1242 |          7        0.10       98.45
                 1243 |          3        0.04       98.49
                 1244 |          3        0.04       98.53
                 1246 |          1        0.01       98.55
                 1247 |          1        0.01       98.56
                 1248 |          3        0.04       98.61
                 1249 |          1        0.01       98.62
                 1250 |          2        0.03       98.65
                 1251 |          4        0.06       98.71
                 1252 |          1        0.01       98.72
                 1253 |          3        0.04       98.76
                 1254 |          4        0.06       98.82
                 1255 |          4        0.06       98.88
                 1256 |          2        0.03       98.90
                 1257 |          4        0.06       98.96
                 1258 |          3        0.04       99.00
                 1259 |          1        0.01       99.02
                 1260 |          2        0.03       99.05
                 1261 |          2        0.03       99.08
                 1263 |          3        0.04       99.12
                 1265 |          1        0.01       99.13
                 1266 |          2        0.03       99.16
                 1267 |          2        0.03       99.19
                 1268 |          1        0.01       99.20
                 1269 |          1        0.01       99.22
                 1272 |          5        0.07       99.29
                 1274 |          1        0.01       99.30
                 1275 |          1        0.01       99.32
                 1276 |          1        0.01       99.33
                 1277 |          6        0.09       99.42
                 1278 |          2        0.03       99.45
                 1279 |          1        0.01       99.46
                 1280 |          1        0.01       99.47
                 1282 |          2        0.03       99.50
                 1283 |          1        0.01       99.52
                 1284 |          1        0.01       99.53
                 1285 |          4        0.06       99.59
                 1287 |          1        0.01       99.60
                 1288 |          1        0.01       99.62
                 1289 |          1        0.01       99.63
                 1290 |          1        0.01       99.64
                 1291 |          1        0.01       99.66
                 1297 |          2        0.03       99.69
                 1299 |          2        0.03       99.72
                 1301 |          2        0.03       99.74
                 1302 |          2        0.03       99.77
                 1309 |          2        0.03       99.80
                 1312 |          1        0.01       99.82
                 1313 |          1        0.01       99.83
                 1317 |          2        0.03       99.86
                 1321 |          1        0.01       99.87
                 1324 |          1        0.01       99.89
                 1327 |          3        0.04       99.93
                 1336 |          1        0.01       99.94
                 1358 |          1        0.01       99.96
                 1372 |          1        0.01       99.97
                 1374 |          1        0.01       99.99
                 1469 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . summ bicristalbreadth

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
          bicristalb~h |      7,028    274.5435    19.07584        197        362

          . tab bicristalbreadth // all seem reasonable. A typical range is 200-380mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

          bicristalbr |
                eadth |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                  197 |          1        0.01        0.01
                  201 |          1        0.01        0.03
                  205 |          1        0.01        0.04
                  209 |          1        0.01        0.06
                  212 |          1        0.01        0.07
                  213 |          2        0.03        0.10
                  214 |          2        0.03        0.13
                  219 |          1        0.01        0.14
                  220 |          3        0.04        0.18
                  221 |          1        0.01        0.20
                  222 |          2        0.03        0.23
                  223 |          2        0.03        0.26
                  224 |          2        0.03        0.28
                  225 |          5        0.07        0.36
                  226 |          4        0.06        0.41
                  227 |          7        0.10        0.51
                  228 |          6        0.09        0.60
                  229 |         12        0.17        0.77
                  230 |          9        0.13        0.90
                  231 |          8        0.11        1.01
                  232 |         15        0.21        1.22
                  233 |         15        0.21        1.44
                  234 |         15        0.21        1.65
                  235 |         25        0.36        2.01
                  236 |         15        0.21        2.22
                  237 |         15        0.21        2.43
                  238 |         17        0.24        2.68
                  239 |         28        0.40        3.07
                  240 |         32        0.46        3.53
                  241 |         30        0.43        3.96
                  242 |         27        0.38        4.34
                  243 |         46        0.65        4.99
                  244 |         32        0.46        5.45
                  245 |         42        0.60        6.05
                  246 |         55        0.78        6.83
                  247 |         42        0.60        7.43
                  248 |         42        0.60        8.03
                  249 |         54        0.77        8.79
                  250 |         69        0.98        9.78
                  251 |         53        0.75       10.53
                  252 |         76        1.08       11.61
                  253 |        104        1.48       13.09
                  254 |         75        1.07       14.16
                  255 |         95        1.35       15.51
                  256 |         91        1.29       16.80
                  257 |        107        1.52       18.33
                  258 |        120        1.71       20.03
                  259 |        107        1.52       21.56
                  260 |        100        1.42       22.98
                  261 |        123        1.75       24.73
                  262 |        131        1.86       26.59
                  263 |        143        2.03       28.63
                  264 |        145        2.06       30.69
                  265 |        115        1.64       32.33
                  266 |        141        2.01       34.33
                  267 |        108        1.54       35.87
                  268 |        184        2.62       38.49
                  269 |        125        1.78       40.27
                  270 |        139        1.98       42.25
                  271 |        122        1.74       43.98
                  272 |        134        1.91       45.89
                  273 |        191        2.72       48.61
                  274 |        172        2.45       51.05
                  275 |        131        1.86       52.92
                  276 |        127        1.81       54.72
                  277 |        123        1.75       56.47
                  278 |        152        2.16       58.64
                  279 |        118        1.68       60.32
                  280 |        119        1.69       62.01
                  281 |        136        1.94       63.94
                  282 |        174        2.48       66.42
                  283 |        145        2.06       68.48
                  284 |        153        2.18       70.66
                  285 |         93        1.32       71.98
                  286 |        136        1.94       73.92
                  287 |        108        1.54       75.46
                  288 |        124        1.76       77.22
                  289 |        120        1.71       78.93
                  290 |         94        1.34       80.26
                  291 |        101        1.44       81.70
                  292 |         93        1.32       83.03
                  293 |        104        1.48       84.50
                  294 |         77        1.10       85.60
                  295 |         85        1.21       86.81
                  296 |         88        1.25       88.06
                  297 |         46        0.65       88.72
                  298 |         69        0.98       89.70
                  299 |         62        0.88       90.58
                  300 |         69        0.98       91.56
                  301 |         57        0.81       92.37
                  302 |         58        0.83       93.20
                  303 |         51        0.73       93.92
                  304 |         35        0.50       94.42
                  305 |         41        0.58       95.01
                  306 |         36        0.51       95.52
                  307 |         24        0.34       95.86
                  308 |         30        0.43       96.29
                  309 |         22        0.31       96.60
                  310 |         26        0.37       96.97
                  311 |         16        0.23       97.20
                  312 |         11        0.16       97.35
                  313 |         19        0.27       97.62
                  314 |         26        0.37       97.99
                  315 |         16        0.23       98.22
                  316 |         12        0.17       98.39
                  317 |         10        0.14       98.53
                  318 |          8        0.11       98.65
                  319 |          7        0.10       98.75
                  320 |          5        0.07       98.82
                  321 |          4        0.06       98.88
                  322 |          8        0.11       98.99
                  323 |          6        0.09       99.08
                  324 |          4        0.06       99.13
                  325 |          6        0.09       99.22
                  326 |          9        0.13       99.35
                  328 |          7        0.10       99.45
                  329 |          6        0.09       99.53
                  330 |          3        0.04       99.57
                  331 |          3        0.04       99.62
                  332 |          6        0.09       99.70
                  333 |          2        0.03       99.73
                  334 |          2        0.03       99.76
                  335 |          2        0.03       99.79
                  336 |          4        0.06       99.84
                  337 |          1        0.01       99.86
                  338 |          4        0.06       99.91
                  339 |          1        0.01       99.93
                  340 |          1        0.01       99.94
                  343 |          1        0.01       99.96
                  347 |          1        0.01       99.97
                  356 |          1        0.01       99.99
                  362 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . summ hipbreadth

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
            hipbreadth |      7,028    348.4102    24.99114        264        473

          . tab hipbreadth // all seem reasonable. A typical range is 250-450mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

           hipbreadth |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                  264 |          3        0.04        0.04
                  268 |          1        0.01        0.06
                  276 |          1        0.01        0.07
                  277 |          1        0.01        0.09
                  280 |          1        0.01        0.10
                  282 |          1        0.01        0.11
                  283 |          1        0.01        0.13
                  284 |          6        0.09        0.21
                  285 |          2        0.03        0.24
                  286 |          5        0.07        0.31
                  287 |          6        0.09        0.40
                  288 |          5        0.07        0.47
                  289 |          1        0.01        0.48
                  290 |          8        0.11        0.60
                  291 |          9        0.13        0.73
                  292 |          3        0.04        0.77
                  293 |          9        0.13        0.90
                  294 |          9        0.13        1.02
                  295 |          5        0.07        1.10
                  296 |         13        0.18        1.28
                  297 |          8        0.11        1.39
                  298 |         20        0.28        1.68
                  299 |         11        0.16        1.84
                  300 |         19        0.27        2.11
                  301 |         17        0.24        2.35
                  302 |         15        0.21        2.56
                  303 |         19        0.27        2.83
                  304 |         16        0.23        3.06
                  305 |         16        0.23        3.29
                  306 |         23        0.33        3.61
                  307 |         36        0.51        4.13
                  308 |         39        0.55        4.68
                  309 |         26        0.37        5.05
                  310 |         30        0.43        5.48
                  311 |         38        0.54        6.02
                  312 |         34        0.48        6.50
                  313 |         42        0.60        7.10
                  314 |         41        0.58        7.68
                  315 |         35        0.50        8.18
                  316 |         52        0.74        8.92
                  317 |         68        0.97        9.89
                  318 |         72        1.02       10.91
                  319 |         51        0.73       11.64
                  320 |         71        1.01       12.65
                  321 |         51        0.73       13.38
                  322 |         80        1.14       14.51
                  323 |         61        0.87       15.38
                  324 |         74        1.05       16.43
                  325 |         57        0.81       17.25
                  326 |         78        1.11       18.36
                  327 |         80        1.14       19.49
                  328 |         76        1.08       20.57
                  329 |         79        1.12       21.70
                  330 |         68        0.97       22.67
                  331 |        115        1.64       24.30
                  332 |        127        1.81       26.11
                  333 |        100        1.42       27.53
                  334 |        128        1.82       29.35
                  335 |         80        1.14       30.49
                  336 |        101        1.44       31.93
                  337 |        130        1.85       33.78
                  338 |        142        2.02       35.80
                  339 |         98        1.39       37.19
                  340 |        104        1.48       38.67
                  341 |        132        1.88       40.55
                  342 |        126        1.79       42.34
                  343 |        148        2.11       44.45
                  344 |        134        1.91       46.36
                  345 |         87        1.24       47.60
                  346 |        115        1.64       49.23
                  347 |        115        1.64       50.87
                  348 |        108        1.54       52.40
                  349 |         93        1.32       53.73
                  350 |         96        1.37       55.09
                  351 |        119        1.69       56.79
                  352 |        121        1.72       58.51
                  353 |        120        1.71       60.22
                  354 |        115        1.64       61.85
                  355 |         94        1.34       63.19
                  356 |        102        1.45       64.64
                  357 |        115        1.64       66.28
                  358 |        134        1.91       68.18
                  359 |         73        1.04       69.22
                  360 |         66        0.94       70.16
                  361 |         99        1.41       71.57
                  362 |        112        1.59       73.16
                  363 |         93        1.32       74.49
                  364 |         89        1.27       75.75
                  365 |         78        1.11       76.86
                  366 |        112        1.59       78.46
                  367 |         77        1.10       79.55
                  368 |         95        1.35       80.90
                  369 |         55        0.78       81.69
                  370 |         68        0.97       82.66
                  371 |         71        1.01       83.67
                  372 |         69        0.98       84.65
                  373 |         56        0.80       85.44
                  374 |         54        0.77       86.21
                  375 |         42        0.60       86.81
                  376 |         53        0.75       87.56
                  377 |         39        0.55       88.12
                  378 |         49        0.70       88.82
                  379 |         33        0.47       89.29
                  380 |         44        0.63       89.91
                  381 |         47        0.67       90.58
                  382 |         45        0.64       91.22
                  383 |         39        0.55       91.78
                  384 |         40        0.57       92.34
                  385 |         22        0.31       92.66
                  386 |         35        0.50       93.16
                  387 |         31        0.44       93.60
                  388 |         22        0.31       93.91
                  389 |         21        0.30       94.21
                  390 |         22        0.31       94.52
                  391 |         26        0.37       94.89
                  392 |         26        0.37       95.26
                  393 |         26        0.37       95.63
                  394 |         13        0.18       95.82
                  395 |         12        0.17       95.99
                  396 |         19        0.27       96.26
                  397 |         16        0.23       96.49
                  398 |         17        0.24       96.73
                  399 |         14        0.20       96.93
                  400 |         17        0.24       97.17
                  401 |         13        0.18       97.35
                  402 |         19        0.27       97.62
                  403 |         12        0.17       97.79
                  404 |         10        0.14       97.94
                  405 |          8        0.11       98.05
                  406 |         10        0.14       98.19
                  407 |         11        0.16       98.35
                  408 |         10        0.14       98.49
                  409 |          6        0.09       98.58
                  410 |          8        0.11       98.69
                  411 |          8        0.11       98.80
                  412 |          7        0.10       98.90
                  413 |          4        0.06       98.96
                  414 |          2        0.03       98.99
                  415 |          2        0.03       99.02
                  416 |          6        0.09       99.10
                  417 |          6        0.09       99.19
                  418 |          2        0.03       99.22
                  419 |          7        0.10       99.32
                  420 |          2        0.03       99.35
                  421 |          3        0.04       99.39
                  422 |          5        0.07       99.46
                  423 |          5        0.07       99.53
                  425 |          2        0.03       99.56
                  426 |          1        0.01       99.57
                  427 |          5        0.07       99.64
                  428 |          5        0.07       99.72
                  430 |          1        0.01       99.73
                  431 |          2        0.03       99.76
                  432 |          1        0.01       99.77
                  433 |          3        0.04       99.82
                  439 |          1        0.01       99.83
                  441 |          2        0.03       99.86
                  442 |          1        0.01       99.87
                  443 |          1        0.01       99.89
                  444 |          1        0.01       99.90
                  445 |          1        0.01       99.91
                  448 |          2        0.03       99.94
                  452 |          1        0.01       99.96
                  457 |          1        0.01       99.97
                  470 |          1        0.01       99.99
                  473 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . summ hipbreadthsitting

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
          hipbreadth~g |      7,028     385.892    32.03365        280        541

          . tab hipbreadthsitting // all seem reasonable. A typical range is 250-500mm and all the values either fall within or are close enough to not want to mark as suspicious/unreasonable.

          hipbreadths |
               itting |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                  280 |          2        0.03        0.03
                  288 |          1        0.01        0.04
                  291 |          1        0.01        0.06
                  295 |          1        0.01        0.07
                  299 |          2        0.03        0.10
                  301 |          1        0.01        0.11
                  304 |          1        0.01        0.13
                  306 |          2        0.03        0.16
                  307 |          1        0.01        0.17
                  308 |          3        0.04        0.21
                  309 |          1        0.01        0.23
                  310 |          1        0.01        0.24
                  311 |          2        0.03        0.27
                  312 |          6        0.09        0.36
                  313 |          7        0.10        0.46
                  314 |          5        0.07        0.53
                  315 |          4        0.06        0.58
                  316 |         13        0.18        0.77
                  317 |          7        0.10        0.87
                  318 |         15        0.21        1.08
                  319 |          4        0.06        1.14
                  320 |          6        0.09        1.22
                  321 |          5        0.07        1.29
                  322 |          8        0.11        1.41
                  323 |          9        0.13        1.54
                  324 |          8        0.11        1.65
                  325 |          7        0.10        1.75
                  326 |         16        0.23        1.98
                  327 |          7        0.10        2.08
                  328 |         21        0.30        2.38
                  329 |         13        0.18        2.56
                  330 |         26        0.37        2.93
                  331 |         28        0.40        3.33
                  332 |         17        0.24        3.57
                  333 |         25        0.36        3.93
                  334 |         30        0.43        4.35
                  335 |         22        0.31        4.67
                  336 |         19        0.27        4.94
                  337 |         39        0.55        5.49
                  338 |         38        0.54        6.03
                  339 |         32        0.46        6.49
                  340 |         39        0.55        7.04
                  341 |         30        0.43        7.47
                  342 |         30        0.43        7.90
                  343 |         43        0.61        8.51
                  344 |         45        0.64        9.15
                  345 |         34        0.48        9.63
                  346 |         47        0.67       10.30
                  347 |         50        0.71       11.01
                  348 |         45        0.64       11.65
                  349 |         38        0.54       12.19
                  350 |         61        0.87       13.06
                  351 |         54        0.77       13.83
                  352 |         54        0.77       14.60
                  353 |         49        0.70       15.30
                  354 |         61        0.87       16.16
                  355 |         73        1.04       17.20
                  356 |         57        0.81       18.01
                  357 |         52        0.74       18.75
                  358 |         65        0.92       19.68
                  359 |         42        0.60       20.28
                  360 |         72        1.02       21.30
                  361 |         53        0.75       22.05
                  362 |         74        1.05       23.11
                  363 |         85        1.21       24.32
                  364 |         79        1.12       25.44
                  365 |         55        0.78       26.22
                  366 |         86        1.22       27.45
                  367 |         93        1.32       28.77
                  368 |         78        1.11       29.88
                  369 |         77        1.10       30.98
                  370 |         87        1.24       32.21
                  371 |         84        1.20       33.41
                  372 |         88        1.25       34.66
                  373 |         91        1.29       35.96
                  374 |        105        1.49       37.45
                  375 |         77        1.10       38.55
                  376 |         78        1.11       39.66
                  377 |         89        1.27       40.92
                  378 |         94        1.34       42.26
                  379 |         80        1.14       43.40
                  380 |        128        1.82       45.22
                  381 |         95        1.35       46.57
                  382 |         99        1.41       47.98
                  383 |         96        1.37       49.35
                  384 |         92        1.31       50.65
                  385 |        108        1.54       52.19
                  386 |         78        1.11       53.30
                  387 |        112        1.59       54.89
                  388 |        102        1.45       56.35
                  389 |         61        0.87       57.21
                  390 |         96        1.37       58.58
                  391 |        101        1.44       60.02
                  392 |         63        0.90       60.91
                  393 |         86        1.22       62.14
                  394 |         99        1.41       63.55
                  395 |         61        0.87       64.41
                  396 |         78        1.11       65.52
                  397 |         87        1.24       66.76
                  398 |         77        1.10       67.86
                  399 |         65        0.92       68.78
                  400 |         77        1.10       69.88
                  401 |         55        0.78       70.66
                  402 |         76        1.08       71.74
                  403 |         71        1.01       72.75
                  404 |         70        1.00       73.75
                  405 |         54        0.77       74.52
                  406 |         76        1.08       75.60
                  407 |         58        0.83       76.42
                  408 |         63        0.90       77.32
                  409 |         63        0.90       78.22
                  410 |         79        1.12       79.34
                  411 |         42        0.60       79.94
                  412 |         50        0.71       80.65
                  413 |         63        0.90       81.55
                  414 |         46        0.65       82.20
                  415 |         57        0.81       83.01
                  416 |         45        0.64       83.65
                  417 |         44        0.63       84.28
                  418 |         63        0.90       85.17
                  419 |         32        0.46       85.63
                  420 |         55        0.78       86.41
                  421 |         37        0.53       86.94
                  422 |         29        0.41       87.35
                  423 |         40        0.57       87.92
                  424 |         40        0.57       88.49
                  425 |         37        0.53       89.02
                  426 |         27        0.38       89.40
                  427 |         48        0.68       90.08
                  428 |         39        0.55       90.64
                  429 |         30        0.43       91.06
                  430 |         34        0.48       91.55
                  431 |         26        0.37       91.92
                  432 |         18        0.26       92.17
                  433 |         34        0.48       92.66
                  434 |         27        0.38       93.04
                  435 |         28        0.40       93.44
                  436 |         22        0.31       93.75
                  437 |         19        0.27       94.02
                  438 |         29        0.41       94.44
                  439 |         16        0.23       94.66
                  440 |         23        0.33       94.99
                  441 |          9        0.13       95.12
                  442 |         28        0.40       95.52
                  443 |         16        0.23       95.75
                  444 |         13        0.18       95.93
                  445 |          6        0.09       96.02
                  446 |          7        0.10       96.12
                  447 |         15        0.21       96.33
                  448 |         12        0.17       96.50
                  449 |          6        0.09       96.59
                  450 |         17        0.24       96.83
                  451 |          9        0.13       96.96
                  452 |          9        0.13       97.08
                  453 |          9        0.13       97.21
                  454 |         10        0.14       97.35
                  455 |         11        0.16       97.51
                  456 |         11        0.16       97.67
                  457 |          8        0.11       97.78
                  458 |          7        0.10       97.88
                  459 |          7        0.10       97.98
                  460 |          6        0.09       98.06
                  461 |         10        0.14       98.21
                  462 |          9        0.13       98.34
                  463 |          8        0.11       98.45
                  464 |         11        0.16       98.61
                  465 |          2        0.03       98.63
                  466 |          9        0.13       98.76
                  467 |          3        0.04       98.80
                  468 |          5        0.07       98.88
                  469 |          1        0.01       98.89
                  470 |          3        0.04       98.93
                  471 |          1        0.01       98.95
                  472 |          4        0.06       99.00
                  473 |          2        0.03       99.03
                  474 |          2        0.03       99.06
                  475 |          8        0.11       99.17
                  476 |          3        0.04       99.22
                  477 |          5        0.07       99.29
                  478 |          5        0.07       99.36
                  479 |          3        0.04       99.40
                  480 |          2        0.03       99.43
                  481 |          2        0.03       99.46
                  482 |          3        0.04       99.50
                  483 |          1        0.01       99.52
                  484 |          1        0.01       99.53
                  485 |          3        0.04       99.57
                  486 |          1        0.01       99.59
                  487 |          5        0.07       99.66
                  488 |          2        0.03       99.69
                  490 |          1        0.01       99.70
                  491 |          2        0.03       99.73
                  495 |          3        0.04       99.77
                  498 |          3        0.04       99.82
                  499 |          5        0.07       99.89
                  501 |          1        0.01       99.90
                  505 |          2        0.03       99.93
                  509 |          1        0.01       99.94
                  518 |          1        0.01       99.96
                  533 |          1        0.01       99.97
                  538 |          1        0.01       99.99
                  541 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . summ weightkg

              Variable |        Obs        Mean    Std. dev.       Min        Max
          -------------+---------------------------------------------------------
              weightkg |      7,028    84.12565    58.08255       35.8       1099

          . tab weightkg 

             weightkg |      Freq.     Percent        Cum.
          ------------+-----------------------------------
                 35.8 |          1        0.01        0.01
                 39.3 |          2        0.03        0.04
                   40 |          1        0.01        0.06
                 42.6 |          2        0.03        0.09
                 42.8 |          1        0.01        0.10
                   43 |          1        0.01        0.11
                 43.1 |          1        0.01        0.13
                 43.2 |          1        0.01        0.14
                 43.5 |          1        0.01        0.16
                 44.2 |          1        0.01        0.17
                 44.4 |          1        0.01        0.18
                 44.5 |          1        0.01        0.20
                   45 |          3        0.04        0.24
                 45.2 |          1        0.01        0.26
                 45.4 |          1        0.01        0.27
                 45.9 |          1        0.01        0.28
                   46 |          1        0.01        0.30
                 46.2 |          1        0.01        0.31
                 46.3 |          1        0.01        0.33
                 46.4 |          1        0.01        0.34
                 46.7 |          3        0.04        0.38
                 46.8 |          3        0.04        0.43
                 46.9 |          3        0.04        0.47
                   47 |          4        0.06        0.53
                 47.1 |          2        0.03        0.55
                 47.4 |          2        0.03        0.58
                 47.5 |          1        0.01        0.60
                 47.6 |          1        0.01        0.61
                 47.7 |          1        0.01        0.63
                 47.8 |          5        0.07        0.70
                   48 |          3        0.04        0.74
                 48.4 |          1        0.01        0.75
                 48.5 |          3        0.04        0.80
                 48.7 |          2        0.03        0.83
                 48.8 |          2        0.03        0.85
                 48.9 |          3        0.04        0.90
                   49 |          1        0.01        0.91
                 49.1 |          1        0.01        0.92
                 49.3 |          2        0.03        0.95
                 49.6 |          1        0.01        0.97
                 49.7 |          3        0.04        1.01
                 49.9 |          5        0.07        1.08
                   50 |          2        0.03        1.11
                 50.1 |          2        0.03        1.14
                 50.2 |          4        0.06        1.20
                 50.3 |          3        0.04        1.24
                 50.4 |          5        0.07        1.31
                 50.5 |          6        0.09        1.39
                 50.6 |          1        0.01        1.41
                 50.7 |          2        0.03        1.44
                 50.8 |          5        0.07        1.51
                 50.9 |          3        0.04        1.55
                   51 |          3        0.04        1.59
                 51.1 |          2        0.03        1.62
                 51.2 |          2        0.03        1.65
                 51.3 |          2        0.03        1.68
                 51.5 |          1        0.01        1.69
                 51.6 |          5        0.07        1.76
                 51.7 |          3        0.04        1.81
                 51.8 |          4        0.06        1.86
                 51.9 |          2        0.03        1.89
                   52 |          4        0.06        1.95
                 52.1 |          1        0.01        1.96
                 52.2 |          5        0.07        2.03
                 52.3 |          6        0.09        2.12
                 52.4 |          4        0.06        2.18
                 52.5 |          2        0.03        2.21
                 52.6 |          7        0.10        2.31
                 52.7 |          1        0.01        2.32
                 52.8 |          3        0.04        2.36
                 52.9 |          8        0.11        2.48
                   53 |          4        0.06        2.53
                 53.1 |          1        0.01        2.55
                 53.2 |          5        0.07        2.62
                 53.3 |          4        0.06        2.68
                 53.4 |          2        0.03        2.70
                 53.5 |          6        0.09        2.79
                 53.6 |          6        0.09        2.87
                 53.7 |          5        0.07        2.95
                 53.8 |          3        0.04        2.99
                 53.9 |          3        0.04        3.03
                   54 |          8        0.11        3.14
                 54.1 |          1        0.01        3.16
                 54.2 |          5        0.07        3.23
                 54.3 |          1        0.01        3.24
                 54.4 |          3        0.04        3.29
                 54.5 |          3        0.04        3.33
                 54.6 |          7        0.10        3.43
                 54.7 |          3        0.04        3.47
                 54.8 |          8        0.11        3.59
                 54.9 |         10        0.14        3.73
                   55 |          4        0.06        3.78
                 55.1 |          3        0.04        3.83
                 55.2 |          5        0.07        3.90
                 55.3 |          5        0.07        3.97
                 55.4 |          1        0.01        3.98
                 55.5 |          5        0.07        4.06
                 55.6 |          5        0.07        4.13
                 55.7 |          9        0.13        4.25
                 55.8 |          6        0.09        4.34
                 55.9 |          7        0.10        4.44
                   56 |          8        0.11        4.55
                 56.1 |         10        0.14        4.70
                 56.2 |          4        0.06        4.75
                 56.3 |          9        0.13        4.88
                 56.4 |          8        0.11        4.99
                 56.5 |          4        0.06        5.05
                 56.6 |          8        0.11        5.17
                 56.7 |          9        0.13        5.29
                 56.8 |          5        0.07        5.36
                 56.9 |          5        0.07        5.44
                   57 |          5        0.07        5.51
                 57.1 |          3        0.04        5.55
                 57.2 |          8        0.11        5.66
                 57.3 |          8        0.11        5.78
                 57.4 |          8        0.11        5.89
                 57.5 |          7        0.10        5.99
                 57.6 |          8        0.11        6.10
                 57.7 |         10        0.14        6.25
                 57.8 |         12        0.17        6.42
                 57.9 |          6        0.09        6.50
                   58 |          8        0.11        6.62
                 58.1 |          9        0.13        6.74
                 58.2 |         10        0.14        6.89
                 58.3 |         11        0.16        7.04
                 58.4 |          7        0.10        7.14
                 58.5 |         11        0.16        7.30
                 58.6 |          4        0.06        7.36
                 58.7 |          7        0.10        7.46
                 58.8 |          7        0.10        7.56
                 58.9 |         10        0.14        7.70
                   59 |          9        0.13        7.83
                 59.1 |         22        0.31        8.14
                 59.2 |          7        0.10        8.24
                 59.3 |         10        0.14        8.38
                 59.4 |          6        0.09        8.47
                 59.5 |          5        0.07        8.54
                 59.6 |          9        0.13        8.67
                 59.7 |         12        0.17        8.84
                 59.8 |          8        0.11        8.95
                 59.9 |         11        0.16        9.11
                   60 |          6        0.09        9.19
                 60.1 |         17        0.24        9.43
                 60.2 |         12        0.17        9.60
                 60.3 |          9        0.13        9.73
                 60.4 |         11        0.16        9.89
                 60.5 |          5        0.07        9.96
                 60.6 |          8        0.11       10.07
                 60.7 |         12        0.17       10.24
                 60.8 |          9        0.13       10.37
                 60.9 |         16        0.23       10.60
                   61 |          9        0.13       10.73
                 61.1 |         12        0.17       10.90
                 61.2 |          3        0.04       10.94
                 61.3 |         11        0.16       11.10
                 61.4 |          9        0.13       11.23
                 61.5 |          4        0.06       11.28
                 61.6 |         12        0.17       11.45
                 61.7 |         12        0.17       11.62
                 61.8 |         14        0.20       11.82
                 61.9 |          5        0.07       11.90
                   62 |         14        0.20       12.09
                 62.1 |         13        0.18       12.28
                 62.2 |         13        0.18       12.46
                 62.3 |         10        0.14       12.61
                 62.4 |          5        0.07       12.68
                 62.5 |          8        0.11       12.79
                 62.6 |         12        0.17       12.96
                 62.7 |          7        0.10       13.06
                 62.8 |          9        0.13       13.19
                 62.9 |          7        0.10       13.29
                   63 |         17        0.24       13.53
                 63.1 |         17        0.24       13.77
                 63.2 |         12        0.17       13.94
                 63.3 |         16        0.23       14.17
                 63.4 |         12        0.17       14.34
                 63.5 |          8        0.11       14.46
                 63.6 |          7        0.10       14.56
                 63.7 |          8        0.11       14.67
                 63.8 |          8        0.11       14.78
                 63.9 |         13        0.18       14.97
                   64 |         11        0.16       15.13
                 64.1 |         10        0.14       15.27
                 64.2 |         13        0.18       15.45
                 64.3 |         17        0.24       15.69
                 64.4 |         17        0.24       15.94
                 64.5 |         15        0.21       16.15
                 64.6 |         19        0.27       16.42
                 64.7 |         16        0.23       16.65
                 64.8 |         12        0.17       16.82
                 64.9 |         17        0.24       17.06
                   65 |         18        0.26       17.32
                 65.1 |          8        0.11       17.43
                 65.2 |         12        0.17       17.60
                 65.3 |         11        0.16       17.76
                 65.4 |         21        0.30       18.06
                 65.5 |         15        0.21       18.27
                 65.6 |          7        0.10       18.37
                 65.7 |         19        0.27       18.64
                 65.8 |         17        0.24       18.88
                 65.9 |         14        0.20       19.08
                   66 |         17        0.24       19.32
                 66.1 |         18        0.26       19.58
                 66.2 |         17        0.24       19.82
                 66.3 |         22        0.31       20.13
                 66.4 |         13        0.18       20.32
                 66.5 |         15        0.21       20.53
                 66.6 |         17        0.24       20.77
                 66.7 |         17        0.24       21.02
                 66.8 |         11        0.16       21.17
                 66.9 |         22        0.31       21.49
                   67 |         15        0.21       21.70
                 67.1 |         13        0.18       21.88
                 67.2 |         17        0.24       22.13
                 67.3 |         12        0.17       22.30
                 67.4 |         13        0.18       22.48
                 67.5 |         18        0.26       22.74
                 67.6 |         20        0.28       23.02
                 67.7 |         19        0.27       23.29
                 67.8 |         18        0.26       23.55
                 67.9 |          8        0.11       23.66
                   68 |         17        0.24       23.90
                 68.1 |         16        0.23       24.13
                 68.2 |         19        0.27       24.40
                 68.3 |         16        0.23       24.63
                 68.4 |         13        0.18       24.82
                 68.5 |         16        0.23       25.04
                 68.6 |         20        0.28       25.33
                 68.7 |         13        0.18       25.51
                 68.8 |         13        0.18       25.70
                 68.9 |         19        0.27       25.97
                   69 |         20        0.28       26.25
                 69.1 |         17        0.24       26.49
                 69.2 |         11        0.16       26.65
                 69.3 |         10        0.14       26.79
                 69.4 |         16        0.23       27.02
                 69.5 |         24        0.34       27.36
                 69.6 |         16        0.23       27.59
                 69.7 |         20        0.28       27.87
                 69.8 |         16        0.23       28.10
                 69.9 |         21        0.30       28.40
                   70 |         20        0.28       28.69
                 70.1 |         18        0.26       28.94
                 70.2 |         16        0.23       29.17
                 70.3 |         16        0.23       29.40
                 70.4 |         15        0.21       29.61
                 70.5 |         16        0.23       29.84
                 70.6 |         10        0.14       29.98
                 70.7 |         10        0.14       30.12
                 70.8 |         22        0.31       30.44
                 70.9 |         14        0.20       30.63
                   71 |         12        0.17       30.81
                 71.1 |         12        0.17       30.98
                 71.2 |         16        0.23       31.20
                 71.3 |         16        0.23       31.43
                 71.4 |         12        0.17       31.60
                 71.5 |         15        0.21       31.82
                 71.6 |         17        0.24       32.06
                 71.7 |         24        0.34       32.40
                 71.8 |         10        0.14       32.54
                 71.9 |         17        0.24       32.78
                   72 |         13        0.18       32.97
                 72.1 |         14        0.20       33.17
                 72.2 |         16        0.23       33.39
                 72.3 |         12        0.17       33.57
                 72.4 |         15        0.21       33.78
                 72.5 |         20        0.28       34.06
                 72.6 |         15        0.21       34.28
                 72.7 |         28        0.40       34.68
                 72.8 |          8        0.11       34.79
                 72.9 |         15        0.21       35.00
                   73 |         20        0.28       35.29
                 73.1 |          9        0.13       35.42
                 73.2 |         17        0.24       35.66
                 73.3 |         10        0.14       35.80
                 73.4 |         20        0.28       36.08
                 73.5 |         20        0.28       36.37
                 73.6 |         19        0.27       36.64
                 73.7 |         19        0.27       36.91
                 73.8 |         13        0.18       37.09
                 73.9 |         11        0.16       37.25
                   74 |         19        0.27       37.52
                 74.1 |         13        0.18       37.71
                 74.2 |         20        0.28       37.99
                 74.3 |         11        0.16       38.15
                 74.4 |         23        0.33       38.47
                 74.5 |         11        0.16       38.63
                 74.6 |         19        0.27       38.90
                 74.7 |          9        0.13       39.03
                 74.8 |         14        0.20       39.23
                 74.9 |         18        0.26       39.48
                   75 |         22        0.31       39.80
                 75.1 |         13        0.18       39.98
                 75.2 |         17        0.24       40.22
                 75.3 |         22        0.31       40.54
                 75.4 |         17        0.24       40.78
                 75.5 |         13        0.18       40.96
                 75.6 |         16        0.23       41.19
                 75.7 |         16        0.23       41.42
                 75.8 |         24        0.34       41.76
                 75.9 |         15        0.21       41.97
                   76 |         22        0.31       42.29
                 76.1 |         21        0.30       42.59
                 76.2 |         18        0.26       42.84
                 76.3 |         14        0.20       43.04
                 76.4 |         15        0.21       43.26
                 76.5 |         23        0.33       43.58
                 76.6 |         24        0.34       43.92
                 76.7 |         14        0.20       44.12
                 76.8 |         14        0.20       44.32
                 76.9 |         11        0.16       44.48
                   77 |          9        0.13       44.61
                 77.1 |         25        0.36       44.96
                 77.2 |         17        0.24       45.20
                 77.3 |         25        0.36       45.56
                 77.4 |         16        0.23       45.79
                 77.5 |         26        0.37       46.16
                 77.6 |         17        0.24       46.40
                 77.7 |         14        0.20       46.60
                 77.8 |         18        0.26       46.86
                 77.9 |         20        0.28       47.14
                   78 |         17        0.24       47.38
                 78.1 |         21        0.30       47.68
                 78.2 |         19        0.27       47.95
                 78.3 |         17        0.24       48.19
                 78.4 |         22        0.31       48.51
                 78.5 |         17        0.24       48.75
                 78.6 |         18        0.26       49.00
                 78.7 |         14        0.20       49.20
                 78.8 |         18        0.26       49.46
                 78.9 |         13        0.18       49.64
                   79 |         10        0.14       49.79
                 79.1 |         30        0.43       50.21
                 79.2 |         17        0.24       50.46
                 79.3 |         20        0.28       50.74
                 79.4 |         13        0.18       50.92
                 79.5 |         14        0.20       51.12
                 79.6 |         15        0.21       51.34
                 79.7 |         25        0.36       51.69
                 79.8 |         14        0.20       51.89
                 79.9 |         18        0.26       52.15
                   80 |          9        0.13       52.28
                 80.1 |         22        0.31       52.59
                 80.2 |         18        0.26       52.85
                 80.3 |         12        0.17       53.02
                 80.4 |         24        0.34       53.36
                 80.5 |          5        0.07       53.43
                 80.6 |         13        0.18       53.61
                 80.7 |         16        0.23       53.84
                 80.8 |         18        0.26       54.10
                 80.9 |         23        0.33       54.43
                   81 |         15        0.21       54.64
                 81.1 |         16        0.23       54.87
                 81.2 |         17        0.24       55.11
                 81.3 |         18        0.26       55.36
                 81.4 |         11        0.16       55.52
                 81.5 |         13        0.18       55.71
                 81.6 |         18        0.26       55.96
                 81.7 |         15        0.21       56.18
                 81.8 |         15        0.21       56.39
                 81.9 |         22        0.31       56.70
                   82 |         13        0.18       56.89
                 82.1 |         19        0.27       57.16
                 82.2 |         21        0.30       57.46
                 82.3 |         19        0.27       57.73
                 82.4 |         15        0.21       57.94
                 82.5 |         14        0.20       58.14
                 82.6 |         17        0.24       58.38
                 82.7 |         15        0.21       58.59
                 82.8 |         18        0.26       58.85
                 82.9 |         21        0.30       59.15
                   83 |         15        0.21       59.36
                 83.1 |         18        0.26       59.62
                 83.2 |         16        0.23       59.85
                 83.3 |         18        0.26       60.10
                 83.4 |         13        0.18       60.29
                 83.5 |         16        0.23       60.52
                 83.6 |         12        0.17       60.69
                 83.7 |         17        0.24       60.93
                 83.8 |         11        0.16       61.08
                 83.9 |          7        0.10       61.18
                   84 |         19        0.27       61.45
                 84.1 |         11        0.16       61.61
                 84.2 |         25        0.36       61.97
                 84.3 |         14        0.20       62.17
                 84.4 |         15        0.21       62.38
                 84.5 |         16        0.23       62.61
                 84.6 |         26        0.37       62.98
                 84.7 |         17        0.24       63.22
                 84.8 |         15        0.21       63.43
                 84.9 |         14        0.20       63.63
                   85 |         14        0.20       63.83
                 85.1 |         15        0.21       64.04
                 85.2 |         19        0.27       64.31
                 85.3 |          7        0.10       64.41
                 85.4 |         10        0.14       64.56
                 85.5 |         12        0.17       64.73
                 85.6 |         17        0.24       64.97
                 85.7 |         20        0.28       65.25
                 85.8 |         22        0.31       65.57
                 85.9 |         16        0.23       65.79
                   86 |         15        0.21       66.01
                 86.1 |         16        0.23       66.24
                 86.2 |         21        0.30       66.53
                 86.3 |         12        0.17       66.70
                 86.4 |         13        0.18       66.89
                 86.5 |         12        0.17       67.06
                 86.6 |         23        0.33       67.39
                 86.7 |         24        0.34       67.73
                 86.8 |         15        0.21       67.94
                 86.9 |         18        0.26       68.20
                   87 |         17        0.24       68.44
                 87.1 |         18        0.26       68.70
                 87.2 |         20        0.28       68.98
                 87.3 |         17        0.24       69.22
                 87.4 |         17        0.24       69.46
                 87.5 |         15        0.21       69.68
                 87.6 |         11        0.16       69.83
                 87.7 |         13        0.18       70.02
                 87.8 |         14        0.20       70.22
                 87.9 |         14        0.20       70.42
                   88 |         17        0.24       70.66
                 88.1 |          9        0.13       70.79
                 88.2 |         29        0.41       71.20
                 88.3 |         12        0.17       71.37
                 88.4 |         11        0.16       71.53
                 88.5 |         14        0.20       71.73
                 88.6 |          9        0.13       71.86
                 88.7 |         20        0.28       72.14
                 88.8 |         15        0.21       72.35
                 88.9 |         17        0.24       72.60
                   89 |         12        0.17       72.77
                 89.1 |          9        0.13       72.89
                 89.2 |         11        0.16       73.05
                 89.3 |         15        0.21       73.26
                 89.4 |         19        0.27       73.53
                 89.5 |         18        0.26       73.79
                 89.6 |          9        0.13       73.92
                 89.7 |         17        0.24       74.16
                 89.8 |         10        0.14       74.30
                 89.9 |         11        0.16       74.46
                   90 |         13        0.18       74.64
                 90.1 |          9        0.13       74.77
                 90.2 |         20        0.28       75.06
                 90.3 |         16        0.23       75.28
                 90.4 |         11        0.16       75.44
                 90.5 |         10        0.14       75.58
                 90.6 |         15        0.21       75.80
                 90.7 |         14        0.20       76.00
                 90.8 |         14        0.20       76.20
                 90.9 |         11        0.16       76.35
                   91 |         19        0.27       76.62
                 91.1 |          2        0.03       76.65
                 91.2 |         13        0.18       76.84
                 91.3 |          8        0.11       76.95
                 91.4 |         17        0.24       77.19
                 91.5 |          8        0.11       77.31
                 91.6 |         13        0.18       77.49
                 91.7 |          6        0.09       77.58
                 91.8 |         13        0.18       77.76
                 91.9 |          9        0.13       77.89
                   92 |         15        0.21       78.10
                 92.1 |         16        0.23       78.33
                 92.2 |         12        0.17       78.50
                 92.3 |          3        0.04       78.54
                 92.4 |         14        0.20       78.74
                 92.5 |         12        0.17       78.91
                 92.6 |         12        0.17       79.08
                 92.7 |         13        0.18       79.27
                 92.8 |          7        0.10       79.37
                 92.9 |          6        0.09       79.45
                   93 |          9        0.13       79.58
                 93.1 |         14        0.20       79.78
                 93.2 |         15        0.21       79.99
                 93.3 |          8        0.11       80.11
                 93.4 |         10        0.14       80.25
                 93.5 |         12        0.17       80.42
                 93.6 |          7        0.10       80.52
                 93.7 |         12        0.17       80.69
                 93.8 |         13        0.18       80.88
                 93.9 |         12        0.17       81.05
                   94 |         11        0.16       81.20
                 94.1 |         13        0.18       81.39
                 94.2 |         16        0.23       81.62
                 94.3 |          3        0.04       81.66
                 94.4 |          7        0.10       81.76
                 94.5 |         11        0.16       81.92
                 94.6 |         10        0.14       82.06
                 94.7 |         13        0.18       82.24
                 94.8 |          7        0.10       82.34
                 94.9 |         16        0.23       82.57
                   95 |         12        0.17       82.74
                 95.1 |         12        0.17       82.91
                 95.2 |         13        0.18       83.10
                 95.3 |         11        0.16       83.25
                 95.4 |         15        0.21       83.47
                 95.5 |         10        0.14       83.61
                 95.6 |         13        0.18       83.79
                 95.7 |         11        0.16       83.95
                 95.8 |         20        0.28       84.23
                 95.9 |         10        0.14       84.38
                   96 |          3        0.04       84.42
                 96.1 |          9        0.13       84.55
                 96.2 |         16        0.23       84.78
                 96.3 |         14        0.20       84.97
                 96.4 |          6        0.09       85.06
                 96.5 |         12        0.17       85.23
                 96.6 |          9        0.13       85.36
                 96.7 |          6        0.09       85.44
                 96.8 |         11        0.16       85.60
                 96.9 |          8        0.11       85.71
                   97 |         13        0.18       85.90
                 97.1 |          4        0.06       85.96
                 97.2 |         17        0.24       86.20
                 97.3 |          6        0.09       86.28
                 97.4 |         14        0.20       86.48
                 97.5 |         10        0.14       86.62
                 97.6 |          4        0.06       86.68
                 97.7 |          7        0.10       86.78
                 97.8 |          5        0.07       86.85
                 97.9 |          8        0.11       86.97
                   98 |          7        0.10       87.07
                 98.1 |          4        0.06       87.12
                 98.2 |          9        0.13       87.25
                 98.3 |          6        0.09       87.34
                 98.4 |          7        0.10       87.44
                 98.5 |          5        0.07       87.51
                 98.6 |          5        0.07       87.58
                 98.7 |          6        0.09       87.66
                 98.8 |          7        0.10       87.76
                 98.9 |          1        0.01       87.78
                   99 |          7        0.10       87.88
                 99.1 |          9        0.13       88.01
                 99.2 |         10        0.14       88.15
                 99.3 |          3        0.04       88.19
                 99.4 |          8        0.11       88.30
                 99.5 |         13        0.18       88.49
                 99.6 |          8        0.11       88.60
                 99.7 |         10        0.14       88.75
                 99.8 |          9        0.13       88.87
                 99.9 |          8        0.11       88.99
                  100 |          5        0.07       89.06
                100.1 |         12        0.17       89.23
                100.2 |          5        0.07       89.30
                100.3 |          8        0.11       89.41
                100.4 |          4        0.06       89.47
                100.5 |          4        0.06       89.53
                100.6 |          4        0.06       89.58
                100.7 |          6        0.09       89.67
                100.8 |         10        0.14       89.81
                100.9 |          6        0.09       89.90
                  101 |          8        0.11       90.01
                101.1 |          4        0.06       90.07
                101.2 |         10        0.14       90.21
                101.3 |          5        0.07       90.28
                101.4 |         10        0.14       90.42
                101.5 |          6        0.09       90.51
                101.6 |          6        0.09       90.59
                101.7 |          8        0.11       90.71
                101.8 |          6        0.09       90.79
                101.9 |          8        0.11       90.91
                  102 |          6        0.09       90.99
                102.1 |          8        0.11       91.11
                102.2 |          2        0.03       91.14
                102.3 |          2        0.03       91.16
                102.4 |          4        0.06       91.22
                102.5 |          5        0.07       91.29
                102.6 |          9        0.13       91.42
                102.7 |          2        0.03       91.45
                102.8 |          8        0.11       91.56
                102.9 |          7        0.10       91.66
                  103 |          2        0.03       91.69
                103.1 |          1        0.01       91.70
                103.2 |          5        0.07       91.78
                103.3 |          3        0.04       91.82
                103.4 |          8        0.11       91.93
                103.5 |          3        0.04       91.97
                103.6 |          5        0.07       92.05
                103.7 |          1        0.01       92.06
                103.8 |          4        0.06       92.12
                103.9 |          4        0.06       92.17
                  104 |          4        0.06       92.23
                104.1 |          4        0.06       92.29
                104.2 |          6        0.09       92.37
                104.3 |          4        0.06       92.43
                104.4 |          6        0.09       92.52
                104.5 |          6        0.09       92.60
                104.6 |          6        0.09       92.69
                104.7 |          9        0.13       92.81
                104.8 |          4        0.06       92.87
                104.9 |          4        0.06       92.93
                  105 |          2        0.03       92.96
                105.1 |          6        0.09       93.04
                105.2 |         10        0.14       93.18
                105.3 |          6        0.09       93.27
                105.4 |          9        0.13       93.40
                105.5 |          5        0.07       93.47
                105.6 |          5        0.07       93.54
                105.7 |          6        0.09       93.63
                105.8 |          1        0.01       93.64
                105.9 |          4        0.06       93.70
                  106 |          4        0.06       93.75
                106.1 |          4        0.06       93.81
                106.2 |          4        0.06       93.87
                106.3 |          4        0.06       93.92
                106.4 |          5        0.07       94.00
                106.5 |          3        0.04       94.04
                106.6 |          3        0.04       94.08
                106.7 |          4        0.06       94.14
                106.9 |          6        0.09       94.22
                  107 |          1        0.01       94.24
                107.1 |          5        0.07       94.31
                107.2 |          3        0.04       94.35
                107.3 |          2        0.03       94.38
                107.4 |          7        0.10       94.48
                107.5 |          4        0.06       94.54
                107.6 |          4        0.06       94.59
                107.7 |          3        0.04       94.64
                107.8 |          4        0.06       94.69
                107.9 |          3        0.04       94.74
                  108 |          2        0.03       94.76
                108.1 |          5        0.07       94.83
                108.2 |          5        0.07       94.91
                108.3 |          5        0.07       94.98
                108.4 |          6        0.09       95.06
                108.5 |          1        0.01       95.08
                108.6 |          2        0.03       95.11
                108.7 |          7        0.10       95.20
                108.8 |          1        0.01       95.22
                108.9 |          1        0.01       95.23
                  109 |          3        0.04       95.28
                109.1 |          2        0.03       95.30
                109.2 |          3        0.04       95.35
                109.3 |          5        0.07       95.42
                109.4 |          3        0.04       95.46
                109.5 |          5        0.07       95.53
                109.6 |          8        0.11       95.65
                109.7 |          2        0.03       95.67
                109.8 |          2        0.03       95.70
                109.9 |          7        0.10       95.80
                  110 |          3        0.04       95.85
                110.2 |          2        0.03       95.87
                110.3 |          4        0.06       95.93
                110.4 |          1        0.01       95.94
                110.5 |          4        0.06       96.00
                110.6 |          2        0.03       96.03
                110.7 |          6        0.09       96.12
                110.8 |          5        0.07       96.19
                110.9 |          1        0.01       96.20
                  111 |          1        0.01       96.22
                111.1 |          2        0.03       96.24
                111.2 |          4        0.06       96.30
                111.3 |          1        0.01       96.31
                111.4 |          5        0.07       96.39
                111.5 |          2        0.03       96.41
                111.6 |          4        0.06       96.47
                111.8 |          1        0.01       96.49
                111.9 |          3        0.04       96.53
                  112 |          2        0.03       96.56
                112.1 |          3        0.04       96.60
                112.2 |          2        0.03       96.63
                112.3 |          3        0.04       96.67
                112.4 |          2        0.03       96.70
                112.5 |          1        0.01       96.71
                112.6 |          2        0.03       96.74
                112.7 |          2        0.03       96.77
                112.8 |          3        0.04       96.81
                112.9 |          5        0.07       96.88
                  113 |          3        0.04       96.93
                113.1 |          1        0.01       96.94
                113.2 |          1        0.01       96.96
                113.4 |          2        0.03       96.98
                113.5 |          3        0.04       97.03
                113.7 |          2        0.03       97.05
                113.8 |          2        0.03       97.08
                113.9 |          1        0.01       97.10
                  114 |          3        0.04       97.14
                114.1 |          1        0.01       97.15
                114.2 |          2        0.03       97.18
                114.3 |          1        0.01       97.20
                114.4 |          2        0.03       97.23
                114.5 |          3        0.04       97.27
                114.6 |          3        0.04       97.31
                114.7 |          1        0.01       97.32
                114.9 |          1        0.01       97.34
                  115 |          1        0.01       97.35
                115.1 |          2        0.03       97.38
                115.3 |          1        0.01       97.40
                115.4 |          1        0.01       97.41
                115.5 |          2        0.03       97.44
                115.6 |          2        0.03       97.47
                115.7 |          1        0.01       97.48
                115.8 |          3        0.04       97.52
                115.9 |          1        0.01       97.54
                  116 |          1        0.01       97.55
                116.1 |          6        0.09       97.64
                116.2 |          4        0.06       97.69
                116.3 |          2        0.03       97.72
                116.4 |          3        0.04       97.77
                116.6 |          3        0.04       97.81
                116.7 |          1        0.01       97.82
                117.1 |          2        0.03       97.85
                117.4 |          1        0.01       97.87
                117.6 |          1        0.01       97.88
                117.8 |          2        0.03       97.91
                117.9 |          2        0.03       97.94
                  118 |          4        0.06       97.99
                118.1 |          1        0.01       98.01
                118.3 |          1        0.01       98.02
                118.5 |          1        0.01       98.04
                118.6 |          1        0.01       98.05
                118.9 |          3        0.04       98.09
                119.2 |          1        0.01       98.11
                119.3 |          2        0.03       98.14
                119.4 |          1        0.01       98.15
                119.5 |          1        0.01       98.16
                119.6 |          2        0.03       98.19
                119.7 |          2        0.03       98.22
                119.8 |          1        0.01       98.24
                119.9 |          1        0.01       98.25
                  120 |          2        0.03       98.28
                120.1 |          1        0.01       98.29
                120.2 |          1        0.01       98.31
                120.3 |          1        0.01       98.32
                120.4 |          2        0.03       98.35
                120.5 |          2        0.03       98.38
                120.6 |          1        0.01       98.39
                120.7 |          1        0.01       98.41
                120.8 |          2        0.03       98.43
                120.9 |          3        0.04       98.48
                  121 |          1        0.01       98.49
                121.2 |          1        0.01       98.51
                121.3 |          1        0.01       98.52
                121.8 |          1        0.01       98.53
                121.9 |          1        0.01       98.55
                122.2 |          2        0.03       98.58
                122.3 |          4        0.06       98.63
                122.5 |          1        0.01       98.65
                123.1 |          1        0.01       98.66
                123.5 |          1        0.01       98.68
                123.9 |          2        0.03       98.71
                  124 |          2        0.03       98.73
                124.1 |          1        0.01       98.75
                124.7 |          2        0.03       98.78
                125.1 |          1        0.01       98.79
                125.3 |          1        0.01       98.80
                125.4 |          1        0.01       98.82
                125.6 |          1        0.01       98.83
                125.8 |          3        0.04       98.88
                  126 |          1        0.01       98.89
                126.2 |          2        0.03       98.92
                126.3 |          1        0.01       98.93
                126.4 |          1        0.01       98.95
                126.5 |          1        0.01       98.96
                126.6 |          2        0.03       98.99
                126.8 |          1        0.01       99.00
                127.1 |          1        0.01       99.02
                127.3 |          1        0.01       99.03
                127.4 |          1        0.01       99.05
                127.8 |          2        0.03       99.08
                128.5 |          1        0.01       99.09
                128.7 |          1        0.01       99.10
                129.2 |          1        0.01       99.12
                129.8 |          2        0.03       99.15
                130.1 |          1        0.01       99.16
                130.2 |          1        0.01       99.17
                130.7 |          1        0.01       99.19
                131.2 |          1        0.01       99.20
                132.5 |          2        0.03       99.23
                132.9 |          1        0.01       99.25
                133.6 |          1        0.01       99.26
                133.7 |          1        0.01       99.27
                134.4 |          2        0.03       99.30
                134.5 |          1        0.01       99.32
                134.6 |          1        0.01       99.33
                135.4 |          1        0.01       99.35
                136.9 |          1        0.01       99.36
                137.1 |          1        0.01       99.37
                137.5 |          1        0.01       99.39
                  140 |          1        0.01       99.40
                141.3 |          1        0.01       99.42
                142.9 |          1        0.01       99.43
                144.2 |          1        0.01       99.45
                  596 |          1        0.01       99.46
                  601 |          1        0.01       99.47
                  618 |          1        0.01       99.49
                  664 |          1        0.01       99.50
                  668 |          1        0.01       99.52
                  670 |          1        0.01       99.53
                  700 |          1        0.01       99.54
                  705 |          1        0.01       99.56
                  717 |          1        0.01       99.57
                  732 |          2        0.03       99.60
                  745 |          1        0.01       99.62
                  753 |          1        0.01       99.63
                  760 |          1        0.01       99.64
                  778 |          1        0.01       99.66
                  788 |          1        0.01       99.67
                  804 |          1        0.01       99.69
                  816 |          1        0.01       99.70
                  824 |          1        0.01       99.72
                  828 |          1        0.01       99.73
                  838 |          1        0.01       99.74
                  843 |          1        0.01       99.76
                  852 |          1        0.01       99.77
                  855 |          1        0.01       99.79
                  861 |          1        0.01       99.80
                  876 |          1        0.01       99.82
                  889 |          1        0.01       99.83
                  892 |          1        0.01       99.84
                  895 |          1        0.01       99.86
                  898 |          1        0.01       99.87
                  909 |          1        0.01       99.89
                  918 |          1        0.01       99.90
                  924 |          1        0.01       99.91
                  961 |          1        0.01       99.93
                  971 |          1        0.01       99.94
                  979 |          1        0.01       99.96
                 1045 |          1        0.01       99.97
                 1083 |          1        0.01       99.99
                 1099 |          1        0.01      100.00
          ------------+-----------------------------------
                Total |      7,028      100.00

          . replace weightkg = weightkg/10 if weightkg > 500 // these values did not have a decimal, while almost all the others did. These were also extremely high but made sense if they were just missing the decimal point so I made the assumptions that I could change them. A typical range is 35-200kg.
          (40 real changes made, 1 to missing)

          . duplicates list // "duplicates in terms of all variables - 0 observations are duplicates" // QUESTION 3

          Duplicates in terms of all variables

          (0 observations are duplicates)

          . duplicates examples // "0 observations are duplicates"

          Duplicates in terms of all variables

          (0 observations are duplicates)

          . label variable subjectnumericrace "Subject Numeric Race"

          . label variable dodrace "Department of Defense Race"

          . label variable ethnicity "Ethnicity"

          . label variable gender "Gender"

          . label variable age "Age"

          . label variable component "Component"

          . label variable branch "Branch"

          . label variable writingpreference "Writing Preference"

          . label variable installation "U.S. Army Installation"

          . label variable test_date "Test Date"

          . label variable weightlbs "Weight in Pounds (lbs)"

          . label variable heightin "Height in Inches"

          . label variable thumbtipreach "Thumbtip Reach"

          . label variable span "Span"

          . label variable footlength "Foot Length"

          . label variable kneeheightmidpatella "Knee Height, Midpatella"

          . label variable waistheightomphalion "Waist Height (Omphalion)"

          . label variable functionalleglength "Functional Leg Length"

          . label variable cervicaleheight "Cervical Height"

          . label variable trochanterionheight "Trochanterion Height"

          . label variable stature "Stature"

          . label variable waistcircumference "Waist Circumference (Omphalion)"

          . label variable chestcircumference "Chest Circumference"

          . label variable bicristalbreadth "Bicristal Breadth"

          . label variable hipbreadth "Hip Breadth"

          . label variable hipbreadthsitting "Hip Breadth, Sitting"

          . label variable weightkg "Weight in Kilograms (kgs)"

          . label variable date "Date of Measurement"

          . label variable strdate "String Date"

          . label variable race_white "Race - White"

          . label variable race_black "Race - Black"

          . label variable race_hispanic "Race - Hispanic"

          . label variable race_asian "Race - Asian"

          . label variable race_nativeamerican "Race - Native American"

          . label variable race_pacificislander "Race - Pacific Islander"

          . label variable race_other "Race - Other"

          . foreach var in thumbtipreach span footlength kneeheightmidpatella waistheightomphalion functionalleglength cervicaleheight trochanterionheight stature waistcircumference chestcircumference bicristalbreadth hipbreadth hipbreadthsitting {
          .     gen `var'_cm = `var'
          .         replace `var'_cm = `var' / 10
          . }
          (11 missing values generated)
          (7,029 real changes made, 11 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)
          (1 missing value generated)
          (7,029 real changes made, 1 to missing)

          . label variable thumbtipreach_cm "Thumbtip Reach (cm)"

          . label variable span_cm "Span (cm)"

          . label variable footlength_cm "Foot Length (cm)"

          . label variable kneeheightmidpatella_cm "Knee Height, Midpatella (cm)"

          . label variable waistheightomphalion_cm "Waist Height (Omphalion) (cm)"

          . label variable functionalleglength_cm "Funcational Leg Length (cm)"

          . label variable cervicaleheight_cm "Cervical Height (cm)"

          . label variable trochanterionheight_cm "Trochanterion Height (cm)"

          . label variable stature_cm "Stature (cm)"

          . label variable waistcircumference_cm "Waist Circumference (cm)"

          . label variable chestcircumference_cm "Chest Circumference (cm)"

          . label variable bicristalbreadth_cm "Bicristal Breadth (cm)"

          . label variable hipbreadth_cm "Hip Breadth (cm)"

          . label variable hipbreadthsitting_cm "Hip Breadth Sitting (cm)"

          . gen bmi_cont = (weightlbs*703) / (heightin * heightin) //this is the formula for calculating bmi
          (2 missing values generated)

          . gen bmi_cat = .
          (7,029 missing values generated)

          . replace bmi_cat = .x if bmi_cont == 0
          (0 real changes made)

          . replace bmi_cat = 1 if bmi_cont > 0 & bmi_cont < 18.5
          (52 real changes made)

          . replace bmi_cat = 2 if bmi_cont >= 18.5 & bmi_cont <25
          (2,616 real changes made)

          . replace bmi_cat = 3 if bmi_cont >= 25 & bmi_cont < 30
          (3,241 real changes made)

          . replace bmi_cat = 4 if bmi_cont >= 30 
          (1,120 real changes made)

          . label variable bmi_cat "BMI Category"

          . label define bmi_labels .x "Out of Range/Suspicious" 1 "Underweight" 2 "Normal Weight" 3 "Overweight" 4 "Obese"

          . label values bmi_cat bmi_labels

          . gen month = month(date)
          (963 missing values generated)

          . gen season = .
          (7,029 missing values generated)

          . replace season = 1 if inlist(month, 11, 12, 1, 2)
          (2,482 real changes made)

          . replace season = 2 if inlist(month, 3, 4, 5)
          (1,883 real changes made)

          . replace season = 3 if inlist(month, 6, 7, 8)
          (926 real changes made)

          . replace season = 4 if inlist(month, 9, 10)
          (775 real changes made)

          . label variable season "Season"

          . label define season_labels 1 "Winter" 2 "Spring" 3 "Summer" 4 "Fall"

          . label values season season_labels

          . tab gender // this is to understand the values 

               Gender |      Freq.     Percent        Cum.
          ------------+-----------------------------------
               Female |      2,182       31.04       31.04
                 Male |      4,847       68.96      100.00
          ------------+-----------------------------------
                Total |      7,029      100.00

          . tab writingpreference // this is to understand the values

                   Writing Preference |      Freq.     Percent        Cum.
          ----------------------------+-----------------------------------
          Either hand (No preference) |         66        0.94        0.94
                            Left hand |        757       10.77       11.71
                           Right hand |      6,206       88.29      100.00
          ----------------------------+-----------------------------------
                                Total |      7,029      100.00

          . encode gender, gen(gender_cat) 

          . codebook gender //Male = 2, Female = 1

          ----------------------------------------------------------------------------------------------
          gender                                                                                  Gender
          ----------------------------------------------------------------------------------------------

                            Type: String (str6)

                   Unique values: 2                         Missing "": 0/7,029

                      Tabulation: Freq.  Value
                                  2,182  "Female"
                                  4,847  "Male"

          . encode writingpreference, gen(prefhand_cat) 

          . codebook prefhand_cat // Either = 1, Left = 2, Right = 3

          ----------------------------------------------------------------------------------------------
          prefhand_cat                                                                Writing Preference
          ----------------------------------------------------------------------------------------------

                            Type: Numeric (long)
                           Label: prefhand_cat

                           Range: [1,3]                         Units: 1
                   Unique values: 3                         Missing .: 0/7,029

                      Tabulation: Freq.   Numeric  Label
                                     66         1  Either hand (No preference)
                                    757         2  Left hand
                                  6,206         3  Right hand

          . label variable bmi_cont "BMI (Continuous)"

          . label variable month "Month"

          . label variable gender_cat "Gender (Category)"

          . label variable prefhand_cat "Preferred Hand (Category)"

          . gen body_type = .
          (7,029 missing values generated)

          . replace body_type = 1 if gender_cat == 1 & bmi_cat == 1
          (26 real changes made)

          . replace body_type = 2 if gender_cat == 1 & bmi_cat == 2
          (1,185 real changes made)

          . replace body_type = 3 if gender_cat == 1 & bmi_cat == 3
          (828 real changes made)

          . replace body_type = 4 if gender_cat == 1 & bmi_cat == 4
          (143 real changes made)

          . replace body_type = 5 if gender_cat == 2 & bmi_cat == 1
          (26 real changes made)

          . replace body_type = 6 if gender_cat == 2 & bmi_cat == 2
          (1,431 real changes made)

          . replace body_type = 7 if gender_cat == 2 & bmi_cat == 3
          (2,413 real changes made)

          . replace body_type = 2 if gender_cat == 2 & bmi_cat == 4
          (977 real changes made)

          . label variable body_type "Body Type"

          . label define bodytype_labels 1 "Female - Lean" 2 "Female - Moderate Build" 3 "Female - Heavy Build" 4 "Female - Very Heavy Build" 5 "Male - Lean" 6 "Male - Moderate Build" 7 "Male - Heavy Build" 8 "Male - Very Heavy Build"

          . label values body_type bodytype_labels 

          . tabstat weightlbs heightin thumbtipreach span footlength kneeheightmidpatella waistheightomphalion functionalleglength cervicaleheight trochanterionheight stature waistcircumference chestcircumference bicristalbreadth hipbreadth hipbreadthsitting weightkg, statistics(mean sd n) columns(statistics)

              Variable |      Mean        SD         N
          -------------+------------------------------
             weightlbs |  175.5072  33.47751      7027
              heightin |  68.34628  3.854555      7029
          thumbtipre~h |  792.3233  53.35537      7018
                  span |  1767.855  110.4987      7028
            footlength |  263.4262  17.32096      7028
          kneeheight~a |  475.3203  32.89078      7028
          waistheigh~n |  1032.598  62.54826      7028
          functional~h |  1104.306  68.08699      7028
          cervicaleh~t |  1479.787  84.06564      7028
          trochanter~t |  882.7624   54.0014      7028
               stature |  1716.589   89.6767      7028
          waistcircu~e |  916.9048   113.946      7028
          chestcircu~e |  1024.891  100.1932      7028
          bicristalb~h |  274.5435  19.07584      7028
            hipbreadth |  348.4102  24.99114      7028
          hipbreadth~g |   385.892  32.03365      7028
              weightkg |  80.01662  15.61913      7028
          --------------------------------------------

          . misstable summarize weightlbs heightin thumbtipreach span footlength kneeheightmidpatella waistheightomphalion functionalleglength cervicaleheight trochanterionheight stature waistcircumference chestcircumference bicristalbreadth hipbreadth hipbreadthsitting weightkg
                                                                         Obs<.
                                                          +------------------------------
                         |                                | Unique
                Variable |     Obs=.     Obs>.     Obs<.  | values        Min         Max
            -------------+--------------------------------+------------------------------
               weightlbs |                   2     7,027  |    187         86         321
            thumbtipre~h |                  11     7,018  |    314        602         998
                    span |                   1     7,028  |   >500       1323        2121
              footlength |                   1     7,028  |    106        198         323
            kneeheight~a |                   1     7,028  |    204        346         612
            waistheigh~n |                   1     7,028  |    350        805        1245
            functional~h |                   1     7,028  |    383        835        1316
            cervicaleh~t |                   1     7,028  |    452       1184        1738
            trochanter~t |                   1     7,028  |    321        660        1095
                 stature |                   1     7,028  |    481       1409        1993
            waistcircu~e |                   1     7,028  |   >500        611        1379
            chestcircu~e |                   1     7,028  |   >500        695        1469
            bicristalb~h |                   1     7,028  |    132        197         362
              hipbreadth |                   1     7,028  |    166        264         473
            hipbreadth~g |                   1     7,028  |    202        280         541
                weightkg |         1               7,028  |   >500       35.8       144.2
            -----------------------------------------------------------------------------

          . gen height_hip_ratio = ((trochanterionheight_cm/2.54) / heightin) * 100
          (1 missing value generated)

          . label variable height_hip_ratio "% of Total Height Attributable to Hip Height"

          . tabstat height_hip_ratio, by(gender) stat(mean sd n)

          Summary for variables: height_hip_ratio
          Group variable: gender (Gender)

          gender |      Mean        SD         N
          -------+------------------------------
          Female |  51.46474  1.632943      2182
            Male |  50.59323  1.600638      4846
          -------+------------------------------
           Total |  50.86381  1.660338      7028
          --------------------------------------

          . graph box height_hip_ratio, over(gender)


          . pwcorr stature_cm kneeheightmidpatella_cm cervicaleheight_cm trochanterionheight_cm waistheightomphalion_cm functionalleglength_cm footlength_cm thumbtipreach_cm span_cm

                       | statur~m kneehe~m cervic~m trocha~m waisth~m functi~m footle~m
          -------------+---------------------------------------------------------------
            stature_cm |   1.0000 
          kneeheight~m |   0.8885   1.0000 
          cervicaleh~m |   0.9911   0.9016   1.0000 
          trochanter~m |   0.8794   0.9271   0.8896   1.0000 
          waistheigh~m |   0.9363   0.9132   0.9409   0.9146   1.0000 
          functional~m |   0.8852   0.8715   0.9004   0.8621   0.8761   1.0000 
          footlength~m |   0.8442   0.8066   0.8499   0.7704   0.8061   0.7980   1.0000 
          thumbtipre~m |   0.8075   0.7905   0.8272   0.7754   0.7822   0.8321   0.7881 
               span_cm |   0.8990   0.8718   0.9085   0.8596   0.8839   0.8696   0.8639 

                       | thumbt~m  span_cm
          -------------+------------------
          thumbtipre~m |   1.0000 
               span_cm |   0.8823   1.0000 

          . twoway (scatter stature_cm cervicaleheight_cm) // these two had the highest correlation at 0.9911. Edited the graph titles, color, etc. through the graph editor.


          . by gender, sort: pwcorr stature kneeheightmidpatella_cm cervicaleheight_cm trochanterionheight_cm waistheightomphalion_cm functionalleglength_cm footlength_cm thumbtipreach_cm span_cm

          ----------------------------------------------------------------------------------------------
          -> gender = Female

                       |  stature kneehe~m cervic~m trocha~m waisth~m functi~m footle~m
          -------------+---------------------------------------------------------------
               stature |   1.0000 
          kneeheight~m |   0.8406   1.0000 
          cervicaleh~m |   0.9845   0.8636   1.0000 
          trochanter~m |   0.8586   0.9153   0.8788   1.0000 
          waistheigh~m |   0.9097   0.8773   0.9242   0.8889   1.0000 
          functional~m |   0.8316   0.8270   0.8493   0.8433   0.8291   1.0000 
          footlength~m |   0.7251   0.7320   0.7304   0.7213   0.7049   0.7120   1.0000 
          thumbtipre~m |   0.6712   0.6724   0.6895   0.6851   0.6560   0.7353   0.6540 
               span_cm |   0.8202   0.8275   0.8321   0.8414   0.8291   0.8146   0.7771 

                       | thumbt~m  span_cm
          -------------+------------------
          thumbtipre~m |   1.0000 
               span_cm |   0.8053   1.0000 

          ----------------------------------------------------------------------------------------------
          -> gender = Male

                       |  stature kneehe~m cervic~m trocha~m waisth~m functi~m footle~m
          -------------+---------------------------------------------------------------
               stature |   1.0000 
          kneeheight~m |   0.8335   1.0000 
          cervicaleh~m |   0.9840   0.8563   1.0000 
          trochanter~m |   0.8527   0.9014   0.8721   1.0000 
          waistheigh~m |   0.9074   0.8714   0.9152   0.8893   1.0000 
          functional~m |   0.8123   0.8030   0.8413   0.8066   0.8075   1.0000 
          footlength~m |   0.7169   0.6919   0.7235   0.6755   0.6917   0.6563   1.0000 
          thumbtipre~m |   0.6915   0.6941   0.7282   0.6980   0.6766   0.7436   0.6510 
               span_cm |   0.8226   0.8001   0.8390   0.8138   0.8195   0.7831   0.7508 

                       | thumbt~m  span_cm
          -------------+------------------
          thumbtipre~m |   1.0000 
               span_cm |   0.8130   1.0000 

          . gen selfrep_weight = weightlbs / 2.205
          (2 missing values generated)

          . label variable selfrep_weight "Self-Reported Weight (kg)"

          . graph box selfrep_weight weightkg // made edits in the graph editor


          . gen weight_diff = selfrep_weight - weightkg
          (3 missing values generated)

          . label variable weight_diff "Difference in Self-Reported Weight and Measured Weight"

          . summ weight_diff, detail

                 Difference in Self-Reported Weight and Measured
                                     Weight
          -------------------------------------------------------------
                Percentiles      Smallest
           1%    -8.702499      -48.27007
           5%    -4.972786      -45.51338
          10%    -3.364632      -44.68526       Obs               7,026
          25%    -1.672783      -43.40794       Sum of wgt.       7,026

          50%    -.2472801                      Mean           -.419161
                                  Largest       Std. dev.      2.999618
          75%     1.071655       14.40295
          90%     2.540817       16.09319       Variance       8.997705
          95%     3.546257       17.90023       Skewness      -.8886803
          99%     5.978683        66.1263       Kurtosis       68.58195

          . histogram weight_diff, percent width(2) by(gender) ///
               title("Distribution of Weight Difference by Gender") ///
               xtitle("Self - Measured Weight (kg)") // Made edits inthe graph editor



          . gen selfrep_height = heightin * 25.4

          . label variable selfrep_height "Self-Reported Height (mm)"

          . graph box selfrep_height stature // made edits in the graph editor.


          . tabstat weightkg bmi_cont, by(body_type) statistics(mean sd n)

          Summary statistics: Mean, SD, N
          Group variable: body_type (Body Type)

                 body_type |  weightkg  bmi_cont
          -----------------+--------------------
             Female - Lean |  51.83462  17.47061
                           |  7.616138  1.147617
                           |        26        26
          -----------------+--------------------
          Female - Moderat |  80.24551  27.03374
                           |  22.65971  5.234048
                           |      2162      2160
          -----------------+--------------------
          Female - Heavy B |  73.67403  26.92193
                           |  7.859859  1.305453
                           |       828       828
          -----------------+--------------------
          Female - Very He |  85.66783   32.0094
                           |  9.865158    1.8367
                           |       143       143
          -----------------+--------------------
               Male - Lean |  65.18077  17.21558
                           |  15.51845   1.35517
                           |        26        26
          -----------------+--------------------
          Male - Moderate  |  72.41978  22.84776
                           |  8.177395   1.48495
                           |      1431      1431
          -----------------+--------------------
          Male - Heavy Bui |   86.6245  27.28356
                           |  8.746041   1.43499
                           |      2412      2413
          -----------------+--------------------
                     Total |  80.01662  26.28345
                           |  15.61913  3.752555
                           |      7028      7027
          --------------------------------------

          . tab body_type bmi_cat, row

          +----------------+
          | Key            |
          |----------------|
          |   frequency    |
          | row percentage |
          +----------------+

                                |                BMI Category
                      Body Type | Underweig  Normal We  Overweigh      Obese |     Total
          ----------------------+--------------------------------------------+----------
                  Female - Lean |        26          0          0          0 |        26 
                                |    100.00       0.00       0.00       0.00 |    100.00 
          ----------------------+--------------------------------------------+----------
          Female - Moderate Bui |         0      1,185          0        977 |     2,162 
                                |      0.00      54.81       0.00      45.19 |    100.00 
          ----------------------+--------------------------------------------+----------
           Female - Heavy Build |         0          0        828          0 |       828 
                                |      0.00       0.00     100.00       0.00 |    100.00 
          ----------------------+--------------------------------------------+----------
          Female - Very Heavy B |         0          0          0        143 |       143 
                                |      0.00       0.00       0.00     100.00 |    100.00 
          ----------------------+--------------------------------------------+----------
                    Male - Lean |        26          0          0          0 |        26 
                                |    100.00       0.00       0.00       0.00 |    100.00 
          ----------------------+--------------------------------------------+----------
          Male - Moderate Build |         0      1,431          0          0 |     1,431 
                                |      0.00     100.00       0.00       0.00 |    100.00 
          ----------------------+--------------------------------------------+----------
             Male - Heavy Build |         0          0      2,413          0 |     2,413 
                                |      0.00       0.00     100.00       0.00 |    100.00 
          ----------------------+--------------------------------------------+----------
                          Total |        52      2,616      3,241      1,120 |     7,029 
                                |      0.74      37.22      46.11      15.93 |    100.00 



