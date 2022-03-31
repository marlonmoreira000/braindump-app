# Software Development Plan

---

## 1. Statement of Purpose and Scope

#### What will this application do?

In a nutshell, this application will plan your day for you. It allows users to add daily tasks, then it sorts them in order of priority. Instead of trying to plan the day yourself, let the app do it for you.

####  What problem is this application solving?

We all know that planning your day can be time consuming and tricky, especially when you have lots of tasks and different deadlines. This app solves this problem by planning the day for you, saving you time and brain-power. It maximises your productivity by keeping you on track with the most important tasks throughout the day.

#### Who is the target audience for this application?

Anyone looking to save a bit of time and boost their productivity.


## 2. App features

#### 1. Add tasks

Users can add as many tasks as they want to their schedule. To add a task, users must provide a task description, and tell the app when it is due, and how important it is. 

#### 2. Delete tasks

Users can delete one or more tasks from their schedule.
They need to confirm that they want to delete, before deletion. 

#### 3. Mark tasks as complete

Users can mark one or more tasks for completion. This will be shown in the schedule as 'complete' (in green text).

#### 4. See schedule

User's daily tasks are sorted, based on when they are due, and how important they are. This makes sure that the most important tasks are completed first. The schedule also colors tasks according to their status, 'complete' (in green) or 'incomplete' in red.

#### 5. Clear schedule

Users can clear their entire schedule anytime, allowing them to start fresh every day.

#### Feature 3: User customisation

Users are able to add their name as an argument on the command line, which personalises user experience in the app by displaying their name in the menu.

## 3. User Interaction and Experience

#### How the user will find out how to interact with/use each feature?

The user will be given a simple menu, and easy-to-understand prompts throughout the app. These will always be at the bottom of the screen, creating a consistent format which is easy to navigate.

#### How the user will interact with/use each feature?

The users will interact with the program via their keyboard only. They will be required to provide various input, such as text input for task descriptions, and numeric input for task importance codes.

#### How errors will be handled by the application and displayed to the user?

All input will be validated. If input is invalid, the user will be asked to retry. Other errors will be treated through standard error-handling methods (i.e. raising errors when needed and using `begin-rescue-end` blocks to handle them)

## 4. Control Flow Diagram

![control-flow-diagram](/docs/control-flow-diagram.png)

## 5. Implementation Plan

#### Trello Board

The Trello board for this project can be found [here.](https://trello.com/b/hXgtQZNi/coder-exercise)

#### Implementation Checklist


| Feature | Steps                                                                                                           | Deadline      |
| -------------- | --------------------------------------------------------------- | ------------- |
| Add task/s          | - User selects option to add task<br />- User is prompted for input<br />- Input is validated<br />- User input is stored in Task class<br />- Task is added to Schedule<br />- Confirmation message is displayed<br />- User is asked if they would like to add another task, or exit back to main menu| 26th March |
| Delete task/s          | - User selects option to delete task<br />- User is presented with a printout of current tasks<br />- User chooses which task they would like to delete<br />- Input is validated<br />- Task is removed from Schedule<br />- Confirmation message is displayed<br />- User is asked if they would like to delete another task, or exit back to main menu| 27th March |
| Mark task/s as complete          | - User selects which tasks they have completed<br />- Task object status is changed to 'completed'<br />- Task status is changed to green to indicate it's been completed<br />- Schedule is printed to screen with green status<br />- User is prompted to exit back to main menu<br />| 28th March |
| Show schedule          | - User selects option to show schedule<br />- Schedule is sorted by algorithm<br />- Schedule is colorized<br />- Schedule is printed to screen<br />- User is prompted to exit back to main menu<br />| 29th March |
| Clear schedule         | - User selects option to clear schedule<br />- User is shown a warning that this action will delete all current tasks, are they sure they would like to continue?<br />- User chooses yes or no<br />- Input is validated<br />- If yes, Schedule is cleared, confirmation message is displayed and return to main menu<br />- If no, return to main menu<br />| 31st March |
