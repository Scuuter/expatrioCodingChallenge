# coding_challenge
This is the expatrio home assignment for the mobile post


### Requirements:
1. Implement a login page with Expatrio authentication.
2. After successful login, redirect the user to a screen with a prominent CTA to update their
TAX DATA.
3. When the user clicks on the "Update Tax Data" CTA, a bottom sheet should open,
prompting the user to input their tax data.
1. Implement API to receive tax data and to pre-populate existing fields.
4. The bottom sheet should allow the user to select a country from a list from lib/shared and
also allow the user to input a TAX ID number for the field.
5. A user can select multiple taxation countries by clicking the ADD ANOTHER CTA.
However, the user should not be able to choose a previously selected country.
1. Note: The user can also remove any additional countries by clicking on the
remove CTA. Please note: By default, the user must have at least one
country/tax pair available.

6. The user must be forced to check a checkbox verifying the accuracy of their information
before being able to submit their tax data.
7. The tax data should be stored locally for the user’s ID and pushed to the backend via
API integration.
8. If the user clicks on the "Update Tax Data" CTA again, the bottom sheet should open
with the user's populated data, allowing them to edit and update the information at will.


### Submission Guidelines:
1. Provide a GitHub repository with the Flutter code.
2. Include clear instructions on setting up and running the application.
3. Ensure that the code is well-documented and follows best practices.
4. Use version control effectively, with meaningful commit messages.
5. Include a README file with an overview of the project, any considerations made, and
potential improvements.

### Bonus Points:
● Implement secure authentication practices.
● Handle edge cases, such as network errors or invalid user input.
● Include unit tests to ensure the reliability of the code.

# Overview of my work

The task does not satisfy all the requirements: I've spent too much time setting up a proper authorisation flow and
underestimated the complexity of the tax data widget. Although, I am proud of my work on authorisation flow and consider the scope of this unpaid assignment too high.

I have made a decision to add as few additional dependencies as possible and use the ones already
provided. Otherwise I would add some state management mechanism (I think Provider is enough for this
scope).

The project lacks error handling when working with the API and user input. And the
critical logic should be tested.

I have also added to-dos in the code with more minor improvements.

### Next steps

- add logic for updating tax data
- error handling
- unit tests
- make design closer to provided example
- (optional) check for material and apple guidelines compliance
- (optional) check for responsiveness and adaptivity
- (optional) state management
- turn all strings into assets (move them to the dedicated file)
- close other to-dos

# Additional info to run the project

## Getting Started

A postman collection is available along with a video showing the flow and an apk in case you want to
test it yourself
link is here -> [click ](https://drive.google.com/drive/folders/1MuyOdR152tvVVctcRwouRiXZAbG9XM5K)

## credentials for access

- email : tito+bs792@expatrio.com
- password : nemampojma

## Set up and run project

You can simply download and install .apk file from latest release on available android device or
emulator.

#### Or build it yourself

From the project root folder run these commands (you must have installed and configured `flutter` on
your machine):

- get dependencies

  ```flutter pub get```

- generate code (I didn't commit generated files into git)

  ```dart run build_runner build```

- build and run

  ```flutter run```

