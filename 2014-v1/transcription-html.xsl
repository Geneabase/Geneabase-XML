<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:tr="http://geneabase.com/transcription"
    xmlns:html="http://geneabase.com/html" version="1.0">
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
        <html>
            <head>
                <link href="http://stadsarchief.amsterdam.nl/transcription.css" rel="Stylesheet"/>
            </head>
            <body>
                <xsl:apply-templates/> 
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tr:file">
        <h1>File <xsl:value-of select="attribute::name"/></h1>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tr:note">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tr:transcription">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tr:page">
        <h2>P <xsl:value-of select="attribute::nr"/></h2>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tr:region">
        <div class="region"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="tr:line">
        <div class="line"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="tr:page/tr:title">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    <xsl:template match="tr:region/tr:title">
        <h4><xsl:apply-templates/></h4>
    </xsl:template>
    
    <xsl:template match="html:span[@class='strikethrough']">
        <del><xsl:apply-templates/></del>
    </xsl:template>
    <xsl:template match="html:span[@class='underlined']">
        <u><xsl:apply-templates/></u>
    </xsl:template>
    <xsl:template match="html:span[@class='unclear']">
        <span class="unclear"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="html:span[@class='unreadable']">
        <span class="unreadable"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="html:strong">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>
    <xsl:template match="html:em">
        <em><xsl:apply-templates/></em>
    </xsl:template>
    <xsl:template match="html:sup">
        <sup><xsl:apply-templates/></sup>
    </xsl:template>
</xsl:stylesheet>
