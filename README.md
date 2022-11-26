![](https://i.ibb.co/LrMY5Yz/Group-6.png)

# Ximno
A social Media Platform for people love healthy life!. Built with Flutter.

## Features

- 🏋🏻 Customizable Training Programs with a lot of exercises
- 🍽 Delicious & Healthy Recipes from all over the world
- 📊 Track your progress with our your training report - **coming soon**
- 🌓 Automatic, Light, Dark Theme Options

## Folder Structure
```bash
lib/
├── app/
│   ├── data/
│   │   ├── models # Data Models
│   │   ├── providers # Data Providers ( API, DB, etc. )
│   │   └── services # Data Services
│   └── modules/ # All app capabilities ( aka. Features )
│       └── example_module
├── core/
│   ├── languages # Localication files
│   ├── theme # Theme files ( colors, fonts, etc. )
│   └── utils # Utility files ( helpers, etc. )
└── routes # All app routes
```

## Packages
- [GetX](https://pub.dev/packages/get)
- [http](https://pub.dev/packages/http)
- and more will be added soon...
## Building Source
- Set your working directory to the root of your `git clone`
- Make sure your XCode, Android SDK and Flutter are up to date (flutter upgrade)
- Execute `flutter run`
