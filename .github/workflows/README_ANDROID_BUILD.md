# Android APK 构建指南

本项目包含一个专门用于构建 Android APK 的 GitHub Workflow。

## 使用方法

### 1. 手动触发构建

1. 访问 GitHub 仓库的 Actions 页面
2. 选择 "Build Android APK Only" workflow
3. 点击 "Run workflow" 按钮
4. 配置构建参数：
   - **Build type**: 选择 `release` 或 `debug`
   - **Flutter channel**: 选择 `stable`、`beta` 或 `dev`
   - **Split per ABI**: 是否按架构拆分APK（推荐启用，可减小文件大小）
   - **Clean before build**: 是否在构建前清理缓存

### 2. 自动触发构建

Workflow 支持以下触发条件：
- 手动触发 (`workflow_dispatch`)
- 推送标签到 `master` 分支（标签格式：`android_v*`）

## 必需的 GitHub Secrets

为了成功构建 APK，你需要在 GitHub 仓库设置中配置以下 secrets：

### Release 版本所需的 Secrets

如果选择构建 release 版本，需要配置以下签名相关的 secrets：

1. **KEYSTORE_BASE64**: 
   - 将你的 Android 签名 keystore 文件编码为 Base64
   - 获取方法：`base64 -i your_keystore.jks`
   - 在 GitHub Secrets 中添加 `KEYSTORE_BASE64` 变量

2. **STORE_PASSWORD**: 
   - 签名 keystore 的密码

3. **KEY_PASSWORD**: 
   - 签名 key 的密码

4. **KEY_ALIAS**: 
   - 签名 key 的别名

### 创建 Android 签名 keystore

如果还没有签名 keystore，可以使用以下命令创建：

```bash
keytool -genkey -v -keystore simple_live_release.keystore -alias simple_live -keyalg RSA -keysize 2048 -validity 10000
```

## 构建输出

构建成功后，你可以在 Actions 页面下载生成的 APK 文件：

- **Release 版本**: 会生成按架构拆分的 APK 文件（推荐）
  - `app-arm64-v8a-release.apk` (64位 ARM)
  - `app-armeabi-v7a-release.apk` (32位 ARM)
  - `app-x86_64-release.apk` (64位 x86)

- **Debug 版本**: 
  - `app-debug.apk`

## 文件大小优化

建议启用 "Split per ABI" 选项，这样可以：
- 显著减小 APK 文件大小
- 只下载用户设备需要的架构版本
- 提高安装和更新速度

## 构建日志

构建完成后，可以在 Actions 页面查看详细的构建日志，包括：
- Flutter 环境设置
- 依赖安装
- 编译过程
- APK 文件信息

## 故障排除

### 常见问题

1. **签名错误**: 确保所有签名相关的 secrets 都正确配置
2. **依赖问题**: 尝试启用 "Clean before build" 选项
3. **Flutter 版本问题**: 可以尝试切换到不同的 Flutter channel

### 获取帮助

如果遇到构建问题，请检查：
1. GitHub Actions 页面的构建日志
2. Flutter 和 Android SDK 的兼容性
3. 项目的 `pubspec.yaml` 配置

## 工作流文件

工作流配置文件位于：`.github/workflows/build_android_only.yml`

你可以根据需要修改这个文件来调整构建流程。