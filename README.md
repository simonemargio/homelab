# Maya homelab

<p align="center">
  <img src="./assets/maya-homelab.webp" width="250" alt="Maya Homelab Logo">
  <br><br>
  <em>Meet Maya, the official mascot of this tiny homelab!<br /><br />I usually pride myself on building and doing everything from scratch, but since I can't even draw a proper square, I had to rely on an LLM prompt to generate this logo.</em> 🥲
</p>

<br><br>

# Who is Maya?

[Maya](./assets/maya.webp) is my Jack Russell and the inspiration behind the name of this homelab. She's been part of my life long before this little infrastructure project existed, so naming the physical server after her felt only right.
She's also the unofficial supervisor of the entire operation, always nearby, keeping an eye on things and silently judging every questionable infrastructure decision.

<br />

This repository serves as the architectural blueprint for my simple homelab. It's a collection of my containerized services designed with a singular purpose: **digital sovereignty**.

# Repository Architecture

The repository structure is strictly organizational. Each directory corresponds to a discrete service or a logical grouping of containers. 

Inside every directory:
- `docker-compose.yml`: the declarative configuration defining the service, its dependencies, networking routing, and persistent volumes.
- `.env-example`: a template containing required environment variables.

## Services

The current infrastructure runs a diverse stack of applications:

### Core
*   **Beszel:** telemetry engine. A highly efficient monitoring daemon that aggregates real time metrics on CPU, memory, and container health, maintaining historical performance data without consuming excessive system resources.
*   **Cloudflare Tunnel:** edge gateway. It securely exposes internal services to the public internet via outbound connections, establishing a zero trust architecture. This completely bypasses the need for port forwarding, protecting the internal network from external scanning.
*   **Portainer:** centralized control plane. It provides comprehensive visibility and management over the Docker environment, simplifying container orchestration, volume inspection, and virtual network management.

### Security
*   **Forgejo:** git instance that serves as the definitive repository for my personal codebase, scripts, and documentation. Keeping these assets locally provides a trusted source of truth for the system, enables versioned and auditable changes, and avoids exposing sensitive operational details to third-party cloud services.
*   **Kopia:** It orchestrates zero knowledge, deduplicated, and end-to-end encrypted snapshots, shipping all my homelab data to an offsite Hetzner storage box to ensure rapid disaster recovery against local hardware failure.
*   **Vaultwarden:** lightweight, Rust-based implementation of the Bitwarden API that securely manages credentials and sensitive strings locally, entirely severing reliance on cloud-based password managers.

### Media
*   **Kavita:** digital archival platform. It acts as a highly optimized reading server for ebooks, comics, and manga, featuring a sophisticated metadata engine and seamless cross device synchronization.
*   **Koito:** modern scrobbler. A fast, themeable server to explore listening patterns, track favorite artists, and relay scrobbles to other platforms keeping listening data entirely under my control. You can look at my entire [listening history](https://replay.simonemargio.dev) since I started using Navidrome along with ListenBrainz.
*   **Navidrome:** robust, Subsonic-compatible server that indexes massive local music libraries and streams them with near zero latency to dedicated clients across any device.
*   **qBittorrent:** A containerized torrent client utilized for retrieving and seeding large datasets and distributions.

### Productivity
*   **ezbookkeeping:** streamlined accounting platform for tracking expenses, managing budgets, and analyzing personal cash flow without feeding financial data to external analytics engines.
*   **FreshRSS:** in an era of algorithmic feeds, this service provides deterministic, chronological aggregation of news, blogs, and releases, putting information consumption entirely under my control.