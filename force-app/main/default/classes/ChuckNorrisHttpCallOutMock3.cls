@isTest
global class ChuckNorrisHttpCallOutMock3 implements HttpCalloutMock{

    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        System.assertEquals('GET', request.getMethod());
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('["dev","food"]');
        response.setStatusCode(200);
        return response; 
    }
}