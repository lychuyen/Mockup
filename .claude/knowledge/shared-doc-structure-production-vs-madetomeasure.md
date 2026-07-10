# Document Structure Decision: Option C (Deliverables by Technical Module)

This document records the architectural decision to organize the BA deliverables (BRD and SRS) under **Option C**.

## Context
When sharing specifications and designs with external clients, developers, and QA teams, the document structure must be intuitive and easy to navigate. We analyzed three options:
- **Option A (By Phase):** Organizing files strictly by phase (Phase 1, Phase 2...). This makes it hard to see the complete spec of a single module since requirements are scattered across different phases.
- **Option B (By Document Type):** Having separate `brd/` and `srs/` root folders. This makes it difficult to associate a specific business requirement with its technical specification.
- **Option C (By Technical Module):** Having one directory per technical module, with each directory containing its own `brd/` and `srs/` subfolders.

## Decision: Option C
We selected **Option C** (Deliverables by Technical Module) because:
1. **High Cohesion:** All requirements (`brd/`) and design specifications (`srs/`) for a single module are stored together. Open a module folder, and you see everything for that feature area.
2. **Clear Boundaries:** It maps directly to the FIMS technical architecture (12 modules), making it easy for developer and QA assignment.
3. **Avoids Redundancy:** Where a phase spans multiple modules, we place the monolithic BRD under the primary module and use lightweight pointer files (`SEE-*.md`) in other modules to link to the source.
