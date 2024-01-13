*** Settings ***
Library           ../../Users/DELL/AppData/Local/Programs/Python/Python312/Lib/site-packages/SeleniumLibrary/

*** Variables ***
${url}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}        chrome
${password}       xpath=//input[@placeholder='Password']
${username}       xpath=//input[@placeholder='Username']
${login_button}    xpath=//button[normalize-space()='Login']
${comp_image}     class=orangehrm-login-branding
${usernameinput}    Admin
${passwordinput}    admin123
${dashboard}      https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
${userdropdown}    class=oxd-userdropdown-tab
${logout}         xpath=//a[normalize-space()='Logout']
${body}           xpath=//body
${leave}          class=oxd-main-menu-item
${myinfo}         xpath=//span[normalize-space()='My Info']
${midname}        xpath=//input[@placeholder='Middle Name']
${status}         xpath=//div[contains(text(),'Married')]
${B+}             xpath=//div[contains(text(),'B+')]
${savePI}         xpath=//div[@class='orangehrm-custom-fields']//button[@type='submit'][normalize-space()='Save']
${contactdetails}    xpath=//a[normalize-space()='Contact Details']
${country}        xpath=//div[5]//div[1]//div[2]//input[1]
${saveCD}         xpath=//button[normalize-space()='Save']
${applyleave}     xpath=//button[@title='Apply Leave']//*[name()='svg']
${leavetype}      xpath=//i[@class='oxd-icon bi-caret-down-fill oxd-select-text--arrow']

*** Test Cases ***
Login & Logout TC
    [Documentation]    This is my first time creating automation by Robot.
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    wait until element is visible    ${comp_image}
    input text    ${username}    ${usernameinput}
    input text    ${password}    ${passwordinput}
    click element    ${login_button}
    wait until location is    ${dashboard}
    press keys    ${body}    ESC
    click element    ${userdropdown}
    click element    ${logout}
    wait until location is    ${url}
    [Teardown]    close browser

Apply leave
    [Documentation]    Already update leave entitlements
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    wait until element is visible    ${comp_image}
    input text    ${username}    ${usernameinput}
    input text    ${password}    ${passwordinput}
    click element    ${login_button}
    sleep    2
    wait until location is    ${dashboard}
    press keys    ${body}    ESC
    sleep    5
    wait until element is visible    ${applyleave}
    sleep    2
    click element    ${applyleave}
    wait until location is    https://opensource-demo.orangehrmlive.com/web/index.php/leave/applyLeave
    click element    ${leavetype}
    [Teardown]    close browser

Update personal details
    [Documentation]    This is my first time creating automation by Robot.
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    wait until element is visible    ${comp_image}
    input text    ${username}    ${usernameinput}
    input text    ${password}    ${passwordinput}
    click element    ${login_button}
    wait until location is    ${dashboard}
    press keys    ${body}    ESC
    click element    ${myinfo}
    wait until location is    https://opensource-demo.orangehrmlive.com/web/index.php/pim/viewPersonalDetails/empNumber/7
    sleep    2
    Wait Until Element Is Visible    ${midname}
    click element    ${midname}
    sleep    2
    input text    ${midname}    Updatetest
    click element    ${savePI}
    [Teardown]    close browser

Update contact detail
    [Documentation]    This is my first time creating automation by Robot.
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    wait until element is visible    ${comp_image}
    input text    ${username}    ${usernameinput}
    input text    ${password}    ${passwordinput}
    click element    ${login_button}
    sleep    2
    wait until location is    ${dashboard}
    press keys    ${body}    ESC
    click element    ${myinfo}
    sleep    2
    wait until location is    https://opensource-demo.orangehrmlive.com/web/index.php/pim/viewPersonalDetails/empNumber/7
    click element    ${contactdetails}
    sleep    2
    wait until location is    https://opensource-demo.orangehrmlive.com/web/index.php/pim/contactDetails/empNumber/7
    Wait Until Element Is Visible    ${country}
    click element    ${country}
    input text    ${country}    11
    sleep    2
    click element    ${saveCD}
    sleep    2
    [Teardown]    close browser
