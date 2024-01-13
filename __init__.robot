*** Settings ***
Library           ../../Users/DELL/AppData/Local/Programs/Python/Python312/Lib/site-packages/SeleniumLibrary/

*** Variables ***
${url}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}        chrome
${username}       xpath=//div[@class='orangehrm-login-branding']
${password}       xpath=//input[@placeholder='Password']
${login_button}    xpath=//button[normalize-space()='Login']
${comp_image}     class=orangehrm-login-branding
${usernameinput}    Admin
${passwordinput}    admin123
${dashboard}      https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
${userdropdown}    xpath=//span[@class='oxd-userdropdown-tab']
