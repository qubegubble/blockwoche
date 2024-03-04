<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:template match="feature">
        <html>
            <head>
                <title>Energiewerke Mittelland Vergleiche</title>
                <link rel="stylesheet" type="text/css" href="theme.css"/>
            </head>
            <body>
                <h1>Feature #02</h1>
                <small>
                    <a href="index.xml">Home</a>
                </small>
                <div class="content">
                    <div>
                        <p>here would be a graph</p>

                        <xsl:apply-templates
                                select="document('../database/database.xml')/energie-data/energie-plant/plant"
                        >
                        </xsl:apply-templates>

                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="offer">
        <li>
            <xsl:value-of select="price"/>
        </li>
    </xsl:template>
    
</xsl:stylesheet>