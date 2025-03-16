const fs = require('fs');
const path = require('path');
const { DOMParser, XMLSerializer } = require('@xmldom/xmldom');
const xsltProcessor = require('xslt-processor');

// File paths
const xsltFilePath = path.join(__dirname, 'ConsentGeo.xslt');
const xmlFilePath = path.join(__dirname, 'sample-data.xml');
const outputPath = path.join(__dirname, 'output.html');

// Read files
try {
    console.log('Reading files...');
    const xsltContent = fs.readFileSync(xsltFilePath, 'utf8');
    const xmlContent = fs.readFileSync(xmlFilePath, 'utf8');

    // Parse XML
    const parser = new DOMParser();
    const xmlDoc = parser.parseFromString(xmlContent, 'text/xml');
    const xsltDoc = parser.parseFromString(xsltContent, 'text/xml');

    // Update the Today element with current date
    const todayElements = xmlDoc.getElementsByTagName('Today');
    if (todayElements.length > 0) {
        const now = new Date();
        const formattedDate = now.toISOString().slice(0, 19);
        todayElements[0].textContent = formattedDate;
    }

    // Transform
    console.log('Transforming XSLT...');
    const resultDoc = xsltProcessor.processXSLT(xsltDoc, xmlDoc);
    
    // Write to file
    fs.writeFileSync(outputPath, resultDoc, 'utf8');
    console.log(`Transformation complete. Output written to ${outputPath}`);
} catch (error) {
    console.error('Error:', error.message);
} 