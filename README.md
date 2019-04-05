# React Native Simple Architecture

## Why

React Native Simple Architecture (RNSA) allows developers to create apps in no time. It has scripts to add views and functionalities to the code without writing too much boilerplate.

RNSA follows Redux.js architecture as closely as possible. It delivers tools and scripts to generate boilerplate code and separates configurations from the actual code.

## Used technologies

### Handling state
- Redux & React Redux - surprisingly, this combo is the easiest way available to build an app
- Redux Thunk - Can be replaced by Redux Sagas or another library to handle side effects/asynchronous code, but Redux Thunk is the easiest to start project and then work with
- Immutable.JS - simple to learn, yet powerful library to make reducers immutable.
- Redux Persist - NOT IMPLEMENTED YET

### Development tools

- Mocha
- Chai
- redux-immutable-state-invariant

### Others

- React Navigation - The most stable and easiest to use navigation library for React Native
- NativeBase - In terms of development speed, NativeBase has no competition
- React Native Splash Screen - Splash screen handling is installed by default

## Not included by in React Native Simple Architecture

### Windows and Linux support

Mac is required for building iOS apps so the most common mobile app development platform is OSX. I personally don't have other platforms at hand, but if you'd like to add support for your preffered one, PR's are most welcomed.

### Typescript

RNSA is designed for projects that iterate fast and change specs often. Some call this stage of development 0 to 1. The emphasis is on speed of development. Therefore, I start with delivering architecture that doesn't include Typescript.

Adding Typescript template is scheduled after all features in this project works with plain EcmaScript.

If you are budgeting a development effort, consider the following:

- Adding types, resolving problems with missing or outdated types of libraries etc generally adds around 1/3 more work to the project.
- Typescript is another thousands of lines of code that you add to your project. It needs to maintained.
- While Typescript grows in popularity, most of Javascript developers either don't know the language at all or don't understand how to use types to their advantage. Analytics shows that more than 50% of all Typescript code on Github use *Any* type, which is equivalent to not using Typescript at all.

How to decide:

- If your app functionality is already known and it's in maintanance mode rather than fast iteration mode, you should *consider adding Typescript* to the project.
- If you start a completely new app and your developers are from typed language background, *consider using Typescript*
- If you rewrite already built app (in any other technology) and you know that the looks and functionality is not going to change, *consider using Typescript*
- If you start a project form vague idea and you know that specification will change, *don't use Typescript* - it will add too much work.
- If your developers are from web background and/or don't have formal education on typed languages, *don't use Typescript*. It can end up in an unmaintanable code base.

To add Typescript on your own:
1. Change `react-native init $1` to `react-native init $1 --template typescript` in file `/source/buildInitial.mac.sh`
2. Add types to files generated in `/source/makeDirTree.sh`

## Instalation

git clone

## Create newproject

There is one simple script to create an app:

`sh createProject.sh lowercasename`

where *lowercasename* is the name of the project (this is what package.json *name* field recommends).

## Usage

There are following scripts to make your life easier:

### createReducer

Creates boilerplate to add functionality to your app.

`yarn createReducer underline_separated_lower_case_name`

### createContainer

Creates a React component aware of the state.

NOT IMPLEMENTED YET

### createComponent

Creates a React component unaware of the state.

NOT IMPLEMENTED YET
