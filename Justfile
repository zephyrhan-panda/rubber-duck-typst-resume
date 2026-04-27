set shell:= ["bash", "-uceE"]

CONTAINER_RUNTIME := "podman"
PROJECT_ROOT := `git rev-parse --show-toplevel`
OUTPUT_FILENAME := "resume.pdf"
TEMPLATE := "latex"
# TEMPLATE := "awesome"
FONT_PATH := "." / "templates" / TEMPLATE / "assets" / "fonts"
TYPST_IMAGE_REF := "ghcr.io/typst/typst:latest"

default:
    @just --list

build:
    @typst compile --font-path "{{FONT_PATH}}" resume.typ "{{OUTPUT_FILENAME}}"

dev:
    @typst watch --font-path "{{FONT_PATH}}" resume.typ "{{OUTPUT_FILENAME}}"

font:
    @typst fonts --font-path "{{FONT_PATH}}" --variants

clean:
    @rm -f *.pdf

containerized-build:
    @{{CONTAINER_RUNTIME}} run --rm -t \
        -v "{{PROJECT_ROOT}}:/mnt" \
        -w "/mnt" \
        "{{TYPST_IMAGE_REF}}" \
        typst compile --font-path "{{FONT_PATH}}" resume.typ "{{OUTPUT_FILENAME}}"

containerized-dev:
    @{{CONTAINER_RUNTIME}} run --rm -it -v \
        "{{PROJECT_ROOT}}:/mnt" \
        -w "/mnt" \
        --init \
        "{{TYPST_IMAGE_REF}}" \
        typst watch --font-path "{{FONT_PATH}}" resume.typ "{{OUTPUT_FILENAME}}"

containerized-font:
    @{{CONTAINER_RUNTIME}} run --rm -t -v \
        "{{PROJECT_ROOT}}:/mnt" \
        -w "/mnt" \
        "{{TYPST_IMAGE_REF}}" \
        typst fonts --font-path "{{FONT_PATH}}" --variants