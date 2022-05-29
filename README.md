# Receipify

Generate recipes from your recipes and ingredients at home.
Supported by [Spoonacular API](https://spoonacular.com/food-api/ "Spoonacular API").

## Features
- Add ingredients that you already have to your inventory in the app.
- Scan receipts and get list of recipes that you can potentially make based on the ingredients in the receipts and your invenvtory.
- Customize the ingredients from the receipts and inventory for recipes that match your taste.
- Explore the popular recipes or recipes based on the category.
- Search for recipes that also consider the ingredients that you have in your inventory.
- Manage your scanned receipt and its corresponding food items.

## Tech Stacks
- Android Frontend: Flutter

<!-- <code>flutter --version</code>
<code>
    Flutter 2.13.0-0.0.pre.227 • channel master • https://github.com/flutter/flutter.git 
    Framework • revision 0a7b3d72c9 (10 weeks ago) • 2022-03-23 12:10:17 -0700 
    Engine • revision 4fbff7a511 
    Tools • Dart 2.17.0 (build 2.17.0-227.0.dev) • DevTools 2.11.4
</code> -->

> $ flutter --version

> Flutter 2.13.0-0.0.pre.227 • channel master • https://github.com/flutter/flutter.git 
> Framework • revision 0a7b3d72c9 (10 weeks ago) • 2022-03-23 12:10:17 -0700 
> Engine • revision 4fbff7a511 
> Tools • Dart 2.17.0 (build 2.17.0-227.0.dev) • DevTools 2.11.4

- Backend: Django (Django REST Framework)

- External API: [Spoonacular API](https://spoonacular.com/food-api/ "Spoonacular API")

- Used Library:
  - [Pytesseract](https://pypi.org/project/pytesseract/ "Pytesseract")
  - [OpenCV](https://opencv.org "OpenCV")

## Disclaimer
- This app is still in development stage. 
- This repo is made purely for personal use.

## Technical Notes
- This app uses JWT Authentication to authenticate user and generate token.
- For extracting the receipt to local ingredient list, this app uses pytesseract to convert the image to string and uses custom REGEX to extract only the items from the string (removing the date, price, etc.) then convert the items into a list.

## Documentation
### Welcome Page
<table stlye="width:100%">
    <colgroup>
       <col span="1" style="width: 15%;">
       <col span="1" style="width: 70%;">
       <col span="1" style="width: 15%;">
    </colgroup>
  <thead>
    <tr>
      <th>Page</th>
      <th>Andorid Emulator</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Welcome Page</td>
      <td align="center" style:"width=700"> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837519.png" width="200"/>
      </td>
      <td> In the Welcome Page, you can create an account by clicking 'Sign Up' button or login to your account with the 'Sign In' Button </td>
    </tr>
    <tr>
      <td>Sign Up & Sign In Page</td>
      <td align="center"> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837628.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837701.png" width="100"/>
      </td>
      <td> 
        <ul>
          <li> In order to register, you need to put your username, email and password</li>
          <li> Currently, the app is still on development phase and if you fill the email field with anything as long as it has '@' and it would still be valid </li>
          <li> This app uses JWT authentication to authenticate your accocunt credentials and the password that are saved into the database is hashed </li>
        </ul> 
      </td>
    </tr>
    <tr>
      <td>Pre-Ingredients Page</td>
      <td align="center" style:"width=700"> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837716.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837762.png" width="100"/>
      </td>
      <td> 
        <ul>
          <li> Search for ingredients or food items that you already have in your home and it will be saved into your inventory as well as in our database  </li>
          <li> You can add the ingredients by using the ingredient suggestions or use the search button and add manually </li>
          <li> You can remove the ingredients that you've added and it will be automatically updated </li>
        </ul> 
      </td>
    </tr>
    <tr>
      <td>Main Page</td>
      <td align="center" style:"width=700"> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837785.png" width="200"/>
      </td>
      <td> 
        <ul>
          <li> The main page provides you a camera to scan your receipt </li>
          <li> You can get the receipt image by capturing it from your camera or choosing it from your phone's gallery </li>
        </ul> 
      </td>
    </tr>
    <tr>
      <td>Inventory Page</td>
      <td align="center" style:"width=700"> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837790.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837808.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837815.png" width="100"/>
      </td>
      <td> 
        <ul>
          <li> The inventory page shows you the list of ingredients that you've entered in the pre-ingredients page before </li>
          <li> You can  add or remove ingredients by using the 'Add' button to add or search the items using the search bar at the top. For removing ingredients, you can simply press the 'X' icon on the corresponding items</li>
          <li> Once you're happy with the changes, press the 'Update' button </li>
          <li> These items are stored on the database of your account </li>
        </ul> 
      </td>
    </tr>
    <tr>
      <td>Scan and Search</td>
      <td align="center" style:"width=700"> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838035.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838164.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838170.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838174.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838187.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838201.png" width="100"/>
      </td>
      <td> 
        <ul>
          <li>If you choose the 'Gallery' icon on the main page, you would be able to choose the image of the receipt that you already have in your phone's gallery</li>
          <li>Once you've chosen the image of the receipt, the app will shows you the list of the ingredients extracted from the receipt and also the ingredients from your inventory</li>
          <li>You can customize the list of the ingredients so that the recipes that are going to be shown later is according to your preference</li>
          <li>You can add the items and the receipt to your inventory by simply clicking the 'Add receipt and item to library' button</li>
          <li>Press 'Scan' button to see the list of recipes that you can potentially make. It would also shows you the number of missed and (will be) used ingredients represented with the 'x' and '\/' (check) button respectively</li>
          <li>The app shows you the detail ingredients and steps needed to make the meal. It also shows you the name of the ingredients that you missed and (are going to) use</li>
        </ul> 
      </td>
    </tr>
    <tr>
      <td>Receipt Library Page</td>
      <td align="center" style:"width=700"> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837825.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838212.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838217.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838218.png" width="100"/>
      </td>
      <td> 
        <ul>
          <li> The Receipt Library shows the receitps that you have scanned and saved </li>
          <li> You can see (food/ingredient) items of the receipt by clicking the image of the receipt and go to the 'Items' bar</li>
          <li> These receipts are saved into the database of your account </li>
        </ul> 
      </td>
    </tr>
    <tr>
      <td>Recipe Page</td>
      <td align="center" style:"width=700"> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837831.png" width="200"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837847.png" width="200"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837954.png" width="200"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837957.png" width="200"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837975.png" width="200"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838018.png" width="200"/>
      </td>
      <td> 
        <ul>
          <li> In the Recipe Page, you can scroll through popular recipes or look for recipes based on the provied category </li>
          <li> These recipes are taken from <a href="https://spoonacular.com/food-api/">Spoonacular API</a></li>
          <li> You can use the search bar to search for recipes and check the details on what ingredients are used and the steps needed to make the meal </li>
          <li> This app provide you the feauture to include your inventory when searching for recipes. This feature allows the user to see the number of missed and used ingredients as well ('x' icon for missed ingredietns and '\/' (check) icon for used ingredients). </li>
        </ul> 
      </td>
    </tr>
    <tr>
      <td>Profile Page</td>
      <td align="center""> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837831.png" width="100"/>
      </td>
      <td>The profile page shows you the username, email and the number of the receipt that you've scanned and saved as well as a 'Logout' button</td>
    </tr>
    <tr>
      <td>Dark Mode</td>
      <td align="center" style:"width=700"> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838227.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838230.png" width="100"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653838233.png" width="100"/>
      </td>
      <td>As an accessibility feature, this app is supporting dark mode</td>
    </tr>
  </tbody>
</table>
