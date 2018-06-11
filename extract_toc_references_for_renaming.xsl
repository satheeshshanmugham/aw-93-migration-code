<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
 
    <!-- Setting DOCTYPE and other required XML declarations -->
    <xsl:output method="text" indent="yes"/>   
   
    
    <xsl:template match="/">
        <xsl:for-each select="//@Link">
            <xsl:variable name="path">
                <xsl:variable name="full_path" select="."/>
                <xsl:variable name="full_filename" select="tokenize($full_path,'/')[last()]"/>
                <xsl:variable name="filename" select="substring-before($full_filename,'.')"/>
                <xsl:variable name="only_path" select="substring-before($full_path,$full_filename)"/>
                <xsl:value-of select="concat($only_path, 'GUID-AW92-', $filename, '.html')"/>
            </xsl:variable>
            
           
            
            <xsl:value-of select="$path"/>
            <xsl:text>&#013;&#010;</xsl:text>                    
        </xsl:for-each>
    </xsl:template>    
        
</xsl:stylesheet>