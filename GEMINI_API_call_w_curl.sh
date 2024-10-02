# GEMINI API call with curl

PROJECT_ID=
LOCATION=
API_ENDPOINT=${LOCATION}-aiplatform.googleapis.com
MODEL_ID="gemini-1.0-pro"

PROMPT="Tell me a fact."

cat > request.json << 'EOF'
{
  "contents": [
    {
      "role": "user",
      "parts": { "text": "${PROMPT}" }
    },
  ],
}
EOF

curl -X POST \
     -H "Authorization: Bearer $(gcloud auth print-access-token)" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d @request.json \
     "https://${LOCATION}-aiplatform.googleapis.com/v1/projects/${PROJECT_ID}/locations/${LOCATION}/publishers/google/models/${MODEL_ID}:${GENERATE_RESPONSE_METHOD}"