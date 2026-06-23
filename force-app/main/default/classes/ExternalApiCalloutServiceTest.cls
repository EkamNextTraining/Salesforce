@IsTest
private class ExternalApiCalloutServiceTest {

    
    private class SimpleMock implements HttpCalloutMock {
        private Integer statusCode;
        private String  body;
        private String  method;

        public SimpleMock(Integer statusCode, String body, String method) {
            this.statusCode = statusCode;
            this.body       = body;
            this.method     = method;
        }

        public HttpResponse respond(HttpRequest req) {
            System.assertEquals(method, req.getMethod(), 'Wrong HTTP method');
            HttpResponse res = new HttpResponse();
            res.setStatusCode(statusCode);
            res.setBody(body);
            return res;
        }
    }

    
    @IsTest
    static void testGetPost() {
        Test.setMock(HttpCalloutMock.class, new SimpleMock(200, '{"id":1,"title":"Test"}', 'GET'));

        Test.startTest();
        HttpResponse res = ExternalApiCalloutService.getPost(1);
        Test.stopTest();

        System.assertEquals(200, res.getStatusCode());
        System.assert(res.getBody().contains('Test'));
    }

    @IsTest
    static void testGetAllPosts() {
        Test.setMock(HttpCalloutMock.class, new SimpleMock(200, '[{"id":1},{"id":2}]', 'GET'));

        Test.startTest();
        HttpResponse res = ExternalApiCalloutService.getAllPosts();
        Test.stopTest();

        System.assertEquals(200, res.getStatusCode());
    }

    
    @IsTest
    static void testCreatePost() {
        Test.setMock(HttpCalloutMock.class, new SimpleMock(201, '{"id":101,"title":"My Title"}', 'POST'));

        Test.startTest();
        HttpResponse res = ExternalApiCalloutService.createPost('My Title', 'My body', 1);
        Test.stopTest();

        System.assertEquals(201, res.getStatusCode());
        System.assert(res.getBody().contains('101'));
    }

    
    @IsTest
    static void testUpdatePost() {
        Test.setMock(HttpCalloutMock.class, new SimpleMock(200, '{"id":1,"title":"Updated"}', 'PUT'));

        Test.startTest();
        HttpResponse res = ExternalApiCalloutService.updatePost(1, 'Updated', 'New body', 1);
        Test.stopTest();

        System.assertEquals(200, res.getStatusCode());
        System.assert(res.getBody().contains('Updated'));
    }

    
    @IsTest
    static void testPatchPost() {
        Test.setMock(HttpCalloutMock.class, new SimpleMock(200, '{"id":1,"title":"Patched"}', 'PATCH'));

        Test.startTest();
        HttpResponse res = ExternalApiCalloutService.patchPost(1, 'Patched');
        Test.stopTest();

        System.assertEquals(200, res.getStatusCode());
        System.assert(res.getBody().contains('Patched'));
    }

    
    @IsTest
    static void testDeletePost() {
        Test.setMock(HttpCalloutMock.class, new SimpleMock(200, '{}', 'DELETE'));

        Test.startTest();
        HttpResponse res = ExternalApiCalloutService.deletePost(1);
        Test.stopTest();

        System.assertEquals(200, res.getStatusCode());
    }

    
    @IsTest
    static void testGetPost_notFound() {
        Test.setMock(HttpCalloutMock.class, new SimpleMock(404, '{}', 'GET'));

        Test.startTest();
        HttpResponse res = ExternalApiCalloutService.getPost(9999);
        Test.stopTest();

        System.assertEquals(404, res.getStatusCode());
    }
}