#!/usr/bin/env bash
set -euo pipefail

cd /opt/nexo-crm

printf 'Digite somente a nova senha do banco Supabase: '
IFS= read -r -s DB_PASSWORD
printf '\n'

if [ -z "$DB_PASSWORD" ]; then
  echo 'Senha vazia. Nada foi alterado.'
  exit 1
fi

ENCODED_PASSWORD="$(DB_PASSWORD="$DB_PASSWORD" python3 - <<'PY'
import os
from urllib.parse import quote
print(quote(os.environ["DB_PASSWORD"], safe=""))
PY
)"

DB_URL="postgresql://postgres.vnamugekrpwdokysunaz:${ENCODED_PASSWORD}@aws-1-us-west-2.pooler.supabase.com:5432/postgres"
PARTIAL=".env.partial"
TMP="$(mktemp)"

if [ -f "$PARTIAL" ]; then
  grep -v '^SUPABASE_DB_URL=' "$PARTIAL" > "$TMP" || true
fi
printf "SUPABASE_DB_URL='%s'\n" "$DB_URL" >> "$TMP"
chmod 600 "$TMP"
mv "$TMP" "$PARTIAL"
unset DB_PASSWORD ENCODED_PASSWORD DB_URL

echo 'Conexão do banco salva com segurança. Reiniciando o instalador...'
exec bash hostgator-setup-kit/install.sh
