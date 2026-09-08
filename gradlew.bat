@rem Gradle startup script for Windows.
@rem Requires gradle\wrapper\gradle-wrapper.jar (see gradlew comments).
@echo off
set DIR=%~dp0
java -jar "%DIR%gradle\wrapper\gradle-wrapper.jar" %*
