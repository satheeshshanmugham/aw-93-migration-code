<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:MadCap="http://www.madcapsoftware.com/Schemas/MadCap.xsd"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:output method="xml" indent="yes"></xsl:output>    
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template name="updateConref" match="MadCap:snippetBlock | MadCap:snippetText">      
        <xsl:param name="load_file" select="document(concat('./Content/Resources/Snippets', @src))"></xsl:param>
        <xsl:copy>
            <xsl:apply-templates select="$load_file//html/body/*"/>
        </xsl:copy>
    </xsl:template> 
    
    
</xsl:stylesheet>