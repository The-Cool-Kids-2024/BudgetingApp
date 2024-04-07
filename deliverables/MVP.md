# Minimum Viable Product (MVP)

This MVP for our  budgeting app focuses on essential features that provide value to users while keeping development costs and time to a minimum.
## Design
flowchart TD;
    A[Login Page] --"Create Account" button --> B[Create Account]
    A -- "Login" button w/ valid credentials --> C[Home Page]
    A -- "Login" button w/ invalid credentials --> A
    B --> C
    C -- "Home" button --> D[Home]
    C -- "Add Goal" button --> H[Add Goal Page]
    H --> C
    C -- "Add Income/Expense" button --> I[Add Income/Expense Page]
    I --> C
    C -- "Budget" button --> E[Budget Page]
    C -- "Goals" button --> F[Goals Page]
    C -- "Account" button --> G[Account Page]


- Login: Allow users to create accounts or sign in using credentials.

- Home Page: A central hub where users can view their financial overview, including income, expenses, and free money.

- Income/Expense Tracking: Enable users to input and track their various sources of income and allow users to categorize and track their expenses. Provide predefined categories (e.g., groceries, utilities, rent) and the option to create custom categories.

- Budget Creation: Enable users to set monthly budgets for different expense categories. They should be able to specify budget amounts and duration.

- Goal Tracking: Allow users to add a Goal and track it.


