-- Save a GitHub access token as a secret
CREATE OR REPLACE SECRET ML_DEMO_GIT_TOKEN
  TYPE = GENERIC_STRING
  SECRET_STRING = '<YOUR_PAT_HERE>';

-- Create External Access Integration to allow network access to GitHub
CREATE OR REPLACE NETWORK RULE GITHUB_NETWORK_RULE
  MODE = EGRESS
  TYPE = HOST_PORT
  VALUE_LIST = ('github.com:443');

CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION GITHUB_EAI
  ALLOWED_NETWORK_RULES = (GITHUB_NETWORK_RULE)
  ENABLED = true;
GRANT USAGE ON INTEGRATION GITHUB_EAI TO ROLE <ROLE_NAME>;