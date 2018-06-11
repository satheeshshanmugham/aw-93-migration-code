<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    
    <xsl:output method="text" indent="yes"/>   
   
    <xsl:param name="filename_guid_prefix" required="yes"/>
    
    <xsl:template match="/">
        <xsl:for-each select="//@Link">
            
            <xsl:variable name="variable_href">
                <xsl:variable name="full_path" select="."/>
                <xsl:variable name="full_filename" select="tokenize($full_path,'/')[last()]"/>
                <xsl:variable name="filename" select="substring-before($full_filename,'.')"/>
                <xsl:value-of select="concat($filename_guid_prefix, '-', $filename, '.html')"/>               
            </xsl:variable>
            
            
            <xsl:value-of select="$variable_href"/>
            <xsl:text>&#013;&#010;</xsl:text>                    
        </xsl:for-each>
    </xsl:template>   
        
</xsl:stylesheet>