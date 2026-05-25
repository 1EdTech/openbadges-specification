FROM us-central1-docker.pkg.dev/specautomation-458709/microsites/microsites-base:dev
ARG ASTRO_BASE_PATH=/open-badges/
ENV ASTRO_BASE_PATH=/open-badges/
ENV MICROSITE_CONTENT_ROOT=/app/content

# Remove bundled upstream example content (mdexamples, diagram-examples, etc.)
RUN rm -rf /app/content/docs

COPY --chown=astro:nodejs ob_v3p0/microsites /app/content/docs/standards/
COPY --chown=astro:nodejs .microsite /app/content/.microsite

# ACE Extension
COPY --chown=astro:nodejs extensions/aceExtension/v1p0/microsite /app/content/docs/standards/ob-ace

# Assessment Extension
COPY --chown=astro:nodejs extensions/assessmentExtension/v2p0/microsite /app/content/docs/standards/ob-assessment

# Issuer Accreditation Extension
COPY --chown=astro:nodejs extensions/issuerAccreditationExtension/v2p0/microsite /app/content/docs/standards/ob-accred
