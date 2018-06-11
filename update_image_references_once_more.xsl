<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
    xmlns:MadCap="http://www.madcapsoftware.com/Schemas/MadCap.xsd"   
    exclude-result-prefixes="MadCap"
    >
    
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="pre" />
    <xsl:output method="xhtml" indent="yes" />
    
    <xsl:param name="filename_guid_prefix" required="yes"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="MadCap:xref[@href]">
        <xsl:choose>
            <xsl:when test="contains(@href, 'http')">
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
                
                <a class="xref">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@href"/>
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
                    <xsl:variable name="filename" select="substring-before($full_filename, '.htm')"/>
                    <xsl:variable name="filename_actual" select="concat($filename_guid_prefix, '-', $filename, '.html')"/>
                    <xsl:variable name="href_replaced_space" select="replace($filename_actual, ' ', '_')"/>
                    <xsl:variable name="href_replaced_space" select="replace($href_replaced_space, ' ', '_')"/>
                    <xsl:value-of select="$href_replaced_space"/>
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
    
    <xsl:template match="a[@href][count(@*)=1]">
        <xsl:choose>
            <xsl:when test="contains(@href, 'http')">
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
                
                <a class="xref">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@href"/>
                    </xsl:attribute>
                    
                    <xsl:value-of select="$xref_text"></xsl:value-of>
                    
                </a>                
                
            </xsl:when>
            
            <xsl:when test="contains(@href, '#') and contains(@href, '.htm')">
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
                    <xsl:variable name="filename" select="substring-before($full_filename, '.htm')"/>
                    <xsl:variable name="anchorname" select="substring-after($full_filename, '.htm')"/>
                    <xsl:variable name="filename_actual" select="concat($filename_guid_prefix, '-', $filename, '.html', $anchorname)"/>
                    <xsl:variable name="href_replaced_space" select="replace($filename_actual, ' ', '_')"/>
                    <xsl:variable name="href_replaced_space" select="replace($href_replaced_space, ' ', '_')"/>
                    <xsl:value-of select="$href_replaced_space"/>
                </xsl:variable>
                
                <a class="xref">
                    <xsl:attribute name="href">
                        <xsl:value-of select="$variable_guid"/>
                    </xsl:attribute>
                    
                    <xsl:value-of select="$xref_text"></xsl:value-of>
                    
                </a>         
                
            </xsl:when>
            
            <xsl:when test="contains(@href, '#')">
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
                
                <a class="xref">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@href"/>
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
                    <xsl:variable name="filename" select="substring-before($full_filename, '.htm')"/>
                    <xsl:variable name="filename_actual" select="concat($filename_guid_prefix, '-', $filename, '.html')"/>
                    <xsl:variable name="href_replaced_space" select="replace($filename_actual, ' ', '_')"/>
                    <xsl:variable name="href_replaced_space" select="replace($href_replaced_space, ' ', '_')"/>
                    <xsl:value-of select="$href_replaced_space"/>
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
    
    <xsl:template match="a[@href][@MadCap:conditions]">
        <xsl:choose>
            <xsl:when test="contains(@href, 'http')">
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
                
                <a class="xref">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@href"/>
                    </xsl:attribute>
                    
                    <xsl:value-of select="$xref_text"></xsl:value-of>
                    
                </a>                
                
            </xsl:when>
            
            <xsl:when test="contains(@href, '#') and contains(@href, '.htm')">
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
                    <xsl:variable name="filename" select="substring-before($full_filename, '.htm')"/>
                    <xsl:variable name="anchorname" select="substring-after($full_filename, '.htm')"/>
                    <xsl:variable name="filename_actual" select="concat($filename_guid_prefix, '-', $filename, '.html', $anchorname)"/>
                    <xsl:variable name="href_replaced_space" select="replace($filename_actual, ' ', '_')"/>
                    <xsl:variable name="href_replaced_space" select="replace($href_replaced_space, ' ', '_')"/>
                    <xsl:value-of select="$href_replaced_space"/>
                </xsl:variable>
                
                <a class="xref">
                    <xsl:attribute name="href">
                        <xsl:value-of select="$variable_guid"/>
                    </xsl:attribute>
                    
                    <xsl:value-of select="$xref_text"></xsl:value-of>
                    
                </a>         
                
            </xsl:when>
            
            <xsl:when test="contains(@href, '#')">
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
                
                <a class="xref">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@href"/>
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
                    <xsl:variable name="filename" select="substring-before($full_filename, '.htm')"/>
                    <xsl:variable name="filename_actual" select="concat($filename_guid_prefix, '-', $filename, '.html')"/>
                    <xsl:variable name="href_replaced_space" select="replace($filename_actual, ' ', '_')"/>
                    <xsl:variable name="href_replaced_space" select="replace($href_replaced_space, ' ', '_')"/>
                    <xsl:value-of select="$href_replaced_space"/>
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
    
    <xsl:template match="img[@class='AW_border']">
        
        <xsl:variable name="variable_image_filename">        
            <xsl:variable name="full_path">
                <xsl:value-of select="@src"/>
            </xsl:variable>
            <xsl:variable name="filename" select="tokenize($full_path,'/')[last()]"/>            
            <xsl:value-of select="concat('images/', $filename)"/>                    
        </xsl:variable>
        
        <xsl:variable name="image_alt_text">
            <xsl:variable name="temp" select="substring-after($variable_image_filename, 'images/')"/>
            <xsl:value-of select="substring-before($temp, '.png')"/>
        </xsl:variable>
        
        <xsl:variable name="image_style">
            <xsl:variable name="image_dimension">
                <xsl:value-of select="@style"/>
            </xsl:variable>
            <xsl:value-of select="concat($image_dimension, ' ', 'border:1px solid #0095D3; border-radius:6px')"/>
        </xsl:variable>
        
        <img class="image" src="{$variable_image_filename}" alt="{$image_alt_text}" style="{$image_style}"></img>        
    </xsl:template>
    
    <xsl:template match="img[@class='AW_border_nopad']">
        
        <xsl:variable name="variable_image_filename">        
            <xsl:variable name="full_path">
                <xsl:value-of select="@src"/>
            </xsl:variable>
            <xsl:variable name="filename" select="tokenize($full_path,'/')[last()]"/>            
            <xsl:value-of select="concat('images/', $filename)"/>                    
        </xsl:variable>
        
        <xsl:variable name="image_alt_text">
            <xsl:variable name="temp" select="substring-after($variable_image_filename, 'images/')"/>
            <xsl:value-of select="substring-before($temp, '.png')"/>
        </xsl:variable>
        
        <xsl:variable name="image_style">
            <xsl:variable name="image_dimension">
                <xsl:value-of select="@style"/>
            </xsl:variable>
            <xsl:value-of select="concat($image_dimension, ' ', 'border:1px solid #0095D3; border-radius:6px')"/>
        </xsl:variable>
        
        <img class="image" src="{$variable_image_filename}" alt="{$image_alt_text}" style="{$image_style}"></img>        
    </xsl:template>
    
    <xsl:template match="img[@class='Border_Large_Over400px']">
        
        <xsl:variable name="variable_image_filename">        
            <xsl:variable name="full_path">
                <xsl:value-of select="@src"/>
            </xsl:variable>
            <xsl:variable name="filename" select="tokenize($full_path,'/')[last()]"/>            
            <xsl:value-of select="concat('images/', $filename)"/>                    
        </xsl:variable>
        
        <xsl:variable name="image_alt_text">
            <xsl:variable name="temp" select="substring-after($variable_image_filename, 'images/')"/>
            <xsl:value-of select="substring-before($temp, '.png')"/>
        </xsl:variable>
        
        <xsl:variable name="image_style">
            <xsl:variable name="image_dimension">
                <xsl:value-of select="@style"/>
            </xsl:variable>
            <xsl:value-of select="concat($image_dimension, ' ', 'border:1px solid #0095D3')"/>
        </xsl:variable>
        
        <img class="image" src="{$variable_image_filename}" alt="{$image_alt_text}" style="{$image_style}"></img>        
    </xsl:template>
    
    <xsl:template match="img[@class='Border_Small_Under400px']">
        
        <xsl:variable name="variable_image_filename">        
            <xsl:variable name="full_path">
                <xsl:value-of select="@src"/>
            </xsl:variable>
            <xsl:variable name="filename" select="tokenize($full_path,'/')[last()]"/>            
            <xsl:value-of select="concat('images/', $filename)"/>                    
        </xsl:variable>
        
        <xsl:variable name="image_alt_text">
            <xsl:variable name="temp" select="substring-after($variable_image_filename, 'images/')"/>
            <xsl:value-of select="substring-before($temp, '.png')"/>
        </xsl:variable>
        
        <xsl:variable name="image_style">
            <xsl:variable name="image_dimension">
                <xsl:value-of select="@style"/>
            </xsl:variable>
            <xsl:value-of select="concat($image_dimension, ' ', 'border:1px solid #0095D3')"/>
        </xsl:variable>
        
        <img class="image" src="{$variable_image_filename}" alt="{$image_alt_text}" style="{$image_style}"></img>        
    </xsl:template>
    
    <xsl:template match="img">
        
        <xsl:variable name="variable_image_filename">        
            <xsl:variable name="full_path">
                <xsl:value-of select="@src"/>
            </xsl:variable>
            <xsl:variable name="filename" select="tokenize($full_path,'/')[last()]"/>            
            <xsl:value-of select="concat('images/', $filename)"/>                    
        </xsl:variable>
        
        <xsl:variable name="image_alt_text">
            <xsl:variable name="temp" select="substring-after($variable_image_filename, 'images/')"/>
            <xsl:value-of select="substring-before($temp, '.png')"/>
        </xsl:variable>
        
        <xsl:variable name="image_style">
            <xsl:variable name="image_dimension">
                <xsl:value-of select="@style"/>
            </xsl:variable>
            <xsl:value-of select="$image_dimension"/>
        </xsl:variable>
        
        <img class="image" src="{$variable_image_filename}" alt="{$image_alt_text}" style="{$image_style}"></img>        
    </xsl:template>
    
    <!--  Code to fix ordered list numbering -->
    
    <xsl:template match="ol[position() &gt; 1 and @MadCap:continue='true']">
        <xsl:variable name="li_count">
            <xsl:value-of select="count(preceding-sibling::ol/li)"/>
        </xsl:variable>        
        <xsl:copy>
            <xsl:attribute name="start">
                <xsl:value-of select="$li_count + 1"/>
            </xsl:attribute>
            <xsl:apply-templates select="@* | node()"></xsl:apply-templates>
        </xsl:copy>
        
    </xsl:template>
    
    <xsl:template match="MadCap:snippetBlock | MadCap:snippetText">
        <xsl:copy-of select="./node()|@*"></xsl:copy-of>
    </xsl:template>
    
    <!-- Alternate Code to remove empty line breaks inside the elements -->
    
    <!--<xsl:template match="*/text()[normalize-space()]">
        <xsl:value-of select="normalize-space()"/>
    </xsl:template>    
    <xsl:template match="*/text()[not(normalize-space())]" />  --> 
    
    
    
</xsl:stylesheet>