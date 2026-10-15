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

## Updating the Installation

To update to a newer version of the mcp-builder skill:

### Option 1: Re-run Installation Script

```bash
python3 install_mcp_builder.py
```

This will overwrite existing files with the latest versions from GitHub.

### Option 2: Manual Update

For specific files, download and replace:

```python
import urllib.request

BASE_URL = "https://raw.githubusercontent.com/Prat011/awesome-llm-skills/master/mcp-builder"
file_to_update = "reference/python_mcp_server.md"
local_file = f"/path/to/installation/directory/{file_to_update}"

with urllib.request.urlopen(f"{BASE_URL}/{file_to_update}", timeout=30) as response:
    content = response.read().decode('utf-8')

with open(local_file, 'w', encoding='utf-8') as f:
    f.write(content)

print(f"Updated {file_to_update}")
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

## Installing Skill_Seekers into LM Studio

### Overview
This section describes the process of installing the **Skill_Seekers** skill from GitHub into LM Studio. Skills are modular components that extend Bionic's capabilities with specialized knowledge and functionality.

### Repository Information
- **Repository**: [yusufkaraaslan/Skill_Seekers](https://github.com/yusufkaraaslan/Skill_Seekers)
- **Purpose**: Provides skills for seeking and managing various AI/LLM-related tasks
- **Installation Location**: `~/.lmstudio/skills/`

### Installation Process

#### Step 1: Prepare the Skills Directory
```bash
mkdir -p ~/.lmstudio/skills
cd ~/.lmstudio/skills
```

#### Step 2: Clone or Download the Repository

**Option A: Using Git (Recommended)**
```bash
git clone https://github.com/yusufkaraaslan/Skill_Seekers.git ~/.lmstudio/skills/
```

**Option B: Using wget/curl**
```bash
wget https://github.com/yusufkaraaslan/Skill_Seekers/archive/refs/zip/main.zip -O Skill_Seekers.zip
unzip Skill_Seekers.zip
mv Skill_Seekers-main/* ~/.lmstudio/skills/
rmdir Skill_Seekers-main
```

**Option C: Using Python (if git/wget unavailable)**
```python
import urllib.request
import zipfile
import os
import shutil

# Download the repository
url = "https://github.com/yusufkaraaslan/Skill_Seekers/archive/refs/zip/main.zip"
output_path = "/tmp/skill_seekers.zip"
urllib.request.urlretrieve(url, output_path)

# Extract and move to skills directory
extract_dir = "/tmp/skill_seekers_extract"
os.makedirs(extract_dir, exist_ok=True)
with zipfile.ZipFile(output_path, 'r') as zip_ref:
    zip_ref.extractall(extract_dir)

skills_dir = os.path.expanduser("~/.lmstudio/skills")
for item in os.listdir(extract_dir):
    src = os.path.join(extract_dir, item)
    dst = os.path.join(skills_dir, item)
    if os.path.isdir(src):
        os.makedirs(dst, exist_ok=True)
        for f in os.listdir(src):
            shutil.copy(os.path.join(src, f), os.path.join(dst, f))
    else:
        shutil.copy(src, dst)

# Cleanup
os.remove(output_path)
shutil.rmtree(extract_dir)
```

#### Step 3: Verify Installation
After installation, verify the skill is properly set up:

1. Check that the `SKILL.md` file exists in `~/.lmstudio/skills/Skill_Seekers/`
2. Review the skill's description and capabilities
3. Restart LM Studio if necessary for changes to take effect

### Troubleshooting Skill_Seekers Installation

#### Network Connectivity Issues
If you encounter errors like "Host is unreachable" or "Connection refused":

1. **Check Network Settings**: Ensure your system can access external hosts (github.com)
2. **Try Alternative Proxies**: Some networks use GitHub mirrors:
   ```bash
   wget https://ghproxy.com/https://github.com/yusufkaraaslan/Skill_Seekers/archive/refs/zip/main.zip -O Skill_Seekers.zip
   ```
3. **Use Local Cache**: If available, download from a cached mirror or colleague's machine

#### Permission Errors
If you encounter permission denied errors:
```bash
chmod 755 ~/.lmstudio/skills/Skill_Seekers
# Or run with sudo if necessary (not recommended)
sudo chown -R $USER ~/.lmstudio/skills/
```

#### Missing SKILL.md File
The skill folder must contain a `SKILL.md` file. If missing:
1. Check the repository structure
2. Ensure you extracted all files correctly
3. The `SKILL.md` defines the skill's name, description, and behavior

### Enabling/Disabling Skills

Once installed:

1. Open LM Studio settings
2. Navigate to the **Skills** section
3. Find "Skill_Seekers" in the list
4. Toggle it on/off as needed

### Best Practices

- Always backup your skills folder before making changes
- Keep skill folders organized and named consistently
- Review each skill's `SKILL.md` to understand its purpose
- Test skills in a non-production environment first

---

**Installation Date**: 2026-10-14  
**Version**: 1.0.0  
**Status**: Production Ready ✅
```

<parameter=message>
Add Skill_Seekers installation documentation for LM Studio