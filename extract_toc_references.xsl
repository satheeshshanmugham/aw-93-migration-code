<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
 
    <!-- Setting DOCTYPE and other required XML declarations -->
    <xsl:output method="text" indent="yes"/>   
   
    
    <xsl:template match="/">
        <xsl:for-each select="//@Link">
            <xsl:value-of select="."/>
            <xsl:text>&#013;&#010;</xsl:text>                    
        </xsl:for-each>
    </xsl:template>    
        
</xsl:stylesheet>