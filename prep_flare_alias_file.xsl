<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:strip-space elements="*"/>
    <xsl:output method="xhtml" indent="yes"></xsl:output>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="CatapultAliasFile/Map">
        <xsl:variable name="deliverable_name">
            <xsl:variable name="full_path" select="@Link"/>
            <xsl:variable name="deliverable_folder" select="tokenize($full_path,'/')"/>
            <xsl:value-of select="$deliverable_folder[4]"/>            
        </xsl:variable>
        
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
            <xsl:attribute name="flare_toc"><xsl:value-of select="$deliverable_name"/></xsl:attribute>
        </xsl:copy>
        
    </xsl:template>    
</xsl:stylesheet>