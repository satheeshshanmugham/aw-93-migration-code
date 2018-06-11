<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:MadCap="http://www.madcapsoftware.com/Schemas/MadCap.xsd"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:strip-space elements="*"/>    
    <!--<xsl:output method="xhtml" indent="yes"></xsl:output>-->    
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
        
    <xsl:template name="updateConref" match="MadCap:snippetBlock | MadCap:snippetText">
        <!--<xsl:param name="load_file" select="document(concat('../Content/Resources', substring-after(@src, 'Resources')))"></xsl:param>-->
        <!--<xsl:param name="load_file" select="document(concat('./Content/Resources/Snippets-temp/', tokenize(@src, '/')[last()]))"></xsl:param>-->
        <!--<xsl:param name="load_file" select="collection(concat('./Content/Resources/Snippets?select=', tokenize(@src, '/')[last()]))"></xsl:param>-->
        <!--<xsl:param name="load_file" select="document(concat('./Content/Resources/Snippets/', substring-after(@src, '..')))"></xsl:param>-->
        
        <xsl:param name="load_file" select="document(@src)"></xsl:param>
        <xsl:apply-templates select="$load_file//html/body/*"/>       
        
    </xsl:template>
    
   
    
</xsl:stylesheet>