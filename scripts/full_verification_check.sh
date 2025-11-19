#!/bin/bash

# 完整的验证方案脚本 - 确保所有Kotlin版本引用一致和media_kit包版本降级

# 打印标题
function print_title() {
  echo "========================================"
  echo "$1"
  echo "========================================"
}

print_title "开始验证Kotlin版本和Android SDK配置一致性"

# 检查simple_live_app的配置
print_title "验证 simple_live_app 配置"

echo "1. 检查Kotlin插件版本:"
grep -r "org.jetbrains.kotlin" --include="*.gradle" --include="*.gradle.kts" d:\github\dart_simple_live\simple_live_app\android

echo "\n2. 检查Kotlin版本变量:"
grep -r "kotlin_version" --include="*.gradle" --include="*.gradle.kts" d:\github\dart_simple_live\simple_live_app\android

echo "\n3. 检查Gradle版本:"
grep "distributionUrl" d:\github\dart_simple_live\simple_live_app\android\gradle\wrapper\gradle-wrapper.properties

echo "\n4. 检查SDK版本:"
grep -E "compileSdk|targetSdk" d:\github\dart_simple_live\simple_live_app\android\app\build.gradle

# 检查simple_live_tv_app的配置
print_title "验证 simple_live_tv_app 配置"

echo "1. 检查Kotlin插件版本:"
grep -r "org.jetbrains.kotlin" --include="*.gradle" --include="*.gradle.kts" d:\github\dart_simple_live\simple_live_tv_app\android

echo "\n2. 检查Kotlin版本变量:"
grep -r "kotlin_version" --include="*.gradle" --include="*.gradle.kts" d:\github\dart_simple_live\simple_live_tv_app\android

echo "\n3. 检查Gradle版本:"
grep "distributionUrl" d:\github\dart_simple_live\simple_live_tv_app\android\gradle\wrapper\gradle-wrapper.properties

echo "\n4. 检查SDK版本:"
grep -E "compileSdk|targetSdk" d:\github\dart_simple_live\simple_live_tv_app\android\app\build.gradle

# 检查是否有Kotlin 1.6.x版本的引用
print_title "检查是否存在Kotlin 1.6.x版本引用"

echo "在simple_live_app中搜索:"
grep -r "1\.6\.[0-9]\+" --include="*.gradle" --include="*.gradle.kts" --include="*.properties" d:\github\dart_simple_live\simple_live_app\android

echo "\n在simple_live_tv_app中搜索:"
grep -r "1\.6\.[0-9]\+" --include="*.gradle" --include="*.gradle.kts" --include="*.properties" d:\github\dart_simple_live\simple_live_tv_app\android

# 检查是否有SDK 36的引用
print_title "检查是否存在SDK 36引用"

echo "在simple_live_app中搜索:"
grep -r "36" --include="*.gradle" --include="*.gradle.kts" --include="*.properties" d:\github\dart_simple_live\simple_live_app\android

echo "\n在simple_live_tv_app中搜索:"
grep -r "36" --include="*.gradle" --include="*.gradle.kts" --include="*.properties" d:\github\dart_simple_live\simple_live_tv_app\android

# 编译验证命令
print_title "编译验证命令"

echo "执行以下命令验证编译是否成功:"
echo "# 清除构建缓存"
echo "flutter clean"
echo "\n# 为Android构建APK (simple_live_app)"
echo "cd d:\github\dart_simple_live\simple_live_app && flutter build apk --debug"
echo "\n# 为Android构建APK (simple_live_tv_app)"
echo "cd d:\github\dart_simple_live\simple_live_tv_app && flutter build apk --debug"

# 检查media_kit版本
print_title "检查media_kit包版本"

echo "在simple_live_app中的版本:"
grep -A 3 "视频播放" d:\github\dart_simple_live\simple_live_app\pubspec.yaml

echo "\n在simple_live_tv_app中的版本:"
grep -A 3 "视频播放" d:\github\dart_simple_live\simple_live_tv_app\pubspec.yaml

print_title "验证完成"
echo "请执行以下步骤来确保修改后的配置能够正常工作："
echo "1. 清理并获取依赖："
echo "   cd d:\github\dart_simple_live\simple_live_app && flutter clean && flutter pub get"
echo "   cd d:\github\dart_simple_live\simple_live_tv_app && flutter clean && flutter pub get"
echo "2. 编译验证："
echo "   cd d:\github\dart_simple_live\simple_live_app && flutter build apk --debug"
echo "   cd d:\github\dart_simple_live\simple_live_tv_app && flutter build apk --debug"
echo "\n降级media_kit到0.13.x版本系列应该解决SDK 36预览版的问题，现在可以正常使用SDK 34进行编译。"