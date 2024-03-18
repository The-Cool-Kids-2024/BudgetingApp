# Design Specifications

## INTRODUCTION

This software design document describes the architecture and system design of CommonCents - a mobile budgeting app to help users manage their finances.

## SYSTEM OVERVIEW

Give a general description of the functionality, context and design of your project. Provide any background information if necessary.

### REQUIREMENTS

| Req No. | Requirement                                                                                                                     |
| ------: | ------------------------------------------------------------------------------------------------------------------------------- |
| 1.0     | The app shall allow users to track their monthly expenses through user input.                                                   |
| 2.0     | The app shall allow users to log in with a username and password pair.                                                          |
| 2.1     | The app shall store and retrieve historical expense data for multiple users.                                                    |
| 3.0     | The app shall allow users to plan large purchases by calculating monthly savings based on total price and desired goal date.    |
| 3.1     | The app shall allow users to plan large purchases by calculating a goal date based on total price and desired monthly savings.  |
| 4.0     | The app shall be supported on iOS devices.                                                                                      |
| 4.1     | The app shall be supported on Android devices.                                                                                  |

## SYSTEM ARCHITECTURE

```mermaid
flowchart TD;
    A[Login Page] --"Create Account" button --> B[Create Account]
    A -- "Login" button w/ valid credentials --> C[Home Page]
    A -- "Login" button w/ invalid credentials --> A
    B --> C
    C -- "Budget" button --> D[Budget]
    C -- "Add" button --> E[Add Income/Expense]
    C -- "Profile" button --> F[View Profile]
    C -- "Goal" button --> G[Goal] 
    F -- "Log out" button --> A
```

### Login Page

The Login Page is the first page displayed to the user upon opening the app. It allows users to either enter their login credentials or create an account.

### Home Page
### Income/Expense Page
### Budget Page
### Goals Page
### Account Page

The account page displays the user's first name, last name, username, and email. From this page, users can choose to change these fields or log out.

## DATA DESIGN

### Data Description
Explain how the information domain of your system is transformed into data structures. Describe how the major data or system entities are stored, processed and organized. List any databases or data storage items.


## INTERFACE DESIGN

### Login Page

- "Username" text field
- "Password" text field
- "Log In" button
- "Create Account" button

### Create Account Page

- "First Name" text field
- "Last Name" text field
- "Email" text field
- "Username" text field
- "Password" text field
- "Confirm Password" text field
- "Create Account" button

### Home Page
### Income/Expense Page
### Budget Page
### Goals Page
- "Goal Amount" number field
- "Goal date" date field
- "Goal monthly" number field (appears based on "Switch to monthly goal")
- "Switch to monthly goal" button
### Account Page

The account page displays the user's first name, last name, username, and email. From this page, users can choose to change these fields or log out.
