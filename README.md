# Linux Infrastructure Health Check

A small, read-only Bash script for basic Linux infrastructure checks.

## Purpose

Provide a quick baseline view during lab work or first-level troubleshooting. The script does not modify system configuration.

## Checks

- Date, hostname, operating system and kernel
- System uptime
- Filesystem usage
- Memory usage, when `free` is available
- Failed systemd services, when `systemctl` is available

## Requirements

- Bash
- Standard Linux utilities: `date`, `hostname`, `uname`, `df`
- `free` and `systemctl` are optional

## Run

```bash
bash healthcheck.sh
```

On a Linux lab system, you may also make the file executable and run `./healthcheck.sh`.

## Test

The repository includes a GitHub Actions workflow that checks Bash syntax and runs the script in a temporary hosted Linux runner. This is not a guarantee of compatibility with every Linux distribution.

## Safety and limitations

For lab use and basic triage only. It does not replace monitoring, security review, or incident diagnosis. Review output before sharing it because hostnames, mount points, and system details may be sensitive. Do not run on production systems without review and authorization.

## Author

Sobhy NEGGAZI — GitHub: https://github.com/neggazizaggen
