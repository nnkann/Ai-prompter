-- Prompt-Hermes-Engine core schema
-- CPS-shaped Supabase schema for source ingestion, prompt assets, ontology clusters,
-- team requests, and feedback. Secrets are not stored here.

CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS vector;

-- Keep embedding dimension explicit. Default MVP assumes OpenAI text-embedding-3-small
-- compatible 1536-d vectors. If the embedding provider changes, create a follow-up
-- migration rather than silently mixing vector dimensions.

CREATE TABLE IF NOT EXISTS sources (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  source_fingerprint TEXT UNIQUE NOT NULL,
  source_platform TEXT NOT NULL CHECK (source_platform IN ('x','youtube','linkedin','discord','web','image','unknown')),
  ingest_mode TEXT NOT NULL CHECK (ingest_mode IN ('manual_discord','artist_watch_cron','channel_ingest_cron','daily_prompt_trend_cron','scheduled_request')),
  origin_url TEXT,
  canonical_url TEXT,
  title TEXT,
  source_text TEXT,
  author_name TEXT,
  author_handle TEXT,
  published_at TIMESTAMPTZ,
  discovered_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  submitted_by TEXT,
  source_payload JSONB NOT NULL DEFAULT '{}'::jsonb,
  c TEXT,
  problem TEXT[] NOT NULL DEFAULT '{}',
  s TEXT[] NOT NULL DEFAULT '{}',
  evidence JSONB NOT NULL DEFAULT '{}'::jsonb,
  sighting_count INTEGER NOT NULL DEFAULT 1 CHECK (sighting_count >= 1),
  last_seen_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  confidence TEXT NOT NULL DEFAULT 'medium' CHECK (confidence IN ('high','medium','low')),
  needs_review BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS sources_platform_discovered_idx ON sources (source_platform, discovered_at DESC);
CREATE INDEX IF NOT EXISTS sources_ingest_mode_discovered_idx ON sources (ingest_mode, discovered_at DESC);
CREATE INDEX IF NOT EXISTS sources_needs_review_idx ON sources (needs_review, discovered_at DESC);
CREATE INDEX IF NOT EXISTS sources_problem_gin_idx ON sources USING GIN (problem);
CREATE INDEX IF NOT EXISTS sources_s_gin_idx ON sources USING GIN (s);
CREATE INDEX IF NOT EXISTS sources_payload_gin_idx ON sources USING GIN (source_payload);

CREATE TABLE IF NOT EXISTS assets (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  source_id UUID REFERENCES sources(id) ON DELETE SET NULL,
  asset_type TEXT NOT NULL CHECK (asset_type IN ('image','screenshot','video','sample_prompt','document','link')),
  asset_fingerprint TEXT,
  drive_file_id TEXT,
  drive_view_url TEXT,
  mime_type TEXT,
  caption TEXT,
  metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(asset_fingerprint)
);

CREATE INDEX IF NOT EXISTS assets_source_id_idx ON assets (source_id);
CREATE INDEX IF NOT EXISTS assets_type_created_idx ON assets (asset_type, created_at DESC);
CREATE INDEX IF NOT EXISTS assets_metadata_gin_idx ON assets USING GIN (metadata);

CREATE TABLE IF NOT EXISTS prompt_assets (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  source_id UUID REFERENCES sources(id) ON DELETE SET NULL,
  prompt_title TEXT NOT NULL,
  core_prompt TEXT NOT NULL,
  production_specs JSONB NOT NULL DEFAULT '{}'::jsonb,
  source_summary TEXT,
  tags TEXT[] NOT NULL DEFAULT '{}',
  trend_keywords TEXT[] NOT NULL DEFAULT '{}',
  c TEXT,
  problem TEXT[] NOT NULL DEFAULT '{}',
  s TEXT[] NOT NULL DEFAULT '{}',
  acceptance_criteria JSONB NOT NULL DEFAULT '{}'::jsonb,
  evidence JSONB NOT NULL DEFAULT '{}'::jsonb,
  confidence TEXT NOT NULL DEFAULT 'medium' CHECK (confidence IN ('high','medium','low')),
  needs_review BOOLEAN NOT NULL DEFAULT FALSE,
  embedding_text TEXT NOT NULL,
  embedding vector(1536),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS prompt_assets_source_id_idx ON prompt_assets (source_id);
CREATE INDEX IF NOT EXISTS prompt_assets_created_idx ON prompt_assets (created_at DESC);
CREATE INDEX IF NOT EXISTS prompt_assets_tags_gin_idx ON prompt_assets USING GIN (tags);
CREATE INDEX IF NOT EXISTS prompt_assets_trend_keywords_gin_idx ON prompt_assets USING GIN (trend_keywords);
CREATE INDEX IF NOT EXISTS prompt_assets_problem_gin_idx ON prompt_assets USING GIN (problem);
CREATE INDEX IF NOT EXISTS prompt_assets_s_gin_idx ON prompt_assets USING GIN (s);
CREATE INDEX IF NOT EXISTS prompt_assets_embedding_idx ON prompt_assets USING ivfflat (embedding vector_cosine_ops) WITH (lists = 100);

CREATE TABLE IF NOT EXISTS cps_clusters (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  cluster_type TEXT NOT NULL CHECK (cluster_type IN ('artist','style','platform','use_case','model','trend','prompt_pattern','result_type')),
  name TEXT NOT NULL,
  description TEXT,
  c TEXT,
  problem TEXT[] NOT NULL DEFAULT '{}',
  s TEXT[] NOT NULL DEFAULT '{}',
  keywords TEXT[] NOT NULL DEFAULT '{}',
  embedding vector(1536),
  metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(cluster_type, name)
);

CREATE INDEX IF NOT EXISTS cps_clusters_type_name_idx ON cps_clusters (cluster_type, name);
CREATE INDEX IF NOT EXISTS cps_clusters_keywords_gin_idx ON cps_clusters USING GIN (keywords);
CREATE INDEX IF NOT EXISTS cps_clusters_problem_gin_idx ON cps_clusters USING GIN (problem);
CREATE INDEX IF NOT EXISTS cps_clusters_s_gin_idx ON cps_clusters USING GIN (s);
CREATE INDEX IF NOT EXISTS cps_clusters_embedding_idx ON cps_clusters USING ivfflat (embedding vector_cosine_ops) WITH (lists = 100);

CREATE TABLE IF NOT EXISTS asset_cluster_links (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  prompt_asset_id UUID REFERENCES prompt_assets(id) ON DELETE CASCADE,
  source_id UUID REFERENCES sources(id) ON DELETE CASCADE,
  cluster_id UUID NOT NULL REFERENCES cps_clusters(id) ON DELETE CASCADE,
  link_reason TEXT,
  score NUMERIC,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CHECK (prompt_asset_id IS NOT NULL OR source_id IS NOT NULL),
  UNIQUE(prompt_asset_id, source_id, cluster_id)
);

CREATE INDEX IF NOT EXISTS asset_cluster_links_prompt_asset_idx ON asset_cluster_links (prompt_asset_id);
CREATE INDEX IF NOT EXISTS asset_cluster_links_source_idx ON asset_cluster_links (source_id);
CREATE INDEX IF NOT EXISTS asset_cluster_links_cluster_idx ON asset_cluster_links (cluster_id);

CREATE TABLE IF NOT EXISTS team_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  request_source TEXT NOT NULL CHECK (request_source IN ('discord','slack_later','scheduled')),
  requester_display_name TEXT,
  request_text TEXT NOT NULL,
  input_links TEXT[] NOT NULL DEFAULT '{}',
  input_attachments JSONB NOT NULL DEFAULT '[]'::jsonb,
  retrieval_filters JSONB NOT NULL DEFAULT '{}'::jsonb,
  c TEXT,
  problem TEXT[] NOT NULL DEFAULT '{}',
  s TEXT[] NOT NULL DEFAULT '{}',
  generated_prompt_id UUID REFERENCES prompt_assets(id) ON DELETE SET NULL,
  response_summary TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS team_requests_created_idx ON team_requests (created_at DESC);
CREATE INDEX IF NOT EXISTS team_requests_problem_gin_idx ON team_requests USING GIN (problem);
CREATE INDEX IF NOT EXISTS team_requests_s_gin_idx ON team_requests USING GIN (s);

CREATE TABLE IF NOT EXISTS feedback_signals (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  prompt_asset_id UUID REFERENCES prompt_assets(id) ON DELETE CASCADE,
  request_id UUID REFERENCES team_requests(id) ON DELETE SET NULL,
  signal_type TEXT NOT NULL CHECK (signal_type IN ('copy','use','rating','revision','reject','favorite')),
  value JSONB NOT NULL DEFAULT '{}'::jsonb,
  actor_display_name TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS feedback_prompt_asset_idx ON feedback_signals (prompt_asset_id);
CREATE INDEX IF NOT EXISTS feedback_request_idx ON feedback_signals (request_id);
CREATE INDEX IF NOT EXISTS feedback_signal_created_idx ON feedback_signals (signal_type, created_at DESC);

CREATE TABLE IF NOT EXISTS cron_runs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  job_name TEXT NOT NULL,
  run_source TEXT NOT NULL CHECK (run_source IN ('hermes_cron','manual_discord','manual_cli','webhook')),
  status TEXT NOT NULL CHECK (status IN ('started','ok','partial','failed','skipped')),
  started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  finished_at TIMESTAMPTZ,
  input_summary JSONB NOT NULL DEFAULT '{}'::jsonb,
  result_summary JSONB NOT NULL DEFAULT '{}'::jsonb,
  error_message TEXT
);

CREATE INDEX IF NOT EXISTS cron_runs_job_started_idx ON cron_runs (job_name, started_at DESC);
CREATE INDEX IF NOT EXISTS cron_runs_status_started_idx ON cron_runs (status, started_at DESC);

-- Retrieval helper: vector search plus freshness/CPS filtering should be implemented
-- in the application/query layer first. SQL functions can be added after scoring is measured.
