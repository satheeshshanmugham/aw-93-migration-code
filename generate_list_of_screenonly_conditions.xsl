<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:MadCap="http://www.madcapsoftware.com/Schemas/MadCap.xsd"   
    exclude-result-prefixes="MadCap"    
    version="2.0">
    
    <xsl:strip-space elements="*"/>
    <xsl:output method="xhtml" omit-xml-declaration="yes"  indent="yes"></xsl:output>
    
    <xsl:variable name="variable_guid">
        <xsl:variable name="full_path" select="document-uri()"/>
        <!-- <xsl:variable name="full_filename" select="tokenize($full_path, '/')[last()]"/>
        <xsl:variable name="filename" select="substring-before($full_filename, '.')"/>-->
        <xsl:value-of select="$full_path"/>
    </xsl:variable>
   
    <xsl:template match="/">
        
        <!--<h4><font color="blue"><xsl:value-of select="$variable_guid"/></font></h4>-->
        <!--<ol>
            <xsl:for-each select="//p[@MadCap:conditions and MadCap:xref]">
                <li><xsl:value-of select="."/></li>
            </xsl:for-each>            
        </ol>     -->
        
        <xsl:if test="//MadCap:xref[parent::p[@MadCap:conditions]]">
            <h4><font color="blue"><xsl:value-of select="$variable_guid"/></font></h4>
        <ol>
            <xsl:for-each select="//MadCap:xref[parent::p[@MadCap:conditions]]">
                <li><xsl:value-of select="@href"/></li>
            </xsl:for-each>            
        </ol>         
        </xsl:if>
        
    </xsl:template>
</xsl:stylesheet>