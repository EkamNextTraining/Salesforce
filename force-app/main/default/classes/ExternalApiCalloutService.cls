public with sharing class ExternalApiCalloutService {

    private static final String BASE_URL = 'callout:JSONPlaceholder';

    // ── GET ──────────────────────────────────────────────────────────────────
    // Returns a single post by Id
    // Usage: ExternalApiCalloutService.getPost(1);
    public static HttpResponse getPost(Integer postId) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts/' + postId);
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        return new Http().send(req);
    }

    // ── GET ALL ──────────────────────────────────────────────────────────────
    // Returns all posts
    // Usage: ExternalApiCalloutService.getAllPosts();
    public static HttpResponse getAllPosts() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts');
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        return new Http().send(req);
    }

    // ── POST ─────────────────────────────────────────────────────────────────
    // Creates a new post
    // Usage: ExternalApiCalloutService.createPost('My Title', 'My body', 1);
    public static HttpResponse createPost(String title, String body, Integer userId) {
        Map<String, Object> payload = new Map<String, Object>{
            'title'  => title,
            'body'   => body,
            'userId' => userId
        };

        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(payload));
        return new Http().send(req);
    }

    // ── PUT ──────────────────────────────────────────────────────────────────
    // Full update of an existing post
    // Usage: ExternalApiCalloutService.updatePost(1, 'New Title', 'New body', 1);
    public static HttpResponse updatePost(Integer postId, String title, String body, Integer userId) {
        Map<String, Object> payload = new Map<String, Object>{
            'id'     => postId,
            'title'  => title,
            'body'   => body,
            'userId' => userId
        };

        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts/' + postId);
        req.setMethod('PUT');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(payload));
        return new Http().send(req);
    }

    // ── PATCH ────────────────────────────────────────────────────────────────
    // Partial update - only send fields you want to change
    // Usage: ExternalApiCalloutService.patchPost(1, 'Updated Title Only');
    public static HttpResponse patchPost(Integer postId, String newTitle) {
        Map<String, Object> payload = new Map<String, Object>{
            'title' => newTitle
        };

        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts/' + postId);
        req.setMethod('PATCH');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(payload));
        return new Http().send(req);
    }

    // ── DELETE ───────────────────────────────────────────────────────────────
    // Deletes a post by Id
    // Usage: ExternalApiCalloutService.deletePost(1);
    public static HttpResponse deletePost(Integer postId) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts/' + postId);
        req.setMethod('DELETE');
        req.setHeader('Content-Type', 'application/json');
        return new Http().send(req);
    }
}