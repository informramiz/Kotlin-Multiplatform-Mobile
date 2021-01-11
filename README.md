# Kotlin-Multiplatform-Mobile
A sample application for iOS and Android written using **Kotlin Multiplatform Mobile (KMM)**.

| Android | iOS |
| ------- | --- |
|![android](docs/android.gif)|![ios](docs/ios.gif)|

---

## Architecture

- Both Android and iOS apps use the **MVVM** pattern for code architecture.
- Both apps frontend (UI) is written in their respective platform native languages.
	- iOS app frontend is written in `Swift` using `SwiftUI`
	- Android app frontend is written in `Kotlin` (Jetpack Compose version coming soon)
- Apps common logic is written in Kotlin Multiplatform Mobile
	- Networking Code which uses [SpaceX API](https://docs.spacexdata.com/?version=latest) to fetch launches list.
	- Database code to save and fetch launches, for caching.


## Libraries
The app makes use of the following libraries

- [Ktor](https://ktor.io/docs/welcome.html) for networking
- [SqlDelight](https://github.com/cashapp/sqldelight) for database caching.
- [Kotlin Coroutines](https://github.com/Kotlin/kotlinx.coroutines) for asynchronous code.
- [Kotlin Serialization](https://github.com/Kotlin/kotlinx.serialization) for JSON parsing.
- Jetpack set of libraries (ViewModel, Activity-ktx, Fragment-ktx, Lifecycle, LiveData etc.)


## Credits

**Note:** This application is written by me, from scratch, but is based on the official JetBrains [Tutorial](https://play.kotlinlang.org/hands-on/Networking%20and%20Data%20Storage%20with%20Kotlin%20Multiplatfrom%20Mobile/01_Introduction).
