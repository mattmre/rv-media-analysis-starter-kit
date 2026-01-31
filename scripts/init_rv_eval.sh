#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <NEW_RV_FOLDER_NAME>"
  echo "Example: $0 RV_EVAL_2021_Thor_Ace_29_Listing123"
  exit 1
fi

NEW="$1"
cp -R "$(dirname "$0")/../RV_EVAL_TEMPLATE" "$NEW"

# Seed base markdowns from templates
cp "$(dirname "$0")/../templates/media_index_template.md" "$NEW/analysis/media_index.md"
cp "$(dirname "$0")/../templates/scope_template.md" "$NEW/analysis/SCOPE.md"
cp "$(dirname "$0")/../templates/summary_template.md" "$NEW/analysis/SUMMARY.md"
cp "$(dirname "$0")/../templates/findings_master_template.md" "$NEW/analysis/FINDINGS_MASTER.md"
cp "$(dirname "$0")/../templates/negotiation_packet_template.md" "$NEW/outputs/NEGOTIATION_PACKET.md"

# Create standard findings files
for f in ROOF_AND_WATER STRUCTURE_AND_BODY SLIDES_AND_AWNINGS CHASSIS_AND_DRIVETRAIN ELECTRICAL_12V_120V PLUMBING_AND_TANKS PROPANE_AND_SAFETY HVAC APPLIANCES INTERIOR PAPERWORK_AND_VALUE; do
  touch "$NEW/analysis/findings/${f}.md"
  if ! grep -q "#" "$NEW/analysis/findings/${f}.md"; then
    echo "# ${f//_/ }" > "$NEW/analysis/findings/${f}.md"
    echo >> "$NEW/analysis/findings/${f}.md"
    echo "- Key findings:" >> "$NEW/analysis/findings/${f}.md"
    echo "- Evidence links:" >> "$NEW/analysis/findings/${f}.md"
    echo "- Severity roll-up:" >> "$NEW/analysis/findings/${f}.md"
    echo "- Recommended verification/tests:" >> "$NEW/analysis/findings/${f}.md"
    echo "- Cost roll-up:" >> "$NEW/analysis/findings/${f}.md"
  fi
done

# Assumptions file
cat > "$NEW/analysis/costing/ASSUMPTIONS.md" <<'AEOF'
# Costing Assumptions

## Labor Rates
- DIY: $0/hr (time not monetized)
- Independent RV shop: $150–$220/hr (region-dependent)
- Heavy truck / chassis shop (diesel): $175–$250/hr (region-dependent)

## Parts and Materials
- Parts markup factor: 1.0–1.25
- Shipping/consumables contingency: 5–10%

## Notes
- Estimates vary significantly by RV class, region, and scope.
- Confirm with local quotes before using numbers in a final offer.
AEOF

echo "Initialized: $NEW"
