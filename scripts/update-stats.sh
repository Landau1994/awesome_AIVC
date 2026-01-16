#!/bin/bash
# update-stats.sh - Update README stats before commit

cd "$(dirname "$0")"

# Count files
PAPERS=$(ls -1 01_Papers/*.md 2>/dev/null | wc -l)
CONCEPTS=$(ls -1 02_Concepts/*.md 2>/dev/null | wc -l)
TEMPLATES=$(ls -1 Templates/*.md 2>/dev/null | wc -l)

# Update README with actual counts
sed -i "s/| Papers *|.*/| Papers | $PAPERS |/" README.md
sed -i "s/| Concepts *|.*/| Concepts | $CONCEPTS |/" README.md
sed -i "s/| Templates *|.*/| Templates | $TEMPLATES |/" README.md

echo "Stats updated: Papers=$PAPERS, Concepts=$CONCEPTS, Templates=$TEMPLATES"
