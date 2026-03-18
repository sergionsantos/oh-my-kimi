---
name: release
description: Workflow de release automatizado
version: 1.0.0
---

# Release Skill

## Purpose
Automated release workflow. Handles versioning, changelog, tagging, and publishing.

## Use When
- Preparing new release
- Version bumping
- Publishing packages
- Creating GitHub releases

## Invocation

### Command
```
/omk-release patch
/omk-release minor
/omk-release major
```

### Skill
```
$release patch      # 1.0.0 -> 1.0.1
$release minor      # 1.0.0 -> 1.1.0
$release major      # 1.0.0 -> 2.0.0
$release --preview  # Preview changes
```

## Workflow

### 1. Pre-Release Checks
```
✓ All tests passing
✓ No uncommitted changes
✓ Changelog updated
✓ Version bumped
```

### 2. Version Bump
Updates version in:
- `package.json`
- `Cargo.toml`
- `pyproject.toml`
- Version files

### 3. Changelog Update
```markdown
## [1.1.0] - 2026-03-18

### Added
- New feature X
- Support for Y

### Fixed
- Bug in Z

### Changed
- Improved performance
```

### 4. Git Operations
```bash
git add .
git commit -m "release: v1.1.0"
git tag v1.1.0
git push origin main --tags
```

### 5. GitHub Release
Creates release with:
- Tag
- Changelog
- Assets (optional)

### 6. Publish (if package)
```bash
npm publish
# or
cargo publish
# or
python -m build && twine upload
```

## Configuration

`.omk/release.json`:
```json
{
  "packageManager": "npm",
  "changelog": "CHANGELOG.md",
  "versionFile": "package.json",
  "autoPublish": false,
  "preReleaseChecks": [
    "test",
    "lint",
    "build"
  ],
  "git": {
    "requireClean": true,
    "push": true,
    "createTag": true
  },
  "github": {
    "createRelease": true,
    "draft": false
  }
}
```

## Example

```
User: release minor

Kimi: Starting release workflow...
      
      [1/6] Pre-release checks
      ✓ All tests passing
      ✓ No uncommitted changes
      
      [2/6] Version bump
      Current: 1.0.0
      New: 1.1.0
      
      [3/6] Update changelog
      ✓ Added entries for v1.1.0
      
      [4/6] Git operations
      ✓ Committed: "release: v1.1.0"
      ✓ Tagged: v1.1.0
      ✓ Pushed to origin
      
      [5/6] GitHub release
      ✓ Created release v1.1.0
      
      [6/6] Publish
      ? Publish to npm? [Y/n]
      
Release v1.1.0 complete!
```

## Dry Run

Preview without making changes:
```
$release minor --dry-run
```
