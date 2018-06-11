<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
    xmlns:MadCap="http://www.madcapsoftware.com/Schemas/MadCap.xsd"   
    exclude-result-prefixes="MadCap"
    >
    
    <xsl:strip-space elements="*"/>    
    <xsl:output method="xhtml" indent="yes" />
    
    <xsl:param name="filename_guid_prefix" required="yes"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Code to transform tables -->
    
    <!--<xsl:template match="table">
        <table class="table">
            <colgroup>
                <xsl:for-each select="col">
                    <col><xsl:apply-templates select="node()"></xsl:apply-templates></col>
                </xsl:for-each>
            </colgroup>
            <xsl:apply-templates select="node() except col"></xsl:apply-templates>
        </table>        
    </xsl:template>
    
    <xsl:template match="table/thead">
        <thead class="thead"><xsl:apply-templates select="node()"></xsl:apply-templates></thead>
    </xsl:template>
    
    <xsl:template match="table/thead/tr">
        <tr class="row"><xsl:apply-templates select="node()"></xsl:apply-templates></tr>
    </xsl:template>
    
    <xsl:template match="table/thead/tr/th">
        <th class="entry"><xsl:apply-templates select="node()|@colspan"></xsl:apply-templates></th>
    </xsl:template>
    
    <xsl:template match="table/tbody">
        <tbody class="tbody"><xsl:apply-templates select="node()"></xsl:apply-templates></tbody>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr">
        <tr class="row"><xsl:apply-templates select="node()"></xsl:apply-templates></tr>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td">
        <td class="entry"><xsl:apply-templates select="node()|@colspan"></xsl:apply-templates></td>
    </xsl:template>-->
    
    <!-- Code to transform Images -->
    
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
    
    
    
    
    <xsl:template match="h1">
        <h1 class="title topictitle1"><xsl:value-of select="."/></h1>
    </xsl:template>
    
    <xsl:template match="h2[1]">        
        <h1 class="title topictitle1"><xsl:value-of select="."/></h1>
    </xsl:template>
    
    <xsl:template match="h2">
        <h2 class="title sectiontitle"><xsl:value-of select="."/></h2>
    </xsl:template>
    
    <xsl:template match="h3">
        <h3 class="title sectiontitle"><xsl:value-of select="."/></h3>
    </xsl:template>   
   
    <!-- Code to transform cross references -->
    
    <xsl:template match="MadCap:xref | a[@href]">
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
    
    <xsl:template match="a[@href][contains(@href, 'mailto')]">
        <a class="xref">
            <xsl:attribute name="href">
                <xsl:value-of select="@href"/>
            </xsl:attribute>
            
            <xsl:value-of select="."></xsl:value-of>            
        </a>
    </xsl:template>
    
    <xsl:template match="MadCap:snippetBlock | MadCap:snippetText">
        <xsl:copy-of select="./node()|@*"></xsl:copy-of>
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
    
    <!-- Code to transform codeblock -->
    
    <xsl:template match="pre | div[@class='code']" >
        <div>
        <pre class="pre codeblock vm-code-block prettyprint">
            <xsl:apply-templates select="node()"></xsl:apply-templates>
        </pre>
        </div>
    </xsl:template>
    
    <xsl:template match="code">
        <code class="ph codeph vm-code-block prettyprint"><xsl:apply-templates select="node()"></xsl:apply-templates></code>
    </xsl:template>
    
    
    <!-- Code to transform list items -->
    
    <xsl:template match="li/ol">
        <ol class="ol" type="a">
            <xsl:apply-templates select="node()"></xsl:apply-templates>
        </ol>
    </xsl:template>
    
    <xsl:template match="li/ul">
        <ul class="ul" style="list-style-type:circle">
            <xsl:apply-templates select="node()"></xsl:apply-templates>
        </ul>
    </xsl:template>
    
    <xsl:template match="li">
        <li class="li">
            <xsl:apply-templates select="node()"></xsl:apply-templates>            
        </li>
    </xsl:template>
    
    <!-- Code to remove <MadCap:concept> -->
    <xsl:template match="MadCap:concept"></xsl:template>
    
</xsl:stylesheet>