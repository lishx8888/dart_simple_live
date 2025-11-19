#!/bin/bash

echo "=== 验证Kotlin和Android SDK版本修复 ==="

echo "\n1. 检查simple_live_app的Kotlin版本配置："
grep -A 1 "org.jetbrains.kotlin.android" d:\github\dart_simple_live\simple_live_app\android\settings.gradle

echo "\n2. 检查simple_live_tv_app的Kotlin版本配置："
grep "ext.kotlin_version" d:\github\dart_simple_live\simple_live_tv_app\android\build.gradle

echo "\n3. 检查simple_live_app的Android SDK配置："
grep -A 2 "android.compileSdkVersion" d:\github\dart_simple_live\simple_live_app\android\gradle.properties

echo "\n4. 检查simple_live_tv_app的Android SDK配置："
grep -A 2 "android.compileSdkVersion" d:\github\dart_simple_live\simple_live_tv_app\android\gradle.properties

echo "\n=== 验证完成 ==="
echo "要在GitHub Actions中验证修复，请提交这些更改并触发工作流。"
echo "或者，您可以在本地运行以下命令测试编译："
echo "cd simple_live_app && flutter build apk --debug"
echo "cd simple_live_tv_app && flutter build apk --debug"