<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple">
                    <fo:region-body margin="1in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simple">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="24pt" font-weight="bold" text-align="center" margin-bottom="20pt">Energy Statistics</fo:block>
                    <fo:table table-layout="auto" width="100%" border-color="black" border-style="solid" border-width="0.5pt">
                        <fo:table-column column-width="20%"/>
                        <fo:table-column column-width="40%"/>
                        <fo:table-column column-width="40%"/>
                        <fo:table-header>
                            <fo:table-row background-color="silver">
                                <fo:table-cell>
                                    <fo:block font-weight="bold">Plant Name</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-weight="bold">Postal Code</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-weight="bold">Price</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <xsl:apply-templates select="//plant"/>
                        </fo:table-body>
                    </fo:table>
                    <xsl:apply-templates
                            select="document('../database/database.xml')/energie-data/energie-plant/plant"
                    >

                    </xsl:apply-templates>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
    <xsl:template match="plant">
        <xsl:for-each select="offer">
            <fo:table-row>
                <fo:table-cell border="solid 1px black">
                    <fo:block>
                       <xsl:value-of select="../name"/>
                    </fo:block>
                    <fo:block>
                       <xsl:value-of select="../offer"/>
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid 1px black">
                    <fo:block>
                        <xsl:value-of select="postalcode"/>
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid 1px black">
                    <fo:block>
                        <xsl:value-of select="price"/>
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell border="solid 1px black">
                    <fo:block>
                        <xsl:value-of select="currency"/>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
