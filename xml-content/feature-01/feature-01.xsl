<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
>
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:template match="feature">
        <html>
            <head>
                <title>Energiewerke Mittelland Reloaded</title>
                <link rel="stylesheet" type="text/css" href="theme.css"/>
            </head>
            <body>

                <h1>Feature #03</h1>
                <small>
                    <a href="index.xml">Home</a>
                </small>
                <div class="content">

                    <div>
                        <p>
                            <i>Let's create a printable energie statistics:
                            </i>
                        </p>
                        <p>
                            <a href="fo.xml" target="_blank">create FO</a>
                        </p>
                        <p>
                            <a href="#" onclick="createPdf()">create PDF</a>
                        </p>
                        <a id="dummyLink"></a>
                    </div>

                </div>
                <script src="feature-03/fo-functions.js" type="text/javascript"></script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
