<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:MadCap="http://www.madcapsoftware.com/Schemas/MadCap.xsd"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"></xsl:output>
    <!--<xsl:param name="load_meta_file" select="document('VMware_AirWatch_9.2.fltoc')"></xsl:param>-->
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!--<xsl:template match="//TocEntry/@Title"></xsl:template>-->
    <xsl:template match="//TocEntry/@BreakType"></xsl:template>
    <xsl:template match="//TocEntry/@PageType"></xsl:template>
    <xsl:template match="//TocEntry/@PageNumber"></xsl:template>
    <xsl:template match="//TocEntry/@SyncDocumentTitle"></xsl:template>
    
    <xsl:template match="//TocEntry">        
        <xsl:param name="load_file" select="document(concat('.', @Link))"></xsl:param>
       <xsl:copy>
           <xsl:apply-templates select="@*"/>
           <xsl:attribute name="NewTitle">                            
               <xsl:variable name="get_title" select="$load_file//html/body/*[1]"/>
               <xsl:value-of select="normalize-space($get_title)"/>                              
           </xsl:attribute>
           
           <xsl:apply-templates select="node()"/>
       </xsl:copy>        
    </xsl:template>
</xsl:stylesheet>