@isTest
global class ChuckNorrisHttpCallOutMock1 implements HttpCalloutMock{

    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        System.assertEquals('GET', request.getMethod());
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"categories":["dev"],"created_at":"2020-01-05 13:42:19.104863","icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png","id":"wb1kcp6itj-5pk9md1-tiq","updated_at":"2020-01-05 13:42:19.104863","url":"https://api.chucknorris.io/jokes/wb1kcp6itj-5pk9md1-tiq","value":"Chuck Norris invented the internet? just so he had a place to store his porn."}');
        response.setStatusCode(200);
        return response; 
    }
}