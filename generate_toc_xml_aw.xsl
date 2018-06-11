<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="deliverable_name" required="yes"/>
    <xsl:param name="filename_guid_prefix" required="yes"/>
    <xsl:param name="load_meta_file" select="document('metadata_resource.xml')"/>


    <xsl:strip-space elements="*"/>
    <xsl:output method="xhtml" indent="yes"/>

    <xsl:template match="CatapultToc">
        <xsl:text disable-output-escaping="yes">
<![CDATA[<?NLS TYPE="org.html5.toc"?>]]>
</xsl:text>
        <toc>

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
                <xsl:variable name="full_filename" select="tokenize($full_path, '/')[last()]"/>
                <xsl:variable name="filename" select="substring-before($full_filename, '.')"/>
                <xsl:variable name="href_actual" select="concat($filename_guid_prefix, '-', $filename, '.html')"/>
                <xsl:variable name="href_replaced_space" select="replace($href_actual, ' ', '_')"/>
                <xsl:variable name="href_replaced_space" select="replace($href_replaced_space, ' ', '_')"/>
                <xsl:value-of select="$href_replaced_space"/>
            </xsl:variable>

            <xsl:attribute name="label">
                <xsl:value-of
                    select="$load_meta_file//deliverable[@name = $deliverable_name]/publication_name"
                />
            </xsl:attribute>

            <xsl:attribute name="topic">
                <xsl:value-of select="$variable_href"/>
            </xsl:attribute>

            <xsl:apply-templates/>

        </toc>


    </xsl:template>

    <xsl:template match="TocEntry">

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
            <xsl:variable name="full_filename" select="tokenize($full_path, '/')[last()]"/>
            <xsl:variable name="filename" select="substring-before($full_filename, '.')"/>
            <xsl:variable name="href_actual" select="concat($filename_guid_prefix, '-', $filename, '.html')"/>
            <xsl:variable name="href_replaced_space" select="replace($href_actual, ' ', '_')"/>
            <xsl:variable name="href_replaced_space" select="replace($href_replaced_space, ' ', '_')"/>
            <xsl:value-of select="$href_replaced_space"/>
        </xsl:variable>

        <topic label="{$variable_topictitle}" href="{$variable_href}">
            <xsl:apply-templates/>
        </topic>

    </xsl:template>


</xsl:stylesheet>
