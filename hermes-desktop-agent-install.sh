#!/bin/bash
# =============================================================================
# Hermes Desktop Agent - Complete Installation & Startup Script for Ubuntu
# =============================================================================
# This script installs all dependencies, sets up the environment, and starts
# the Hermes Desktop Agent UI application on Ubuntu/Debian Linux.
# =============================================================================

set -e  # Exit on any error

echo "=========================================="
echo "🚀 Hermes Desktop Agent Installation"
echo "=========================================="
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored messages
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# =============================================================================
# STEP 1: Update System Packages
# =============================================================================
echo "Step 1/8: Updating system packages..."
sudo apt update
if [ $? -eq 0 ]; then
    print_success "System packages updated successfully"
else
    print_error "Failed to update system packages"
    exit 1
fi

# Upgrade existing packages
sudo apt upgrade -y --no-install-recommends > /dev/null 2>&1 || true
print_info "Package upgrades completed"

# =============================================================================
# STEP 2: Install Node.js and npm (if not already installed)
# =============================================================================
echo ""
echo "Step 2/8: Installing Node.js and npm..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    print_info "Installing Node.js 18.x LTS..."
    
    # Add NodeSource repository
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - > /dev/null 2>&1
    
    # Install Node.js
    sudo apt install nodejs npm -y > /dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        print_success "Node.js and npm installed successfully"
    else
        print_error "Failed to install Node.js"
        exit 1
    fi
else
    print_info "Node.js already installed. Checking versions..."
    node --version
    npm --version
fi

# =============================================================================
# STEP 3: Install Build Dependencies for Electron
# =============================================================================
echo ""
echo "Step 3/8: Installing build dependencies for Electron..."

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
    libnotify-dev > /dev/null 2>&1

print_success "Build dependencies installed"

# =============================================================================
# STEP 4: Clone Hermes Desktop Agent Repository
# =============================================================================
echo ""
echo "Step 4/8: Cloning Hermes Desktop Agent repository..."

if [ -d "Hermes-Desktop-Agent" ]; then
    print_info "Repository already exists. Updating to latest version..."
    cd Hermes-Desktop-Agent
    git pull origin main > /dev/null 2>&1 || true
else
    print_info "Cloning repository from GitHub..."
    git clone https://github.com/rison114514/Hermes-Desktop-Agent.git > /dev/null 2>&1
    
    if [ $? -ne 0 ]; then
        print_error "Failed to clone repository. Please check your internet connection."
        exit 1
    fi
    
    cd Hermes-Desktop-Agent
fi

print_success "Repository ready"

# =============================================================================
# STEP 5: Install NPM Dependencies
# =============================================================================
echo ""
echo "Step 5/8: Installing NPM dependencies..."

cd Hermes-Desktop-Agent

if [ -f "package-lock.json" ]; then
    npm ci --silent > /dev/null 2>&1 || npm install --silent > /dev/null 2>&1
else
    print_info "No package-lock.json found. Running npm install..."
    npm install > /dev/null 2>&1
fi

print_success "NPM dependencies installed"

# =============================================================================
# STEP 6: Create Desktop Launcher Script
# =============================================================================
echo ""
echo "Step 6/8: Creating desktop launcher..."

cat > ~/.local/bin/hermes-desktop << 'EOF'
#!/bin/bash
cd "$(dirname "$0")/../Hermes-Desktop-Agent"
npm run dev &
disown
exit 0
EOF

chmod +x ~/.local/bin/hermes-desktop

print_success "Desktop launcher created at: ~/.local/bin/hermes-desktop"

# =============================================================================
# STEP 7: Create Systemd Service (Optional - for background running)
# =============================================================================
echo ""
echo "Step 7/8: Creating systemd service file..."

cat > /etc/systemd/hermes-desktop.service << 'EOF'
[Unit]
Description=Hermes Desktop Agent UI
After=network.target graphical-target

[Service]
Type=simple
User=%i
WorkingDirectory=/home/%u/Hermes-Desktop-Agent
ExecStart=/usr/bin/npm run dev --prefix /home/%u/Hermes-Desktop-Agent
Restart=on-failure
RestartSec=10

[Install]
WantedBy=default.target
EOF

print_success "Systemd service file created"

# =============================================================================
# STEP 8: Verify Installation
# =============================================================================
echo ""
echo "Step 8/8: Verifying installation..."

echo ""
echo "=========================================="
echo "✅ Installation Complete!"
echo "=========================================="
echo ""
echo "Installed Components:"
echo "  ✓ Node.js $(node --version)"
echo "  ✓ npm $(npm --version)"
echo "  ✓ Hermes Desktop Agent repository"
echo "  ✓ NPM dependencies"
echo "  ✓ Build tools and libraries"
echo ""

# =============================================================================
# START THE APPLICATION
# =============================================================================
echo "=========================================="
echo "🎯 Starting Hermes Desktop Agent..."
echo "=========================================="
echo ""

cd Hermes-Desktop-Agent

print_info "Running in development mode with hot reload..."
echo ""
echo "To stop the application, press Ctrl+C"
echo ""
echo "----------------------------------------"
npm run dev
