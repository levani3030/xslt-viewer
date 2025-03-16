# XSLT Viewer

A simple web-based viewer for the ConsentGeo.xslt file that automatically updates when the XSLT file changes.

## Features

- Real-time preview of XSLT transformations
- Automatic updates when the XSLT file is modified
- Simple local web server for testing
- Command line testing utility

## Files

- `ConsentGeo.xslt` - The original XSLT file (do not modify this file through the viewer)
- `sample-data.xml` - Sample XML data for testing the XSLT
- `xslt-viewer.html` - The main viewer interface
- `preview.html` - Handles the actual XSLT transformation and display
- `xslt-viewer.js` - JavaScript for handling automatic updates
- `server.js` - A simple Node.js server for running the viewer
- `test-xslt.js` - A command-line tool to test XSLT transformation

## Installation

1. Make sure you have Node.js installed on your system

2. Install the required dependencies:
   ```
   npm install
   ```

## How to use

### Web Viewer

1. Start the local server:
   ```
   npm start
   ```
   or
   ```
   node server.js
   ```

2. Open your browser and navigate to:
   ```
   http://localhost:3000/
   ```

3. The viewer will display the current state of your XSLT transformation

4. When you edit and save the `ConsentGeo.xslt` file, the preview will automatically update

### Command-line Testing

If you prefer to test without the browser, you can use the command-line tool:

```
npm test
```

This will transform the XSLT with the sample data and save the result to `output.html`.

## How to modify sample data

If you need to test with different data, edit the `sample-data.xml` file, which contains the following structure:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Root>
  <Email>example@example.com</Email>
  <PhoneNumber>+995 555 12 34 56</PhoneNumber>
  <Today>2023-10-15T14:30:00</Today>
</Root>
```

The viewer will automatically update the Today field with the current date and time.

## Notes

- The viewer doesn't modify your original XSLT file
- The preview updates once per second when changes are detected
- For production use, you might want to implement a more robust solution 