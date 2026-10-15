# Contributing to MCP Builder Installation Guide

Thank you for your interest in contributing to this installation guide! This document outlines how you can help improve and maintain the mcp-builder skill installation documentation.

## How to Contribute

### Reporting Bugs

If you find a bug or have an issue with the installation process:

1. **Check Existing Issues**: Search through existing issues before creating a new one
2. **Provide Details**: Include:
   - Your Python version (`python3 --version`)
   - Operating system and version
   - Steps to reproduce the issue
   - Expected vs actual behavior
   - Error messages or stack traces

### Suggesting Features

Have an idea for improving the installation guide? Please open an issue first to discuss your idea before implementing it.

### Submitting Pull Requests

1. **Fork this repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes**
4. **Commit with clear messages**: `git commit -m 'Add amazing feature'`
5. **Push to your fork**: `git push origin feature/amazing-feature`
6. **Open a Pull Request**

## Code Style Guidelines

### Python Code Formatting

- Use 4 spaces for indentation (no tabs)
- Follow PEP 8 style guide
- Run `black` formatter before committing:
  ```bash
  black scripts/*.py
  ```

### Documentation Standards

- Use Markdown for all documentation files
- Include clear headings and code blocks
- Add examples where helpful
- Keep sentences concise and clear

## Commit Message Guidelines

Use conventional commit messages:

```
feat: add new installation method
fix: resolve issue with file permissions
docs: update README with troubleshooting steps
test: add tests for evaluation script
chore: update dependencies in requirements.txt
```

## Pull Request Process

1. **Sign the CLA**: Ensure you've signed the Contributor License Agreement (if required)
2. **Update Documentation**: Make sure your changes are documented
3. **Add Tests**: Include tests if applicable
4. **Run Linting**: Ensure code passes all linting checks
5. **Request Review**: Ask maintainers to review your PR

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](https://github.com/Prat011/awesome-llm-skills/blob/master/CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

## Reporting Security Issues

If you discover a security vulnerability, please **do not** create a public issue or pull request. Instead:

1. Email the maintainers directly
2. Provide detailed information about the vulnerability
3. Allow time for assessment before disclosure

## Areas for Improvement

### Documentation Enhancements

- Add more troubleshooting examples
- Include screenshots of common errors
- Create step-by-step visual guides
- Add FAQ section

### Testing Improvements

- Add automated tests for installation script
- Test on different Python versions
- Validate file integrity after download
- Add performance benchmarks

### Tooling Improvements

- Create a Dockerfile for containerized installation
- Add CI/CD pipeline for testing
- Generate documentation automatically
- Add interactive installation wizard

## Questions?

If you have questions about contributing:

1. Check existing issues and discussions
2. Open a new issue with your question
3. Contact the maintainers directly

## Thank You!

Your contributions help make this installation guide better for everyone. We appreciate your time and effort in improving the mcp-builder skill documentation!

---

**Last Updated**: 2026-10-14  
**Maintained By**: emiskowi
