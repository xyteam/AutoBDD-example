// Mock server for AutoBDD-example external-service demo features.
//
// Serves:
//   * static pages for github / varmour / bestvpn / html5demos drag under mock-app/
//     on :8090
//   * a minimal restful-booker-style JSON API on :8091 (used by the postman
//     collection via newman)
//   * downloadable fixture files (pdf / xls) on :8092
//
// Start: node mock-server.js   (or: npm run mock-up)

const http = require('http');
const fs = require('fs');
const path = require('path');

const STATIC_ROOT = path.join(__dirname, 'mock-app');
const PORT_STATIC = 8090;
const PORT_API = 8091;
const PORT_DOWNLOAD = 8092;

// ---- static file server (github / varmour / bestvpn / drag pages) ----
const MIME = {
  '.html': 'text/html', '.htm': 'text/html', '.js': 'text/javascript',
  '.css': 'text/css', '.png': 'image/png', '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg', '.svg': 'image/svg+xml', '.json': 'application/json',
  '.gif': 'image/gif', '.ico': 'image/x-icon', '.pdf': 'application/pdf',
  '.xls': 'application/vnd.ms-excel'
};

function staticServer(req, res) {
  let urlPath = decodeURIComponent(req.url.split('?')[0]);
  if (urlPath === '/') urlPath = '/index.html';
  // path traversal guard
  const full = path.normalize(path.join(STATIC_ROOT, urlPath));
  if (!full.startsWith(STATIC_ROOT)) {
    res.writeHead(403); res.end('forbidden'); return;
  }
  fs.readFile(full, (err, data) => {
    if (err) {
      res.writeHead(404, { 'Content-Type': 'text/plain' });
      res.end('not found: ' + urlPath);
      return;
    }
    res.writeHead(200, { 'Content-Type': MIME[path.extname(full)] || 'application/octet-stream' });
    res.end(data);
  });
}

// ---- restful-booker style mock API (matches Restful-Booker.postman_collection) ----
// the /booking list assertion requires >= 10 booking ids, and /booking/1 must
// return a valid firstname/lastname
const bookings = [];
const firstNames = ['Jim','Mary','John','Jane','Alice','Bob','Carol','Dave','Eve','Frank'];
const lastNames  = ['Brown','Smith','Jones','Doe','White','Black','Green','Hill','Lee','King'];
for (let i = 1; i <= 10; i++) {
  bookings.push({ bookingid: i, booking: {
    firstname: firstNames[i - 1], lastname: lastNames[i - 1],
    totalprice: 100 + i, depositpaid: i % 2 === 0,
    bookingdates: { checkin: '2018-0' + (i % 9 + 1) + '-01', checkout: '2019-01-01' },
    additionalneeds: 'Breakfast'
  }});
}

function sendJson(res, code, obj) {
  const body = JSON.stringify(obj);
  res.writeHead(code, { 'Content-Type': 'application/json', 'Content-Length': Buffer.byteLength(body) });
  res.end(body);
}

function apiServer(req, res) {
  const url = new URL(req.url, 'http://localhost');
  const p = url.pathname;
  // health check -> 201 Created
  if (p === '/ping' && req.method === 'GET') {
    sendJson(res, 201, {}); return;
  }
  if (p === '/booking' && req.method === 'GET') {
    sendJson(res, 200, bookings.map(b => ({ bookingid: b.bookingid }))); return;
  }
  // GET /booking/{id}
  const m = p.match(/^\/booking\/(\d+)$/);
  if (m && req.method === 'GET') {
    const b = bookings.find(x => x.bookingid === Number(m[1]));
    if (b) { sendJson(res, 200, b.booking); return; }
    sendJson(res, 404, { reason: 'Not Found' }); return;
  }
  if (p === '/booking' && req.method === 'POST') {
    sendJson(res, 200, { bookingid: 99 }); return;
  }
  sendJson(res, 404, { reason: 'Not Found' });
}

// ---- download server ----
function downloadServer(req, res) {
  const urlPath = req.url.split('?')[0].replace(/^\//, '') || 'pdf-test.pdf';
  const full = path.join(STATIC_ROOT, 'downloads', path.basename(urlPath));
  fs.readFile(full, (err, data) => {
    if (err) { res.writeHead(404); res.end('not found'); return; }
    res.writeHead(200, {
      'Content-Type': MIME[path.extname(full)] || 'application/octet-stream',
      'Content-Disposition': 'attachment; filename="' + path.basename(full) + '"'
    });
    res.end(data);
  });
}

http.createServer(staticServer).listen(PORT_STATIC, () => console.log('mock static on :' + PORT_STATIC));
http.createServer(apiServer).listen(PORT_API, () => console.log('mock api on :' + PORT_API));
http.createServer(downloadServer).listen(PORT_DOWNLOAD, () => console.log('mock download on :' + PORT_DOWNLOAD));
