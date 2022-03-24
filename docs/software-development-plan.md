# Software Development Plan

---

## Statement of Purpose and Scope

#### What will this application do?

In a nutshell, this application will plan your day for you. It allows users to add daily tasks, then it sorts them in order of priority. Instead of trying to plan the day yourself, let the app do it for you.

####  What problem is this application solving?

We all know that planning your day can be time consuming and tricky, especially when you have lots of tasks and different deadlines. This app solves this problem by planning the day for you, saving you time and brain-power. It maximises your productivity by keeping you on track with the most important tasks throughout the day.

#### Who is the target audience for this application?

Anyone looking to save a bit of time and boost their productivity.

#### How will the target audience use this application?

## Features

#### Feature 1: Adding and deleting tasks

Users can add and delete tasks anytime. These will be added to their daily schedule.

#### Feature 2: Sorting your schedule for you

The app sorts (and color codes) daily tasks based on their importance and when they are due form completion. This takes the thinking out of planning your day.

#### Feature 3: User customisation

Users are able to add their name as an argument on the command line, which personalises user experience in the app by displaying their name in the menu.

## User Interaction and Experience

#### How the user will find out how to interact with/use each feature?

The user will be given a simple menu, and easy-to-understand prompts throughout the app. These will always be at the bottom of the screen, creating a consistent format which is easy to navigate.

#### How the user will interact with/use each feature?

The users will interact with the program via their keyboard only. They will be required to provide various input, such as text input for task descriptions, and numeric input for task importance codes.

#### How errors will be handled by the application and displayed to the user?

All input will be validated. If input is invalid, the user will be asked to retry. Other errors will be treated through standard error-handling methods (i.e. raising errors when needed and using `begin-rescue-end` blocks to handle them)

## Control Flow Diagram

!(control-flow-diagram)[/docs/control-flow-diagram.png]

## Implementation Plan

#### Trello Board

The Trello board for this project can be found (here.)[https://trello.com/b/hXgtQZNi/coder-exercise]

#### Implementation Checklist


| Feature | Steps                                                                                                           | Deadline      |
| -------------- | --------------------------------------------------------------- | ------------- |
| Add a task          | - User selects option to add task<br />- User is prompted for input<br />- Input is validated<br />- User input is stored in Task class<br />- Task is added to Schedule<br />- Confirmation message is displayed<br />- User is asked if they would like to add another task, or exit back to main menu| Due Date |
| Delete a task          | - User selects option to delete task<br />- User is presented with a printout of current tasks<br />- User chooses which task they would like to delete<br />- Input is validated<br />- Task is removed from Schedule<br />- Confirmation message is displayed<br />- User is asked if they would like to delete another task, or exit back to main menu| Due Date |
| Show schedule          | - User selects option to show schedule<br />- Schedule is sorted by algorithm<br />- Schedule is colorized<br />- Schedule is printed to screen<br />- User is prompted to exit back to main menu<br />| Due Date |
| Clear schedule         | - User selects option to clear schedule<br />- User is shown a warning that this action will delete all current tasks, are they sure they would like to continue?<br />- User chooses yes or no<br />- Input is validated<br />- If yes, Schedule is cleared, confirmation message is displayed and return to main menu<br />- If no, return to main menu<br />| Due Date |
