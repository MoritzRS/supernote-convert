#!/bin/bash

INPUT=${INPUT:-"./input"};
OUTPUT=${OUTPUT:-"./output"};

if [ -z "$(ls $INPUT)" ]; then
    echo "No files found in $INPUT";
    exit 1;
fi

mkdir -p $OUTPUT;

for file in $INPUT/*; do
    base_name=$(basename "$file");
    pdf_name="${base_name%.*}.pdf";
    echo "$base_name";
    ebook-convert "$file" "$OUTPUT/$pdf_name" \
        --base-font-size 14 \
        --change-justification "justify" \
        --extra-css "@page{margin:0 1pt;}body{margin:0;orphans:1;widows:1;}" \
        --font-size-mapping 12,12,14,16,18,20,22,24 \
        --insert-blank-line \
        --insert-blank-line-size 1 \
        --line-height 0 \
        --minimum-line-height 135 \
        --remove-paragraph-spacing \
        --remove-paragraph-spacing-indent-size 0 \
        --smarten-punctuation \
        >/dev/null 2>&1;

done
