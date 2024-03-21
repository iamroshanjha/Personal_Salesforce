@isTest
global class SongLyricsHttpCallOutMock2 implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        System.assertEquals('GET', request.getMethod());
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"lyrics": ""}');
        response.setStatusCode(404);
        return response; 
    }
}