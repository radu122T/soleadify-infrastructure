SELECT 'CREATE DATABASE websites'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'websites')\gexec
