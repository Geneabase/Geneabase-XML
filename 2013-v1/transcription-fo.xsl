<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:tr="http://geneabase.com/transcription"
    xmlns:html="http://geneabase.com/html" version="1.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="main" margin-top="36pt" margin-bottom="0.5cm"
                    page-width="210mm" page-height="297mm" margin-left="2cm" margin-right="2cm">
                    <fo:region-body margin-bottom="2cm" />
                    <fo:region-after extent="0.5cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="main">
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font-size="8pt" text-align="center"><fo:page-number/> / <fo:page-number-citation ref-id="theEnd"/></fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates/>
                    <fo:block id="theEnd"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    <xsl:template match="tr:file">
        <fo:block font-size="14pt" font-weight="bold" space-after="0em" keep-with-next="true" color="#c82058">
            File <xsl:value-of select="attribute::name"/>
        </fo:block>
        <fo:block font-size="10pt">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:note">
        <fo:block font-size="10pt" font-style="italic">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:transcription">
        <fo:block font-size="10pt" space-before="0.8em" space-after="0em"
            space-after.maximum="0.4em" color="black">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:page">
        <fo:block font-size="10pt" font-style="italic" space-after="0.2em"  keep-with-next="true" space-before="0.5em"
            border-bottom="dotted" text-align="right">
            Pagina <xsl:value-of select="attribute::nr"/>
        </fo:block>
        <fo:block font-size="10pt">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:region">
        <fo:block space-before="2em" space-after="2em">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:line">
        <fo:block space-before="0.5em" space-after="0.5em">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:page/tr:title">
        <fo:block font-size="1.2em" font-weight="bold" space-before="0.8em" space-after="0em"  keep-with-next="true"
            space-after.maximum="0.4em" color="red" keep-with-next.within-column="always"
            keep-together.within-column="always">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="tr:region/tr:title">
        <fo:block font-size="1.2em" font-weight="bold" space-before="0.8em" space-after="0.4em"  keep-with-next="true"
            space-after.maximum="0.4em" color="black" keep-with-next.within-column="always"
            keep-together.within-column="always">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    <xsl:template match="html:span">
        <fo:inline>
            <xsl:choose>
                <xsl:when test="@class='strikethrough'">
                    <xsl:attribute name="text-decoration">line-through</xsl:attribute>
                </xsl:when>
                <xsl:when test="@class='underlined'">
                    <xsl:attribute name="text-decoration">underline</xsl:attribute>
                </xsl:when>
                <xsl:when test="@class='unclear'">
                    <xsl:attribute name="background-color">#b7de03</xsl:attribute>
                </xsl:when>
                <xsl:when test="@class='unreadable'">
                    <xsl:attribute name="background-color">#efd602</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    <xsl:template match="html:strong">
        <fo:inline font-weight="bold">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    
</xsl:stylesheet>
