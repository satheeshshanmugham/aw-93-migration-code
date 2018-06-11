<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    
    <xsl:output method="xhtml" omit-xml-declaration="yes" indent="yes"/>

    <xsl:param name="deliverable_name" required="yes"/>
    <xsl:param name="filename_guid_prefix" required="yes"/>


    <xsl:variable name="variable_filename">
        <xsl:variable name="full_path" select="document-uri()"/>
        <xsl:variable name="full_filename" select="tokenize($full_path, '/')[last()]"/>
        <xsl:variable name="filename" select="substring-before($full_filename, '.')"/>
        <xsl:value-of select="concat($filename_guid_prefix, '-', $filename, '.html')"/>
    </xsl:variable>

    <xsl:template match="/">

        <context>

            <xsl:attribute name="topic">
                <xsl:value-of select="$variable_filename"/>
            </xsl:attribute>

            <title>
                <xsl:value-of select="html/body/h1[1] | html/body/h2[1]"/>
            </title>
            <description>
                <xsl:value-of select="html/body/p[1]"/>
            </description>
        </context>


    </xsl:template>

</xsl:stylesheet>
