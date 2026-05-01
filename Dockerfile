FROM us-central1-docker.pkg.dev/specautomation-458709/microsites/microsites-base:dev
ARG ASTRO_BASE_PATH=/openbadges/
ENV ASTRO_BASE_PATH=/openbadges/

# This clears some test upstream content bundled in the base image, preserving content.config.ts
RUN if [ -f /app/src/content/content.config.ts ]; then \
      cp /app/src/content/content.config.ts /tmp/content.config.ts; \
    fi && \
    rm -rf /app/src/content && \
    mkdir -p /app/src/content/standards && \
    if [ -f /tmp/content.config.ts ]; then \
      cp /tmp/content.config.ts /app/src/content/content.config.ts; \
      rm /tmp/content.config.ts; \
    fi


COPY --chown=astro:nodejs ob_v3p0/microsites /app/src/content/standards/
COPY --chown=astro:nodejs .microsite /app/src/content/

# ACE Extension
COPY --chown=astro:nodejs extensions/aceExtension/v1p0/microsite /app/src/content/standards/ob-ace

# Assessment Extension
COPY --chown=astro:nodejs extensions/assessmentExtension/v2p0/microsite /app/src/content/standards/ob-assessment

# Issuer Accreditation Extension
COPY --chown=astro:nodejs extensions/issuerAccreditationExtension/v2p0/microsite /app/src/content/standards/ob-accred

# The base image handles everything:
# 1. Runtime processes the assets (transforms paths, copies assets)
# 2. Starts the Astro server
# No additional commands needed!