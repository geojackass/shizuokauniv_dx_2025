-- init_postgis_pgr.sql

-- データベース作成済みなら不要
-- CREATE DATABASE gisdb;

-- PostGIS 拡張
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;

-- pgRouting 拡張
CREATE EXTENSION IF NOT EXISTS pgrouting;
