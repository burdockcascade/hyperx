package hyper;

class StatusCode {

    // 1xx
    public static var OK = new StatusCode(200, "OK");
    public static var CREATED = new StatusCode(201, "Created");
    public static var ACCEPTED = new StatusCode(202, "Accepted");
    public static var NON_AUTHORITATIVE_INFORMATION = new StatusCode(203, "Non-Authoritative Information");
    public static var NO_CONTENT = new StatusCode(204, "No Content");
    public static var RESET_CONTENT = new StatusCode(205, "Reset Content");
    public static var PARTIAL_CONTENT = new StatusCode(206, "Partial Content");
    public static var MULTI_STATUS = new StatusCode(207, "Multi-Status");
    public static var ALREADY_REPORTED = new StatusCode(208, "Already Reported");
    public static var IM_USED = new StatusCode(226, "IM Used");


    // 3xx 
    public static var MOVED_PERMANENTLY = new StatusCode(301, "Moved Permanently");
    public static var FOUND = new StatusCode(302, "Found");
    public static var SEE_OTHER = new StatusCode(303, "See Other");
    public static var NOT_MODIFIED = new StatusCode(304, "Not Modified");
    public static var USE_PROXY = new StatusCode(305, "Use Proxy");
    public static var SWITCH_PROXY = new StatusCode(306, "Switch Proxy");
    public static var TEMPORARY_REDIRECT = new StatusCode(307, "Temporary Redirect");
    public static var PERMANENT_REDIRECT = new StatusCode(308, "Permanent Redirect");

    // 4xx
    public static var BAD_REQUEST = new StatusCode(400, "Bad Request");
    public static var UNAUTHORIZED = new StatusCode(401, "Unauthorized");
    public static var PAYMENT_REQUIRED = new StatusCode(402, "Payment Required");
    public static var FORBIDDEN = new StatusCode(403, "Forbidden");
    public static var NOT_FOUND = new StatusCode(404, "Not Found");
    public static var METHOD_NOT_ALLOWED = new StatusCode(405, "Method Not Allowed");
    public static var NOT_ACCEPTABLE = new StatusCode(406, "Not Acceptable");
    public static var PROXY_AUTHENTICATION_REQUIRED = new StatusCode(407, "Proxy Authentication Required");
    public static var REQUEST_TIMEOUT = new StatusCode(408, "Request Timeout");
    public static var CONFLICT = new StatusCode(409, "Conflict");
    public static var GONE = new StatusCode(410, "Gone");
    public static var LENGTH_REQUIRED = new StatusCode(411, "Length Required");
    public static var PRECONDITION_FAILED = new StatusCode(412, "Precondition Failed");
    public static var PAYLOAD_TOO_LARGE = new StatusCode(413, "Payload Too Large");
    public static var URI_TOO_LONG = new StatusCode(414, "URI Too Long");
    public static var UNSUPPORTED_MEDIA_TYPE = new StatusCode(415, "Unsupported Media Type");
    public static var RANGE_NOT_SATISFIABLE = new StatusCode(416, "Range Not Satisfiable");
    public static var EXPECTATION_FAILED = new StatusCode(417, "Expectation Failed");
    public static var IM_A_TEAPOT = new StatusCode(418, "I'm a teapot");
    public static var MISDIRECTED_REQUEST = new StatusCode(421, "Misdirected Request");
    public static var UNPROCESSABLE_ENTITY = new StatusCode(422, "Unprocessable Entity");
    public static var TOO_EARLY = new StatusCode(425, "Too Early");
    public static var UPGRADE_REQUIRED = new StatusCode(426, "Upgrade Required");

    // 5xx
    public static var INTERNAL_SERVER_ERROR = new StatusCode(500, "Internal Server Error");
    public static var NOT_IMPLEMENTED = new StatusCode(501, "Not Implemented");
    public static var BAD_GATEWAY = new StatusCode(502, "Bad Gateway");
    public static var SERVICE_UNAVAILABLE = new StatusCode(503, "Service Unavailable");
    public static var GATEWAY_TIMEOUT = new StatusCode(504, "Gateway Timeout");
    public static var HTTP_VERSION_NOT_SUPPORTED = new StatusCode(505, "HTTP Version Not Supported");
    public static var VARIANT_ALSO_NEGOTIATES = new StatusCode(506, "Variant Also Negotiates");
    public static var INSUFFICIENT_STORAGE = new StatusCode(507, "Insufficient Storage");
    public static var LOOP_DETECTED = new StatusCode(508, "Loop Detected");
    public static var NOT_EXTENDED = new StatusCode(510, "Not Extended");
    public static var NETWORK_AUTHENTICATION_REQUIRED = new StatusCode(511, "Network Authentication Required");

    var code: Int = 0;
    var message: String = "";

    function new(code: Int, message: String) {
        this.code = code;
        this.message = message;
    }

}