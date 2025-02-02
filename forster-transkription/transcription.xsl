<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <!-- Grundstruktur des HTML-Dokuments -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Georg Forster Transkription</title>
        <style>
          body { font-family: 'Roboto', sans-serif; background-color: #f9f9f9; color: #333; padding: 20px; }
          h1 { color: #444; }
          .transcription { background: #fff; padding: 20px; margin-top: 20px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); }
          p { margin: 10px 0; line-height: 1.6; }
          .heading { font-weight: bold; color: darkred; }
          .quote { font-style: italic; color: gray; }
        </style>
      </head>
      <body>
        <h1>Georg Forster Transkription</h1>
        <div class="transcription">
          <!-- Iteration durch TextRegionen -->
          <xsl:for-each select="//TextRegion">
            <!-- Anzeige des Inhalts der Region -->
            <xsl:choose>
              <xsl:when test="@structure='heading'">
                <p class="heading">
                  <xsl:value-of select=".//TextEquiv/Unicode" />
                </p>
              </xsl:when>
              <xsl:when test="contains(@custom, 'quote')">
                <p class="quote">
                  <xsl:value-of select=".//TextEquiv/Unicode" />
                </p>
              </xsl:when>
              <xsl:otherwise>
                <p>
                  <xsl:value-of select=".//TextEquiv/Unicode" />
                </p>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
