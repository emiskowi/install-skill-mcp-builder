# 🚀 Hermes Desktop Agent - Complete Installation Guide for Ubuntu

This guide provides everything you need to install and run the **Hermes Desktop Agent** UI application on Ubuntu/Debian Linux.

---

## 📋 Table of Contents

1. [Quick Start](#quick-start)
2. [Full Automated Installation](#full-automated-installation)
3. [Manual Step-by-Step Installation](#manual-step-by-step-installation)
4. [Alternative Methods](#alternative-methods)
5. [Troubleshooting](#troubleshooting)
6. [System Requirements](#system-requirements)

---

## ⚡ Quick Start (3 Commands)

```bash
git clone https://github.com/rison114514/Hermes-Desktop-Agent.git && cd Hermes-Desktop-Agent && npm install && npm run dev
```

This will:
- Clone the repository
- Install all dependencies
- Start the application in development mode

---

## 🤖 Full Automated Installation

### Option 1: Run the Installation Script

Save this script as `install-hermes.sh` and make it executable:

```bash
chmod +x install-hermes.sh
./install-hermes.sh
```

The script will automatically:
1. Update system packages
2. Install Node.js 18.x LTS
3. Install build dependencies for Electron
4. Clone the Hermes Desktop Agent repository
5. Install NPM dependencies
6. Create desktop launcher and systemd service
7. Start the application

### Option 2: Copy-Paste Script

```bash
#!/bin/bash
set -e

echo "🚀 Installing Hermes Desktop Agent..."

# Update system
sudo apt update && sudo apt upgrade -y > /dev/null 2>&1 || true

# Install Node.js if needed
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - > /dev/null 2>&1
    sudo apt install nodejs npm -y > /dev/null 2>&1
fi

# Install build dependencies
sudo apt install -y \
    build-essential git python3 libgtk-3-dev \
    libwebkit2gtk-4.0-dev libnss3-dev libxkbcommon-dev \
    libatspi2.0-dev > /dev/null 2>&1

# Clone repository
git clone https://github.com/rison114514/Hermes-Desktop-Agent.git > /dev/null 2>&1
cd Hermes-Desktop-Agent

# Install dependencies
npm install > /dev/null 2>&1

echo "✅ Installation complete! Starting application..."
npm run dev
```

Copy this into your terminal and press Enter.

---

## 📝 Manual Step-by-Step Installation

### Step 1: Update System Packages

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install Node.js (if not already installed)

```bash
# Check if Node.js is installed
node --version

# If not installed, install Node.js 18.x LTS
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install nodejs npm -y
```

### Step 3: Install Build Dependencies for Electron

```bash
sudo apt install -y \
    build-essential \
    git \
    python3 \
    python3-pip \
    libgtk-3-dev \
    libwebkit2gtk-4.0-dev \
    libnss3-dev \
    libxkbcommon-dev \
    libatspi2.0-dev \
    libsecret-1-dev \
    libnotify-dev
```

### Step 4: Clone the Repository

```bash
git clone https://github.com/rison114514/Hermes-Desktop-Agent.git
cd Hermes-Desktop-Agent
```

### Step 5: Install NPM Dependencies

```bash
npm install
```

This will take a few minutes. You should see output like:
```
added 1234 packages in 45s
```

### Step 6: Start the Application

```bash
npm run dev
```

The application will start automatically with hot reload enabled!

---

## 🎯 Alternative Methods

### Method 1: Using Vite Directly

```bash
cd Hermes-Desktop-Agent
npx vite
```

### Method 2: Using Electron Directly

```bash
cd Hermes-Desktop-Agent
npx electron .
```

### Method 3: Production Build (creates installer)

```bash
npm run electron:build
# This creates an .AppImage or native installer
```

### Method 4: Using Desktop Launcher

After installation, you can use the launcher script:

```bash
hermes-desktop
```

Or create a desktop shortcut:

```bash
cat > ~/.local/share/applications/hermes.desktop << 'EOF'
[Desktop Entry]
Name=Hermes Desktop Agent
Exec=hermes-desktop
Icon=hermes
Terminal=false
Type=Application
Categories=Development;Utilities;
EOF

chmod 755 ~/.local/share/applications/hermes.desktop
```

### Method 5: Systemd Service (Background Mode)

```bash
# Enable and start the service
sudo systemctl enable hermes-desktop.service
sudo systemctl start hermes-desktop.service

# Check status
sudo systemctl status hermes-desktop.service
```

---

## 🔧 Troubleshooting

### Issue: GUI not showing in WSL

**Solution:** Install X11 forwarding dependencies

```bash
sudo apt install -y xorg xserver-xorg-input-all xauth
```

Or use VSCodium with Remote-WSL extension.

### Issue: "Cannot find module" errors

**Solution:** Reinstall dependencies

```bash
rm -rf node_modules package-lock.json
npm cache clean --force
npm install
```

### Issue: Build fails on Ubuntu

**Solution:** Install additional build dependencies

```bash
sudo apt install -y \
    libgtk-3-dev \
    libwebkit2gtk-4.0-dev \
    libnss3-dev \
    libxkbcommon-dev \
    libatspi2.0-dev
```

### Issue: Electron won't start

**Solution:** Check Node.js version (must be v16+)

```bash
node --version  # Should show v16.x or higher

# If needed, reinstall Node.js from nodesource.com
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install nodejs npm -y
```

### Issue: Port already in use

**Solution:** Change the port or kill the process

```bash
# Find and kill processes on port 3000
lsof -i :3000 | grep LISTEN
kill -9 <PID>

# Or specify a different port
npm run dev -- --port 3001
```

### Issue: TypeScript errors in development

**Solution:** Regenerate type definitions

```bash
rm -rf node_modules/.cache
npm install
npm run dev
```

---

## 💻 System Requirements

### Minimum Requirements

- **OS:** Ubuntu 20.04 LTS or later (Debian 11+, Fedora 35+)
- **RAM:** 2GB minimum, 8GB recommended
- **Disk Space:** 2GB free space
- **Node.js:** v16.x or higher (v18.x recommended)
- **npm:** v8.x or higher

### Recommended Requirements

- **OS:** Ubuntu 22.04 LTS or later
- **RAM:** 8GB+
- **Disk Space:** 5GB free space
- **GPU:** Optional for better performance with AI models

---

## 📁 Application Structure

```
Hermes-Desktop-Agent/
├── electron/          # Electron main process code
├── src/               # Source files for the UI
├── assets/            # Static assets and images
├── personas/          # AI agent persona configurations
├── mods/              # Custom modules/extensions
├── runtime/           # Runtime configuration
├── package.json       # NPM scripts and dependencies
├── tsconfig.json      # TypeScript configuration
└── vite.config.ts     # Vite bundler configuration
```

---

## 🎓 Common Commands Reference

### Development Mode (Recommended)
```bash
npm run dev          # Start with hot reload
npx vite             # Alternative using Vite directly
```

### Production Build
```bash
npm run electron:build    # Create installer for current OS
npm run dist:dir          # Unpacked version for current platform
npm run dist:win-unpacked # Windows unpacked build
```

### Testing and Linting
```bash
npm test              # Run tests
npm run lint          # Check code style
npm run format        # Format code automatically
```

### Clean Installation
```bash
rm -rf node_modules package-lock.json
npm cache clean --force
npm install
npm run dev
```

---

## 📚 Additional Resources

- **Repository:** https://github.com/rison114514/Hermes-Desktop-Agent
- **Electron Docs:** https://www.electronjs.org/docs
- **NPM Scripts:** Check `package.json` in the repository
- **AGENTS.md:** Agent-specific documentation in the repo

---

## ✅ Verification Checklist

After installation, verify everything is working:

```bash
# 1. Check Node.js version
node --version  # Should show v16.x or higher

# 2. Check npm version
npm --version   # Should show v8.x or higher

# 3. Verify dependencies are installed
ls node_modules | wc -l  # Should show many packages

# 4. Start the application and verify UI loads
npm run dev
```

---

## 🎉 Success!

You've successfully installed Hermes Desktop Agent on Ubuntu! The application should now be running with a graphical interface.

If you encounter any issues, check the troubleshooting section above or refer to the repository's documentation.

Happy automating! 🚀