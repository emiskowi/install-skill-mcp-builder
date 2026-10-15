# MCP Builder Skill Installation Guide

## Overview

This repository documents the complete installation process for the **mcp-builder** skill from the [Prat011/awesome-llm-skills](https://github.com/Prat011/awesome-llm-skills) repository. The mcp-builder skill provides tools and documentation for building Model Context Protocol (MCP) servers.

## Repository Information

- **Repository URL**: https://github.com/emiskowi/install-skill-mcp-builder
- **Source**: Prat011/awesome-llm-skills/tree/master/mcp-builder
- **Installation Date**: 2026-10-14
- **Author**: emiskowi

## What is MCP Builder?

The mcp-builder skill includes:
- Reference documentation for building MCP servers (Python and Node.js)
- Evaluation scripts and templates
- Best practices for MCP server development
- Connection management utilities
- Comprehensive guides for implementing MCP protocols

## Installation Summary

### Files Installed

The following 10 files were successfully installed from the source repository:

#### Main Skill Files
| File | Description | Size |
|------|-------------|------|
| `SKILL.md` | Main skill documentation with YAML frontmatter | - |
| `LICENSE.txt` | License information for the skill | - |

#### Reference Documentation
| File | Description |
|------|-------------|
| `reference/evaluation.md` | Evaluation guidelines and criteria |
| `reference/mcp_best_practices.md` | Best practices for MCP server development |
| `reference/node_mcp_server.md` | Node.js MCP server implementation guide |
| `reference/python_mcp_server.md` | Python MCP server implementation guide |

#### Scripts & Utilities
| File | Description |
|------|-------------|
| `scripts/connections.py` | Connection management utilities for MCP servers |
| `scripts/evaluation.py` | Evaluation scripts for testing MCP implementations |
| `scripts/example_evaluation.xml` | Example XML template for evaluation reports |
| `scripts/requirements.txt` | Python dependencies for the installation |

### Installation Command Used

```bash
python3 /path/to/install_mcp_builder.py
```

Or manually using the Python script:

```python
import urllib.request
import os

# Download each file from GitHub
BASE_URL = "https://raw.githubusercontent.com/Prat011/awesome-llm-skills/master/mcp-builder"
LOCAL_BASE = "/path/to/installation/directory"

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
    local_file = os.path.join(LOCAL_BASE, file_path)
    
    # Create directory if needed
    dir_name = os.path.dirname(local_file)
    os.makedirs(dir_name, exist_ok=True)
    
    # Download and save
    with urllib.request.urlopen(url, timeout=30) as response:
        content = response.read().decode('utf-8')
    
    with open(local_file, 'w', encoding='utf-8') as f:
        f.write(content)
```

## Quick Start Guide

### Step 1: Clone or Access the Installation Script

The installation script is available at:
`/path/to/workspace/scripts/install_mcp_builder.py`

### Step 2: Run the Installation

```bash
python3 install_mcp_builder.py
```

Expected output:
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

### Step 3: Verify Installation

Check that all files are present:

```bash
ls -la /path/to/installation/directory/
# Should show: LICENSE.txt, SKILL.md, reference/, scripts/

ls -la /path/to/installation/directory/reference/
# Should show: evaluation.md, mcp_best_practices.md, node_mcp_server.md, python_mcp_server.md

ls -la /path/to/installation/directory/scripts/
# Should show: connections.py, evaluation.py, example_evaluation.xml, requirements.txt
```

## Reference Documentation Overview

### 1. Python MCP Server Guide (`reference/python_mcp_server.md`)

This guide covers:
- Setting up a Python-based MCP server
- Implementing MCP tools and prompts
- Handling resources and context
- Error handling and logging
- Testing your implementation

**Key Topics:**
- Installation requirements
- Basic server structure
- Tool registration
- Resource management
- Prompt engineering for MCP
- Security best practices

### 2. Node.js MCP Server Guide (`reference/node_mcp_server.md`)

This guide covers:
- Setting up a Node.js-based MCP server
- TypeScript vs JavaScript considerations
- Implementing MCP capabilities
- Event handling and streaming
- Testing with MCP clients

**Key Topics:**
- npm package setup
- TypeScript configuration
- Server initialization
- Capability registration
- Client communication patterns

### 3. Best Practices Guide (`reference/mcp_best_practices.md`)

This guide covers:
- Performance optimization
- Security considerations
- Error handling strategies
- Logging best practices
- Testing methodologies
- Documentation standards

**Key Topics:**
- Resource management
- Authentication and authorization
- Rate limiting
- Input validation
- Output formatting
- Version compatibility

### 4. Evaluation Guide (`reference/evaluation.md`)

This guide covers:
- Setting up evaluation environments
- Running automated tests
- Performance benchmarking
- Quality metrics collection
- Reporting results

**Key Topics:**
- Test case creation
- Benchmark setup
- Metrics collection
- Report generation
- Continuous integration

## Troubleshooting

### Common Issues and Solutions

#### Issue: "Host is unreachable" error during download

**Solution**: Check your network connection and firewall settings. Ensure you can access GitHub raw URLs.

```bash
# Test connectivity to GitHub
ping github.com

# If behind a proxy, configure environment variables
export HTTP_PROXY=http://proxy-server:port
export HTTPS_PROXY=http://proxy-server:port
```

#### Issue: "Permission denied" when writing files

**Solution**: Ensure the installation directory has write permissions.

```bash
chmod 755 /path/to/installation/directory
# or
sudo chown -R $USER:$USER /path/to/installation/directory
```

#### Issue: Python dependencies not found

**Solution**: Install required packages first.

```bash
pip3 install -r scripts/requirements.txt
```

### Verifying Installation Integrity

After installation, verify all files are present and readable:

```bash
# Check file count
find /path/to/installation/directory -type f | wc -l  # Should return 10

# Check SKILL.md has YAML frontmatter
head -5 /path/to/installation/directory/SKILL.md
# Should show: ---\nname: ...\ndescription: ...

# Verify Python scripts are executable
python3 -m py_compile scripts/connections.py
python3 -m py_compile scripts/evaluation.py
```

## Security Considerations

### Before Using MCP Builder Skill

1. **Review Dependencies**: Check `scripts/requirements.txt` for any security vulnerabilities
2. **Update Regularly**: Keep the source repository updated to get latest security patches
3. **Environment Variables**: Never hardcode credentials in scripts
4. **Network Access**: Restrict network access to only required endpoints

### Recommended Security Practices

```bash
# Check for known vulnerabilities in dependencies
pip3 install safety
safety check requirements.txt

# Review Python code for security issues
pip3 install bandit
bandit scripts/connections.py
bandit scripts/evaluation.py
```

## Contributing

If you'd like to contribute improvements to this installation guide:

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This installation guide and all associated files are available under the license specified in `LICENSE.txt`.

See the original repository for more details: [Prat011/awesome-llm-skills](https://github.com/Prat011/awesome-llm-skills)

## Acknowledgments

- **Original Author**: Prat011
- **Source Repository**: awesome-llm-skills
- **Installation Date**: 2026-10-14
- **Documented By**: emiskowi

## Related Resources

- [MCP Builder Skill Documentation](./SKILL.md)
- [Python MCP Server Guide](./reference/python_mcp_server.md)
- [Node.js MCP Server Guide](./reference/node_mcp_server.md)
- [Best Practices](./reference/mcp_best_practices.md)
- [Evaluation Guidelines](./reference/evaluation.md)

## Quick Links

| Resource | URL |
|----------|-----|
| Source Repository | https://github.com/Prat011/awesome-llm-skills/tree/master/mcp-builder |
| This Installation Guide | https://github.com/emiskowi/install-skill-mcp-builder |
| MCP Protocol Specification | https://modelcontextprotocol.io/ |

---

**Last Updated**: 2026-10-14  
**Version**: 1.0.0  
**Status**: Production Ready ✅
