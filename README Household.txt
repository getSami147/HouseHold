***"Household Mobile Application"***.

// How to install the Flutter in Window Operating System:
Step 1: Check system requirements
Ensure your computer meets the following requirements:

Operating System: Windows 7 SP1 or later (64-bit)
Disk Space: At least 400 MB (excluding IDE/Tooling)
Tools: Git for Windows installed (if you plan to use Flutter with the command-line interface)
Step 2: Download Flutter SDK

Go to the Flutter website: https://flutter.dev/
Click on the "Get started" button and then select "Windows" as your operating system.
Click on the "Download Flutter SDK for Windows" button to download the zip archive.
Step 3: Extract the Flutter SDK

Once the download is complete, extract the contents of the downloaded zip archive to a location on your computer. For example, you can extract it to "C:\src\flutter".
Step 4: Set up Environment Variables

Add the Flutter SDK path to the system environment variables:
Open the Start menu and search for "Environment Variables".
Select "Edit the system environment variables".
Click on the "Environment Variables" button at the bottom right.
In the "System variables" section, look for the "Path" variable, and click on the "Edit" button.
Click on "New" and add the path to the "flutter\bin" directory. For example, if you extracted the SDK to "C:\src\flutter", add "C:\src\flutter\bin" to the list.
Click "OK" to close all the windows.
Step 5: Install Android Studio (optional but recommended)

Although Android Studio is optional, it's recommended as it provides an easy way to set up the Android SDK and AVD (Android Virtual Device) for running Flutter apps on an Android emulator.
Download Android Studio from: https://developer.android.com/studio
Install Android Studio following the installation wizard and default settings.
Step 6: Set up Android Studio (optional)

Open Android Studio.
Click on "Configure" in the welcome screen and select "SDK Manager".
In the SDK Manager, go to the "SDK Platforms" tab and select at least one version of the Android OS to install (e.g., Android 11.0).
Go to the "SDK Tools" tab, and make sure "Android SDK Command-line Tools" is checked. Then click "Apply" to install them.
After the installation is complete, click "Finish".
Step 7: Verify Flutter installation

Open a Command Prompt or PowerShell window.
Run the command flutter doctor. This command will check your installation and display any missing dependencies you need to install.
If there are any missing dependencies, follow the instructions to install them.
Once everything is set up, you should see "All Android licenses accepted" and "Flutter is ready to run!" at the end of the output.
That's it! You've successfully installed Flutter on Windows. You can now create and run Flutter apps on both Android and iOS devices/emulators.


// To run a Flutter app on both an emulator and a physical device (mobile), follow these steps:

Step 1: Connect your physical device (Mobile)
- Connect your Android or iOS device to your computer using a USB cable.
- Make sure that USB debugging is enabled on your device. For Android, you may need to enable Developer Options and USB Debugging in the device settings.

Step 2: Launch Emulator (if using an emulator)
- If you're using an emulator, launch it from Android Studio or by running `flutter emulator` command in the terminal.

Step 3: Check connected devices
- Open a Command Prompt or Terminal window.
- Run the command `flutter devices` to check if your connected device (physical or emulator) is recognized by Flutter.

Step 4: Run the Flutter app
- Navigate to the root directory of your Flutter project using the Command Prompt or Terminal.
- To run the app on an emulator, use the command `flutter run`. Flutter will automatically detect and launch the app on the open emulator.
- To run the app on your physical device, use the command `flutter run -d device_id`, where `device_id` is the ID of your connected device. The device ID can be obtained from the output of `flutter devices` command. For example, if your connected device is listed as "RQ8M6059N3H", you can run the app using `flutter run -d RQ8M6059N3H`.

Step 5: Observe the app
- Once the app is launched on the emulator or physical device, you should see the Flutter app running.

Note: If you are running the app on an iOS device, you may need to open Xcode, select your device as the active scheme, and allow Xcode to manage the signing of the app.

Additionally, if you want to target a specific platform (Android or iOS) while running the app on an emulator or physical device, you can use the `--flavor` flag followed by the flavor name. For example:
- To run the Android version: `flutter run --flavor android`
- To run the iOS version: `flutter run --flavor ios`

Remember that the above instructions assume you have set up your Flutter project correctly. If you encounter any issues, ensure that you have the necessary dependencies installed and your project is properly configured for the desired platform (Android or iOS).