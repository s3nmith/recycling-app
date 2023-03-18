# SolutionChallenge2023-RecyclingApp
This is our team's project for the Solution Challenge 2023, it is an app. This app is a tool which foreigners can use inorder to sort their trash in accordance with the rules of each ward in Tokyo. 


Some of the SDG's covered in our project:
    GOAL 11: Sustainable Cities and Communities
    GOAL 12: Responsible Consumption and Production
    GOAL 14: Life Below Water
    GOAL 15: Life on Land


We believe that this project will help ease the transition into life in Japan for many people. This is due to the vast amount of students we have seen struggle with garbage sorting during their first month in Japan. This app can also help educate people on the importance of waste sorting.

## Running the program

After downloading this repository as a zip or cloning it. Open it using Visual Studio Code or Android Studio. Make sure you have a working Android Emulator or IOS Emulator.

Run the following command

    flutter run

or

    flutter run --no-sound-null-safety  

## Known Issues

- Lexical or Preprocessor Issue (Xcode): 'vector' file not found. Parse Issue (Xcode): Could not build module 'tflite'
    
    pod deintegrate, install, update, repo update

If this doesn't resolve the issue:

    Open ios/Runner.xcworkspace in Xcode, click Runner > Tagets > Runner > Build Settings, search Compile Sources As, change the value to Objective-C++
    
- Parse Issue (Xcode): Use of '@import' when C++ modules are disabled, consider using -fmodules and -fcxx-modules

    Open ios/Runner.xcworkspace in Xcode, click Runner > Tagets > Runner > Build Settings, search Other C++ Flags, add the compiler flag -fcxx-modules


