# coding_challenge
This is the expatrio home assignment for the mobile post

## credentials for access

- email : tito+bs792@expatrio.com
- password : nemampojma

## Getting Started

A postman collection is available along with a video showing the flow and an apk in case you want to
test it yourself
link is here -> [click ](https://drive.google.com/drive/folders/1MuyOdR152tvVVctcRwouRiXZAbG9XM5K)

## Set up and run project

From the project root folder run these commands (you must have installed and configured flutter on
your machine):

- get dependencies

  ```flutter pub get```

- generate code (I didn't commit generated files into git)

  ```dart run build_runner build```

- build and run

  ```flutter run```

## Overview of project

The task is not finished: I've spent too much time setting up a proper authorisation flow and
underestimated the complexity of the tax data widget.

I have made a decision to add as few additional dependencies as possible and use the ones already
provided. Otherwise I would add some state management mechanism (I think Provider is enough for this
scope).

The project definitely lacks error handling when working with the API and user input. And the
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