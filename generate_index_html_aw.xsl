<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="deliverable_name" required="yes"/>
    <xsl:param name="filename_guid_prefix" required="yes"/>
    <xsl:param name="load_meta_file" select="document('metadata_resource.xml')"/>

    <!-- Output type definition -->
    <xsl:strip-space elements="*"/>
    <xsl:output method="xhtml" omit-xml-declaration="yes" indent="yes"/>

    <xsl:template match="CatapultToc">
        <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>]]></xsl:text>
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="type" content="concept"/>
                <meta name="title" content="Index"/>
                <meta name="abstract"
                    content="{$load_meta_file//deliverable[@name=$deliverable_name]/publication_name}"/>
                <meta name="subject"
                    content="{$load_meta_file//deliverable[@name=$deliverable_name]/publication_name}"/>
                <meta name="description"
                    content="{$load_meta_file//deliverable[@name=$deliverable_name]/publication_name}"/>
                <meta name="keywords"
                    content="{$load_meta_file//deliverable[@name=$deliverable_name]/publication_name}"/>
                <meta name="guid">
                    <xsl:attribute name="content">
                        <xsl:value-of select="concat($filename_guid_prefix, '-', 'INDEX')"/>
                    </xsl:attribute>
                </meta>
                <meta name="format" content="HTML5"/>
                <meta name="language" content="en"/>
                <meta name="author" content="ix-vmware"/>
                <meta name="last modified">
                    <xsl:attribute name="content">
                        <xsl:value-of
                            select="format-dateTime(current-dateTime(), '[D01]/[M01]/[Y0001] [H01]:[m01]:[s01]')"
                        />
                    </xsl:attribute>
                </meta>
                <meta name="product">
                    <xsl:attribute name="content">
                        <xsl:value-of
                            select="concat($load_meta_file//deliverable[@name = $deliverable_name]/product_name, $load_meta_file//deliverable[@name = $deliverable_name]/product_version)"
                        />
                    </xsl:attribute>
                </meta>
                <link rel="stylesheet" type="text/css" href="commonltr.css"/>
                <title>Index</title>
            </head>

            <body>
                <nav>
                    <h1 class="title topictitle1">
                        <xsl:value-of
                            select="$load_meta_file//deliverable[@name = $deliverable_name]/publication_name"
                        />
                    </h1>
                    <p>
                        <xsl:value-of
                            select="format-dateTime(current-dateTime(), '[D01]/[M01]/[Y0001] [H01]:[m01]:[s01]')"
                        />
                    </p>
                    
                    <xsl:apply-templates/>
                    
                </nav>
            </body>
        </html>
    </xsl:template>
    
       
    
    <xsl:template name="li_component" match="*/TocEntry">
        <!-- Variable to extract topic title from flare toc -->
        <xsl:variable name="variable_topictitle">
            <!--<xsl:value-of select="@Title"/>-->
            <xsl:choose>
                <xsl:when
                    test="@Title = '[%=System.LinkedHeader%]' or @Title = '[%=System.LinkedTitle%]'">
                    <xsl:value-of select="@NewTitle"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@Title"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <!-- Variable to extract only the filename and concat with html extension -->
        <xsl:variable name="variable_href">
            <xsl:variable name="full_path" select="@Link"/>
            <xsl:variable name="full_filename"
                select="tokenize($full_path, '/')[last()]"/>
            <xsl:variable name="filename"
                select="substring-before($full_filename, '.')"/>
            <xsl:value-of
                select="concat($filename_guid_prefix, '-', $filename, '.html')"
            />
        </xsl:variable>
        
        
        <li class="topicref">
            <a href="{$variable_href}">
                <xsl:value-of select="$variable_topictitle"/>
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>
