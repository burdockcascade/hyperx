package hyper;

import hyper.Http.StatusCode;
import haxe.io.Bytes;
import sys.thread.Thread;
import sys.net.Socket;
import sys.net.Host;

class HyperServer {

    var hostname:String;
    var port:Int;
    var handler:HttpRequestHandler;

    public function new() {

    }

    public function setHandler(handler:HttpRequestHandler) {
        this.handler = handler;
    }

    public function setHostname(hostname:String) {
        this.hostname = hostname;
    }

    public function setPort(port:Int) {
        this.port = port;
    }

    public function start() {
        var serverSocket = new Socket(); 
        serverSocket.bind(new Host(this.hostname), this.port);
        serverSocket.listen(5);

        trace("Server started");

        while (true) {
            var clientSocket = serverSocket.accept();
            trace("Client connected from: " + clientSocket.peer());
            Thread.create(() -> handleConnection(clientSocket));
        }
    }

    private function handleConnection(clientSocket:Socket) {
        try {
            var input = clientSocket.input;
            var output = clientSocket.output;

            while (true) {

                var requestLine = input.readLine();
                if (requestLine == null) {
                    break;
                }

                var request = new HttpRequest();
                var response = new HttpResponse();

                var parts = requestLine.split(" ");
                request.method = parts[0];
                request.path = parts[1];

                // read headers
                while (true) {
                    
                    // read line
                    var line = input.readLine();

                    // end of headers
                    if (line == "") {
                        break;
                    }

                    // parse header and add to map
                    var parts = line.split(": ");
                    request.headers.set(parts[0], parts[1]);

                }

                // read body
                if (request.headers.exists("Content-Length")) {
                    var contentLength = Std.parseInt(request.headers.get("Content-Length"));
                    request.body = input.read(contentLength);
                }

                // handle request
                handler.handle(request, response);

                // write response
                output.writeString("HTTP/1.1 200 OK\n");
                output.writeString("Content-Type: text/plain\n");
                output.writeString("Connection: keep-alive\n");
                output.writeString("Content-Length: " + response.body.length + "\n");
                output.writeString("\n");
                output.write(response.body);

            }

        } catch (e:Dynamic) {
            trace("Client error: " + e); 
        }

        clientSocket.close();
        trace("Client disconnected");
    }
}

interface HttpRequestHandler {
    function handle(request:HttpRequest, response:HttpResponse):Void;
}

class HttpRequest {
    public var method:String;
    public var path:String;
    public var headers:Map<String, String>;
    public var body:Bytes;

    public function new() {
        this.headers = new Map<String, String>();
    }
}

class HttpResponse {
    public var status:StatusCode;
    public var headers:Map<String, String>;
    public var body:Bytes;

    public function new() {
        this.headers = new Map<String, String>();
    }
}

class Header {
    public var name:String;
    public var value:String;

    public function new(name:String, value:String) {
        this.name = name;
        this.value = value;
    }

    public function toString():String {
        return name + ": " + value;
    }
}