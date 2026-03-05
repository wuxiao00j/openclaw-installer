# OpenClaw Termux 一键安装脚本

在 Android Termux 环境中快速安装 OpenClaw 及其依赖。

## 使用方法

在 Termux 终端中执行：

```bash
curl -fsSL https://raw.githubusercontent.com/wuxiao00j/openclaw-installer/main/install.sh | bash
```

或先下载再执行：

```bash
curl -O https://raw.githubusercontent.com/wuxiao00j/openclaw-installer/main/install.sh
bash install.sh
```

## 安装内容

- 更新并升级 Termux 包
- 申请存储权限
- 安装基础工具：curl, git, build-essential, python, nodejs
- 安装 Python 虚拟环境工具
- 全局安装 OpenClaw

## 安装完成后

执行以下命令开始使用 OpenClaw：

```bash
openclaw onboard
```

## 环境要求

- Android 设备
- 已安装 [Termux](https://termux.dev/)

## License

MIT
