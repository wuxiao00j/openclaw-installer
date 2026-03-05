#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "[1/6] 更新并升级 Termux 包..."
pkg update && pkg upgrade -y

echo "[2/6] 申请共享存储权限（可跳过）..."
termux-setup-storage || true

echo "[3/6] 安装基础环境..."
pkg install -y curl git build-essential python nodejs python-pip

echo "[4/6] 安装 Python 虚拟环境工具..."
pip install virtualenv

echo "[5/6] 安装 OpenClaw..."
npm install -g openclaw@latest --ignore-scripts

echo "[6/6] 环境自检..."
echo "node: $(node -v || echo missing)"
echo "npm:  $(npm -v || echo missing)"
echo "python: $(python --version 2>/dev/null || echo missing)"
echo "openclaw: $(openclaw --version 2>/dev/null || echo missing)"

echo ""
echo "安装完成。下一步建议执行："
echo "openclaw onboard"
