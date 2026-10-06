# Archive

This directory serves as a historical vault for services and applications that were once part of the active homelab infrastructure but have since been retired. 

The configurations (`docker-compose.yml`, `.env-example`, and related scripts) kept here are preserved for future reference, documentation, and archival purposes.

> [!IMPORTANT]
> The configurations in this directory are no longer actively maintained or updated, and they may contain outdated image tags or deprecated variables.

## Retired services directory

*   **Forgejo:** previously served as the definitive local git repository for personal codebase and documentation. It was retired in favor of moving back to a managed external platform (GitHub) to eliminate the friction of maintaining split codebases, managing local Git databases, etc.
*   **ezbookkeeping:** initially deployed for local personal finance tracking. It was sunsetted because the friction of manual transaction entry outweighed the benefits of self-hosting. Tracking finances was moved to a native, multi-platform dedicated application to reduce mental load and improve consistency.
*   **qBittorrent (Standalone):** previously utilized as a general-purpose, manually managed torrent client.