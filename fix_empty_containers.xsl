<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:strip-space elements="*"/>
    <xsl:output method="xhtml" indent="yes"></xsl:output>
    
    <xsl:variable name="variable_guid">
        <xsl:variable name="full_path" select="document-uri()"/>
        <xsl:variable name="full_filename" select="tokenize($full_path, '/')[last()]"/>
        <xsl:variable name="filename" select="substring-before($full_filename, '.')"/>
        <xsl:value-of select="$filename"/>
    </xsl:variable>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="CatapultToc/TocEntry[@Title='Generic Cover']"></xsl:template>
    <xsl:template match="CatapultToc/TocEntry[@Title='Table of Contents']"></xsl:template>    
    
    
    <xsl:template match="CatapultToc/TocEntry[TocEntry]/@Link">
        <xsl:attribute name="OriginalLink">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
   
    <xsl:template match="CatapultToc/TocEntry[TocEntry]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="Link">
                <xsl:value-of select="TocEntry[1]/@Link"/>
            </xsl:attribute> 
            <xsl:apply-templates select="node()"/>
        </xsl:copy>        
    </xsl:template>
    
</xsl:stylesheet>