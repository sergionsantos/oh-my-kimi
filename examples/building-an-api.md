# Example: Building a REST API with OMK

This example shows how to build a complete REST API using Oh My Kimi.

## Scenario

We want to build a REST API for a blog with:
- Posts (CRUD operations)
- Comments
- User authentication
- Pagination
- Search

## Step 1: Start with Deep Interview

First, let's clarify our requirements:

```bash
$deep-interview "I want to build a REST API for a blog with posts, comments, authentication, and search"
```

OMK will ask clarifying questions:
- What technology stack? (Node.js/Express)
- What database? (PostgreSQL)
- Authentication method? (JWT)
- Any specific requirements?

## Step 2: Create a Plan

```bash
$plan "Build REST API for blog with posts, comments, auth, search"
```

OMK generates a detailed plan:
```markdown
## Plan: Blog REST API

### Phase 1: Setup (Est: 30min)
1. Initialize project
2. Setup Express
3. Configure database
4. Setup testing

### Phase 2: Models (Est: 45min)
1. User model
2. Post model
3. Comment model
4. Relationships

### Phase 3: Authentication (Est: 1h)
1. Register endpoint
2. Login endpoint
3. JWT middleware
4. Password hashing

### Phase 4: CRUD Endpoints (Est: 1.5h)
1. POST /posts
2. GET /posts
3. GET /posts/:id
4. PUT /posts/:id
5. DELETE /posts/:id
6. Comment endpoints

### Phase 5: Advanced Features (Est: 1h)
1. Search functionality
2. Pagination
3. Sorting/filtering
4. Rate limiting

### Phase 6: Testing & Validation (Est: 1h)
1. Unit tests
2. Integration tests
3. API documentation
```

## Step 3: Execute with Autopilot

```bash
$autopilot "Build a REST API for a blog with posts, comments, JWT authentication, and search using Node.js, Express, and PostgreSQL"
```

Watch OMK work through phases:

### Phase 0: Expansion
```
OMK: Analyzing requirements...
     - Technology: Node.js + Express + PostgreSQL
     - Features: CRUD, Auth, Search, Pagination
     - Creating technical specification...
```

### Phase 1: Planning
```
OMK: Creating implementation plan...
     - Database schema designed
     - API endpoints planned
     - Security considerations addressed
```

### Phase 2: Execution
```
OMK: Implementing...
     [executor] Setting up project structure
     [executor] Creating database models
     [executor] Implementing authentication
     [executor] Building CRUD endpoints
```

### Phase 3: QA
```
OMK: Running QA cycles...
     Running tests...
     ✓ All tests passing
     Running linter...
     ✓ No lint errors
```

### Phase 4: Validation
```
OMK: Multi-perspective review...
     [security-reviewer] ✓ No vulnerabilities found
     [code-reviewer] ✓ Code quality acceptable
     [architect] ✓ Design sound
```

## Step 4: Review Results

After ~3-4 hours, you have:

```
blog-api/
├── src/
│   ├── config/
│   │   └── database.js
│   ├── controllers/
│   │   ├── auth.controller.js
│   │   ├── post.controller.js
│   │   └── comment.controller.js
│   ├── middleware/
│   │   ├── auth.middleware.js
│   │   └── error.middleware.js
│   ├── models/
│   │   ├── user.model.js
│   │   ├── post.model.js
│   │   └── comment.model.js
│   ├── routes/
│   │   ├── auth.routes.js
│   │   ├── post.routes.js
│   │   └── comment.routes.js
│   ├── services/
│   │   ├── auth.service.js
│   │   ├── post.service.js
│   │   └── search.service.js
│   └── app.js
├── tests/
│   ├── unit/
│   └── integration/
├── .env.example
├── package.json
└── README.md
```

## Alternative: Team Mode

For faster execution with parallel work:

```bash
$team 3 "build blog API - split: auth, posts, comments"
```

This spawns 3 agents working in parallel on different parts.

## Adding Features Later

### Add Search

```bash
$ralph "implement full-text search for posts using PostgreSQL tsvector"
```

### Add Rate Limiting

```bash
$executor "add rate limiting middleware to all API endpoints"
```

### Write Documentation

```bash
$writer "create API documentation with examples for all endpoints"
```

## Testing the API

```bash
# Run tests
npm test

# Start server
npm start

# Test endpoints
curl http://localhost:3000/api/posts
curl -X POST http://localhost:3000/api/posts \
  -H "Content-Type: application/json" \
  -d '{"title":"Hello","content":"World"}'
```

## Lessons Learned

1. **Deep interview first** saves time by clarifying requirements
2. **Planning phase** catches issues before coding
3. **Autopilot** handles the full workflow automatically
4. **Team mode** is faster for parallelizable work
5. **Ralph** ensures tasks complete even with obstacles

## Next Steps

- Deploy with `$release`
- Add monitoring with custom skill
- Create frontend with `$autopilot`
