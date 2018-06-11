<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
 
    <!-- Setting DOCTYPE and other required XML declarations -->
    <xsl:output method="text" indent="yes"/>   
   
    
    <xsl:template match="CatapultToc">
        <xsl:for-each select="//TocEntry">
            
            <xsl:variable name="full_path" select="@Link"/>
                
            
            <xsl:variable name="filename_only">
                <xsl:variable name="full_path" select="@link"/>
                <xsl:variable name="full_filename" select="tokenize($full_path,'/')[last()]"/>
                
                <xsl:variable name="filename" select="substring-before($full_filename,'.')"/>
                <xsl:value-of select="$filename"/>
                <!--<xsl:value-of select="concat($filename_guid_prefix, '-', $filename, '.html')"/>  -->                  
            </xsl:variable>
            
            <xsl:variable name="occurence" select="TocEntry[contains(@Link, 'Introduction')]"/>
            <xsl:variable name="counter" select="count($occurence)"/>
            
           <xsl:if test="number($counter) > number(1)">
               <xsl:value-of select="concat($filename_only, '-------->', $counter)"/>
               <xsl:text>&#013;&#010;</xsl:text>   
           </xsl:if>
                               
        </xsl:for-each>
    </xsl:template>    
        
</xsl:stylesheet>