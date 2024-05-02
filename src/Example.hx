package;

import haxe.io.Bytes;
import hyper.Http.StatusCode;
import hyper.HyperServer;

class Example {
    static function main() {
       
        var server = new HyperServer();
        server.setHostname("localhost");
        server.setPort(80);
        server.setHandler(new MyHandler());
        server.start();

    }
}

class MyHandler implements HttpRequestHandler {

    var counter = 0;

    public function new() {
    }

    public function handle(req:HttpRequest, res:HttpResponse) {
        res.status = StatusCode.OK;
        res.body = Bytes.ofString("Hello World! " + counter++);

    }
}