import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Release signing: read from android/key.properties when present, otherwise
// fall back to debug signing so release builds still work on a fresh checkout.
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "mobile.ultratude.com.mzizichurchsystem"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "mobile.ultratude.com.mzizichurchsystem"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = 11
        versionName = "3.1.0"
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String?
            keyPassword = keystoreProperties["keyPassword"] as String?
            storeFile = (keystoreProperties["storeFile"] as String?)?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String?
        }
    }

    buildTypes {
        release {
            signingConfig = if (keystorePropertiesFile.exists())
                signingConfigs.getByName("release")
            else
                signingConfigs.getByName("debug")
        }
    }

    buildFeatures {
        resValues = true
    }

    flavorDimensions += "app"
    productFlavors {
        create("mzizicms") { // MziziCMS
            dimension = "app"
            resValue("string", "app_name", "MziziCMS")
            versionCode = 11
            versionName = "3.1.0"
        }
        create("bwmc") { // The Bible Way Ministries
            dimension = "app"
            resValue("string", "app_name", "BWMC")
            applicationIdSuffix = ".bwmc"
            versionCode = 12
            versionName = "3.1.0"
        }
        create("dcik") { // Deliverance Church International Kasarani
            dimension = "app"
            resValue("string", "app_name", "DCIK")
            applicationIdSuffix = ".dcik"
            versionCode = 13
            versionName = "3.1.0"
        }
        create("jcc") { // Jubilee Christian Church
            dimension = "app"
            resValue("string", "app_name", "JCC")
            applicationIdSuffix = ".jcc"
            versionCode = 14
            versionName = "3.1.0"
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
