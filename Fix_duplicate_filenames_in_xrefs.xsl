<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:MadCap="http://www.madcapsoftware.com/Schemas/MadCap.xsd"   
    exclude-result-prefixes="MadCap"    
    version="2.0">
    
    <xsl:template match="a">
        <xsl:choose>
            <xsl:when test="
                contains(@href, 'Introduction.htm') or
                contains(@href, 'OverV_CL.htm') or
                contains(@href, 'RP_Topic.htm')
                ">
                <xsl:variable name="xref_text">
                    <xsl:variable name="validate_text" select="."/>
                    <xsl:choose>
                        <xsl:when test="contains($validate_text,'on page')">
                            <xsl:value-of select="substring-before($validate_text,' on page')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$validate_text"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                </xsl:variable>
                
                <xsl:variable name="token_5">
                    <xsl:variable name="full_path" select="@href"/>
                    <xsl:variable name="tokens" select="tokenize($full_path, '/')"/>
                    <xsl:value-of select="$tokens[5]"/>
                </xsl:variable>
                
                <xsl:variable name="token_4">
                    <xsl:variable name="full_path" select="@href"/>
                    <xsl:variable name="tokens" select="tokenize($full_path, '/')"/>
                    <xsl:value-of select="$tokens[4]"/>
                </xsl:variable>
                
                <xsl:variable name="variable_guid">
                    <xsl:variable name="full_path" select="@href"/>
                    <xsl:variable name="full_filename" select="tokenize($full_path, '/')[last()]"/>
                    <xsl:variable name="filename" select="substring-before($full_filename, '.')"/>
                    <xsl:value-of select="concat('GUID-AW92', '-', $filename)"/>
                </xsl:variable>
                
                <a class="xref">
                    <xsl:attribute name="href">
                        <xsl:value-of select="concat($variable_guid, '_', $token_5, '_', $token_4, '.html')"/>
                    </xsl:attribute>
                    
                    <xsl:value-of select="$xref_text"></xsl:value-of>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="xref_text">
                    <xsl:variable name="validate_text" select="."/>
                    <xsl:choose>
                        <xsl:when test="contains($validate_text,'on page')">
                            <xsl:value-of select="substring-before($validate_text,' on page')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$validate_text"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                </xsl:variable>
                
                <xsl:variable name="variable_guid">
                    <xsl:variable name="full_path" select="@href"/>
                    <xsl:variable name="full_filename" select="tokenize($full_path, '/')[last()]"/>
                    <xsl:variable name="filename" select="substring-before($full_filename, '.')"/>
                    <xsl:value-of select="concat($filename_guid_prefix, '-', $filename, '.html')"/>
                </xsl:variable>
                
                <a class="xref">
                    <xsl:attribute name="href">
                        <xsl:value-of select="$variable_guid"/>
                    </xsl:attribute>
                    
                    <xsl:value-of select="$xref_text"></xsl:value-of>
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>