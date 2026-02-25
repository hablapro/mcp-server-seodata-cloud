# mcp-server-seodata-cloud

DataForSEO MCP Server — TypeScript implementation providing 79+ SEO tools via Model Context Protocol.

## Repository

- **Fork**: https://github.com/hablapro/mcp-server-seodata-cloud
- **Upstream**: https://github.com/dataforseo/mcp-server-typescript (remote: `upstream`)

## Railway Deployment

- URL: `https://dataforseo-mcp-server-production-8d37.up.railway.app`
- Mode: SSE (`cli.js sse`) — supports both SSE and Streamable HTTP transports
- Health check: `GET /health`
- Project ID: `bf74aea5-319d-48f6-95c9-be7ea0980a3e`
- Service ID: `c3c9dda3-3cf4-47bc-8ac0-2570f2e5e701`

## MCP Client Config

The `dataforseo` MCP server is configured **globally** in `~/.claude.json` (not in project `.mcp.json`):

```json
{
  "dataforseo": {
    "type": "http",
    "url": "https://dataforseo-mcp-server-production-8d37.up.railway.app/mcp"
  }
}
```

## Key Facts

- 79+ tools across 9 modules (AI Optimization, SERP, Keywords Data, OnPage, DataForSEO Labs, Backlinks, Business Data, Domain Analytics, Content Analysis)
- Tools are deferred-loaded in Claude Code — no context window cost until searched via `ToolSearch`
- Credentials: `DATAFORSEO_USERNAME` / `DATAFORSEO_PASSWORD` env vars
- Optional API key auth: `MCP_API_KEY` env var + `X-API-Key` header
- Dockerfile uses `npm install` (not `npm ci`) — upstream has no package-lock
- `agents` package pinned at 0.0.101 (v0.5.1 incompatible)
- Full tool reference with search keywords: see `OPERATIONS.md`

## Build & Test

```bash
npm run build
npm run validate  # check tool name lengths (max 50 chars)
node build/main/main/cli.js sse  # test locally on :3000
```

Push to GitHub triggers Railway auto-deploy.

## Our Customizations (vs upstream)

- API key auth (`MCP_API_KEY` env var) on HTTP and SSE transports
- Health check endpoint (`/health`)
- Railway deployment config (Dockerfile, railway.json, railway.toml)
