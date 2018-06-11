<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:MadCap="http://www.madcapsoftware.com/Schemas/MadCap.xsd"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:strip-space elements="*"/>    
    <xsl:output method="xhtml" indent="yes"></xsl:output>    
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
        
    <xsl:template match="MadCap:snippetBlock">
        <xsl:copy-of select="./node()|@*"></xsl:copy-of>
    </xsl:template>
    
    <xsl:template match="MadCap:snippetText">
        <xsl:copy-of select="./node()|@*"></xsl:copy-of>
    </xsl:template>   
   
    
</xsl:stylesheet>