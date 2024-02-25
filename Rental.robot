*** Settings ***
Documentation    Car rental
Library    SeleniumLibrary
Library    DateTime
Resource    resource.robot
Resource    booking.robot

*** Test Cases ***

Choosing the car for rental
    [Documentation]    select car and confirm booking for the trip
    [Tags]    choose the car for rental VG_test

    Given choosing a car for rental with valid credentials
    When After Confirm Booking Should Show My Page Button
    Then See The History Page

Test valid login credentials
    [Documentation]    login with a valid credential
    [Tags]    Login VG_test

    Given Opening The Webpage
    When Logging In    ${username}    ${password}
    Then see the welcome page to book dates after click continue button

Test invalid login
    [Documentation]    test with invalid username and password it should not be login
    [Tags]    Invalid Login VG_test

    Given Opening The Webpage
    When Invalid Logging In
    Then Alert Message For Wrong Password
    
Book valid dates
    [Documentation]    book your trip through dates
    [Tags]    book valid dates VG_test

    Given Opening The Webpage
    When Logging In   ${username}    ${password}
    Then see the welcome page to book dates after click continue button
    And Book Your Dates    ${start}    ${end}

User cannot book a car without login
    [Documentation]    user trying to book a car for rental without login
    [Tags]    Booking a car without valid credentials VG_Test

    Given Opening The Webpage
    When Book Your Dates    ${start}    ${end}
    Then Booking a car without valid credential

Check the my page function
    [Documentation]    go to my page and check the order id
    [Tags]    check the my page function VG_Test
    Given Opening The Webpage
    When Logging In   ${username}    ${password}
    Then Go to my page and check the order

check if press the hide history button function
    [Documentation]    check the hide history button
    [Tags]    press the hide history button VG_Test
    Given check the show history function
    When click the history button
    Then check the hide history button











    
    
    




