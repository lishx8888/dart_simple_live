# PowerShell 验证脚本 - 检查修复是否成功

Write-Host "========================================"
Write-Host "开始验证修复是否成功"
Write-Host "========================================"

# 检查 simple_live_app 的配置
Write-Host "`n========================================"
Write-Host "验证 simple_live_app 配置"
Write-Host "========================================"

Write-Host "1. 检查 Kotlin 插件版本:"
Select-String -Path "d:\github\dart_simple_live\simple_live_app\android\settings.gradle" -Pattern "org.jetbrains.kotlin"

Write-Host "`n2. 检查 Gradle 版本:"
Select-String -Path "d:\github\dart_simple_live\simple_live_app\android\gradle\wrapper\gradle-wrapper.properties" -Pattern "distributionUrl"

Write-Host "`n3. 检查 SDK 版本:"
Select-String -Path "d:\github\dart_simple_live\simple_live_app\android\app\build.gradle" -Pattern "compileSdk|targetSdk"

Write-Host "`n4. 检查 media_kit 版本:"
Select-String -Path "d:\github\dart_simple_live\simple_live_app\pubspec.yaml" -Pattern "media_kit" -Context 0,3

# 检查 simple_live_tv_app 的配置
Write-Host "`n========================================"
Write-Host "验证 simple_live_tv_app 配置"
Write-Host "========================================"

Write-Host "1. 检查 Kotlin 版本变量:"
Select-String -Path "d:\github\dart_simple_live\simple_live_tv_app\android\build.gradle" -Pattern "kotlin_version"

Write-Host "`n2. 检查 Gradle 版本:"
Select-String -Path "d:\github\dart_simple_live\simple_live_tv_app\android\gradle\wrapper\gradle-wrapper.properties" -Pattern "distributionUrl"

Write-Host "`n3. 检查 SDK 版本:"
Select-String -Path "d:\github\dart_simple_live\simple_live_tv_app\android\app\build.gradle" -Pattern "compileSdk|targetSdk"

Write-Host "`n4. 检查 media_kit 版本:"
Select-String -Path "d:\github\dart_simple_live\simple_live_tv_app\pubspec.yaml" -Pattern "media_kit" -Context 0,3

# 编译验证命令
Write-Host "`n========================================"
Write-Host "编译验证命令"
Write-Host "========================================"

Write-Host "执行以下命令来验证修复是否成功:"
Write-Host "`n# 清理并获取依赖 (simple_live_app)"
Write-Host "cd d:\github\dart_simple_live\simple_live_app; flutter clean; flutter pub get"
Write-Host "`n# 清理并获取依赖 (simple_live_tv_app)"
Write-Host "cd d:\github\dart_simple_live\simple_live_tv_app; flutter clean; flutter pub get"
Write-Host "`n# 编译简单验证 (optional)"
Write-Host "cd d:\github\dart_simple_live\simple_live_app; flutter build apk --debug"

Write-Host "`n========================================"
Write-Host "验证完成"
Write-Host "========================================"
Write-Host "已将 media_kit 包更新为兼容版本系列 (^1.0.11, ^1.1.8)，应避免 SDK 36 依赖。"
Write-Host "请执行上述命令来验证修复是否成功。"