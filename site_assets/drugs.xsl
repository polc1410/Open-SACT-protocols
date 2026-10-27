<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <!-- Page wrapper -->
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <title>Drug examples</title>
        <link rel="stylesheet" href="../assets/site.css"/>
      </head>
      <body>
        <nav class="site-nav"><a href="../index.html">Open SACT Protocols</a></nav>
        <h1>Drug examples</h1>
        <xsl:apply-templates select="//drug"/>
      </body>
    </html>
  </xsl:template>

  <!-- One card per drug -->
  <xsl:template match="drug">
    <div class="card">
      <h2><xsl:value-of select="name"/></h2>
      <table>
        <tr>
          <th>Units of measure</th>
          <td>
            <xsl:for-each select="unitsOfMeasure/unit">
              <xsl:value-of select="."/>
              <xsl:if test="position() != last()">, </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
        <tr>
          <th>Routes</th>
          <td>
            <xsl:for-each select="routes/route">
              <xsl:value-of select="."/>
              <xsl:if test="position() != last()">, </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>

</xsl:stylesheet>
