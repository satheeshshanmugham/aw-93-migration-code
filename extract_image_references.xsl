<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:strip-space elements="*"/>
    <xsl:output method="text" indent="yes"/>
   
    <xsl:template match="/">
        
        <xsl:for-each select="//@src">
            <xsl:variable name="actual_path">
                <xsl:variable name="full_path" select="."/>
                <xsl:variable name="cleaned_path" select="substring-after($full_path, '/Images/')"/>
                <xsl:value-of select="concat('/Content/Resources/Images/', $cleaned_path)" />
            </xsl:variable>
                       
            
            <xsl:choose>
                <xsl:when test="contains($actual_path, '.png') or contains($actual_path, '.PNG')">
                    <xsl:value-of select="$actual_path"/>
                    <xsl:text>&#013;&#010;</xsl:text>   
                </xsl:when>
            </xsl:choose>
            
                            
        </xsl:for-each>
    </xsl:template>     
        
</xsl:stylesheet>