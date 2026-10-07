# XLSX Photo Extractor

A simple Windows batch script that extracts embedded photos/images from an Excel (`.xlsx`) spreadsheet.

Excel files (`.xlsx`) are ZIP archives under the hood. This script temporarily renames the file to `.zip`, extracts its contents with 7-Zip, and copies the embedded media files into a convenient output folder.

## Prerequisites

- **Windows** (batch script)
- **[7-Zip](https://www.7-zip.org/)** installed  
  The script expects `7z.exe` (and related files) to be available in the same folder as the script (or in your system `PATH`).

## How to Use

1. Place the batch file (`extract-photos.bat` or whatever you named it) in a folder.
2. Copy the Excel file you want to extract photos from into the **same folder**.
3. Make sure `7z.exe` (and the other 7-Zip files) are also in that folder (or accessible via PATH).
4. Double-click the batch file or run it from a Command Prompt.
5. When prompted, type the **name of the Excel file without the `.xlsx` extension** and press Enter.


## What the Script Does

1. Creates a temporary working directory at `C:\setupfiles\temp\`
2. Copies your Excel file and the 7-Zip files into a temporary subfolder
3. Renames the `.xlsx` file to `.zip`
4. Extracts the archive
5. Copies all files from the `xl\media\` folder (where Excel stores embedded images) to an output folder.
6. Cleans up the temporary files
7. Returns to the original folder and asks if you want to process another file


## Notes & Limitations

- The script uses **hard-coded paths** under `C:\setupfiles\temp\`. Make sure you have write permission to the `C:` drive, or edit the script if you prefer a different location.
- Only works with modern Excel files (`.xlsx`). Older `.xls` files are not supported.
- The script runs in a continuous loop so you can process multiple files without restarting it. Close the window when you’re finished.
- Embedded images are usually stored with names like `image1.png`, `image2.jpeg`, etc.

## Disclaimer

This is a simple utility script. Use it at your own risk. Always keep a backup of important Excel files before running extraction tools.
