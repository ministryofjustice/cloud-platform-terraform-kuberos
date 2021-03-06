# Default values for kuberos.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: "${replicaCount}"

ingress:
  host: "${hostname}"
  tls:
    - host:
      - "${hostname}"

# These values will be supplied by the OIDC provider.
oidc:
  issuerUrl: "${issuer_url}"
  clientId: "${client_id}"
  clientSecret: "${client_secret}"

# Cluster specific values, replace `address` with the external URL to the
# kubernetes API. If you leave `ca` empty, kuberos will use the current
# cluster's CA certificate. Alternativly, you can specify one by passing the
# base64-encoded apiserver CA certificate.
cluster:
  name: "${cluster_name}"
  address: "${cluster_address}"