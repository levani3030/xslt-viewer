// File paths
const xsltFilePath = 'ConsentGeo.xslt';
const xmlFilePath = 'sample-data.xml';

// DOM elements
const statusElement = document.getElementById('status');
const previewFrame = document.getElementById('preview');

// Watch interval (in milliseconds)
const watchInterval = 5000;

// Last modified timestamp for detecting changes
let lastModified = null;

/**
 * Check if the XSLT file has been modified
 */
async function checkFileChanges() {
    try {
        const response = await fetch(xsltFilePath + '?t=' + new Date().getTime());
        const currentLastModified = response.headers.get('last-modified');
        
        if (lastModified === null) {
            // First check
            lastModified = currentLastModified;
            return;
        }
        
        if (currentLastModified !== lastModified) {
            // File has been modified
            lastModified = currentLastModified;
            refreshPreview();
            showStatus('Updated', false);
            setTimeout(() => showStatus('Connected', false), 2000);
        }
    } catch (error) {
        showStatus('Error: ' + error.message, true);
        console.error('Error checking file changes:', error);
    }
}

/**
 * Refresh the preview iframe
 */
function refreshPreview() {
    previewFrame.contentWindow.location.reload();
}

/**
 * Update status display
 */
function showStatus(message, isError) {
    statusElement.textContent = message;
    
    if (isError) {
        statusElement.classList.add('error');
    } else {
        statusElement.classList.remove('error');
    }
}

// Start monitoring
function initialize() {
    // Initial check
    checkFileChanges();
    
    // Set up regular checking
    setInterval(checkFileChanges, watchInterval);
    
    // Add event listeners
    window.addEventListener('error', (event) => {
        showStatus('Error: ' + event.message, true);
    });
}

// Initialize when document is loaded
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initialize);
} else {
    initialize();
} 