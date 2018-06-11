<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="deliverable_name" required="yes"/>
    <xsl:param name="filename_guid_prefix" required="yes"/>
    <xsl:param name="load_meta_file" select="document('metadata_resource.xml')"/>
    
    <xsl:strip-space elements="*"/>
    <xsl:output method="xhtml" indent="yes"></xsl:output>
    
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="CatapultAliasFile">
        <xsl:text disable-output-escaping="yes">
<![CDATA[<?NLS type="org.html5.contexts"?>]]>
</xsl:text>
        <contexts>
            <xsl:apply-templates select="node()|@*"/> 
        </contexts>
    </xsl:template>
    
    <xsl:template match="Map">
        <xsl:param name="load_file" select="document(concat('.', @Link))"></xsl:param>
        <context>
            
            <xsl:attribute name="id"><xsl:value-of select="@Name"/></xsl:attribute>
            
            <xsl:attribute name="title"><xsl:value-of select="normalize-space($load_file//html/body/h2[1])"/></xsl:attribute>
            
            <xsl:element name="description">
                <!--<xsl:variable name="shortdesc" select="normalize-space($load_file//html/head/meta/@content)"/>-->
                <xsl:variable name="shortdesc" select="$load_file//html/head/meta/@content"/>
                <xsl:choose>
                    <xsl:when test="$shortdesc != ''">
<!--                        <xsl:value-of select="normalize-space($load_file//html/head/meta/@content)"/>-->
                        <xsl:value-of select="$load_file//html/head/meta/@content"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="normalize-space($load_file//html/body/h2[1])"/>
                    </xsl:otherwise>
                </xsl:choose>                
            </xsl:element>
            
            <xsl:element name="topic">
                <xsl:attribute name="label"><xsl:value-of select="normalize-space($load_file//html/body/h2[1])"/></xsl:attribute>
                <xsl:attribute name="href">
                    <xsl:variable name="variable_href">
                        <xsl:variable name="full_path" select="@Link"/>
                        <xsl:variable name="full_filename" select="tokenize($full_path, '/')[last()]"/>
                        <xsl:variable name="filename" select="substring-before($full_filename, '.')"/>
                        <xsl:variable name="href_actual" select="concat($filename_guid_prefix, '-', $filename, '.html')"/>
                        <xsl:variable name="href_replaced_space" select="replace($href_actual, ' ', '_')"/>
                        <xsl:variable name="href_replaced_space" select="replace($href_replaced_space, ' ', '_')"/>
                        <xsl:value-of select="$href_replaced_space"/>
                    </xsl:variable>
                    <xsl:value-of select="concat('/', $load_meta_file//deliverable[@name=$deliverable_name]/output_file_name_html, '/', $variable_href)"/>
                </xsl:attribute>
            </xsl:element>
            
        </context>
    </xsl:template>
    
    
</xsl:stylesheet>