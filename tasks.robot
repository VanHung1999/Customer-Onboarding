*** Settings ***
Documentation    New corporate customers need to be added to 
...              The Cable Co's customer relationship management system
Library          RPA.Browser.Selenium
Library          RPA.Tables
Library          RPA.HTTP
Library          MyLibrary

*** Keywords ***
Download the file 
    Download    https://s3-us-west-2.amazonaws.com/aai-devportal-media/wp-content/uploads/2021/07/08203317/MissingCustomers.csv
    ...         overwrite=True

    Open Available Browser    https://developer.automationanywhere.com/challenges/automationanywherelabs-customeronboarding.html

*** Keywords ***
Get data in file csv
    ${data}=    Read table from CSV    MissingCustomers.csv
    FOR    ${i}    IN RANGE    0    7    1
        &{datas_row}=    Get Table Row    ${data}    ${i}
        Fill in the blanks on the web    &{datas_row}
        
    END
    
*** Keywords ***
Fill in the blanks on the web
    [Arguments]    &{datas_row}
    Input Text    id:customerName    ${datas_row}[Company Name]
    Input Text    id:customerID    ${datas_row}[Customer ID]
    Input Text    id:primaryContact    ${datas_row}[Primary Contact]
    Input Text    id:street    ${datas_row}[Street Address]
    Input Text    id:city    ${datas_row}[City]
    Select From List By Value    id:state    ${datas_row}[State]
    Input Text    id:zip    ${datas_row}[Zip]
    Input Text    id:city    ${datas_row}[City]
    Input Text    id:email    ${datas_row}[Email Address]

    ${beta}=    Yes or no     

        


    


*** Tasks ***
Work need to do
    Download the file
    Get data in file csv
    