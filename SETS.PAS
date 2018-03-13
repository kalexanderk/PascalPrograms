PROGRAM pr_8_23;
 uses crt;
 type contin = (Africa, Asia, NorthAmerica, SouthAmerica, Oceania, Europe);
 type countr = (Algeria, Angola, Benin, Botswana, Burkina, Burundi, Cameroon,
                Cape_Verde, Central_African_Republic, Chad, Comoros, Congo,
                Democratic_Republic_of_Djibouti, Egypt, Equatorial_Guinea, 
                Eritrea, Ethiopia,Gabon, Gambia, Ghana, Guinea, Guinea_Bissau,
                Ivory_Coast, Kenya,Lesotho, Liberia, Libya, Madagascar, Malawi,
                Mali, Mauritania, Mauritius, Morocco, Mozambique, Namibia, 
                Niger, Nigeria, Rwanda, Sao_Tome_and_Principe, Senegal, 
                Seychelles, Sierra_Leone, Somalia, South_Africa, South_Sudan,
                Sudan, Swaziland, Tanzania, Togo, Tunisia, Uganda, Zambia, 
                Zimbabwe, Afghanistan, Bahrain, Bangladesh, Bhutan, Brunei, 
                Myanmar, Cambodia,China, East_Timor, India, Indonesia, Iran, 
                Iraq, Israel, Japan, Jordan,Kazakhstan, North_Korea, 
                South_Korea, Kuwait, Kyrgyzstan, Laos, Lebanon, Malaysia, 
                Maldives, Mongolia, Nepal, Oman, Pakistan, Philippines, Qatar, 
                Russian_Federation, Saudi_Arabia, Singapore, Sri_Lanka, Syria,
                Tajikistan, Thailand, Turkey, Turkmenistan, 
                United_Arab_Emirates, Uzbekistan, Vietnam, Yemen, Albania, 
                Andorra, Armenia, Austria, Azerbaijan, Belarus, Belgium, 
                Bosnia_and_Herzegovina, Bulgaria, Croatia, Cyprus, 
                Czech_Republic, Denmark, Estonia, Finland, France, Georgia, 
                Germany, Greece, Hungary, Iceland, Ireland, Italy, Latvia,
                Liechtenstein, Lithuania, Luxembourg, Macedonia, Malta, Moldova,
                Monaco, Montenegro, Netherlands, Norway, Poland, Portugal,
                Romania, San_Marino, Serbia, Slovakia, Slovenia, Spain, Sweden,
                Switzerland, Ukraine, United_Kingdom, Vatican_City, 
                Antigua_and_Barbuda, Bahamas, Barbados, Belize, Canada, 
                Costa_Rica, Cuba, Dominica, Dominican_Republic, El_Salvador,
                Grenada, Guatemala, Haiti, Honduras, Jamaica, Mexico, Nicaragua,
                Panama, Saint_Kitts_and_Nevis, Saint_Lucia, 
                Saint_Vincent_and_the_Grenadines, Trinidad_and_Tobago, 
                United_States, Australia, Fiji, Kiribati, Marshall_Islands, 
                Micronesia, Nauru, New_Zealand, Palau, Papua_New_Guinea, Samoa, 
                Argentina, Bolivia, Brazil, Chile, Colombia, Ecuador, Guyana, 
                Paraguay, Peru, Suriname, Uruguay, Venezuela, Solomon_Islands, 
                Tonga, Tuvalu, Vanuatu);
 const contStr : array[contin] of string = ('Africa', 'Asia', 'NorthAmerica', 
       'SouthAmerica', 'Oceania', 'Europe');
 const countryStr : array[countr] of string = ('Algeria', 'Angola', 'Benin', 
       'Botswana', 'Burkina', 'Burundi', 'Cameroon', 'Cape_Verde',
       'Central_African_Republic', 'Chad', 'Comoros', 'Congo',
       'Democratic_Republic_of_Djibouti', 'Egypt',
       'Equatorial_Guinea', 'Eritrea', 'Ethiopia',
       'Gabon', 'Gambia', 'Ghana', 'Guinea', 'Guinea_Bissau',
       'Ivory_Coast', 'Kenya',
       'Lesotho', 'Liberia', 'Libya', 'Madagascar', 'Malawi',
       'Mali', 'Mauritania', 'Mauritius', 'Morocco',
       'Mozambique', 'Namibia', 'Niger', 'Nigeria',
       'Rwanda', 'Sao_Tome_and_Principe',
       'Senegal', 'Seychelles', 'Sierra_Leone',
       'Somalia', 'South_Africa', 'South_Sudan',
       'Sudan', 'Swaziland', 'Tanzania', 'Togo', 'Tunisia', 'Uganda', 
       'Zambia', 'Zimbabwe', 'Afghanistan', 'Bahrain', 'Bangladesh', 
       'Bhutan', 'Brunei', 'Myanmar', 'Cambodia',
       'China', 'East_Timor', 'India', 'Indonesia', 'Iran', 'Iraq', 'Israel', 
       'Japan', 'Jordan', 'Kazakhstan', 'North_Korea', 'South_Korea', 'Kuwait', 
       'Kyrgyzstan', 'Laos', 'Lebanon', 'Malaysia', 'Maldives', 'Mongolia', 
       'Nepal', 'Oman', 'Pakistan', 'Philippines','Qatar', 'Russian_Federation', 
       'Saudi_Arabia', 'Singapore', 'Sri_Lanka', 'Syria', 'Tajikistan', 
       'Thailand', 'Turkey', 'Turkmenistan', 'United_Arab_Emirates', 
       'Uzbekistan', 'Vietnam', 'Yemen', 'Albania', 'Andorra', 'Armenia', 
       'Austria', 'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia_and_Herzegovina', 
       'Bulgaria', 'Croatia', 'Cyprus', 'Czech_Republic', 'Denmark',
       'Estonia', 'Finland', 'France', 'Georgia', 'Germany', 'Greece',
       'Hungary', 'Iceland', 'Ireland', 'Italy', 'Latvia', 'Liechtenstein',
       'Lithuania', 'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 
       'Montenegro', 'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 
       'San_Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 
       'Switzerland', 'Ukraine', 'United_Kingdom', 'Vatican_City', 
       'Antigua_and_Barbuda', 'Bahamas', 'Barbados', 'Belize', 'Canada', 
       'Costa_Rica', 'Cuba', 'Dominica', 'Dominican_Republic', 'El_Salvador', 
       'Grenada', 'Guatemala', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 
       'Nicaragua', 'Panama', 'Saint_Kitts_and_Nevis', 'Saint_Lucia', 
       'Saint_Vincent_and_the_Grenadines', 'Trinidad_and_Tobago', 
       'United_States', 'Australia', 'Fiji', 'Kiribati', 'Marshall_Islands', 
       'Micronesia', 'Nauru', 'New_Zealand', 'Palau', 'Papua_New_Guinea', 
       'Samoa', 'Argentina', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 
       'Ecuador', 'Guyana', 'Paraguay', 'Peru', 'Suriname', 'Uruguay', 
       'Venezuela', 'Solomon_Islands', 'Tonga', 'Tuvalu', 'Vanuatu');
 type countr_set = set of countr;
 type countries = array[contin] of countr_set;

 procedure add_country(var a: countries; b : contin; c:countr);
   begin
     include(a[b], c);
   end;

 procedure write_countries(const a: countries; i: contin);
   var j: countr;
   begin
     for j := Algeria to Vanuatu do
     if j in a[i] then
     writeln(countryStr[j]);
   end;

 var
   a:countries;
   i,j,f:string;
   c:contin;
   d:countr;

BEGIN
  clrscr;
  writeln('Adding the country');

  repeat

    writeln('Input continent (for ex. "NorthAmerica" or "Oceania")');
    readln(i);
    if i='' then break;
    
    writeln('Input country (for ex. "United_States" or "Dominica")');
    readln(j);
    for c:=Africa to Europe do 
      begin
        if contStr[c]=i then 
          begin
            for d:=Algeria to Vanuatu do 
              begin
                if countryStr[d]=j then
                  add_country(a,c,d);
              end;
          end;
      end;
      
  until i='';
  
  writeln('Displaying countries');

  repeat
    writeln('Input continent (for ex. "NorthAmerica" or "Oceania")');
    readln(f);
    if f='' then break;
    for c:=Asia to Europe do 
      begin
        if contStr[c]=f then 
          begin
            write_countries(a,c);
          end;
      end;
  until f='';
  
  readln;
END.