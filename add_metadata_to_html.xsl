<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:MadCap="http://www.madcapsoftware.com/Schemas/MadCap.xsd" exclude-result-prefixes="MadCap">

    <xsl:param name="deliverable_name" required="yes"/>
    <xsl:param name="filename_guid_prefix" required="yes"/>
    <xsl:param name="load_meta_file" select="document('metadata_resource.xml')"></xsl:param>

    <xsl:strip-space elements="*"/>
    <xsl:output method="xhtml" indent="yes"/>


    <xsl:variable name="variable_topictitle">
        <!--<xsl:copy-of select="html/body/h1[1] | html/body/h2[1] | html/body/h3[1]"/>-->
        <!--<xsl:value-of select="html/body/h1[1] | html/body/h2[1]"/>-->
        <!--<xsl:value-of select="html/body/*[1]"/>-->       
        <xsl:value-of select="html/body/node()[starts-with(name(), 'h')][1]"/>
        
    </xsl:variable>

    <xsl:variable name="variable_shortdesc">
        <xsl:choose>
            <xsl:when test="html/body/p[1]=''">
                <xsl:copy-of select="html/body/p[2]"></xsl:copy-of>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="html/body/p[1]"></xsl:copy-of>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:variable>

    <xsl:variable name="variable_guid">
        <xsl:variable name="full_path" select="document-uri()"/>
        <xsl:variable name="full_filename" select="tokenize($full_path, '/')[last()]"/>
        <xsl:variable name="filename" select="substring-before($full_filename, '.')"/>
        <xsl:variable name="filename_actual" select="concat($filename_guid_prefix, '-', $filename)"/>
        <xsl:variable name="href_replaced_space" select="replace($filename_actual, ' ', '_')"/>
        <xsl:variable name="href_replaced_space" select="replace($href_replaced_space, ' ', '_')"/>
        <xsl:variable name="href_replaced_space" select="replace($href_replaced_space, '%20', '_')"/>
        <xsl:variable name="href_replaced_space" select="replace($href_replaced_space, '%C2%A0', '_')"/>
        <xsl:value-of select="$href_replaced_space"/>
    </xsl:variable>
    
    <!-- Custom AirWatch Metadata Information -->
    
    <!--<xsl:variable name="categoryGroup_value">
        <xsl:value-of select="html/meta[@name='categoryGroup']/@content"/>
    </xsl:variable>
    
    <xsl:variable name="categoryName_value">
        <xsl:value-of select="html/meta[@name='categoryName']/@content"/>
    </xsl:variable>
    
    <xsl:variable name="acl_value">
        <xsl:value-of select="html/meta[@name='acl']/@content"/>
    </xsl:variable>
    
    <xsl:variable name="versionMin_value">
        <xsl:value-of select="html/meta[@name='versionMin']/@content"/>
    </xsl:variable>
    
    <xsl:variable name="versionMax_value">
        <xsl:value-of select="html/meta[@name='versionMax']/@content"/>
    </xsl:variable>
    
    <xsl:variable name="productName_value">
        <xsl:value-of select="html/meta[@name='productName']/@content"/>
    </xsl:variable>-->
    
    <xsl:variable name="categoryGroup_value">
        <xsl:if test="html/meta[@name='categoryGroup']/@content">
            <xsl:value-of select="html/meta[@name='categoryGroup']/@content"/>                
        </xsl:if>
        <xsl:value-of select="html/head/meta[@name='categoryGroup']/@content"/>        
    </xsl:variable>
    
    <xsl:variable name="categoryName_value">
        <xsl:if test="html/meta[@name='categoryName']/@content">
            <xsl:value-of select="html/meta[@name='categoryName']/@content"/>                
        </xsl:if>
        <xsl:value-of select="html/head/meta[@name='categoryName']/@content"/>        
    </xsl:variable>
    
    <xsl:variable name="acl_value">
        <xsl:if test="html/meta[@name='acl']/@content">
            <xsl:value-of select="html/meta[@name='acl']/@content"/>                
        </xsl:if>
        <xsl:value-of select="html/head/meta[@name='acl']/@content"/>        
    </xsl:variable>
    
    <xsl:variable name="versionMin_value">
        <xsl:if test="html/meta[@name='versionMin']/@content">
            <xsl:value-of select="html/meta[@name='versionMin']/@content"/>                
        </xsl:if>
        <xsl:value-of select="html/head/meta[@name='versionMin']/@content"/>        
    </xsl:variable>
    
    <xsl:variable name="versionMax_value">
        <xsl:if test="html/meta[@name='versionMax']/@content">
            <xsl:value-of select="html/meta[@name='versionMax']/@content"/>                
        </xsl:if>
        <xsl:value-of select="html/head/meta[@name='versionMax']/@content"/>        
    </xsl:variable>
    
    <xsl:variable name="productName_value">
        <xsl:if test="html/meta[@name='productName']/@content">
            <xsl:value-of select="html/meta[@name='productName']/@content"/>                
        </xsl:if>
        <xsl:value-of select="html/head/meta[@name='productName']/@content"/>        
    </xsl:variable>
    
    

    <xsl:template match="head/title"/>

    <xsl:template match="body">
        <xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>]]></xsl:text>
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="type" content="topic"/>
                <meta name="title" content="{normalize-space($variable_topictitle)}"/>
                <meta name="abstract" content=""/>
                <meta name="subject" content="{$load_meta_file//deliverable[@name = $deliverable_name]/publication_name}"/>
                <meta name="description" content="{normalize-space(replace($variable_shortdesc, ' on page 1', ''))}"/>
                <!--<meta name="description" content="{normalize-space($variable_shortdesc)}"/>-->
                <meta name="keywords" content=""/>
                <meta name="guid">
                   <xsl:attribute name="content">                       
                       <!--<xsl:value-of select="$variable_guid"/>-->
                       <xsl:value-of select="$variable_guid"/>
                   </xsl:attribute>
                </meta>
                <meta name="format" content="HTML5"/>
                <meta name="language" content="en"/>
                <meta name="author" content="cdebeer"/>
                <meta name="last modified">
                    <xsl:attribute name="content">
                        <xsl:value-of select="format-dateTime(current-dateTime(), '[D01]/[M01]/[Y0001] [H01]:[m01]:[s01]')"/>
                    </xsl:attribute>
                </meta>
                <meta name="product">
                    <xsl:attribute name="content">
                        <xsl:value-of select="concat($load_meta_file//deliverable[@name=$deliverable_name]/product_name, ' ', $load_meta_file//deliverable[@name=$deliverable_name]/product_version)"/>
                    </xsl:attribute>
                </meta>
                
                <!-- Custon AirWatch Metadata test -->
                
                <!--<meta name="categoryName" content="Apps" />
                <meta name="acl" content="acl-public" />
                <meta name="versionMin" content="9.2" />
                <meta name="versionMax" content="9.2" />
                <meta name="productName" content="AirWatch Console" />-->
                
                <meta name="categoryGroup" content="{$categoryGroup_value}"/>
                <meta name="categoryName" content="{$categoryName_value}"/>
                <meta name="acl" content="{$acl_value}"/>
                <meta name="versionMin" content="{$versionMin_value}"/>
                <meta name="versionMax" content="{$versionMax_value}"/>
                <meta name="productName" content="{$productName_value}"/>
                
                <link rel="stylesheet" type="text/css" href="commonltr.css"/>
                <title><xsl:value-of select="normalize-space($variable_topictitle)"/></title>
            </head>
            <body>
                <main role="main">
                    <article role="article" aria-labelledby="{$variable_guid}">
                        <xsl:copy-of select="node() | @*" copy-namespaces="no"/>
                    </article>
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
