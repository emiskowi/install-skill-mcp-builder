# Installation Guide

## Prerequisites

Before installing the mcp-builder skill, ensure you have:

- **Python 3.x** installed on your system
- **pip3** package manager available
- **Git** (optional, for cloning repositories)
- **Network access** to GitHub raw URLs

### Verify Python Installation

```bash
python3 --version
# Expected output: Python 3.8+ or higher
```

### Check pip Availability

```bash
pip3 --version
# Expected output: pip X.Y.Z from ...
```

## Installation Methods

You have two options for installing the mcp-builder skill:

### Method 1: Automated Script (Recommended)

Use the provided installation script for a one-click setup.

#### Step 1: Navigate to Scripts Directory

```bash
cd /path/to/workspace/scripts/
# Replace with your actual workspace path
```

#### Step 2: Run Installation Script

```bash
python3 install_mcp_builder.py
```

#### Expected Output

You should see output similar to this:

```
======================================================================
Installing mcp-builder skill from GitHub
======================================================================

Source repository: https://github.com/Prat011/awesome-llm-skills/tree/master/mcp-builder
Local installation path: /path/to/installation/directory

----------------------------------------------------------------------
Installing files...
----------------------------------------------------------------------
✓ Saved to .../LICENSE.txt
✓ Saved to .../SKILL.md
✓ Saved to .../reference/evaluation.md
✓ Saved to .../reference/mcp_best_practices.md
✓ Saved to .../reference/node_mcp_server.md
✓ Saved to .../reference/python_mcp_server.md
✓ Saved to .../scripts/connections.py
✓ Saved to .../scripts/evaluation.py
✓ Saved to .../scripts/example_evaluation.xml
✓ Saved to .../scripts/requirements.txt

----------------------------------------------------------------------
Installation Summary
----------------------------------------------------------------------
Successfully installed: 10 files
Failed: 0 files

======================================================================
✓ Installation complete! All mcp-builder skill files are ready.
======================================================================
```

### Method 2: Manual Installation

If you prefer manual installation or the script doesn't work, follow these steps:

#### Step 1: Create Installation Directory

Choose a location for your installation (e.g., `/home/yourusername/skills/mcp-builder`)

```bash
mkdir -p /path/to/installation/directory
cd /path/to/installation/directory
```

#### Step 2: Download Each File Manually

Use Python to download files from GitHub:

```python
import urllib.request
import os

BASE_URL = "https://raw.githubusercontent.com/Prat011/awesome-llm-skills/master/mcp-builder"

files_to_install = [
    "LICENSE.txt",
    "SKILL.md", 
    "reference/evaluation.md",
    "reference/mcp_best_practices.md",
    "reference/node_mcp_server.md",
    "reference/python_mcp_server.md",
    "scripts/connections.py",
    "scripts/evaluation.py",
    "scripts/example_evaluation.xml",
    "scripts/requirements.txt"
]

for file_path in files_to_install:
    url = f"{BASE_URL}/{file_path}"
    local_file = os.path.join("/path/to/installation/directory", file_path)
    
    # Create directory if needed
    dir_name = os.path.dirname(local_file)
    os.makedirs(dir_name, exist_ok=True)
    
    # Download and save
    with urllib.request.urlopen(url, timeout=30) as response:
        content = response.read().decode('utf-8')
    
    with open(local_file, 'w', encoding='utf-8') as f:
        f.write(content)

print("Installation complete!")
```

#### Step 3: Verify Installation

Check that all files are present:

```bash
ls -la /path/to/installation/directory/
# Should show: LICENSE.txt, SKILL.md, reference/, scripts/

ls -la /path/to/installation/directory/reference/
# Should show: evaluation.md, mcp_best_practices.md, node_mcp_server.md, python_mcp_server.md

ls -la /path/to/installation/directory/scripts/
# Should show: connections.py, evaluation.py, example_evaluation.xml, requirements.txt
```

## Installation Verification

After installation, verify everything is working correctly:

### 1. Check File Count

```bash
find /path/to/installation/directory -type f | wc -l
# Expected output: 10
```

### 2. Verify SKILL.md Has YAML Frontmatter

```bash
head -5 /path/to/installation/directory/SKILL.md
# Should show: ---\nname: ...\ndescription: ...
```

### 3. Test Python Scripts Syntax

```bash
cd /path/to/installation/directory/scripts/
python3 -m py_compile connections.py
python3 -m py_compile evaluation.py
echo "All scripts are syntactically correct!"
```

## Post-Installation Setup

### Install Python Dependencies (Optional)

If you plan to use the evaluation scripts, install dependencies:

```bash
cd /path/to/installation/directory/scripts/
pip3 install -r requirements.txt
```

This will install any required packages listed in `requirements.txt`.

### Configure Environment Variables (Optional)

For production environments, set up environment variables:

```bash
# Add to your .bashrc or .profile
export MCP_BUILDER_PATH=/path/to/installation/directory
export PYTHONPATH=$PYTHONPATH:$MCP_BUILDER_PATH/scripts
```

Then reload your shell configuration:

```bash
source ~/.bashrc  # or source ~/.profile
```

## Troubleshooting Installation Issues

### Issue: "Host is unreachable" Error

**Cause**: Network connectivity issue or firewall blocking GitHub access.

**Solution**:
1. Check internet connection: `ping github.com`
2. If behind a proxy, configure environment variables:
   ```bash
   export HTTP_PROXY=http://proxy-server:port
   export HTTPS_PROXY=http://proxy-server:port
   ```
3. Try again with the installation script

### Issue: "Permission denied" Error

**Cause**: Installation directory doesn't have write permissions.

**Solution**:
```bash
chmod 755 /path/to/installation/directory
# or for full ownership
sudo chown -R $USER:$USER /path/to/installation/directory
```

### Issue: Python Module Not Found Error

**Cause**: Required Python packages not installed.

**Solution**:
```bash
cd /path/to/installation/directory/scripts/
pip3 install -r requirements.txt
```

### Issue: Installation Script Fails Completely

**Alternative Approach**: Install files one by one using curl or wget if available:

```bash
# Example for SKILL.md
curl -sL "https://raw.githubusercontent.com/Prat011/awesome-llm-skills/master/mcp-builder/SKILL.md" \
  > /path/to/installation/directory/SKILL.md
```

## Next Steps

After successful installation:

1. **Read the Main Documentation**: Open `SKILL.md` to understand what you can do with mcp-builder
2. **Review Best Practices**: Check `reference/mcp_best_practices.md` for development guidelines
3. **Explore Python Server Guide**: Read `reference/python_mcp_server.md` if using Python
4. **Set Up Development Environment**: Install dependencies and configure your workspace

## Support and Resources

- **Documentation**: See the main [SKILL.md](./SKILL.md) file
- **Best Practices**: [mcp_best_practices.md](./reference/mcp_best_practices.md)
- **Python Guide**: [python_mcp_server.md](./reference/python_mcp_server.md)
- **Node.js Guide**: [node_mcp_server.md](./reference/node_mcp_server.md)
- **Evaluation Guide**: [evaluation.md](./reference/evaluation.md)

## License

This installation guide is provided under the same license as the original mcp-builder skill. See `LICENSE.txt` for details.

---

**Installation Date**: 2026-10-14  
**Version**: 1.0.0  
**Status**: Production Ready ✅
