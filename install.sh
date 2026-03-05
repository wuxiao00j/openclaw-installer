#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "[1/7] 更新 Termux 包索引..."
pkg update -y

echo "[2/7] 升级已安装包..."
pkg upgrade -y

echo "[3/7] 申请共享存储权限（可跳过）..."
termux-setup-storage || true

echo "[4/7] 安装已验证基础环境..."
pkg install -y curl git build-essential python nodejs python-pip

echo "[5/7] 安装 Python 虚拟环境工具..."
pip install virtualenv

echo "[6/7] 安装 OpenClaw（沿用已验证参数）..."
npm install -g openclaw@latest --ignore-scripts

echo "[7/7] 环境自检..."
echo "node: $(node -v || echo missing)"
echo "npm:  $(npm -v || echo missing)"
echo "python: $(python --version 2>/dev/null || echo missing)"
echo "openclaw: $(openclaw --version 2>/dev/null || echo missing)"

echo ""
echo "安装完成。下一步建议执行："
echo "openclaw onboard"
