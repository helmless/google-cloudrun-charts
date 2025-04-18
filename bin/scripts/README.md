# Schema Tools

This directory contains scripts for managing JSON schemas in the codebase.

## dereference-schema.py

A script to dereference `values-edit-me.schema.json` files into `values.schema.json` for charts.

### Usage

```bash
bin/scripts/dereference-schema.py [--chart-dir DIRECTORY]
```

Options:
- `--chart-dir DIRECTORY`: Path to the charts directory [default: charts]

### Purpose

This script is used to resolve JSON references in schema files. It finds all chart directories with a `values-edit-me.schema.json` file and dereferences them to create fully resolved `values.schema.json` files. This is useful for:

1. Maintaining DRY (Don't Repeat Yourself) principles in schema files
2. Allowing developers to work with modular, reference-based schemas
3. Ensuring that published schemas are fully resolved for consumers

### How It Works

The script:
1. Scans the chart directory for all `values-edit-me.schema.json` files
2. Uses the `jsonref` library to resolve all JSON references (`$ref`) in these files
3. Performs validation of the dereferenced schema
4. Only writes the result to `values.schema.json` if dereferencing completes successfully
5. Ensures proper end-of-file formatting (ends with a single newline) for compatibility with other pre-commit hooks
6. Returns appropriate error codes and messages for any failures

### Error Handling

The script includes robust error handling for:
- Missing input files
- JSON parsing errors
- Dereferencing failures
- Permission issues when writing output files
- General exceptions

If an error occurs during processing, the script will log detailed error information and exit with a non-zero status code.

### File Formatting

To prevent conflicts with the `end-of-file-fixer` pre-commit hook, this script ensures that:
- All generated JSON files end with exactly one newline character
- Files are written with Unix-style line endings (`\n`)
- No trailing whitespace is included in the output

### Pre-commit Hook

This script is designed to be used as a pre-commit hook. It is called by `bin/pre-commit-hooks/dereference-schema.sh`, which is configured in `.pre-commit-config.yaml`. The pre-commit hook:

1. Verifies Python is installed
2. Checks for required dependencies and directs users to install from requirements.txt if missing
3. Runs the dereference script
4. Adds any changed files to the commit
5. Fails the commit if dereferencing encounters errors

### CI Integration

The script and pre-commit hook are integrated with CI in a streamlined way:

1. The project uses asdf to manage Python in both local and CI environments
2. Dependencies are defined in `requirements.txt` (located in this directory) for consistency
3. The GitHub Actions workflow installs dependencies directly from requirements.txt
4. The same dependency management approach works for both local development and CI

### Dependencies

- Python 3.6+ (managed by asdf)
- Dependencies in `bin/scripts/requirements.txt`:
  - jsonref>=1.0.0

### Getting Started

To set up your environment for running this script:

1. Ensure Python is installed (preferably using asdf):
   ```bash
   asdf install python
   asdf reshim python
   ```

2. Install dependencies:
   ```bash
   pip install -r bin/scripts/requirements.txt
   ```

3. Install pre-commit hooks:
   ```bash
   pre-commit install
   ```
