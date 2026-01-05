from http.server import BaseHTTPRequestHandler, HTTPServer

HOST = "0.0.0.0"
PORT = 8081

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"OK\n")

def main():
    HTTPServer((HOST, PORT), Handler).serve_forever()

if __name__ == "__main__":
    main()
