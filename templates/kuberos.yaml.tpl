# Default values for kuberos.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.

replicaCount: "${replicaCount}"

image:
  tag: "${image_tag}"

ingress:
  annotations:
    external-dns.alpha.kubernetes.io/aws-weight: "100"
    external-dns.alpha.kubernetes.io/set-identifier: "dns-${clusterName}"
    cloud-platform.justice.gov.uk/ignore-external-dns-weight: "true"
  className: default
  host: "${hostname}"
  tls:
    - hosts:
      - "${hostname}"

# These values will be supplied by the OIDC provider.
oidc:
  issuerUrl: "${issuer_url}"
  clientId:
  clientSecret:

# Cluster specific values, replace `address` with the external URL to the
# kubernetes API. If you leave `ca` empty, kuberos will use the current
# cluster's CA certificate. Alternativly, you can specify one by passing the
# base64-encoded apiserver CA certificate.
cluster:
  name: "${cluster_name}"
  address: "${cluster_address}"