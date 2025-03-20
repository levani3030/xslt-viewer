const http = require('http');
const fs = require('fs');
const path = require('path');
const url = require('url');

// Port for the local server
const PORT = 3030;

// MIME types mapping
const MIME_TYPES = {
    '.html': 'text/html',
    '.js': 'text/javascript',
    '.css': 'text/css',
    '.xml': 'application/xml',
    '.xslt': 'application/xml',
    '.json': 'application/json',
    '.png': 'image/png',
    '.jpg': 'image/jpeg',
    '.jpeg': 'image/jpeg',
    '.gif': 'image/gif',
    '.svg': 'image/svg+xml',
    '.ico': 'image/x-icon'
};

// Create HTTP server
const server = http.createServer((req, res) => {
    console.log(`Request: ${req.method} ${req.url}`);
    
    // Parse the URL
    const parsedUrl = url.parse(req.url);
    
    // Extract the path from the URL
    let pathname = parsedUrl.pathname;
    
    // Default to index.html if path is '/'
    if (pathname === '/') {
        pathname = '/xslt-viewer.html';
    }
    
    // Get the absolute file path
    const filePath = path.join(__dirname, pathname);
    
    // Get the file extension
    const ext = path.extname(filePath);
    
    // Check if the file exists
    fs.stat(filePath, (err, stats) => {
        if (err) {
            // File not found
            res.statusCode = 404;
            res.setHeader('Content-Type', 'text/html');
            res.end('<h1>404 Not Found</h1><p>The requested file was not found on the server.</p>');
            return;
        }
        
        // If it's a directory, look for index.html
        if (stats.isDirectory()) {
            res.statusCode = 301;
            res.setHeader('Location', pathname + '/');
            res.end();
            return;
        }
        
        // Read the file
        fs.readFile(filePath, (err, data) => {
            if (err) {
                // Server error
                res.statusCode = 500;
                res.setHeader('Content-Type', 'text/html');
                res.end('<h1>500 Internal Server Error</h1>');
                return;
            }
            
            // Set content type
            const contentType = MIME_TYPES[ext] || 'application/octet-stream';
            res.statusCode = 200;
            res.setHeader('Content-Type', contentType);
            
            // Set Last-Modified header for caching
            res.setHeader('Last-Modified', stats.mtime.toUTCString());
            
            // Send the file content
            res.end(data);
        });
    });
});

// Start the server
server.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}/`);
    console.log(`XSLT Viewer available at http://localhost:${PORT}/xslt-viewer.html`);
}); 