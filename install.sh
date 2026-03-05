#!/data/data/com.termux/files/usr/bin/bash
set -e

# 禁用交互提示，自动确认 Y（避免中途需按回车而中断）
export DEBIAN_FRONTEND=noninteractive
export PIP_BREAK_SYSTEM_PACKAGES=1

# 总步骤数
TOTAL_STEPS=6
CURRENT_STEP=0

# 清屏并显示独立安装界面
clear
echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║   OpenClaw 一键安装脚本 (openclaw.ai)                        ║"
echo "║   已验证命令 · Termux 环境                                   ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# 进度条函数：draw_progress 当前步骤 总步骤 "描述"
draw_progress() {
    local current=$1
    local total=$2
    local desc="${3:-}"
    local width=40
    local filled=$((width * current / total))
    local empty=$((width - filled))
    printf "\r  ["
    printf "%${filled}s" | tr ' ' '='
    printf ">"
    printf "%${empty}s" | tr ' ' ' '
    printf "] %2d/%d  %s" "$current" "$total" "$desc"
}

# 自动输入 Y 确认（纯 bash，不依赖 yes 命令）
auto_confirm() { while true; do echo y; done; }

# 步骤 1：更新并升级 Termux 包（自动确认 Y，避免中途中断）
CURRENT_STEP=1
draw_progress $CURRENT_STEP $TOTAL_STEPS "更新并升级 Termux 包..."
echo ""
auto_confirm | pkg update || pkg update
auto_confirm | pkg upgrade -y || pkg upgrade -y
draw_progress $CURRENT_STEP $TOTAL_STEPS "更新并升级 Termux 包 ✓"
echo ""

# 步骤 2：申请存储权限
CURRENT_STEP=2
draw_progress $CURRENT_STEP $TOTAL_STEPS "申请共享存储权限（可跳过）..."
echo ""
termux-setup-storage 2>/dev/null || true
draw_progress $CURRENT_STEP $TOTAL_STEPS "申请共享存储权限 ✓"
echo ""

# 步骤 3：安装基础环境
CURRENT_STEP=3
draw_progress $CURRENT_STEP $TOTAL_STEPS "安装基础环境 (curl, git, python, nodejs)..."
echo ""
pkg install -y curl git build-essential python nodejs python-pip
draw_progress $CURRENT_STEP $TOTAL_STEPS "安装基础环境 ✓"
echo ""

# 步骤 4：安装 Python 虚拟环境
CURRENT_STEP=4
draw_progress $CURRENT_STEP $TOTAL_STEPS "安装 Python 虚拟环境工具..."
echo ""
auto_confirm | pip install virtualenv || pip install virtualenv
draw_progress $CURRENT_STEP $TOTAL_STEPS "安装 Python 虚拟环境 ✓"
echo ""

# 步骤 5：安装 OpenClaw
CURRENT_STEP=5
draw_progress $CURRENT_STEP $TOTAL_STEPS "安装 OpenClaw..."
echo ""
npm install -g openclaw@latest --ignore-scripts
draw_progress $CURRENT_STEP $TOTAL_STEPS "安装 OpenClaw ✓"
echo ""

# 步骤 6：环境自检
CURRENT_STEP=6
draw_progress $CURRENT_STEP $TOTAL_STEPS "环境自检..."
echo ""
echo "  node: $(node -v 2>/dev/null || echo 'missing')"
echo "  npm:  $(npm -v 2>/dev/null || echo 'missing')"
echo "  python: $(python --version 2>/dev/null || echo 'missing')"
echo "  openclaw: $(openclaw --version 2>/dev/null || echo 'missing')"
draw_progress $CURRENT_STEP $TOTAL_STEPS "环境自检 ✓"
echo ""

# 完成界面
echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║   ✓ 安装完成！                                                ║"
echo "║                                                              ║"
echo "║   请执行以下命令进行 OpenClaw 初始化：                        ║"
echo "║                                                              ║"
echo "║    openclaw onboard                                          ║"
echo "║                                                              ║"
echo "║   更多信息请访问：https://openclaw.ai                         ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
