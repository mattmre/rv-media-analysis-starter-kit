# RV Purchase Media-Driven Analysis Runbook (AI + Engineering + Negotiation)

## 1) Objective
Use a folder of listing **images + videos** (plus any docs) to produce:
- **Critical purchase risks** (walk-away / price-impacting)
- **Structural + engineering concerns** (water intrusion, delamination, frame, roof, slide-outs)
- **Mechanical + systems analysis** (engine/transmission, generator, HVAC, electrical, plumbing, propane, appliances)
- **Immediate repair/replacement projects** (0–30 days) and **near-term** (30–180 days)
- **Cost-to-remedy estimates** and **upgrade opportunities**
- A negotiation-ready **issue dossier** with evidence links to media

This is designed to output **Markdown deliverables**, including:
- `analysis/SCOPE.md`
- `analysis/SUMMARY.md`
- `analysis/FINDINGS_MASTER.md`
- `analysis/COSTING.md`
- `outputs/NEGOTIATION_PACKET.md`
- `analysis/media-notes/<one_md_per_image_or_video>.md`

> Important: Photo/video analysis cannot fully detect hidden defects. Always validate with an **in-person inspection**, moisture meter readings, test drives, and (ideally) an **NRVIA-certified RV inspector** and/or a mechanic for chassis/drivetrain.

---

## 2) Folder Layout (recommended)
Create this structure for each RV you evaluate:

```
RV_EVAL_<Year>_<Make>_<Model>_<ListingID>/
  inputs/
    media/
      images/
      videos/
    docs/
      listing/
      service_records/
      title_vin/
  work/
    keyframes/            # extracted from videos
    transcripts/          # audio transcripts
    metadata/             # exif/mediainfo outputs if used
  analysis/
    media-notes/          # one .md per image/video
    findings/             # system-specific summaries
    costing/              # estimates + assumptions
  outputs/
    NEGOTIATION_PACKET.md
    ONE_PAGE_SCORECARD.md
```

---

## 3) Intake Checklist (minimum data to collect)
Add these to `inputs/docs/listing/` when available:
- Listing text, asking price, location, seller type (dealer/private)
- VIN, year/make/model/trim, length, GVWR, odometer, generator hours
- Chassis (Ford/GM/Ram/Spartan/Freightliner), engine type, transmission
- Slide count, roof type (TPO/EPDM/Fiberglass), construction (wood/aluminum/composite)
- Maintenance records (oil changes, roof reseal, tires, brakes, recalls)
- Title status, accident/disaster history, storage history (covered vs outdoor)

---

## 4) Media Naming Convention (makes narrative easy)
If possible, rename files to encode location + system:

**Images**
`IMG_<Area>_<System>_<Angle>_<Seq>.jpg`
Examples:
- `IMG_ROOF_SEAMS_TOPDOWN_01.jpg`
- `IMG_UNDERBELLY_TANKS_REAR_02.jpg`
- `IMG_BATH_PLUMBING_UNDER_SINK_01.jpg`
- `IMG_ELEC_SHOREPOWER_PANEL_CLOSEUP_01.jpg`

**Videos**
`VID_<Area>_<System>_<Action>_<Seq>.mp4`
Examples:
- `VID_SLIDEOUT_LIVING_EXTEND_01.mp4`
- `VID_GENERATOR_START_RUN_01.mp4`
- `VID_ENGINE_COLDSTART_01.mp4`

If you cannot rename, keep originals but create a mapping table in `analysis/media_index.md`.

---

## 5) Required Coverage (ask seller for these if missing)
### Exterior / Structural
- Roof: full walkaround, seams, penetrations (vents, AC, antennas), soft spots
- Sidewalls: **delamination ripples/bubbles**, cracks, stains, repairs
- Front/rear caps: cracks, separation at joints
- Windows/doors: sealant condition, fogging, frame corrosion
- Slide-outs: side seals, top seals, slide floors, wiper seals, alignment
- Undercarriage: corrosion, leaks, frame rails, suspension mounts
- Tires: DOT date code closeups (all tires), sidewall cracking, tread
- Awnings: deployment, fabric tears, arms, motor/straps

### Mechanical / Chassis (motorhomes)
- Cold start video + idle + light rev
- Engine bay: belts/hoses/leaks, fluid condition, battery/terminals
- Undercarriage leak points: oil pan, trans pan, diff, steering rack, shocks
- Dash: warning lights, odometer, HVAC, infotainment, backup camera

### Systems (coach)
- Electrical: shore power hookup, breaker panel, inverter, converter, battery bank
- Generator: start, run under load (AC on), hours on meter
- Plumbing: water pump, city water, leaks under sinks, water heater operation
- Propane: tank/regulator, leak detector, appliance ignition
- HVAC: AC(s) + furnace, thermostats, airflow
- Appliances: fridge (modes), microwave, stove/oven, washer/dryer (if present)

---

## 6) Severity & Decision Framework
Use these levels in every media note and in the master report:

- **CRITICAL (Walk-away / major structural safety)**  
  Examples: active roof leaks with rot, significant delamination, frame damage, slide structural failure, severe corrosion, flood evidence, unsafe electrical, title problems.
- **HIGH (Major cost / must fix soon)**  
  Examples: aged tires (6–8+ years), roof reseal needed, generator issues, AC not cooling, plumbing leaks, brake/suspension defects.
- **MEDIUM (Planned repair / comfort impact)**  
  Examples: failing batteries, worn awning fabric, minor sealant failures, appliance cosmetic/function issues.
- **LOW (Cosmetic / optional upgrades)**  
  Examples: upholstery wear, small trim issues, minor scratches.

**Decision Gates**
- Gate A: Any CRITICAL issues? → default “No-buy” unless exceptional price + verified fix plan.
- Gate B: Total HIGH remediation exceeds your budget threshold? → price must move or walk.
- Gate C: If buying, require inspection contingency + documented repairs/credits.

---

## 7) Costing Method (consistent, auditable)
Maintain a single assumptions file at `analysis/costing/ASSUMPTIONS.md`:
- Labor rate assumptions (DIY $0/hr vs shop $150–$220/hr)
- Parts markup factor (1.0–1.25)
- Shipping/consumables contingency (5–10%)
- Regional variability note

For each issue, capture:
- **Parts** (range)
- **Labor hours** (range)
- **Total** (low/likely/high)
- **Confidence** (Low/Medium/High based on evidence)

---

## 8) Per-Media Markdown Template (ONE FILE PER IMAGE/VIDEO)
Create one `.md` per media file in `analysis/media-notes/`.

### Filename convention
Match the media name:
- `IMG_ROOF_SEAMS_TOPDOWN_01.md`
- `VID_GENERATOR_START_RUN_01.md`

### Template
```md
---
mediaFile: "inputs/media/images/IMG_ROOF_SEAMS_TOPDOWN_01.jpg"
mediaType: "image"               # image | video
category: "Roof/Exterior"        # Roof/Exterior | Slides | Undercarriage | Electrical | Plumbing | Propane | HVAC | Appliances | Chassis | Interior | Paperwork
locationOnRV: "Roof - midline seam near AC"
observedSystems: ["Roof membrane", "Sealant", "Penetrations"]
severity: "HIGH"                 # CRITICAL | HIGH | MEDIUM | LOW
confidence: "Medium"             # Low | Medium | High
tags: ["sealant", "roof", "water-intrusion-risk"]
---

## What this media shows (objective)
- [Bullet observations: materials, condition, evidence of repair, discoloration, cracks, gaps, rust, stains]

## Potential issues / hypotheses (what it might mean)
- [Translate observations into risks; be explicit about uncertainty]

## Immediate actions (0–30 days)
- [Inspection steps, tests, quotes to obtain]

## Estimated cost-to-remedy (range)
- Parts: $
- Labor: $
- Total: $ (low / likely / high)
- Notes: [assumptions, what would change estimate]

## Negotiation leverage
- [How this impacts offer; request credit/repair; inspection contingency]

## Follow-up media needed
- [Specific angles/tests/videos to confirm]
```

---

## 9) Video-Specific Additions (keyframes + transcript)
For each video note, append:

```md
## Video timeline notes
- 00:00–00:15: [what happens]
- 00:15–00:45: [what happens]
- 00:45–01:10: [what happens]

## Audio/transcript highlights
- [seller statements, audible issues, alarms, rough idle, compressor cycling]
```

Optional work products (if you choose to extract):
- Save keyframes to `work/keyframes/<video_name>/`
- Save transcript to `work/transcripts/<video_name>.txt`

---

## 10) System-by-System Findings Files (synthesis)
As you accumulate media notes, build system summaries in `analysis/findings/`:

- `ROOF_AND_WATER.md`
- `STRUCTURE_AND_BODY.md`
- `SLIDES_AND_AWNINGS.md`
- `CHASSIS_AND_DRIVETRAIN.md`
- `ELECTRICAL_12V_120V.md`
- `PLUMBING_AND_TANKS.md`
- `PROPANE_AND_SAFETY.md`
- `HVAC.md`
- `APPLIANCES.md`
- `INTERIOR.md`
- `PAPERWORK_AND_VALUE.md`

Each should contain:
- Key findings (bulleted)
- Evidence links (media note references)
- Severity roll-up
- Recommended next inspections/tests
- Cost roll-up

---

## 11) Master Output Templates

### `analysis/SCOPE.md`
```md
# Scope: RV Media-Based Pre-Purchase Analysis

## RV Identification
- Listing: [URL or description]
- Year/Make/Model/Trim:
- VIN:
- Asking Price:
- Location:
- Seller Type:

## Inputs Provided
- Images: [count]
- Videos: [count]
- Documents: [service records/title/etc]

## Analysis Goals
- Identify critical defects and price-impacting issues
- Estimate near-term remediation costs
- Produce negotiation packet with evidence

## Out of Scope / Limitations
- Hidden moisture without meter readings
- Full drivetrain health without test drive/scan
- Propane leak confirmation without pressure test
- Roof integrity without physical walk

## Required Follow-up
- [bullets]
```

### `analysis/SUMMARY.md` (executive summary)
```md
# Executive Summary (Media-Based)

## Overall Assessment
- Recommendation: [Proceed / Proceed with conditions / Do not proceed]
- Risk Level: [Low/Moderate/High]
- Estimated Immediate Spend (0–30 days): $
- Estimated Near-Term Spend (30–180 days): $

## Top Issues (ranked)
1. [Issue] — Severity — Estimated $ — Evidence: [media note links]
2. ...
```

### `analysis/FINDINGS_MASTER.md` (full report)
```md
# Findings Master Report

## Scoring Snapshot
- Structural/Water: __/10
- Chassis/Drivetrain: __/10
- Electrical: __/10
- Plumbing: __/10
- Propane/Safety: __/10
- HVAC/Appliances: __/10
- Interior/Finish: __/10
- Paperwork/Value: __/10

## Critical/High Findings
- [Table: Issue | Severity | Cost (low/likely/high) | Confidence | Evidence links | Required verification]

## System Sections
### Roof & Water Intrusion
[summary + evidence references]

### Structure & Body
...

## Cost Roll-Up
- Immediate (0–30): $
- Near-term (30–180): $
- Optional upgrades: $

## Purchase Conditions (if proceeding)
- [inspection contingency, repair credits, documentation requirements]
```

### `outputs/NEGOTIATION_PACKET.md`
```md
# Negotiation Packet

## Offer Position
- Asking Price: $
- Evidence-Based Deductions: $
- Proposed Offer: $
- Contingencies: [inspection, title, test drive, systems demonstration]

## Evidence-Based Issues
- [Issue] — $ impact — Evidence: [media note links] — Requested remedy: [repair/credit]

## Closing Ask
- [clear, professional list of requirements]
```

---

## 12) AI Prompts (optional, for consistent analysis)
If you use an AI model to analyze each media item, use a consistent prompt structure.

### Per-media prompt
```text
You are an RV inspection analyst. Review the provided image/video and produce:
1) Objective observations (no speculation).
2) Likely issues/risks with explicit uncertainty.
3) Severity (CRITICAL/HIGH/MEDIUM/LOW) and confidence.
4) Follow-up media/tests needed to confirm.
5) Repair/replacement tasks (0–30 days and 30–180 days).
6) Cost ranges (parts/labor) with assumptions.
7) Negotiation leverage phrasing.

Output in the per-media Markdown template exactly.
```

### Synthesis prompt (build master report)
```text
You are producing a purchase readiness and negotiation report for an RV.
Use all per-media notes and system summaries to generate:
- Executive summary with recommendation and total cost roll-up
- Ranked issues with evidence links
- System-by-system findings
- Negotiation packet with deductions and contingencies
Output in: SUMMARY.md, FINDINGS_MASTER.md, NEGOTIATION_PACKET.md formats.
```

---

## 13) How to Start (manual workflow)
1. Create the folder structure for the RV.
2. Drop images/videos into `inputs/media/`.
3. Create `analysis/media_index.md` listing file names + short description.
4. For each image/video, create a matching `.md` in `analysis/media-notes/` using the template.
5. As notes accumulate, update the system summaries in `analysis/findings/`.
6. Complete `analysis/costing/ASSUMPTIONS.md` and cost roll-ups.
7. Generate `analysis/SUMMARY.md`, `analysis/FINDINGS_MASTER.md`, and `outputs/NEGOTIATION_PACKET.md`.

---

## 14) Media Index Template (optional)
Create `analysis/media_index.md`:

```md
# Media Index

| Media File | Type | Category | Brief Description | Notes File |
|---|---:|---|---|---|
| IMG_ROOF_SEAMS_TOPDOWN_01.jpg | image | Roof/Exterior | Seam sealant cracking | media-notes/IMG_ROOF_SEAMS_TOPDOWN_01.md |
| VID_GENERATOR_START_RUN_01.mp4 | video | Electrical | Gen start + load test | media-notes/VID_GENERATOR_START_RUN_01.md |
```

---

## 15) Quick “Red Flag” Reference (common high-impact items)
- **Water intrusion**: stains, soft walls/roof, delamination, mold smell
- **Roof seams**: dried/cracked sealant, lifting membrane, patchwork repairs
- **Slide-outs**: misalignment, torn seals, soft floors, water stains
- **Tires**: old DOT date, cracking (blowout risk), uneven wear (alignment/suspension)
- **Undercarriage**: heavy rust, wet/oily areas, tank/valve damage
- **Electrical**: burned outlets, melted transfer switch, amateur wiring, battery corrosion
- **Generator**: won’t start, hunts under load, smoke, abnormal noise
- **HVAC**: AC not cooling, furnace faults
- **Paperwork**: title issues, missing VIN verification, no maintenance history

---

## 16) Next Step
Once you have a folder of images/videos for a specific RV, start with 10–20 key images + 1–2 videos and the listing basics (year/make/model, asking price). Then generate per-media notes, a preliminary summary, and a seller follow-up request list.
