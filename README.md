# RV Media Analysis Starter Kit

A structured framework for conducting **media-driven due diligence** on recreational vehicles before purchase. Analyze listing photos and videos to identify defects, estimate repair costs, and build evidence-based negotiation packets.

## What This Does

- Provides a repeatable folder structure for each RV evaluation
- Includes markdown templates for per-image/video analysis notes
- Generates system-by-system findings (roof, electrical, plumbing, chassis, etc.)
- Produces cost estimates and a negotiation packet with evidence links
- Supports AI-assisted analysis via LLM prompt templates (Claude, etc.)

> **Note:** This is a pre-purchase triage tool. It does not replace in-person inspection, moisture meter readings, drivetrain diagnostics, or a professional NRVIA-certified RV inspector.

## Quick Start

### 1. Initialize a new evaluation folder

**Linux / macOS:**
```bash
./scripts/init_rv_eval.sh RV_EVAL_2021_Thor_Ace_29
```

**Windows PowerShell:**
```powershell
.\scripts\init_rv_eval.ps1 -Name "RV_EVAL_2021_Thor_Ace_29"
```

Or manually copy the scaffold:
```bash
cp -R RV_EVAL_TEMPLATE RV_EVAL_2021_Thor_Ace_29
```

### 2. Add your media

Drop listing photos and videos into:
- `inputs/media/images/`
- `inputs/media/videos/`

### 3. Analyze

For each image/video, create a note in `analysis/media-notes/` using `templates/per_media_note_template.md`.

### 4. Synthesize

As notes accumulate, build up:
- `analysis/findings/` -- system-by-system summaries
- `analysis/SUMMARY.md` -- executive summary
- `analysis/FINDINGS_MASTER.md` -- full findings report
- `outputs/NEGOTIATION_PACKET.md` -- price deductions with evidence

## Project Structure

```
├── RV_EVAL_TEMPLATE/          # Copy this folder for each RV evaluation
│   ├── inputs/                # Your photos, videos, and documents
│   │   ├── media/images/
│   │   ├── media/videos/
│   │   └── docs/              # Listing text, service records, title/VIN
│   ├── work/                  # Extracted keyframes, transcripts, metadata
│   ├── analysis/              # Your analysis markdown files
│   │   ├── media-notes/       # One .md per image/video
│   │   ├── findings/          # System-by-system summaries
│   │   └── costing/           # Cost estimates and assumptions
│   ├── outputs/               # Final deliverables
│   └── archives/              # Completed evaluation archives
│
├── templates/                 # Markdown templates for reports
├── prompts/                   # LLM prompt templates (optional)
├── scripts/                   # Initialization scripts
└── RV_Purchase_Media_Analysis_Runbook.md   # Full 16-section guide
```

## Templates Included

| Template | Purpose |
|----------|---------|
| `per_media_note_template.md` | One-per-image/video analysis note |
| `findings_master_template.md` | Complete findings report |
| `summary_template.md` | Executive summary with recommendation |
| `negotiation_packet_template.md` | Offer strategy with evidence-based deductions |
| `media_index_template.md` | Catalog of all media files |
| `scope_template.md` | Project scope and limitations |

## Severity Levels

- **CRITICAL** -- Walk-away / major structural safety (roof rot, frame damage, flood evidence)
- **HIGH** -- Major cost / must fix soon (aged tires, generator issues, plumbing leaks)
- **MEDIUM** -- Planned repair / comfort impact (failing batteries, worn awning)
- **LOW** -- Cosmetic / optional upgrades (upholstery wear, minor scratches)

## Using with AI (Optional)

The `prompts/` folder contains standardized prompts for LLM-assisted analysis:
- `per-media.prompt.txt` -- Analyze a single image/video
- `synthesis.prompt.txt` -- Generate master report from all notes

These work with Claude, ChatGPT, or any LLM that accepts image/text input.

## Privacy Note

The `.gitignore` is configured to exclude input media, documents, and analysis outputs that may contain personally identifiable information (license plates, VINs, locations, pricing). Only the templates and framework files are tracked in version control.

## License

MIT
