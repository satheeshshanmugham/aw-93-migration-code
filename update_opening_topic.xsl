<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="opening_topic" required="yes"/>    
    
    <xsl:strip-space elements="*"/>
    <xsl:output method="xhtml" indent="yes"></xsl:output>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="publication/topics/topic[guid = $opening_topic]"/>
    
    <xsl:template match="publication/topics">
        <xsl:copy>
            <topic><xsl:copy-of select="topic[guid = $opening_topic]/node()" /></topic>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>