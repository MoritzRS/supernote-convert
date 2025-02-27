# ![Supernote Convert](./logo.svg)

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

Convert E-Books to Supernote A6X2 optimized PDFs.

## What is this?

This repository contains a simple containerized wrapper around calibre to convert E-Books to PDFs for the Supernote A6X2.

## When should I use this?

This project is useful if you want to convert E-Books to PDFs for the Supernote A6X2 since PDFs have better annotations support and are more optimized for the device.

## Usage

### Requirements

This project requires a container engine installed on your system.
Make sure either Docker or Podman is available.

### Converting E-Books

1. Clone the repository.
2. Place your E-Books in the `./input` directory.
3. Run the `convert.sh` script from the root of the repository.
4. The converted PDFs will be placed in the `./output` directory.

## Development

The actual conversion script is located in `.container/convert.sh` with `./convert.sh` being a wrapper around it that detects the container engine and builds the container if necessary.

If you want to modify the the conversion options (e.g. font-sizes, margins, etc.) you can do so in the `.container/convert.sh` script.

If you have calibre installed on your system you can also run the conversion script directly.

## Acknowledgements

The conversion options used in this project were originally inspired by this [reddit post](https://www.reddit.com/r/Supernote/comments/1990lg3/after_some_trial_and_error_ive_landed_on_my_ideal/).

## License

MIT © Moritz R. Schulz
