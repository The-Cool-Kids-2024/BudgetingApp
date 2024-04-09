# Requirement -Evaluation plan

e: evaluation r: requirements

1.0.r The app shall allow users to track their monthly income and expenses through user input.

  - 1.0.e: This requirement will be evaluated by conducting user testing to ensure that users can successfully input and track their monthly income and expenses.

1.1.r The app shall allow users to log in with a username and password pair.

  - 1.1.e: This requirement will be evaluated by user testing on the home page where it asks for login information.

1.2.r The app shall salt and hash user passwords to ensure security.

  - 1.2.e This requirement will be evaluated by analyzing the "salt" and "password" fields of the account tuples stored in the database.

1.3.r The app shall allow users to create accounts with their first name, last name, username, email, and password.

  - 1.3.e This requirement will be evaluated by checking that a tuple is created for each user upon submission through the app.

1.4.r The app shall allow users to edit the first name, last name, username, and email of their account.

  - 1.4.r This requirement will be evaluated by checking that the edited fields trigger a change in the user tuple in the database upon submission through the app.

2.0.r The app shall store and retrieve and display income and expense data for multiple users.

  - 2.0.e This requirement will be evaluated by inputting income and expense data on multiple user accounts and ensuring that users can only view and submit records to their account.

3.0.r  The app shall allow users to plan large purchases by calculating monthly savings based on the total price and desired goal date.

  - 3.0.e: This requirement will be evaluated by ensuring that any goal created by the user displays a correct recommended monthly payment.

~~3.1.r The app shall allow users to plan large purchases by calculating a goal date based on the total price and desired monthly savings.~~

  - ~~3.1.e: This will be evaluated by user testing on the goals and plans page where the user can input the total price for the purchase and the desired monthly savings.~~

4.0.r The app shall be supported on iOS devices.

  - 4.0.e: This requirement will be evaluated by testing on at least one iOS device.

4.1.r The app shall be supported on Android devices.

  - 4.0.e: This requirement will be evaluated by testing on at least one Android device.

## Changelog

- 4/4/2024 - Removed requirement 3.1 due to developer time constraints as a result of issues with development environment and GitHub.

- 4/4/2024 - Added requirements 1.2, 1.3, and 1.4
