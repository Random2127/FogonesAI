# Flutter engine
-keep class io.flutter.** { *; }

# Keep annotations
-keepattributes *Annotation*

# JSON (safe if used)
-keep class com.google.gson.** { *; }

# ---- FIX FOR R8 + FLUTTER ----

# Play Core (Flutter references it even if you don't use it)
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }

# Tasks API
-dontwarn com.google.android.play.core.tasks.**
-keep class com.google.android.play.core.tasks.** { *; }
