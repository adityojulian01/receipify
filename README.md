# Receipify

Generate recipes from your recipes and ingredients at home.

## Features and Limitations
- Add ingredients that you already have to your inventory in the app.
- Scan receipts and get list of recipes that you can potentially make based on the ingredients in the receipts and your invenvtory.
- Customize the ingredients from the receipts and inventory for recipes that match your taste.
- Explore the popular recipes or recipes based on the category.
- Search for recipes that also consider the ingredients that you have in your inventory.
- Manage your scanned receipt and its corresponding food items.

## Documentation
### Welcome Page
<table width = "width:100%">
  <col style = "width:60%">
  <col style = "width:20%">
  <col style = "width:20%">
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
      <td> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837519.png" width="200"/>
      </td>
      <td> In the Welcome Page, you can create an account by clicking 'Sign Up' button or login to your account with the 'Sign In' Button </td>
    </tr>
    <tr>
      <td>Sign Up & Sign In Page</td>
      <td> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837628.png" width="200"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837701.png" width="200"/>
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
      <td> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837716.png" width="200"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837762.png" width="200"/>
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
      <td> 
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
      <td> 
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837790.png" width="200"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837808.png" width="200"/>
        <img src = "https://github.com/adityojulian01/receipify/blob/master/documentation/Screenshot_1653837815.png" width="200"/>
      </td>
      <td> 
        <ul>
          <li> The inventory page shows you the list of ingredients that you've entered in the pre-ingredients page before </li>
          <li> You can  add or remove ingredients by using the 'Add' button to add or search the items using the search bar at the top. For removing ingredients, you can simply press the 'X' icon on the corresponding items</li>
          <li> Once you're happy with the changes, press the 'Update' button </li>
        </ul> 
      </td>
    </tr>
  </tbody>
</table>
