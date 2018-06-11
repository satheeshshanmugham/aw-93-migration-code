<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:MadCap="http://www.madcapsoftware.com/Schemas/MadCap.xsd"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:strip-space elements="*"/>    
    <xsl:output method="xhtml" indent="yes"></xsl:output>    
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
        
    <xsl:template name="updateConref" match="MadCap:snippetBlock | MadCap:snippetText">
        <xsl:param name="load_file" select="document(concat('./Content/Resources', substring-after(@src, 'Resources')))"></xsl:param>
        <!--<xsl:param name="load_file" select="document(concat('./Content/Resources/Snippets-fixed/', tokenize(@src, '/')[last()]))"></xsl:param>-->
        
        <!--<xsl:param name="load_file" select="document(concat('./Content/Resources/Snippets/', tokenize(@src, '/')[last()-1], '/', tokenize(@src, '/')[last()]))"></xsl:param>-->
        <xsl:copy>
            <xsl:apply-templates select="$load_file//html/body/*"/>
        </xsl:copy>
    </xsl:template>   
    
    
    <xsl:template name="updateVariable" match="MadCap:variable">
        <xsl:param name="load_variables" select="document('Variables.flvar')"></xsl:param>
        <xsl:variable name="varname" select="substring-after(@name, '.')"/>
        <xsl:value-of select="concat(' ', normalize-space($load_variables//CatapultVariableSet/Variable[@Name=$varname]))"/>
    </xsl:template>
    
   
   <!-- Code to transform alerts -->
    
    <xsl:template match="p[@class = 'Note']">
        <xsl:choose>
            <xsl:when test="contains(., 'Note:')">
                <div class="note">
                    <span class="note__title">Note:</span>
                    <p class="p">
                        <xsl:copy-of select="node() except(b[contains(text(), 'Note')])"/>
                        <!--<xsl:copy-of select="replace(node() except(b[contains(text(), 'Note')]), ': ', '')"/>-->
                    </p>
                </div>
            </xsl:when>
            <xsl:when test="contains(., 'Important')">
                <div class="note note important">
                    <span class="note__title">Important:</span>
                    <p class="p">
                        <xsl:copy-of select="node() except(b[contains(text(), 'Important')])"/>
                        <!--<xsl:copy-of select="replace(node() except(b[contains(text(), 'Important')]), ': ', '')"/>-->
                    </p>
                </div>
            </xsl:when>
            <xsl:when test="contains(., 'Caution:')">
                <div class="note note caution">
                    <span class="note__title">Caution:</span>
                    <p class="p">
                        <xsl:copy-of select="node() except(b[contains(text(), 'Caution:')])"/>
                        <!--<xsl:copy-of select="replace(node() except(b[contains(text(), 'Caution')]), ': ', '')"/>-->
                    </p>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
    <xsl:template match="table">
        <table class="table">
            <colgroup>
                <xsl:for-each select="col">
                    <col><xsl:apply-templates select="node()"></xsl:apply-templates></col>
                </xsl:for-each>
            </colgroup>
            <xsl:apply-templates select="node() except col"></xsl:apply-templates>
        </table>        
    </xsl:template>
    
    <xsl:template match="table[@class='setcolwidth']">
        <table class="table">
            <colgroup>
                <xsl:for-each select="col">
                    <col>
                        <xsl:attribute name="width"><xsl:value-of select="@width"/></xsl:attribute>
                        <xsl:apply-templates select="node()"></xsl:apply-templates>
                    </col>
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
        <th class="entry"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></th>
    </xsl:template>
    
    <xsl:template match="table/tbody">
        <tbody class="tbody"><xsl:apply-templates select="node()"></xsl:apply-templates></tbody>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr">
        <tr class="row"><xsl:apply-templates select="node()"></xsl:apply-templates></tr>
    </xsl:template>    
    
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyD-Column1-SubHeading']/span">
        <span><xsl:value-of select="."/></span>
    </xsl:template>    
        
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyD-Column1-SubHeading2']/span">
        <span><xsl:value-of select="."/></span>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyE-Column1-SubHeading']/span">
        <span><xsl:value-of select="."/></span>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyE-Column1-SubHeading2']/span">
        <span><xsl:value-of select="."/></span>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyD-Column1-RowHeader1']/span">
        <span><xsl:value-of select="."/></span>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyE-Column1-RowHeader1']/span">
        <span><xsl:value-of select="."/></span>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyD-Column1-Body1']/span[@style='color: #ffffff;']">
        <span><xsl:value-of select="."/></span>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyD-Column1-Body1']/p/span[@style='color: #ffffff;']">
        <span><xsl:value-of select="."/></span>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyD-Column1-Body1']/b[@style='color: #ffffff;']">
        <b><xsl:value-of select="."/></b>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td">
        <td class="entry"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>   
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyD-Column1-Body1' and contains(@style , 'font-weight: bold;') and span]">        
        <td class="entry" style="text-align: left; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
        
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyD-Column1-SubHeading']">        
        <td class="entry" style="text-align: left; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
<!-- Center align sub heading  -->
    <xsl:template match="table/tbody/tr[@MadCap:pattern='6']/td[@class='TableStyle-AWTable-BodyD-Column1-SubHeading']">        
        <td class="entry" style="text-align: center; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr[@MadCap:pattern='6']/td[@class='TableStyle-FormList-BodyD-Column1-SubHeading']">        
        <td class="entry" style="text-align: center; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyD-Column1-SubHeading2']">        
        <td class="entry" style="text-align: left; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyE-Column1-SubHeading']">        
        <td class="entry" style="text-align: left; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyE-Column1-SubHeading2']">        
        <td class="entry" style="text-align: left; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyD-Column1-RowHeader1']">        
        <td class="entry" style="text-align: left; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyD-Column1-RowHeader2']">        
        <td class="entry" style="text-align: left; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyE-Column1-RowHeader1']">        
        <td class="entry" style="text-align: left; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-AWTable-BodyE-Column1-RowHeader2']">        
        <td class="entry" style="text-align: left; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
  
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-FormList-BodyB-Column1-Body1' and @style='font-weight: bold;']">        
        <td class="entry" style="text-align: left; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-FormList-BodyD-Column1-Body1' and @style='font-weight: bold;']">        
        <td class="entry" style="text-align: left; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
    <xsl:template match="table/tbody/tr/td[@class='TableStyle-FormList-BodyE-Column1-Body1' and @style='font-weight: bold;']">        
        <td class="entry" style="text-align: left; font-weight: bold"><xsl:apply-templates select="node()|@colspan | @rowspan"></xsl:apply-templates></td>
    </xsl:template>
    
    
    
    <xsl:template match="body//*[contains(@MadCap:conditions,'Default.!PrintOnly')]"></xsl:template>
    <xsl:template match="body//*[contains(@MadCap:conditions,'Default.!DNI_Future Release')]"></xsl:template>
    <xsl:template match="body//*[contains(@MadCap:conditions,'Default.!DNI_Persist')]"></xsl:template>
    <xsl:template match="body//*[contains(@MadCap:conditions,'Default.!DNI_To Be Deprecated')]"></xsl:template>
    
</xsl:stylesheet>