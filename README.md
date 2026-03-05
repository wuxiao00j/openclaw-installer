# OpenClaw Termux 一键安装脚本

在 Android Termux 环境中快速安装 OpenClaw 及其依赖。

## 使用方法

### 方式一：直接执行（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/wuxiao00j/openclaw-installer/main/install.sh | bash
```

如果报错 TLS/SSL 错误，添加重试参数：

```bash
curl -fsSL --retry 3 --retry-delay 2 https://raw.githubusercontent.com/wuxiao00j/openclaw-installer/main/install.sh | bash
```

### 方式二：使用 wget

```bash
wget -qO- https://raw.githubusercontent.com/wuxiao00j/openclaw-installer/main/install.sh | bash
```

### 方式三：先下载再执行（网络不稳定时）

```bash
# 下载脚本
curl -fLo install.sh https://raw.githubusercontent.com/wuxiao00j/openclaw-installer/main/install.sh
# 或使用 wget
# wget https://raw.githubusercontent.com/wuxiao00j/openclaw-installer/main/install.sh

# 执行
bash install.sh
```

### 方式四：使用镜像加速（中国大陆）

```bash
# ghproxy 加速
curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/wuxiao00j/openclaw-installer/main/install.sh | bash

# 或 fastgit
curl -fsSL https://raw.fastgit.org/wuxiao00j/openclaw-installer/main/install.sh | bash
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

## 常见问题

### TLS/SSL 连接错误

如果遇到 `curl: (35) TLS connect error`，尝试：
1. 重试几次（GitHub 有时不稳定）
2. 切换到移动数据/WiFi 试试
3. 使用上述镜像加速方案
4. 更新 Termux 和证书：`pkg update && pkg install ca-certificates`

### dpkg 配置错误

脚本已自动处理，如需手动修复：

```bash
rm -f /data/data/com.termux/files/usr/var/lib/dpkg/lock-frontend
rm -f /data/data/com.termux/files/usr/var/lib/dpkg/lock
dpkg --configure -a
```

## License

MIT
