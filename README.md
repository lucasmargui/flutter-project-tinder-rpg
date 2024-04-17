<H1 align="center">Application simulating Tinder with style RPG</H1>
<p align="center">🚀 Project to create an application structure using Flutter for future references</p>

## Overview
This application was designed using Flutter to simulate the structure of a dating application with rpg elements



## Main Features

### Character Profile
Adventurer profile, the dating app for fearless explorers and adventurers looking for journey :

Profile
- Adventurer Name:
- Class:
- Experience Level:
- Equipment:

Attributes:

- Strength:
- Agility:
- Intelligence:




<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_TinderRpg/assets/157809964/df989e39-4b85-4876-807a-b613aa510b72" style="width:40%">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_TinderRpg/assets/157809964/9f22f9ba-fd25-4e58-80ae-7f5af968348c" style="width:40%">
</div>


### Battles

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_TinderRpg/assets/157809964/67eec330-b927-4237-80a9-c5378c09d978" style="width:40%">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_TinderRpg/assets/157809964/f8472d42-883a-4d71-8fe5-9ea01dffbeed" style="width:40%">
</div>

## Settings

<details>
 <summary>Click to show content</summary>

### Step 1: Changing the Flutter channel

You need to change the Flutter version to a specific version, in this case to version 2.0.1. But before switching to a specific version, it's important to ensure you're in the correct Flutter channel. In this case, we will switch to the master channel.

Type the following command in your terminal:

```
flutter channel master
```

### Step 2: Changing the Flutter version
Navigate to the folder where Flutter is installed on your system using the terminal

```
cd E:\src\flutter
```
Now, you need to use Git to checkout to the desired version. In our case, we want version 2.0.1:
```
git checkout 2.0.1
```
This command will have you working with version 2.0.1 of Flutter, where the application was developed.

### Step 3: Verify Installation and download necessary files
After switching to the desired version, it is important to check that everything is configured correctly. To do this, run the following command:

```
flutter doctor -v
```

This will verify your Flutter installation and download any files required for the selected version.

After performing these steps, you are ready to develop or compile your application using Flutter version 2.0.1.


### Step 4 (Optional): Resolving Java compilation version error

```
flutter doctor --android-licenses
```

```
java.lang.UnsupportedClassVersionError:
com/android/sdklib/tool/sdkmanager/SdkManagerCli has been compiled
by a more recent version of the Java Runtime (class file version 61.0),
this version of the Java Runtime only recognizes class file versions up to 52.0’
```

The specific error message indicates that the SdkManagerCli class file was compiled with a newer version of the Java Runtime (class file version 61.0), while the version of the Java Runtime you are using only recognizes class file versions up to 52.0.

In this case, version 52 is required, which corresponds to version 8 based on the Java version table.

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_Stocks/assets/157809964/35cf45a7-f805-46d1-b101-788c67707930" style="width:50%">
</div>


Now go to the Android Studio SDK manager and download the corresponding Command-line SDK with version 52

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_Stocks/assets/157809964/f2668f73-902d-458e-8392-3ecc2ff70605" style="width:50%">
</div>

After downloading the corresponding version, navigate to the folder where SDK is installed and change the downloaded version (8.0) to latest

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_Stocks/assets/157809964/3fa35ce5-6ead-4295-869f-945a3c9cb6bf" style="width:50%">
</div>




### Step 5 (Optional): Solving Android Studio not found error

Command used to configure the Android Studio directory in the Flutter environment if it was installed in a different directory.
```
flutter config --android-studio-dir="path\to\Android Studio"
```

### Step 6 (Optional): Resolving Java not found error
```
‘Unable to find bundled Java version with flutter doctor.....’
```
The error "Unable to find bundled Java version" indicates that Flutter was unable to find a Java version included in the bundle. This can occur when Flutter cannot find the Java installation on your system or when the Java installation is not configured correctly.

This error may be caused when the jre folder within the Android Studio directory is empty or has just one file. To solve it, simply copy and paste the jbr folder and rename it to jre

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_Stocks/assets/157809964/a8e5ca2a-dd26-40f2-905d-c38108075edb" style="width:50%">
</div>


</details>













